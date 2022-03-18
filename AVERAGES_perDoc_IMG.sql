--average doc per DCSID
select distinct d.dcsID, count(d.imageid) as docs
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-03-14 0:0:0' and AckTime <= '2015-06-12 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
where (d.ImageID like '%p00%' or ImageID like '%p01%')
group by dcsID


--average img per DCSID CMP
select distinct d.dcsID, sum(d.numpages) as Pages
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-03-14 0:0:0' and AckTime <= '2015-06-12 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
group by dcsID


--average img per DCSID DCS
select distinct dcsid, SUM(numpages)from document 
where ftpstime >= '2015-03-14 0:0:0' and ftpstime <= '2015-06-12 23:59:59.999' 
and pbatch like '02%'
group by dcsid



---average img per batch CMP
select distinct d.PBatch, sum(d.numpages) as Pages
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-03-14 0:0:0' and AckTime <= '2015-07-03 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on T.batchname = d.pbatch
group by d.PBatch



--average DCSID per batch
select count(distinct d.dcsID) TotalDCSIDs, count(distinct T.batchname) TotalBatches
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-07-06 0:0:0' and AckTime <= '2015-07-24 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
left join document d
on batchname = d.pbatch
--where (d.ImageID like '%p00%' or ImageID like '%p01%')
--group by T.batchname


