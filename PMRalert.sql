--outstanding pmr batches
select distinct p.PBatch Batchname, p.InvTime BatchCheckInTime,
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep = 11 and batchlocation = 0 then 'Clean'
END
AS "Batch Location" from PhysicalBatch p
left join TurboscanNG1.dbo.batches ts
on p.PBatch = ts.BatchName
where BatchClassName = 'PMR' 
and not exists (select * from FTPDetails where p.PBatch = FTPDetails.batchname)


--count # of outstanding pmr batches
select count(distinct p.PBatch)
from PhysicalBatch p
where BatchClassName = 'PMR' 
and not exists (select * from FTPDetails where p.PBatch = FTPDetails.batchname)

select pbatch, pobox, invtime, CRCDestination pobox2, BatchClassName type from PhysicalBatch where pbatch = '03143180611801'


--IT version
select distinct p.PBatch Batchname, p.InvTime BatchCheckInTime, 
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep = 11 and batchlocation = 0 then 'Clean'
END
AS TurboscanBatchLocation, f.etime UploadDateTime, f.acktime UploadACKTime, f.comments UploadErrorComments from PhysicalBatch p
left join TurboscanNG1.dbo.batches ts
on p.PBatch = ts.BatchName
left join FTPDetails f
on p.PBatch = f.batchname
where BatchClassName = 'PMR' 
and ts.wfstep = '11'
and p.PBatch not in (select distinct batchname from ftpdetails where AckTime is not null)
and p.PBatch not in (select distinct pBatch from cmprecon where p.PBatch = cmprecon.pBatch)
and p.PBatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)



--IT version count
select count(distinct p.PBatch)
from PhysicalBatch p
left join TurboscanNG1.dbo.batches ts
on p.PBatch = ts.BatchName
left join FTPDetails f
on p.PBatch = f.batchname
where BatchClassName = 'PMR' 
and ts.wfstep = '11'
and p.PBatch not in (select distinct batchname from ftpdetails where AckTime is not null)
and p.PBatch not in (select distinct pBatch from cmprecon where p.PBatch = cmprecon.pBatch)
and p.PBatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)






select * from FTPDetails where batchname in (
'03143160614301',
'03143160625201',
'03143160626201',
'03143160626401',
'03143170613801',
'03143190605901',
'03143190607101',
'03143210618801',
'03143220620901')