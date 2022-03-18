--update p
--set p.boxno = d.boxno
--from PhysicalBatch p
--left join docid.dbo.dd214_box d
--on p.PBatch = d.pbatch
--where p.rmn = 'rmndd214' and p.PBatch = '02163411500502'


select * from docid.dbo.dd214_box where pbatch = '02163411500502'

select * from PhysicalBatch where pbatch = '02163411500502'


---PART 1 of report
use turboscanng1 select distinct T.BatchName, p.RMN, p.BoxNO, T.TurboscanBatchLocation, T.BatchStatus, T.TotalImages
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
						(DATEADD(hh, -4, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime, WFStep, BatchLocation
                         from Batches
                        where jobid = 8 and
						(WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						WFStep = 7 or WFStep = 8 or WFStep = 9 or 
						(WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        --left join dva.dbo.customerCheckIn cc
                        --on p.RMN = cc.RMN   
                        order by T.TurboscanImportDateTime



--part 2

use DVA
select distinct s.kbatch, rmn = 'RMNDD214', p.BoxNO, location = 'CLEAN', status = 'VBMS Uploaded', sum(d.numpages) from stats s
left join PhysicalBatch p
on s.kbatch = p.PBatch
left join document d 
on p.pbatch = d.PBatch
where exists (select * from PhysicalBatch where rmn = 'rmndd214' and pbatch like '02%' and s.kbatch = pbatch)
group by s.kbatch, p.BoxNO





select distinct pbatch, BoxNO from PhysicalBatch where rmn = 'rmndd214'



--update d
--set d.ftpstime = dc.ftpstime
--from document d
--left join Document_Corres dc
--on d.ImageID = dc.ImageID
--where d.ftpstime is not null
--and d.pbatch in (
--'02162291202202',
--'02162291207506',
--'02162291208302',
--'02162291208303',
--'02162291300204',
--'02162291402902',
--'02162291406902',
--'02162291409404',
--'02162291410306',
--'02162291414604')

select * from docid.dbo.dd214_box

