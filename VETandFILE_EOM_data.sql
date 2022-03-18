---veteran and filenumber counts from CustomerData table
select distinct cs.dcsid, cd.filenumber, cd.lastname, cd.firstname, cd.middleinitial, sum(ks) Keystrokes 
from cmpstats cs 
left join CustomerDATA cd on cs.dcsid = cd.dcsID
where cs.dcsid in (select distinct dcsid from document where imagedatetime >= '12/1/2014 0:0:0' and imagedatetime < ='12/22/2014 18:00:00')
and cs.KS > 0
group by cs.dcsid, cd.filenumber, cd.lastname, cd.firstname, cd.middleinitial






---veteran and filenumber counts from CMPStats
select distinct dcsid, FileNumber, LastName, FirstName, MiddleInitial, sum(ks) Keystrokes
from cmpstats
where dcsid in (select distinct dcsid from document where imagedatetime > '12/22/2014 18:00:00' and imagedatetime < ='12/31/2014 23:59:59.999')
and KS > 0 
and insertdate > '2014-12-22 18:00:00' and insertdate < ='12/31/2014 23:59:59.999'
group by dcsid, FileNumber, LastName, FirstName, MiddleInitial
 
--order by insertdate


select * from document where dcsid = 'DCSID031435606165010001'





---veteran and filenumber counts from CMPStats
select distinct dcsid, FileNumber, LastName, FirstName, MiddleInitial, sum(ks) Keystrokes
from cmpstats
where dcsid in (select distinct dcsid from document where imagedatetime > '2015-02-01 00:00:00' and imagedatetime < ='2015-02-28 23:59:59.999')
and KS > 0 
and insertdate > '2015-02-01 00:00:00' and insertdate < ='2015-02-28 23:59:59.999'
group by dcsid, FileNumber, LastName, FirstName, MiddleInitial




---veteran and filenumber counts from CMPStats
select sum(T.Keystrokes)
FROM (
select distinct dcsid, FileNumber, LastName, FirstName, MiddleInitial, sum(ks) Keystrokes
from cmpstats
where dcsid in (select distinct dcsid from document where imagedatetime > '2015-02-01 00:00:00' and imagedatetime < ='2015-02-28 23:59:59.999')
and KS > 0 
and insertdate > '2015-02-01 00:00:00' and insertdate < ='2015-02-28 23:59:59.999'
group by dcsid, FileNumber, LastName, FirstName, MiddleInitial) T




---veteran and filenumber counts from CMPStats
select sum(T.Keystrokes)
FROM (
select distinct dcsid, FileNumber, LastName, FirstName, MiddleInitial, sum(ks) Keystrokes
from cmpstats
where dcsid in (select distinct dcsid from document where imagedatetime > '2015-02-01 00:00:00' and imagedatetime < ='2015-02-28 23:59:59.999')
and KS > 0 
and insertdate > '2015-02-01 00:00:00' and insertdate < ='2015-02-28 23:59:59.999'
group by dcsid, FileNumber, LastName, FirstName, MiddleInitial) T