USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[DVA_WEB_SELECT_RECONCILIATION]    Script Date: 09/19/2012 07:17:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC DVA_WEB_SELECT_RECONCILIATION '','317VB0727121234R','','','','','','  ','','','','','','Western','Admin'
--EXEC DVA_WEB_SELECT_RECONCILIATION 'TESTFERCHO2','','','','','','','','','','','','','Western','Admin'
ALTER PROCEDURE [dbo].[DVA_WEB_SELECT_RECONCILIATION]
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
	
if(@TrackingNo <> '' or @Rmn <> ''or @Firstname <> ''or @Lastname <> ''or @MiddleInitial <> ''or @dcsID <> '' or @participantID <> '' or @FileNumber <> '' or @ShipDateIn <> '' or @ShipDateOut <> '' or @DateInChk <> '' or @DateOutChk <> '')
BEGIN
		if((@ShipDateIn = '' or @ShipDateOut = '') and (@DateInChk <> '' and @DateOutChk <> ''))
		BEGIN
		select Distinct customerCheckIn.RMN, customerCheckIn.trackingno as Tracking_Number
					from customerCheckIn 
					left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
					left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN 
					left join Document on CustomerDATA.dcsID = Document.dcsID 
					left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN 
					where  
					customerCheckIn.trackingno like case when @TrackingNo = '' then '%%' when @TrackingNo <> '' then Replace(@TrackingNo,'*','%') end
								and LTRIM(RTRIM(customerCheckIn.RMN)) like case when @Rmn = '' then '%%' when @Rmn <> '' then Replace(@Rmn,'*','%') end
								and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
								and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
								and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
								and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
								and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
								and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
							   
							    and isnull(CONVERT(VARCHAR(10), customerCheckin.insertdate, 101),'') like '%%'
							    and isnull(CONVERT(VARCHAR(10), manifestDCS.insertdate, 101),'') between @DateInChk and @DateOutChk
							
								and customerCheckIn.location in (select * from @Temp1)	
													
		END
		if((@ShipDateIn <> '' and @ShipDateOut <> '') and (@DateInChk = '' or @DateOutChk = ''))
		BEGIN
		select Distinct customerCheckIn.RMN, customerCheckIn.trackingno as Tracking_Number
					from customerCheckIn 
					left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
					left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN 
					left join Document on CustomerDATA.dcsID = Document.dcsID 
					left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN 
					where  
					customerCheckIn.trackingno like case when @TrackingNo = '' then '%%' when @TrackingNo <> '' then Replace(@TrackingNo,'*','%') end
								and LTRIM(RTRIM(customerCheckIn.RMN)) like case when @Rmn = '' then '%%' when @Rmn <> '' then Replace(@Rmn,'*','%') end
								and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
								and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
								and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
								and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
								and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
								and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
							    
							    and CONVERT(VARCHAR(10), customerCheckin.insertdate, 101) between @ShipDateIn and @ShipDateOut
							    and isnull(CONVERT(VARCHAR(10), manifestDCS.insertdate, 101),'') like '%%'
								
								and customerCheckIn.location in (select * from @Temp1)			
		END
		if((@ShipDateIn <> '' and @ShipDateOut <> '') and (@DateInChk <> '' and @DateOutChk <> ''))
		BEGIN
		select Distinct customerCheckIn.RMN, customerCheckIn.trackingno as Tracking_Number
					from customerCheckIn 
					left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
					left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN 
					left join Document on CustomerDATA.dcsID = Document.dcsID 
					left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN 
					where  
					customerCheckIn.trackingno like case when @TrackingNo = '' then '%%' when @TrackingNo <> '' then Replace(@TrackingNo,'*','%') end
								and LTRIM(RTRIM(customerCheckIn.RMN)) like case when @Rmn = '' then '%%' when @Rmn <> '' then Replace(@Rmn,'*','%') end
								and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
								and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
								and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
								and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
								and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
								and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
							   
							    and CONVERT(VARCHAR(10), customerCheckin.insertdate, 101) between @ShipDateIn and @ShipDateOut
							    and CONVERT(VARCHAR(10), manifestDCS.insertdate, 101) between @DateInChk and @DateOutChk
								
								--and dbo.pobox.pobox like case when @location = '' then '%%' when @location <> '' then Replace(@location,'*','%')end
								and customerCheckIn.location in (select * from @Temp1)			
		END
		if((@ShipDateIn = '' and @ShipDateOut = '') and (@DateInChk = '' and @DateOutChk = ''))
		BEGIN
		select Distinct customerCheckIn.RMN, customerCheckIn.trackingno as Tracking_Number
					from customerCheckIn 
					left join dbo.pobox on dbo.pobox.sysKey = customerCheckIn.Location
					left join CustomerDATA on customerCheckIn.RMN = CustomerDATA.RMN 
					left join Document on CustomerDATA.dcsID = Document.dcsID 
					left join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN 
					where  
					customerCheckIn.trackingno like case when @TrackingNo = '' then '%%' when @TrackingNo <> '' then Replace(@TrackingNo,'*','%') end
						and LTRIM(RTRIM(customerCheckIn.RMN)) like case when @Rmn = '' then '%%' when @Rmn <> '' then Replace(@Rmn,'*','%') end
						and isnull(CustomerDATA.Firstname,'') like case when @Firstname = '' then '%%' when @Firstname <> '' then Replace(@Firstname,'*','%') end
						and isnull(CustomerDATA.Lastname,'') like case when @Lastname = '' then '%%' when @Lastname <> '' then Replace(@Lastname,'*','%') end
						and isnull(CustomerDATA.MiddleInitial,'') like case when isnull(CustomerDATA.MiddleInitial,'') = '' then '%%' when isnull(CustomerDATA.MiddleInitial,'') <> '' then Replace(CustomerDATA.MiddleInitial,'*','%') end
						and isnull(CustomerDATA.dcsID,'') like case when @dcsID = '' then '%%' when @dcsID <> '' then Replace(@dcsID,'*','%') end
						and isnull(CustomerDATA.participantID,'') like case when @participantID = '' then '%%' when @participantID <> '' then Replace(@participantID,'*','%') end
						and isnull(Document.FileNumber,'') like case when @FileNumber = '' then '%%' when @FileNumber <> '' then Replace(@FileNumber,'*','%') end
						and isnull(CONVERT(VARCHAR(10), customerCheckin.insertdate, 101),'') like '%%'
						and isnull(CONVERT(VARCHAR(10), manifestDCS.insertdate, 101),'') like '%%'
						and customerCheckIn.location in (select * from @Temp1)			
		END                      
END
END		