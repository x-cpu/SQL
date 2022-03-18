select t.dcsid, datediff(hour, t.acktime, t1.ftpstime), t.acktime, t1.ftpstime from 
(
SELECT re.dcsid, max(x.acktime) acktime
  FROM [cmpxmldownload] x inner join 
cmprecon re 
on x.XMLfilename + '.xml' = re.XMLfilename
group by re.dcsid
) t inner join 
(
select dcsid, min(ftpstime) ftpstime
from document
where ftpstime is not null
group by dcsid) t1
on t.DCSID = t1.dcsID
where datediff(hour, t.acktime, t1.ftpstime) < 0


