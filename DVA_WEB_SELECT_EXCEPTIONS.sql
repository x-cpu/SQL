USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[DVA_WEB_SELECT_EXCEPTIONS]    Script Date: 10/3/2012 5:43:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DVA_WEB_SELECT_EXCEPTIONS]
	@Opid as varchar(50),
	@Region as Varchar(50),
	@RoleName as Varchar(50),
	@location as Varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @Temp1 table(
		syskey int
	)

	if @RoleName = 'Region'
	Begin
		insert into @Temp1
		SELECT SysKey FROM pobox where Region = @Region
	End
	if @RoleName = 'User'
	Begin
		insert into @Temp1
		SELECT SysKey FROM pobox where pobox = @location
	End
	if @RoleName = 'Admin' or @RoleName = 'National'
	Begin
		insert into @Temp1
		SELECT SysKey FROM pobox
	End
	
	select exceptions.syskey as ID,CONVERT(VARCHAR(10), [customerCheckIn].insertdate, 101) as Ship_date,[exceptions].[operID],[exceptions].[trackingno],[exceptions].[RMN],[dcsID],CONVERT(VARCHAR(10), [exceptions].[insertdate], 101) as insertdate,[errortype] 
	FROM [DVATest].[dbo].[exceptions] 
	inner join customerCheckIn on customerCheckIn.trackingno = exceptions.trackingno
	and customerCheckIn.RMN = exceptions.RMN
	where exceptions.operID = @Opid 
	and dbo.exceptions.trackingno in(SELECT trackingno FROM customerCheckIn where location in (select * from @Temp1))
	
END
