USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[VA_UploadTAT_Report]    Script Date: 11/29/2012 6:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jamison Harris
-- Create date: 11/30/2012
-- Description:	Returns summary of errors by export date
-- =============================================
ALTER PROCEDURE [dbo].[VA_UploadTAT_Report] 
	-- Add the parameters for the stored procedure here
	--@FromDate DateTime, 
	--@ToDate DateTime
AS
IF 1=0 BEGIN
    SET FMTONLY OFF
END
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @CheckinDate DATE
    DECLARE @TATDate DATE
    DECLARE @RMN NVARCHAR(50)
    DECLARE @RMN_Count INT
    DECLARE @ClaimType NVARCHAR(20)
    DECLARE @ULWithinTAT INT
    DECLARE @IPWithinTAT INT
    DECLARE @WithinTAT INT
    DECLARE @ULOutsideTAT INT
    DECLARE @IPOutsideTAT INT
    
    IF OBJECT_ID('tempdb..#UPLOADTAT1_TEMP') IS NOT NULL
    BEGIN
		DROP TABLE #UPLOADTAT1_TEMP;
	END
        
    CREATE TABLE #UPLOADTAT1_TEMP
    (
		TATDate DATE,
		CheckinDate DATE,
		RMN NVARCHAR(50),
		RMN_Count INT,
		ClaimType NVARCHAR(20),
		ULWithinTAT INT,
		IPWithinTAT INT,
		WithinTAT INT,
		ULOutsideTAT INT,
		IPOutsideTAT INT
	)
	DECLARE table_cursor CURSOR FOR
		SELECT DISTINCT
		(CONVERT(varchar(10), DATEADD(day, 6 , p.InvTime), 101)) AS "TAT Date", 
		(CONVERT(varchar(10), p.InvTime, 101)) AS "Checkin Date", 
		p.RMN,
		ISNULL(c.ClaimType, 'C') AS "ClaimType"	
		FROM PhysicalBatch p
		LEFT JOIN customerCheckIn c
		ON c.RMN = p.RMN
		WHERE (CONVERT(varchar(10), DATEADD(day, 6, p.InvTime), 101)) 
		BETWEEN (CONVERT(varchar(10), DATEADD(day, -6, GETDATE()), 101)) AND (CONVERT(varchar(10), GETDATE(), 101))
		ORDER BY (CONVERT(varchar(10), p.InvTime, 101))
	OPEN table_cursor
	FETCH NEXT FROM table_cursor INTO @TATDate, @CheckinDate, @RMN, @ClaimType
	WHILE @@FETCH_STATUS = 0
		BEGIN
			--  Get Upload Within TAT
			DECLARE @NumBatchesCI INT
			DECLARE @NumBatchesUL INT
			SET @NumBatchesCI = (SELECT COUNT(DISTINCT PBatch) 
								FROM PhysicalBatch
								WHERE RMN = @RMN)
			SET @NumBatchesUL = (SELECT COUNT(DISTINCT PBatch) 
								FROM Document
								WHERE RMN = @RMN AND ftpstime <= @TATDate)
			IF @NumBatchesCI = @NumBatchesUL
			BEGIN
				SET @ULWithinTAT = 1
			END
			ELSE
				SET @ULWithinTAT = 0
				
			--  Get In Process Within TAT
			SET @NumBatchesCI = (SELECT COUNT(DISTINCT PBatch) 
								FROM PhysicalBatch
								WHERE RMN = @RMN AND GETDATE() <= @TATDate)
			IF @ULWithinTAT = 0 AND @NumBatchesCI > 0
			BEGIN
				SET @IPWithinTAT = 1
			END
			ELSE
				SET @IPWithinTAT = 0
				
			--  Within TAT
			SET @WithinTAT = @ULWithinTAT + @IPWithinTAT
			
			--  RMN Count
			SET @RMN_Count = 1
			
			--  Upload Outside TAT
			SET @NumBatchesCI = (SELECT COUNT(DISTINCT PBatch) 
								FROM PhysicalBatch
								WHERE RMN = @RMN)
			SET @NumBatchesUL = (SELECT COUNT(DISTINCT PBatch) 
								FROM Document
								WHERE RMN = @RMN AND ftpstime IS NOT NULL)
			IF (@NumBatchesCI = @NumBatchesUL) AND @ULWithinTAT = 0
			BEGIN
				SET @ULOutsideTAT = 1
			END
			ELSE
				SET @ULOutsideTAT = 0
				
			--  InProcess Outside TAT
			SET @NumBatchesCI = (SELECT COUNT(DISTINCT PBatch) 
								FROM PhysicalBatch
								WHERE RMN = @RMN)
			IF @ULWithinTAT = 0 AND @IPWithinTAT = 0 AND @ULOutsideTAT = 0 AND @NumBatchesCI > 0
			BEGIN
				SET @IPOutsideTAT = 1
			END
			ELSE
				SET @IPOutsideTAT = 0
			
						
			INSERT INTO #UPLOADTAT1_TEMP (TATDate, CheckinDate, RMN, RMN_Count, ClaimType, ULWithinTAT, IPWithinTAT, WithinTAT, ULOutsideTAT, IPOutsideTAT)
					VALUES (@TATDate, @CheckinDate, @RMN, @RMN_Count, @ClaimType, @ULWithinTAT, @IPWithinTAT, @WithinTAT, @ULOutsideTAT, @IPOutsideTAT)
			FETCH NEXT FROM table_cursor INTO @TATDate, @CheckinDate, @RMN, @ClaimType
		END
	CLOSE table_cursor
	DEALLOCATE table_cursor
	
	SELECT ClaimType, TATDate AS "TAT Date", CheckInDate AS "Check In Date", COUNT(Distinct RMN) AS "RMN Count", 
	SUM(ULWithinTAT) AS "Upload Within TAT", SUM(IPWithinTAT) AS "InProcess Within TAT", SUM(WithinTAT) AS "Within TAT",
	(CASE WHEN SUM(WithinTAT) = 0 THEN CONVERT(VARCHAR, 0) + '%' ELSE CONVERT(VARCHAR(20), ROUND(CONVERT(FLOAT, SUM(WithinTAT), 6)/SUM(RMN_Count), 6) * 100) + '%' END) AS "TAT %",
	SUM(ULOutsideTAT) AS "Upload Outside TAT", SUM(IPOutsideTAT) AS "InProcess Outside TAT"
	FROM #UPLOADTAT1_TEMP 
	GROUP BY TATDate, CheckinDate, ClaimType
	ORDER BY ClaimType, CONVERT(varchar, CheckinDate, 101) ASC
	DROP TABLE #UPLOADTAT1_TEMP
END


