select * from tmpfaxtifname 
where datemodified > '2016-04-01 0:0:0'
and tifname like '%FAX01.TIF'

select count(*) from tmpfaxtifname 
where datemodified > '2016-04-01 0:0:0'

select SUBSTRING(t.tifname, 1, 14) Batchname, count(distinct t.tifname) ReceivedDocs, count(distinct d.imageid) 
from tmpfaxtifname t
left join document d
on t.pbatch = d.PBatch
where t.datemodified > '2016-04-01 0:0:0'
group by SUBSTRING(t.tifname, 1, 14) 

---QUERY TO CHECK
select t.pbatch Batchname, count(distinct t.tifname) ReceivedDocs, count(distinct d.imageid) ExportedDocs
from tmpfaxtifname t
left join document d
on t.pbatch = d.PBatch
where t.datemodified > '2016-04-01 0:0:0'
group by t.pbatch


--count # of FAX02 vs FAX01
select count(*) from tmpfaxtifname 
where datemodified > '2016-02-01 0:0:0' and datemodified < '2016-03-01 0:0:0'
and tifname like '%FAX02.TIF'

select count(*) from tmpfaxtifname where pbatch = '04160920000601'
select count(*) from Document where pbatch = '04160920000601'