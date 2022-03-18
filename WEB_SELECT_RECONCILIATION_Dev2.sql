USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[WEB_SELECT_RECONCILIATION_Dev2]    Script Date: 4/17/2013 1:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[WEB_SELECT_RECONCILIATION_Dev2]
	@TrackingNo AS VARCHAR(50),
	@Rmn AS VARCHAR(50),
	@FirstName AS VARCHAR(50),
	@LastName AS VARCHAR(50),
	@MiddleInitial AS VARCHAR(50),
	@DcsID AS VARCHAR(50),
	@ParticipantID as varchar(50),
	@FileNumber AS VARCHAR(50),
	
	@ShipDateIn AS VARCHAR(10),
	@ShipDateOut AS VARCHAR(10),
	@CheckDateIn AS VARCHAR(10),
	@CheckDateEnd  AS VARCHAR(10),
	
	@Location AS VARCHAR(50),
	@Region AS VARCHAR(50),
	@RoleName AS VARCHAR(50),
	@ProcessingFacility AS VARCHAR(50),
	@ClaimType AS VARCHAR(50)
AS
BEGIN
--EXEC WEB_SELECT_RECONCILIATION_Dev '','','','','','','','','09/07/2012','12/06/2012','','','','Western','Admin','',''
SET NOCOUNT ON;
	DECLARE @Query VARCHAR(MAX)='',
		@Where VARCHAR(MAX)=''
		set @Query = '
			DECLARE @Temp1 TABLE(
				syskey INT )'
		IF @RoleName = 'Region'
		BEGIN
			SET @Query = @Query+' 
			INSERT INTO @Temp1
			SELECT p.SysKey FROM pobox as p WHERE p.Region = '''+@Region+''' AND p.pobox LIKE ''%' + @Location + '%'' '
		END
		ELSE IF @RoleName = 'User'
		BEGIN
			SET @Query = @Query+'
			INSERT INTO @Temp1
			SELECT p.SysKey FROM pobox  as p WHERE p.pobox = '''+@Location +''''
		END
		ELSE IF @RoleName = 'Admin' or @RoleName = 'National'
		BEGIN
			SET @Query = @Query+'
			INSERT INTO @Temp1
			SELECT p.SysKey FROM pobox as p WHERE p.pobox LIKE ''%'+ @Location + '%'' '
		END
		
		set @Query = @Query +'
			SELECT RMN, Tracking_Number, VA_Ship_Date, Max(CheckIn_Date) as CheckIn_Date, First_Name, MI, Last_Name, Participant_ID, DCS_ID, File_Number,
				SUM(#_of_Documents) AS #_of_Documents, SUM(#_of_Images) as #_of_Images, Upload_to_VA_Date as Upload_to_VA_Date, MAX(Return_to_VA_Date) AS Return_to_VA_Date,
				Return_Tracking_#, Location, ''Newnan''  AS ProcessingFacility, claimtype
			FROM (
			SELECT LTRIM(RTRIM(cci.RMN)) AS RMN, 
				cci.trackingno AS Tracking_Number, 
				MAX(cci.insertdate) as VA_Ship_Date, 
				max(mDCS.insertdate) as CheckIn_Date,
				cd.Firstname as First_Name,
				cd.MiddleInitial as MI,
				cd.Lastname as Last_Name, 
				cd.participantID as Participant_ID,
				mDCS.dcsID as DCS_ID,
				cd.FileNumber as File_Number,
				COUNT(d.ImageID) as #_of_Documents,
				SUM(d.numpages) as #_of_Images,
				CONVERT(DATE, d.ftpstime, 101) as Upload_to_VA_Date,
				CONVERT(DATE, cd.ShipDate, 101) as Return_to_VA_Date,
				cd.shiptrackingnumber as Return_Tracking_#,
				p.pobox as Location,
				cci.claimtype
			FROM customerCheckIn as cci
				LEFT JOIN pobox as p on p.sysKey = cci.Location
				LEFT JOIN (SELECT DISTINCT RMN, DCSID, MAX(InsertDate) AS InsertDate FROM ManifestDCS
						GROUP BY RMN, DCSID) as mDCS on cci.RMN = mDCS.RMN
				LEFT JOIN (SELECT dcsID, MAX(Firstname) AS FirstName, MAX(MiddleInitial) AS MiddleInitial, MAX(LastName) AS LastName, MAX(participantID) AS participantID, 
									MAX(FileNumber) AS FileNumber, MAX(shiptrackingnumber) AS shiptrackingnumber, MAX(shipDate) AS ShipDate FROM CustomerData GROUP BY dcsID) as cd on mDCS.dcsID = cd.dcsID
				LEFT JOIN (SELECT DCSID, ImageID, NumPages, ftpstime
							FROM Document d1 GROUP BY DCSID, ImageID, NumPages, ftpstime) as d on mDCS.dcsID = d.dcsID
			WHERE '
		IF(@TrackingNo != '')	BEGIN	SET @Where = @Where +'		cci.trackingno like '''+@TrackingNo+''' AND '				+ char(13)	END
		IF(@Rmn!= '')			BEGIN	SET @Where = @Where +'		LTRIM(RTRIM(cci.RMN)) like '''+@Rmn+''' AND '				+ char(13)	END
		IF(@FirstName!= '')		BEGIN	SET @Where = @Where +'		isnull(cd.Firstname,'''') like '''+@FirstName+''' AND '			+ char(13)	END
		IF(@LastName!= '')		BEGIN	SET @Where = @Where +'		isnull(cd.Lastname,'''') like '''+@LastName+''' AND'			+ char(13)	END
		IF(@MiddleInitial!= '')	BEGIN	SET @Where = @Where +'		isnull(cd.MiddleInitial,'''') like '''+@MiddleInitial+''' AND'	+ char(13)	END
		IF(@DcsID!= '')			BEGIN	SET @Where = @Where +'		isnull(cd.dcsID,'''') like '''+@DcsID+''' AND'					+ char(13)	END
		IF(@ParticipantID!= '')	BEGIN	SET @Where = @Where +'		isnull(cd.participantID,'''') like '''+@ParticipantID+''' AND'	+ char(13)	END
		IF(@FileNumber!= '')	BEGIN	SET @Where = @Where +'		isnull(d.FileNumber,'''') like '''+@FileNumber+''' AND'			+ char(13)	END
		IF(@ClaimType!= '')		BEGIN	SET @Where = @Where +'		isnull(cci.claimtype,'''') = '''+@ClaimType+''' AND'			+ char(13)	END
		IF(@ShipDateIn!= '' AND @ShipDateOut!='')	
		BEGIN
			SET @Where = @Where +'	((cci.insertdate >= '''+@ShipDateIn+' 0:0:0.000'') AND (cci.insertdate <= '''+@ShipDateOut +' 23:59:59.999'')) AND'
		--	SET @Where = @Where +'	cci.insertdate between cast('''+@ShipDateIn+''' AS datetime) and cast('''+@ShipDateOut +' 23:59:59.999'' as datetime) AND'
		END
		IF(@CheckDateIn!= '' AND @CheckDateEnd!='')	
		BEGIN
			SET @Where = @Where +'	mDCS.insertdate between cast('''+@CheckDateIn+''' AS datetime) and cast('''+@CheckDateEnd +' 23:59:59.999'' as datetime) AND'
		END			
		SET @Where = @Where +'			cci.location in (select * from @Temp1)'
		SET @Query = @Query + @Where + '
			group by LTRIM(RTRIM(cci.RMN)), cci.trackingno, cd.Firstname, cd.MiddleInitial, cd.Lastname,
				cd.participantID, mDCS.dcsID, cd.FileNumber,cd.shiptrackingnumber,
				CONVERT(DATE, cd.ShipDate, 101), p.pobox, CONVERT(DATE, d.ftpstime, 101),cci.claimtype
			) AS TAB
			GROUP BY RMN, Tracking_Number, VA_Ship_Date, First_Name, MI, Last_Name, Participant_ID, DCS_ID, File_Number,
				CONVERT(DATE, Upload_to_VA_Date, 101), CONVERT(DATE, Return_to_VA_Date, 101), Return_Tracking_#, Location, claimtype '

		--PRINT (@Query)
		EXECUTE (@Query)
END

