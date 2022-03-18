--Fax Received
select convert(date, BackDate, 101) RecvDate, count(distinct t.tifname) Faxes 
from PhysicalBatch p
left join tmpfaxtifname t
on p.PBatch = t.pbatch
where p.cordest = 'PMC'
group by convert(date, BackDate, 101)
order by convert(date, BackDate, 101)


--Fax Uploaded
select convert(date, s.ackTime, 101) UploadDate, count(distinct s.dcsid) Faxes 
from smsDCSMapping s
where exists (select * from PhysicalBatch where cordest = 'PMC' and s.batchname = PBatch)
and s.ackTime is not null
group by convert(date, s.ackTime, 101)
order by convert(date, s.ackTime, 101)


----what we uploaded by fax SAM version
select convert(nvarchar,df.etime,101) as UploadDate, 
count(distinct tifname) as Faxes from tmpfaxtifname as t, 
dmhsftpdetails as df, physicalbatch as p
where t.pbatch = df.batchname 
and p.pbatch = t.pbatch
and p.cordest='pmc'
group by convert(nvarchar,df.etime,101)
order by convert(nvarchar,df.etime,101)
