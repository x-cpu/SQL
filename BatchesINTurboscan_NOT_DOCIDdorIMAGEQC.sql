--Original
use turboscanng1 select distinct T.BatchName, p.RMN, cc.claimtype ClaimType, T.TurboscanBatchLocation, T.BatchStatus, T.TotalImages, T.TurboscanImportDateTime, T.BatchDesc, T.WFStep, T.BatchLocation
--into docid.dbo.batchesNotDocID
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
						(WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))
						and 
						BatchName like  '0216204%'
						or BatchName like  '0216205%'
						or BatchName like  '0216206%'
						or BatchName like  '0216207%'
						or BatchName like  '0216208%'
						or BatchName like  '0216209%'
						or BatchName like  '0216210%'
						or BatchName like  '0216211%'
						or BatchName like  '0216212%'
						or BatchName like  '0216213%'
						or BatchName like  '0216214%'
						or BatchName like  '0216215%'
						or BatchName like  '0216216%'
						or BatchName like  '0216217%'
						or BatchName like  '0216218%'
						or BatchName like  '0216219%'
						or BatchName like  '0216220%'
						or BatchName like  '0216221%'
						) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        left join dva.dbo.customerCheckIn cc
                        on p.RMN = cc.RMN
                        where T.TurboscanBatchLocation in ('DocID')
						--and cc.claimtype = 'P'       
						and  not exists (select * from dva.dbo.TS_Audit where T.BatchName = TS_Audit.batchname and TSModule = 'DocID')
						and  not exists (select * from dva.dbo.TS_Audit where T.BatchName = TS_Audit.batchname and TSModule = 'ImageQC')
						and BatchStatus <> 'In Process'
						order by T.TurboscanImportDateTime



use turboscanng1 select  convert(date, T.TurboscanImportDateTime, 101) TurboscanImportDateTime, count(distinct batchname) BatchCount, cc.claimtype ClaimType, sum(T.TotalImages) TotalImages
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
                        where T.TurboscanBatchLocation in ('DocID')
						--and cc.claimtype = 'P'       
						and  not exists (select * from dva.dbo.TS_Audit where T.BatchName = TS_Audit.batchname and TSModule = 'DocID')
						and  not exists (select * from dva.dbo.TS_Audit where T.BatchName = TS_Audit.batchname and TSModule = 'ImageQC')
						and BatchStatus <> 'In Process'
						group by convert(date, T.TurboscanImportDateTime, 101), cc.claimtype
						order by convert(date, T.TurboscanImportDateTime, 101), cc.claimtype






select * from dva.dbo.ts_audit where batchname = '02162181006801'