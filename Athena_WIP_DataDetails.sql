SELECT Received,
                            CustomerName,
                            JobName,
                            ProcessType,
                            BatchName,
                            [Status],
                            ImageCount,
                            DocCount,
                            CompleteDate, 
                            Vertical = 'Public Sector',
                            Region = 'NA',
                            Country = 'US',
                            BillType = 'NA',
                            [Sub-Process] = 'Scan'
                            FROM
                            (
                                SELECT
                                    CONVERT(DATETIME, DATEADD(hh, DATEDIFF(hour, GETUTCDATE(), GetDate()), DATEADD(ss, b.TimeStamp, '01/01/1970')), 103) AS Received,
                                    CustomerName = 'VA',
		                            CASE
			                            WHEN b.BatchName like '01%' then 'RMN'
			                            WHEN b.BatchName like '02%' then 'ICMHS'
			                            WHEN b.BatchName like '07%' then 'BWN'
			                            ELSE 'TSIV'
			                            END JobName,
                                    (CASE 
			                            WHEN (SELECT TOP 1 DBVersion FROM TSDBInfo) >= 7 THEN 'OpenBox' 
			                            ELSE 'TurboScan' END) AS ProcessType,
                                    b.BatchName AS BatchName,
                                    (CASE WHEN b.BatchLocation = 0 THEN 'COMPLETED' 
		                            ELSE 'WIP' END) AS Status,
                                    ISNULL((SELECT COUNT(Level1) FROM Image WHERE BatchId = b.BatchId AND Level1 = 1), 0) AS DocCount,
                                    b.TotalImages AS ImageCount,
                                    (CASE WHEN b.BatchLocation = 0 THEN (SELECT MAX(CONVERT(DATETIME, DATEADD(hh, DATEDIFF(hour, GETUTCDATE(), GetDate()), DATEADD(ss, AppTimeStamp, '01/01/1970')), 103)) FROM BatchResults WHERE BatchId = b.BatchId) ELSE NULL END) AS CompleteDate
                                FROM
                                Batches b 
								where b.batchlocation <> 0
                            ) tab
                            WHERE Received > '8/1/2020 0:0:0'
                            GROUP BY Received, CustomerName, JobName, ProcessType, BatchName, [Status], ImageCount, DocCount, CompleteDate
                            ORDER BY JobName, BatchName