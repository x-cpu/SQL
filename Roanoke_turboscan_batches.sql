--bob and neal version
select distinct tb.wfstep as TSQueue,
count(tb.batchname) "Batch Count", sum(tb.totalimages) as "Image Count", count(distinct dv.RMN) as "RMN Count" from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%' and tb.JobID = '8'
and (tb.WFStep <> '11' and tb.BatchStatus <> '8')
group by WFStep


--mario version
select distinct tb.BatchName, tb.BatchDesc, dv.RMN, (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboScanDate from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where tb.WFStep = '6' and dv.RMN like '314%'
order by TurboScanDate

---by queue with batchname
select tb.wfstep, tb.BatchName, tb.batchdesc, sum(tb.totalimages) as "Image Count", count(distinct dv.RMN) as "RMN Count" from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
--and tb.WFStep = '4' 
and JobID = '8'
and WFStep <= '10'
group by tb.WFStep, tb.BatchName, tb.batchdesc
order by tb.wfstep, tb.BatchName

select * from Batches where batchname = '02142740807501'



---by queue with batchname
select tb.BatchName, tb.batchdesc, sum(tb.totalimages) as "Image Count", count(distinct dv.RMN) as "RMN Count" from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
--and tb.WFStep = '1'
group by tb.WFStep, tb.BatchName, tb.batchdesc
order by tb.batchdesc

use TurboscanNG1
select * from Batches where batchname = '02141070415801'

use TurboscanNG1
select * from Batches where BatchStatus = '8'

select distinct pobox =
CASE
when p.pobox = '5236-Solicited' and p.CRCDestination is null then 'St. Petersburg'
when p.pobox = '5235-Unsolicited' and p.CRCDestination is null then 'St. Petersburg'
when p.pobox = '5236-Solicited' then p.CRCDestination
when p.pobox = '5235-Unsolicited' then p.CRCDestination
else p.pobox
end,
f.batchname batchname, d.dcsID, p.invtime inventoryTime, f.ETime uploadDate
from PhysicalBatch p
join FTPDetails f
on p.PBatch = f.batchname
join document d
on p.PBatch = d.PBatch
where p.pbatch like '03%'
and f.AckTime is not null and len(d.dcsID)=23 and d.ImageDateTime > '2014-05-05 00:00:00'
order by p.InvTime



select distinct tb.BatchName, tb.BatchDesc, dv.RMN, (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboScanDate from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where tb.WFStep = '6' and dv.RMN like '314%'
order by TurboScanDate



select distinct tb.wfstep =
CASE
when tb.wfstep = '1' then 'Scan'
when tb.wfstep = '2' then 'Enhance'
when tb.wfstep = '3' then 'Separation'
when tb.wfstep = '4' then 'QA1/QC'
when tb.wfstep = '5' then 'AutoIndex'
when tb.wfstep = '6' then 'DocID'
when tb.wfstep = '7' then 'DocIDQC'
when tb.wfstep = '8' then 'ManualIndex'
when tb.wfstep = '9' then 'ManualIndexQC'
when tb.wfstep = '10' then 'Verification'
when tb.wfstep = '11' then 'Export'
else tb.wfstep
end,
count(tb.batchname), sum(tb.totalimages) from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
group by WFStep


select distinct tb.wfstep as TSQueue,
count(tb.batchname) "Batch Count", sum(tb.totalimages) as "Image Count", count(distinct dv.RMN) as "RMN Count" from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
and (tb.WFStep <> '11' and tb.BatchStatus <> '8')
group by WFStep

select distinct tb.wfstep,
BatchName, sum(tb.totalimages) as "Image Count", count(distinct dv.RMN) as "RMN Count" from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
and tb.WFStep = '10'
group by WFStep, BatchName



select distinct tb.wfstep WFSTEP, 
count(tb.batchname) "Batch Count", sum(tb.totalimages) as "Image Count", count(distinct dv.RMN) as "RMN Count" from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
and (tb.WFStep <> '11' and tb.BatchStatus <> '8')
and tb.WFStep <> '11'
group by WFStep




select *
from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where dv.RMN like '314%'
and (tb.WFStep = '10' and tb.BatchStatus <> '8')
group by WFStep
