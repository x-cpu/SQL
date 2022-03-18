select distinct substring(pbatch, 1, 12), dcsid from document 
group by dcsid, PBatch  
having count(PBatch) >1 
order by dcsID


select distinct SUBSTRING(d.pbatch, 1,12) as BatchName, m.dcsid, m.insertdate as CheckInDate, max(d.ftpstime) as UpdateDate	
from manifestDCS m
join Document d
on m.dcsID= d.dcsID 
where d.dcsID = 'HFY3IVO5QEZ3Q'
group by d.PBatch, m.dcsid, m.insertdate, d.ftpstime
having count(d.dcsID) > 1


select distinct SUBSTRING(m.pbatch, 1,12) as BatchName, m.dcsid, m.insertdate as CheckInDate, max(d.ftpstime) as UploadDate	
from manifestDCS m
join Document d
on m.dcsid = d.dcsID
where m.dcsID = 'HFY3IVO5QEZ3Q'
group by m.pbatch, m.dcsID, m.insertdate



select distinct SUBSTRING(m.pbatch, 1,12) as BatchName, m.dcsid, m.insertdate as CheckInDate, max(d.ftpstime) as UploadDate
from manifestDCS m
join Document d
on m.dcsid = d.dcsID
and m.dcsID in (
select distinct m.dcsid from manifestDCS m group by dcsid having count(*) > 1)
group by m.pbatch, m.dcsID, m.insertdate
order by m.dcsID


select distinct m.dcsid from manifestDCS m group by dcsid having count(*) > 1

select * from CMPBoxmapping


select TotalImages from TurboscanNG1.dbo.batches group by batchname, TotalImages having count(*) > 1

select  batchname, count(*) from TurboscanNG1.dbo.batches 
where (JobID = 8 or JobID = 11)
group by batchname having count(batchname) > 1
order by BatchName



select * from TurboscanNG1.dbo.batches where batchname = '02151050002104'

select * from TurboscanNG1.dbo.users

select * from TS_Audit where batchname = '02151050002104'
