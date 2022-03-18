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


use turboscanng1 select distinct T.BatchName, p.RMN, cc.claimtype ClaimType, T.TurboscanBatchLocation, T.BatchStatus, T.TotalImages, T.TurboscanImportDateTime, T.BatchDesc, T.WFStep, T.BatchLocation
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
                        order by T.TurboscanImportDateTime




use turboscanng1 
select  
u.UserName, (DATEADD(hh, -5, DATEADD(ss, r.apptimestamp, '01/01/1970'))),
w.WSName, 
b.BatchName 
from BatchResults r
join Batches b 
on r.BatchID = b.BatchID 
join Users u 
on r.UserID = u.UserID 
join Workstation w 
on r.WSID = w.WSID
where b.BatchStatus = '2' and b.Batchname = '02151320302303' and r.WFStep = '6'
order by u.UserName, w.WSName

select * from BatchResults where batchid = '673449'


select * from Batches where BatchName = '02151320302303'