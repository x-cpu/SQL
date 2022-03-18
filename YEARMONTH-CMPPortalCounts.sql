--Combining 2 SQL queries and getting result set in one
--aliasing 2 query and Selecting them in the select query
---agreed good with docs and pages combination
select datepart(yyyy, x.uploadPortaldate) UploadPortalYear, datepart(MM, x.uploadPortaldate) UploadPortalMonth, sum(x.docs) Docs, sum(y.Pages) Images
FROM
(select convert(nvarchar, AckTime, 101) as uploadPortaldate, count(d.imageid) as docs
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-03-01 0:0:0' and AckTime <= '2016-02-16 23:59:59.999' 
and  substring(batchname,1,2) in ('04')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
where (d.ImageID like '%p00%' or ImageID like '%p01%')
group by convert(nvarchar, AckTime, 101)) as x,
(select convert(nvarchar, AckTime, 101) as uploadPortaldate, sum(d.numpages) as Pages
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-03-01 0:0:0' and AckTime <= '2016-02-16 23:59:59.999' 
and  substring(batchname,1,2) in ('04')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
group by convert(nvarchar, AckTime, 101)) as y
where x.uploadPortaldate = y.uploadPortaldate
group by datepart(yyyy, x.uploadPortaldate), datepart(MM, x.uploadPortaldate) 
order by datepart(yyyy, x.uploadPortaldate), datepart(MM, x.uploadPortaldate) 


