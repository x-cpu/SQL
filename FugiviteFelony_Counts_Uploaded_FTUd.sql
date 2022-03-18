--Fugitive Felony Count
select CONVERT(nvarchar, d.ftpstime, 101) UploadDate, count(distinct d.ImageID) Documents, sum(d.NumPages) Images
from document d
where d.ftpstime >= '2020-02-01'
and d.PBatch like '19%'
group by CONVERT(nvarchar, d.ftpstime, 101)


--Fugitive FTU
select distinct T.UploadDate, ISNULL(sum(T.documents), 0) Docs, ISNULL(sum(T.Images), 0) Images
FROM
(select CONVERT(nvarchar, s.acktime,101) UploadDate, count(distinct d.ImageID) Documents, sum(d.NumPages) Images
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.batchname like '20%' 
and s.ackTime >= '2020-03-01'
group by CONVERT(nvarchar, s.acktime,101)) T
group  by T.UploadDate
order by T.UploadDate