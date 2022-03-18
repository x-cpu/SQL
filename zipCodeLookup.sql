select T.dcsID, t.BatchName, t.ZipCode, ts.UserName
FROM
(select distinct c.dcsid, c.pbatch BatchName, c.zipcode
from CustomerDATA c
where exists (select * from stats where c.Pbatch = kbatch)
and c.keydatetime >= '2016-05-01') T
left join TS_Audit ts
on T.BatchName = ts.BatchName
group by T.dcsID, t.BatchName, t.ZipCode, ts.UserName
having ts.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)


select * from pmrFTPDetails

select * from pmrrecon

select * from smsDCSMapping