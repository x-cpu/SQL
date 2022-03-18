select d.PBatch, d.dcsID, ImageDateTime, docidDoctype, pp.insertdate DOMACreation
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join pmrImageIDMapping pp
on d.dcsID = pp.dcsid
where docidDoctype like '%4142%'
and ImageDateTime >= '2018-08-01'
and exists (select * from PhysicalBatch where cordest = 'vtg' and d.PBatch = PBatch)
and exists (select * from pmrImageIDMapping where d.PBatch = SUBSTRING(dcsid, 6, 14))
order by pp.insertdate desc

select d.PBatch, d.dcsID, ImageDateTime, docidDoctype, pp.insertdate DOMACreation 
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join pmrImageIDMapping pp
on d.dcsID = pp.dcsid
where docidDoctype like '%4142%'
and ImageDateTime >= '2018-08-01'
and exists (select * from PhysicalBatch where cordest = 'pmc' and d.PBatch = PBatch)
and exists (select * from pmrImageIDMapping where d.PBatch = SUBSTRING(dcsid, 6, 14))
order by pp.insertdate desc


select d.PBatch, d.dcsID, ImageDateTime, docidDoctype, pp.insertdate DOMACreation
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join pmrImageIDMapping pp
on d.dcsID = pp.dcsid
where docidDoctype like '%4142%'
and ImageDateTime >= '2018-06-01'
and exists (select * from PhysicalBatch where cordest = 'bva' and d.PBatch = PBatch)
and exists (select * from pmrImageIDMapping where d.PBatch = SUBSTRING(dcsid, 6, 14))
order by pp.insertdate desc



select * from pmrImageIDMapping where dcsid = 'DCSID041604700015010073'
select SUBSTRING(dcsid, 6, 14) from pmrImageIDMapping where dcsid = 'DCSID041604700015010073'

select * 
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
where docidDoctype like '%4142%'
and ImageDateTime >= '2018-08-01'
and exists (select * from PhysicalBatch where cordest = 'bva' and d.PBatch = PBatch)


select * 
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
where docidDoctype like '%4142%'
and ImageDateTime >= '2018-08-01'
--and exists (select * from PhysicalBatch where cordest = 'vtg' and d.PBatch = PBatch)
and exists (select * from pmrImageIDMapping where d.dcsID = SUBSTRING(dcsid, 6, 14))