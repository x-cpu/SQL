select T.UploadDate, sum(T.DCSIDs) DCSIDs, sum(T.Docs) Docs, sum(T.Images) Images, sum(T.FileCharCounts) FileCharCounts
FROM
(select distinct convert(date, d.ftpstime, 101) UploadDate, 
count (distinct d.dcsID) DCSIDs, 
count(d.ImageID) Docs, sum(d.numpages) Images,
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
from document d 
left join CustomerDATA c
on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
--left join PhysicalBatch p
--on d.pbatch = d.pbatch
where d.ftpstime is not null
and d.ftpstime >= '2019-02-01' and d.ftpstime <= '2019-02-15'
--and p.BatchClassName = 'Adaptive Auto Card'
and exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
group by convert(datetime, d.ftpstime, 101)) T
group by T.UploadDate
order by T.UploadDate



--Physicalbatch.Batchclassname='adaptive auto card'

select distinct CONVERT(date, d.ftpstime, 101) UploadDate, 
count(distinct d.dcsid) DCSIDs, 
count(distinct d.imageID) Docs,
sum(d.numpages) Images
--ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
from document d
left join CustomerDATA c
on d.dcsID = c.dcsID
where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
and d.ftpstime >= '2019-02-01'
group by CONVERT(date, d.ftpstime, 101)
order by CONVERT(date, d.ftpstime, 101)


--GOOD ONE
select distinct CONVERT(date, d.ftpstime, 101) UploadDate, 
count(distinct d.dcsid) DCSIDs, 
count(distinct d.imageID) Docs,
sum(d.numpages) Images,
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
from document d
left join CustomerDATA c
on d.dcsID = c.dcsID
where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
and d.ftpstime >= '2019-02-01'
group by CONVERT(date, d.ftpstime, 101)
order by CONVERT(date, d.ftpstime, 101)


