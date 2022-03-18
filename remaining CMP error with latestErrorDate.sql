--remaining CMP error with latestErrorDate
select distinct f.imageid, d.dcsID, max(f.insertdate) as LastErrorDate
from FTPError f
join Document d
on f.imageid = d.ImageID
where f.imageid in (
select imageid from document 
where dcsid in (select distinct dcsid from stpetedcsid)
and ftpstime is null 
and imageid in (select distinct imageid from ftperror))
group by f.imageid, d.dcsID
order by max(f.insertdate) desc


--remaining CMP error with latestErrorDate with pbatch
select distinct f.imageid, d.dcsID, max(f.insertdate) as LastErrorDate, d.PBatch
from FTPError f
join Document d
on f.imageid = d.ImageID
where f.imageid in (
select imageid from document 
where dcsid in (select distinct dcsid from stpetedcsid)
and ftpstime is null 
and imageid in (select distinct imageid from ftperror))
group by f.imageid, d.dcsID, d.PBatch
order by max(f.insertdate) asc

