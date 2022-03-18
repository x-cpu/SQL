--VTG
--8017
select d.docidDoctype DocType, count(*) Docs
from document d
left join smsDCSMapping s
on d.dcsid = s.dcsID
where s.ackTime >= '2019-10-01' 
and s.ackTime <= '2019-10-31 23:59:59.999'
and d.PBatch like '04%'
and d.docidDoctype in (
'VA 21-22 Appointment of Veterans Serv. Org. as Claimant Rep',
'VA 21-526 Veterans Application for Compensation or Pension',
'VA 21-526EZ, Fully Developed Claim (Compensation)')
--and not exists (select * from cmpRescanMapping where s.batchname = batchname)
and exists (select * from PhysicalBatch where cordest = 'VTG' and d.pbatch = pbatch)
group by d.docidDoctype


--another way
--non VTG
--5080
select d.docidDoctype DocType, count(*) Docs
from document d
left join smsDCSMapping s
on d.dcsid = s.dcsID
where s.ackTime >= '2019-10-01' 
and s.ackTime <= '2019-10-31 23:59:59.999'
and d.PBatch like '04%'
and d.docidDoctype in (
'VA 21-22 Appointment of Veterans Serv. Org. as Claimant Rep',
'VA 21-526 Veterans Application for Compensation or Pension',
'VA 21-526EZ, Fully Developed Claim (Compensation)')
--and not exists (select * from cmpRescanMapping where s.batchname = batchname)
and not exists (select * from PhysicalBatch where cordest = 'VTG' and d.pbatch = pbatch)
group by d.docidDoctype



--Total VTG
--41316
select d.docidDoctype DocType, count(*) Docs
from document d
left join smsDCSMapping s
on d.dcsid = s.dcsID
where s.ackTime >= '2019-10-01' 
and s.ackTime <= '2019-10-31 23:59:59.999'
and d.PBatch like '04%'
--and d.docidDoctype in (
--'VA 21-22 Appointment of Veterans Serv. Org. as Claimant Rep',
--'VA 21-526 Veterans Application for Compensation or Pension',
--'VA 21-526EZ, Fully Developed Claim (Compensation)')
--and not exists (select * from cmpRescanMapping where s.batchname = batchname)
and exists (select * from PhysicalBatch where cordest = 'VTG' and d.pbatch = pbatch)
group by d.docidDoctype



--Total non VTG
--5080
select d.docidDoctype DocType, count(*) Docs
from document d
left join smsDCSMapping s
on d.dcsid = s.dcsID
where s.ackTime >= '2019-10-01' 
and s.ackTime <= '2019-10-31 23:59:59.999'
and d.PBatch like '04%'
--and d.docidDoctype in (
--'VA 21-22 Appointment of Veterans Serv. Org. as Claimant Rep',
--'VA 21-526 Veterans Application for Compensation or Pension',
--'VA 21-526EZ, Fully Developed Claim (Compensation)')
--and not exists (select * from cmpRescanMapping where s.batchname = batchname)
and not exists (select * from PhysicalBatch where cordest = 'VTG' and d.pbatch = pbatch)
group by d.docidDoctype




