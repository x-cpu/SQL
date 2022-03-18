SELECT b.UserName as UserName
                                , COUNT(a.BatchID) as Batches
                                , SUM(a.AppImagesProcessed) as ImagesProcessed
                                , ROUND((CONVERT(FLOAT, SUM(a.AppProcTime))/60)/60, 2) as ProcessTime
                                , ROUND(CONVERT(FLOAT, SUM(a.AppProcTime))/SUM(a.AppImagesProcessed), 2) AS ProcessTimePerImage
                                , (ROUND(CONVERT(FLOAT, ((MAX(a.AppTimeStamp)-MIN(a.AppTimeStamp))
                                -SUM(a.AppProcTime))), 2)
                                /COUNT(a.BatchID)/60) AS AVGTimeBetweenBatches
                                FROM TurboscanNG1.dbo.BatchResults a
                                LEFT JOIN TurboscanNG1.dbo.Users b 
                                ON a.UserID = b.UserID 
                                LEFT JOIN TurboscanNG1.dbo.Batches c 
                                ON a.BatchID = c.BatchID
                                WHERE (a.AppID = 128) AND (c.WFStatus = 0) AND a.AppImagesProcessed > 0 
                                AND dateadd(hh, -5,dateadd(ss,a.AppTimeStamp,'01/01/1970')) BETWEEN '2012-12-10 0:0:0' AND '2012-12-11 23:59:59' 
                                GROUP BY b.UserName ORDER BY SUM(a.AppImagesProcessed) DESC

								--granular
								SELECT b.UserName as UserName
                                , COUNT(a.BatchID) as Batches, c.BatchName
                                , SUM(a.AppImagesProcessed) as ImagesProcessed
                                , ROUND((CONVERT(FLOAT, SUM(a.AppProcTime))/60)/60, 2) as ProcessTime
                                , ROUND(CONVERT(FLOAT, SUM(a.AppProcTime))/SUM(a.AppImagesProcessed), 2) AS ProcessTimePerImage
                                , (ROUND(CONVERT(FLOAT, ((MAX(a.AppTimeStamp)-MIN(a.AppTimeStamp))
                                -SUM(a.AppProcTime))), 2)
                                /COUNT(a.BatchID)/60) AS AVGTimeBetweenBatches
                                FROM TurboscanNG1.dbo.BatchResults a
                                LEFT JOIN TurboscanNG1.dbo.Users b 
                                ON a.UserID = b.UserID 
                                LEFT JOIN TurboscanNG1.dbo.Batches c 
                                ON a.BatchID = c.BatchID
                                WHERE (a.AppID = 128) AND (c.WFStatus = 0) AND a.AppImagesProcessed > 0 
                                AND dateadd(hh, -5,dateadd(ss,a.AppTimeStamp,'01/01/1970')) BETWEEN '2012-12-10 0:0:0' AND '2012-12-11 23:59:59' 
                                GROUP BY a.BatchId, b.UserName, c.BatchName 
								ORDER BY c.batchname

								use TurboscanNG1
								select distinct batchid 
								from BatchResults
								where AppID = '128' and batches.WFStatus = '0'





								WHEN BatchLocation = 128 AND WFStatus = 0 