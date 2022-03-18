

DECLARE @BatchName NVARCHAR(30);
DECLARE @BatchID INT;
DECLARE @WFStep INT;
DECLARE @ImageName NVARCHAR(30);
DECLARE @NumPagesDeletedInAI INT;
DECLARE @SQL NVARCHAR(200);


IF OBJECT_ID('tempdb..#TEMPTSImageDeletionReport') IS NOT NULL
    BEGIN
		DROP TABLE #TEMPTSImageDeletionReport;
	END
        
CREATE TABLE #TEMPTSImageDeletionReport
(
	BatchName NVARCHAR(30)
	, BatchID INT
	, WFSTEP INT
	, ImageName NVARCHAR(30)

)


DECLARE table_cursor CURSOR FOR
	SELECT   BatchID, BatchName, WFStep
	FROM Batches
	WHERE 
	--Timestamp > '1430438400' AND 
	WFStep > 7
	and Batchname not like '%training%'
	and batchname not like '%test%'
	and exists (select * from dva.dbo.ts_cbatches where TurboscanNG1.dbo.batches.BatchName = BatchName)
OPEN table_cursor
FETCH NEXT FROM table_cursor INTO @BatchID, @BatchName, @WFStep
WHILE @@FETCH_STATUS = 0

	BEGIN
		-- Insert statements for procedure here
		--SET @Sql = N'SELECT @NumPagesDeletedInAI = ISNULL(COUNT(DISTINCT ImageName), 0) FROM Image' + CONVERT(VARCHAR, @BatchID) + 
		--			' WHERE ImageStatus = -1 AND NextProcess = 8'
		--EXEC SP_EXECUTESQL @Sql, N'@NumPagesDeletedInAI INT OUTPUT', @NumPagesDeletedInAI OUTPUT
		
		DECLARE @dynamicSQL nvarchar(200)
		SET @dynamicSQL = N'SELECT count(ImageName) FROM Image' + CONVERT(VARCHAR, @BatchID) +
							' WHERE ImageStatus <> -10000 AND NextProcess<> 200000'
							
		DECLARE @outputCursor CURSOR
		SET @dynamicSQL = 'SET @outputCursor = CURSOR FORWARD_ONLY STATIC FOR ' +
              @dynamicSQL + ' ; OPEN @outputCursor'
			  
		exec sp_executesql @dynamicSQL, N'@outputCursor CURSOR OUTPUT', @outputCursor OUTPUT

		FETCH NEXT FROM @outputCursor INTO @ImageName

		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO #TEMPTSImageDeletionReport (BatchName, BatchID, WFStep, ImageName)
			VALUES (@BatchName, @BatchID, @WFStep, @ImageName)

			FETCH NEXT FROM @outputCursor INTO @ImageName
		END

		CLOSE @outputCursor
		DEALLOCATE @outputCursor		

		FETCH NEXT FROM table_cursor INTO @BatchID, @BatchName, @WFStep
	END
CLOSE table_cursor
DEALLOCATE table_cursor

SELECT * FROM #TEMPTSImageDeletionReport

DROP TABLE #TEMPTSImageDeletionReport