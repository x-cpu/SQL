select * from document 
where dcsid in (select distinct dcsid from stpetedcsid)
and ftpstime is null 
and imageid in (select distinct imageid from ftperror)


select imageid, comments from FTPError where imageid in (
select imageid, dcsID from document 
where dcsid in (select distinct dcsid from stpetedcsid)
and ftpstime is null 
and imageid in (select distinct imageid from ftperror))
and insertdate > '2014-10-06 0:0:0'


--upload count
select imageid, dcsID, ftpstime 
from document where dcsid in (
select dcsid from stpetedcsid) and ftpstime > '2014-09-30 0:0:0'


--error count
select * from FTPError where imageid in (
select ImageID from document where dcsid in (select dcsid from stpetedcsid))
and insertdate > '2014-10-03 0:0:0'


--pending count
select distinct d.imageid, d.dcsID 
from document d
join FTPError f
on d.ImageID = f.imageid
where d.dcsid in (
select dcsid from stpetedcsid) and d.ftpstime is null



--pending count
select distinct d.imageid, d.dcsID, max(f.insertdate) as lasterrordate
from document d
join FTPError f
on d.ImageID = f.imageid
where d.dcsid in (
select dcsid from stpetedcsid) and d.ftpstime is null
group by d.imageid, d.dcsID
order by max(f.insertdate) 


select * from Document where dcsid = 'DCSID031416506136010056'