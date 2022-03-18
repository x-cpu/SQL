select x.uploadPortaldate, x.docs, y.Pages
FROM
(select convert(nvarchar, AckTime, 101) as uploadPortaldate, count(d.imageid) as docs
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2016-02-01 0:0:0' and AckTime <= '2016-02-16 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
where (d.ImageID like '%p00%' or ImageID like '%p01%')
and d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
group by convert(nvarchar, AckTime, 101)) as x,
(select convert(nvarchar, AckTime, 101) as uploadPortaldate, sum(d.numpages) as Pages
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2016-02-01 0:0:0' and AckTime <= '2016-02-16 23:59:59.999'  
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
and d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
group by convert(nvarchar, AckTime, 101)) as y
where x.uploadPortaldate = y.uploadPortaldate
order by x.uploadPortaldate
