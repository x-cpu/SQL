--Fax Received used in hrly
select x.RecvDate Date, sum(ISNULL(X.RegularFaxes, 0)) RegularFaxes, sum(ISNULL(X.PMCFaxes, 0)) PMCFaxes, sum(ISNULL(X.BVAFaxes, 0)) BVAFaxes, sum(ISNULL(x.TotalFaxes, 0)) TotalFaxes
                        FROM
                        (
select convert(date, p.BackDate, 101) RecvDate, count(distinct t.tifname) Faxes,
                        CASE
	                        When (p.PBatch like '04%') then count(distinct t.tifname) 
	                        END AS TotalFaxes,
                        CASE
	                        When (p.cordest = 'pmc') then count(distinct t.tifname) 
	                        END AS PMCFaxes,
                        CASE
	                        When (p.cordest = 'bva' and InvTime > '2017-09-01') then count(distinct t.tifname) 
	                        END AS BVAFaxes,						
                        CASE
	                        When (p.cordest is null) then count(distinct t.tifname) 
	                        END AS RegularFaxes 
from PhysicalBatch p
left join tmpfaxtifname t
on p.PBatch = t.pbatch
where p.PBatch like '04%'
and p.BackDate >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 30, 0)
and p.BackDate < DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)
group by convert(date, BackDate, 101), p.PBatch, p.cordest, p.InvTime) X
group by x.RecvDate
order by x.RecvDate desc




select distinct p.PBatch, convert(date, BackDate, 101) RecvDate, count(distinct t.tifname) Faxes 
from PhysicalBatch p
left join tmpfaxtifname t
on p.PBatch = t.pbatch
where p.cordest = 'PMC'
and convert(date, p.BackDate, 101) >= '2017-11-18' and convert(date, p.BackDate, 101) <= '2017-11-18 23:59:59.999'
--and t.datemodified >= '2017-11-18' and p.BackDate <= '2017-11-18 23:59:59.999'
group by convert(date, BackDate, 101), p.PBatch
order by convert(date, BackDate, 101)



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
