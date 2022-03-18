--DOCID CMP by date
use TurboscanNG1
select batchname, Batchdesc,
case 
       WHEN WFStep = 6 then 'DocID'
END
AS "Turboscan Batch Location", (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime
 from Batches 
where jobid = 11 and wfstep = 6
order by TurboscanImportDateTime



--DOCID DCS by date
use TurboscanNG1
select batchname, Batchdesc,
case 
       WHEN WFStep = 6 then 'DocID'
END
AS "Turboscan Batch Location", (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime
 from Batches 
where jobid = 8 and wfstep = 6
order by TurboscanImportDateTime




--DOCID DCS by date
use turboscanng1 select distinct T.BatchName, p.RMN, cc.claimtype ClaimType, T.BatchDesc, T.TurboscanBatchLocation, T.TurboscanImportDateTime
                        FROM
                        (select distinct batchname, Batchdesc,
                        case 
                               WHEN WFStep = 6 then 'DocID'
                        END
                        AS 'TurboscanBatchLocation', (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime
                         from Batches
                        where jobid = 8 and wfstep = 6) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        left join dva.dbo.customerCheckIn cc
                        on p.RMN = cc.RMN
                        order by T.TurboscanImportDateTime




---Turboscan Batches by date --DCS
	   use turboscanng1 select distinct T.BatchName, p.RMN, cc.claimtype ClaimType, T.BatchDesc, T.TurboscanBatchLocation, T.BatchStatus, T.TurboscanImportDateTime
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
						(DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime
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
                        order by T.TurboscanImportDateTime




---Turboscan Batches by date --CMP
	   use turboscanng1 select distinct T.BatchName, p.RMN,  T.TurboscanBatchLocation, T.BatchStatus, T.TurboscanImportDateTime, T.BatchDesc
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
						(DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime
                         from Batches
                        where jobid = 11 and
						batchname <> 'TS_CMP Template' and
						(WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						WFStep = 7 or WFStep = 8 or WFStep = 9 or 
						(WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        order by T.TurboscanImportDateTime




						select * from TurboscanNG1.dbo.batches where batchname = 'TS_CMP Template'