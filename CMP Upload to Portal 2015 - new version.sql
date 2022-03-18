--Combining 2 SQL queries and getting result set in one
--aliasing 2 query and Selecting them in the select query
---agreed good with docs and pages combination
select x.uploadPortaldate, x.docs, y.Pages
FROM
(select convert(nvarchar, AckTime, 101) as uploadPortaldate, count(d.imageid) as docs
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-11-01 0:0:0' and AckTime <= '2015-11-30 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
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
where AckTime >= '2015-11-01 0:0:0' and AckTime <= '2015-11-30 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
group by convert(nvarchar, AckTime, 101)) as y
where x.uploadPortaldate = y.uploadPortaldate
order by x.uploadPortaldate








select sum(numpages) from document where pbatch in (select distinct batchname from FTPDetails  where AckTime >= '4/1/2015 0:0:0' and AckTime <= '4/30/2015 23:59:59.999'  and  substring(batchname,1,2) in ('03','04','05') and acktime is not null and comments is null)

---agreed method DOCS ONLY CORRECT HERE
select convert(nvarchar, AckTime, 101) as uploadPortaldate, count(d.imageid) as docs, sum(d.numpages) as Pages
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-02-01 0:0:0' and AckTime <= '2015-02-28 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
where (d.ImageID like '%p00%' or ImageID like '%p01%')
group by convert(nvarchar, AckTime, 101)
order by convert(nvarchar, AckTime, 101)





---agreed method DCSID ONLY BY DAY
select convert(nvarchar, AckTime, 101) as uploadPortaldate, count(distinct d.dcsID) as DCSID
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2015-02-01 0:0:0' and AckTime <= '2015-02-22 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
where (d.ImageID like '%p00%' or ImageID like '%p01%')
group by convert(nvarchar, AckTime, 101)
order by convert(nvarchar, AckTime, 101)







select T.batchname, convert(nvarchar, etime, 101) as uploadPortaldate, count(d.imageid) as docs, sum(d.numpages) as Pages 
FROM
(select distinct batchname, max(etime) as etime
from FTPDetails 
where etime >= '2014-11-01 0:0:0' and etime <= '11/30/2014 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on T.batchname = d.pbatch
left join stats s
on T.batchname = s.kbatch
group by convert(nvarchar, etime, 101)
order by convert(nvarchar, etime, 101)


select convert(nvarchar, etime, 101) as uploadPortaldate, count(d.imageid) as docs, sum(d.numpages) as Pages 
FROM
(select distinct batchname, max(etime) as etime
from FTPDetails 
where etime >= '2014-12-01 0:0:0' and etime <= '2014-12-08 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
group by convert(nvarchar, etime, 101)
order by convert(nvarchar, etime, 101)





select convert(nvarchar, etime, 101) as uploadPortaldate, count(d.imageid) as docs, sum(d.numpages) as Pages 
FROM
(select distinct batchname, max(etime) as etime
from FTPDetails 
where etime >= '2014-12-09 0:0:0' and etime <= '2014-12-31 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on batchname = d.pbatch
group by convert(nvarchar, etime, 101)
order by convert(nvarchar, etime, 101)

--breakdown for documents
select distinct T.batchname, convert(nvarchar, etime, 101) as uploadPortaldate, 
sum(s.docs) docsPortal,
count(d.imageid) as docs, sum(d.numpages) as Pages 
FROM
(select distinct batchname, max(etime) as etime
from FTPDetails 
where etime >= '2014-11-01 0:0:0' and etime <= '11/30/2014 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
group by batchname) T
inner join document d
on T.batchname = d.pbatch
left join stats s
on T.batchname = s.kbatch
group by T.batchname, convert(nvarchar, etime, 101)
order by convert(nvarchar, etime, 101)



select sum(docs) from stats where kbatch = '03143140605301'
select * from stats where kbatch = '03143140605301'
select count(imageid) from document where PBatch = '03143140605301'





select * 
from shov1 s
join dk1 d 
on s.totalpages <> d.totalpages
where s.dcsid = d.dcsid


select * from shov1 t
where not exists (select * from dk1 where t.dcsid = dk1.dcsid)