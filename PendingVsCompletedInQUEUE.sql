use turboscanng1 select  distinct cc.claimtype ClaimType, sum(T.TotalImages) TotalImages, T.batchname
						into docid.dbo.csBatches2
                        FROM
                        (select distinct batchname, Batchdesc,
                        case 
							   WHEN WFStep = 1 then 'Capture'
							   WHEN WFStep = 2 then 'Enhance'
							   WHEN WFStep = 3 then 'Separation'
							   WHEN WFStep = 4 then 'ImageQC'
							   WHEN WFStep = 5 then 'AutoIndex'
							   WHEN WFStep = 6 then 'DocID'
							   WHEN WFStep = 7 then 'DocIDQC'
							   WHEN WFStep = 8 then 'Manual Index'
							   WHEN WFStep = 9 then 'Manual IndexQC'
							   WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
							   WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
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
						(DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime, WFStep, BatchLocation
                         from Batches
                        where jobid = 8 and
						(WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						WFStep = 7 or WFStep = 8 or WFStep = 9 or 
						(WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        left join dva.dbo.customerCheckIn cc
                        on p.RMN = cc.RMN   
						where cc.claimtype = 'C' 
						and T.TurboscanBatchLocation = 'DocID'
						--and T.TurboscanBatchLocation <> 'Export' and T.BatchStatus <> 'Auto-Fail'
						group by T.BatchName, cc.claimtype



--drop table docid.dbo.csBatches