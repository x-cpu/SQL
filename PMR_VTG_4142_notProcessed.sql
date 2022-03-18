select distinct p.dcsid, pb.cordest, p.insertdate
from pmrImageIDMapping p
left join document d
on p.dcsid = d.dcsID
left join PhysicalBatch pb
on d.PBatch = pb.PBatch
where p.insertdate > '2020-10-01'
and pb.cordest = 'vtg'
order by p.insertdate


select d.ImageID, d.dcsID, pt.VCIPID
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join pmrImageIDMapping pt
on d.dcsID = pt.dcsid
where d.ImageDateTime > '2020-10-01 06:31:12.540'
and d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
and p.cordest = 'vtg'
and pt.VCIPID is null


select * from document where dcsid = 'DCSID042027405153010036'