select datepart(yyyy, x.UploadDate) UploadYear, datepart(MM, x.UploadDate) UploadMonth, ISNULL(sum(x.Docs), 0) Docs, ISNULL(sum(x.Images), 0) Images
FROM
(select convert(nvarchar, s.ackTime, 101) UploadDate,
CASE WHEN (s.batchname like '03%' or s.batchname like '04%') Then ISNULL(count(distinct d.imageid), 0) end Docs,
CASE WHEN (s.batchname like '03%' or s.batchname like '04%') Then ISNULL(sum(d.numpages), 0) end Images
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
left join CustomerDATA c
on s.dcsID = c.dcsID
where s.ackTime is not null 
group by convert(nvarchar, s.ackTime, 101), s.batchname) X
group by datepart(yyyy, x.UploadDate), datepart(MM, x.UploadDate) 
order by datepart(yyyy, x.UploadDate), datepart(MM, x.UploadDate) 



select count(distinct imageid), sum(numpages) from document where ftpstime >= '02/01/2016 0:0:0.000'and pbatch like '02%' 


select datepart(yyyy, x.UploadDate) UploadYear, datepart(MM, x.UploadDate) UploadMonth, ISNULL(sum(x.Docs), 0) Docs, ISNULL(sum(x.Images), 0) Images
FROM
(select convert(date, ftpstime, 101) UploadDate, count(distinct imageid) Docs, sum(numpages) Images from document 
where ftpstime >= '02/17/2016 0:0:0.000' 
--and pbatch like '02%' 
group by convert(date, ftpstime, 101)) X
group by datepart(yyyy, x.UploadDate), datepart(MM, x.UploadDate) 
order by datepart(yyyy, x.UploadDate), datepart(MM, x.UploadDate) 
