select distinct T.BatchName, p.RMN, cc.claimtype ClaimType, T.TurboscanBatchLocation, T.BatchStatus, T.TotalImages,
DATEDIFF(day, p.InvTime, GETDATE()) CurrentTAT,
p.InvTime BatchCheckInDate,
 T.TurboscanImportDateTime, T.BatchDesc
                        FROM
                        (select distinct batchname, Batchdesc,
                        case 
							 WHEN WFStep = 1 then 'Capture'
							 WHEN WFStep = 2 then 'Enhance1'
							 WHEN WFStep = 3 then 'FullPageOCR'
							 WHEN WFStep = 4 then 'Enhance2'
							 WHEN WFStep = 5 then 'Separation'
							 WHEN WFStep = 6 then 'ImageQC'
							 WHEN WFStep = 7 then 'AutoIndex'
							 WHEN WFStep = 8 then 'DocID'
							 WHEN WFStep = 9 then 'DocIDQC'
                             WHEN WFStep = 10 then 'ManualIndex'
							 WHEN WFStep = 12 and batchlocation = 64 then 'Verification'
							 WHEN WFStep = 13 and batchlocation = 256 then 'Export' 
                        END
                        AS 'TurboscanBatchLocation', 
						case
								WHEN BatchStatus = 1 then 'Ready'
								WHEN BatchStatus = 2 then 'In Process'
								WHEN BatchStatus = 4 then 'Suspended'
								WHEN BatchStatus = 8 then 'Auto-Fail'
								END
								AS 'BatchStatus',
                        TotalImages,
						(DATEADD(hh, -4, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime, WFStep, BatchLocation
                         from [mtv-va-sql-4\p1].turboscanng1.dbo.Batches
                        where jobid = 8 and
						(WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						WFStep = 7 or WFStep = 8 or WFStep = 9 or WFStep = 10 or
						(WFStep = 12 and batchlocation = 64) or (WFStep = 13 and batchlocation = 256))) T
                        left join [mtv-va-sql-1\p922].dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        left join [mtv-va-sql-1\p922].dva.dbo.customerCheckIn cc
                        on p.RMN = cc.RMN   
						where (T.BatchName not like '%test%' and T.BatchName not like 'TSIV%')
                        order by T.BatchName, T.TurboscanImportDateTime



