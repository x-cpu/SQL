USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[DVA_WEB_SELECT_DCSID]    Script Date: 4/16/2014 1:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[DVA_WEB_SELECT_DCSID]
	@DateIN as 	VARCHAR(10),
	@DateOut  as VARCHAR(10),
	@DCSID as VARCHAR(50)
AS
BEGIN
	DECLARE @query VARCHAR(4000)

	SET @query = 'SELECT manifestDCS.RMN, manifestDCS.dcsID, 
		MAX(manifestDCS.insertdate) as ''insertdate'', 
		MAX(BatchLocation) As ''BatchLocation''
		INTO #Temp
		FROM TurboscanNG1.dbo.Batches 
		inner join 
		dva.dbo.manifestDCS on substring(TurboscanNG1.dbo.batches.BatchName, 1,12) = manifestDCS.pbatch 
		WHERE BatchLocation >= 2 AND BatchLocation <= 256 '
		
	IF(@DCSID <> '')
	BEGIN
		SET @query = @query + ' and dcsID = '''+ @DCSID + '''' +CHAR(13)	
	END
	IF(@DateOut<> '' AND @DateIn<> '')
	BEGIN
		SET @query = @query + '  and insertdate between cast('''+@DateIn+''' as datetime) and cast('''+ @DateOut+' 23:59:59.999'' as datetime) '+CHAR(13)	
	END
	SET @query = @query + ' GROUP BY manifestDCS.RMN, manifestDCS.dcsID'
	
	SET @query = @query + ' SELECT RMN,dcsID, 
		insertdate AS ''Received Date'',
		CASE BatchLocation
		When 1 then ''capture''
		WHEN 2 THEN ''Enhance''
		WHEN 4 THEN ''Separation''
		WHEN 8 THEN ''Auto Index''
		WHEN 64 THEN ''Verification''
		WHEN 128 THEN ''QA''
		WHEN 256 THEN ''Export''
		END AS ''Batch Location''
		
		from #Temp
	
		drop table #Temp	
	'
	--PRINT @query
	EXECUTE (@query)
END


