USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[DVA_WEB_SELECT_RECONCILIATION_DETAILS]    Script Date: 11/1/2012 8:57:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DVA_WEB_SELECT_RECONCILIATION_DETAILS]
	@TrackingNo as varchar(50),
	@Rmn as varchar(50),
	@Firstname as varchar(50),
	@Lastname as varchar(50),
	@MiddleInitial as varchar(50),
	@dcsID as varchar(50),
	@participantID as varchar(50),
	@FileNumber as varchar(50),
	
	@ShipDateIn as Varchar(50),
	@ShipDateOut as Varchar(50),
	@DateInChk as Varchar(50),
	@DateOutChk as Varchar(50),
	
	@location as Varchar(50),
	
	@Region as Varchar(50),
	@RoleName as Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--EXEC DVA_WEB_SELECT_RECONCILIATION_DETAILS '1Z12545566624557CV','317SC073120120001C'
	--EXEC DVA_WEB_SELECT_RECONCILIATION_DETAILS '1Z12545566624557CV','317SC073120120001C'
	--Exec DVA_WEB_SELECT_RECONCILIATION_DETAILS 'TESTFERCHO2','','','','','','','','','','','','','Western','Admin'
	--EXEC DVA_WEB_SELECT_RECONCILIATION_DETAILS 'TESTFERCHO2','321321','','','','','','','','','','','','Western','Admin'
  SET NOCOUNT ON;
  declare @Temp1 table(
		syskey int
	)
	if @RoleName = 'Region'
	Begin
		insert into @Temp1
		SELECT SysKey FROM pobox where Region = @Region and pobox.pobox like '%' + @location + '%'
	End
	if @RoleName = 'User'
	Begin
		insert into @Temp1
		SELECT SysKey FROM pobox where pobox = @location
	End
	if @RoleName = 'Admin' or @RoleName = 'National'
	Begin
		insert into @Temp1
		SELECT SysKey FROM pobox where pobox.pobox like '%' + @location + '%'
	End
	
  	if((@ShipDateIn = '' or @ShipDateOut = '') and (@DateInChk <> '' and @DateOutChk <> ''))
	BEGIN
					 select customerCheckIn.insertdate as VA_Ship_Date, 
						max(manifestDCS.insertdate) as CheckIn_Date,
						/*CustomerDATA.Firstname*/'A' as First_Name,/*CustomerDATA.MiddleInitial*/'A' as MI,/*CustomerDATA.Lastname*/'A' as Last_Name, 
						/*CustomerDATA.participantID*/'99999999' as Participant_ID, CustomerDATA.dcsID as DCS_ID,/*document.FileNumber*/'99999999' as File_Number, CustomerDATA.numdocs as #_of_Documents, SUM(document.numpages) as #_of_Images,
						Max(document.ftpstime) as Upload_to_VA_Date, CustomerDATA.ShipDate as Return_to_VA_Date,customerdata.shiptrackingnumber as Return_Tracking_#, pobox.pobox as Location
			   
			   from     customerCheckIn
						left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
						left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN
						left join Document on CustomerDATA.dcsID = Document.dcsID
						left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN

			  where		customerCheckIn.trackingno = @TrackingNo
						and LTRIM(RTRIM(customerCheckIn.RMN)) = @Rmn
						and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
						and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
						and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
						and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
						and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
						and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
			            
						and customerCheckIn.insertdate like '%%'
						and isnull(CONVERT(VARCHAR(10), manifestDCS.insertdate, 101),'') between @DateInChk and @DateOutChk
						
										    
						--and dbo.pobox.pobox like case when @location = '' then '%%' when @location <> '' then Replace(@location,'*','%')end
						and customerCheckIn.location in (select * from @Temp1)		
						
			   group by LTRIM(RTRIM(customerCheckIn.RMN)), customerCheckIn.trackingno, convert(date, customerCheckIn.insertdate), 
						CustomerDATA.Firstname, CustomerDATA.MiddleInitial, CustomerDATA.Lastname,
						CustomerDATA.participantID, CustomerDATA.dcsID, Document.FileNumber,
						CustomerDATA.numdocs,customerdata.shiptrackingnumber,
						customerCheckIn.insertdate, CustomerDATA.ShipDate, pobox.pobox             
		
	  END
	  
	  if((@ShipDateIn <> '' and @ShipDateOut <> '') and (@DateInChk = '' or @DateOutChk = ''))
	  BEGIN
				 select customerCheckIn.insertdate as VA_Ship_Date, 
						max(manifestDCS.insertdate) as CheckIn_Date,
						/*CustomerDATA.Firstname*/'A' as First_Name,/*CustomerDATA.MiddleInitial*/'A' as MI,/*CustomerDATA.Lastname*/'A' as Last_Name, 
						/*CustomerDATA.participantID*/'99999999' as Participant_ID, CustomerDATA.dcsID as DCS_ID,'99999999' as File_Number, CustomerDATA.numdocs as #_of_Documents, SUM(document.numpages) as #_of_Images,
						max(document.ftpstime) as Upload_to_VA_Date, CustomerDATA.ShipDate as Return_to_VA_Date,customerdata.shiptrackingnumber as Return_Tracking_#, pobox.pobox as Location
			   
			   from     customerCheckIn
						left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
						left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN
						left join Document on CustomerDATA.dcsID = Document.dcsID
						left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN

			  where		customerCheckIn.trackingno = @TrackingNo
						and LTRIM(RTRIM(customerCheckIn.RMN)) = @Rmn
						and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
						and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
						and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
						and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
						and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
						and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
			            
					    and CONVERT(VARCHAR(10),customerCheckIn.insertdate, 101) between @ShipDateIn and @ShipDateOut
					    and isnull(manifestDCS.insertdate,'') like '%%'
										    
						--and dbo.pobox.pobox like case when @location = '' then '%%' when @location <> '' then Replace(@location,'*','%')end
						and customerCheckIn.location in (select * from @Temp1)		
						
			   group by    LTRIM(RTRIM(customerCheckIn.RMN)), customerCheckIn.trackingno, convert(date, customerCheckIn.insertdate),
						CustomerDATA.Firstname, CustomerDATA.MiddleInitial, CustomerDATA.Lastname,
						CustomerDATA.participantID, CustomerDATA.dcsID, Document.FileNumber,
						CustomerDATA.numdocs,customerdata.shiptrackingnumber,
						customerCheckIn.insertdate, CustomerDATA.ShipDate, pobox.pobox             
	  END
	  
	  if((@ShipDateIn <> '' and @ShipDateOut <> '') and (@DateInChk <> '' and @DateOutChk <> ''))
	  BEGIN
						 select customerCheckIn.insertdate as VA_Ship_Date, 
						Max(manifestDCS.insertdate) as CheckIn_Date,
						/*CustomerDATA.Firstname*/'A' as First_Name,/*CustomerDATA.MiddleInitial*/'A' as MI,/*CustomerDATA.Lastname*/'A' as Last_Name, 
						'99999999' as Participant_ID, CustomerDATA.dcsID as DCS_ID,'99999999' as File_Number, CustomerDATA.numdocs as #_of_Documents, SUM(document.numpages) as #_of_Images,
						max(document.ftpstime) as Upload_to_VA_Date, CustomerDATA.ShipDate as Return_to_VA_Date,customerdata.shiptrackingnumber as Return_Tracking_#, pobox.pobox as Location
			   
			   from     customerCheckIn
						left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
						left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN
						left join Document on CustomerDATA.dcsID = Document.dcsID
						left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN

			  where		customerCheckIn.trackingno = @TrackingNo
						and LTRIM(RTRIM(customerCheckIn.RMN)) = @Rmn
						and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
						and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
						and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
						and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
						and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
						and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
			            
					    and CONVERT(VARCHAR(10),customerCheckIn.insertdate, 101) between @ShipDateIn and @ShipDateOut
						and isnull(CONVERT(VARCHAR(10),manifestDCS.insertdate, 101),'') between @DateInChk and @DateOutChk
										    
						--and dbo.pobox.pobox like case when @location = '' then '%%' when @location <> '' then Replace(@location,'*','%')end
						and customerCheckIn.location in (select * from @Temp1)	
						
			   group by    LTRIM(RTRIM(customerCheckIn.RMN)), customerCheckIn.trackingno, convert(date, customerCheckIn.insertdate), 
						CustomerDATA.Firstname, CustomerDATA.MiddleInitial, CustomerDATA.Lastname,
						CustomerDATA.participantID, CustomerDATA.dcsID, Document.FileNumber,
						CustomerDATA.numdocs,customerdata.shiptrackingnumber,
						customerCheckIn.insertdate, CustomerDATA.ShipDate, pobox.pobox             
	  END
	  
	  if((@ShipDateIn = '' and @ShipDateOut = '') and (@DateInChk = '' and @DateOutChk = ''))
	  BEGIN
		select customerCheckIn.insertdate as VA_Ship_Date, 
				Max(manifestDCS.insertdate) as CheckIn_Date,
				'A' as First_Name,'A' as MI,'A' as Last_Name, 
				'99999999' as Participant_ID, CustomerDATA.dcsID as DCS_ID,'99999999' as File_Number, CustomerDATA.numdocs as #_of_Documents, SUM(document.numpages) as #_of_Images,
				Max(document.ftpstime) as Upload_to_VA_Date, CustomerDATA.ShipDate as Return_to_VA_Date,customerdata.shiptrackingnumber as Return_Tracking_#, pobox.pobox as Location
	   from     customerCheckIn
				left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
				left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN
				left join Document on CustomerDATA.dcsID = Document.dcsID
				left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN
	  where		customerCheckIn.trackingno = @TrackingNo
				and LTRIM(RTRIM(customerCheckIn.RMN)) = @Rmn
				and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
				and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
				and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
				and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
				and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
				and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
			    and isnull(customerCheckIn.insertdate,'') like '%%'
				and isnull(manifestDCS.insertdate,'') like '%%'
				and customerCheckIn.location in (select * from @Temp1)	
	   	group by    LTRIM(RTRIM(customerCheckIn.RMN)), customerCheckIn.trackingno,
	   			convert(date, customerCheckIn.insertdate),
				CustomerDATA.Firstname, CustomerDATA.MiddleInitial, CustomerDATA.Lastname,
				CustomerDATA.participantID, CustomerDATA.dcsID, Document.FileNumber,
				CustomerDATA.numdocs,customerdata.shiptrackingnumber,
				customerCheckIn.insertdate,CustomerDATA.ShipDate, pobox.pobox             
	  END
END
