select distinct d.PBatch BatchName, d.dcsID, d.ImageID, sum(d.NumPages) Images, pb.cordest BatchType, 
CONVERT(date, d.imagedatetime, 101) ExportDate, CONVERT(datetime, f.ETime, 101)
from document d
left join pmrImageIDMapping p
on d.dcsID = p.dcsid
left join PhysicalBatch pb
on d.PBatch = pb.PBatch
left join dmhsFTPDetails f
on d.PBatch = f.batchname
where d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
--and d.ImageDateTime >= '2019-03-05'
and not exists (select * from pmrImageIDMapping where d.dcsID = dcsid)
and exists (select * from dmhsFTPDetails where etime >= '2019-03-05' and d.PBatch = batchname)
--and p.insertdate < '2019-03-08'
and f.ETime >= '2019-03-05'
group by d.PBatch, d.dcsID, d.ImageID, pb.cordest, CONVERT(date, d.imagedatetime, 101), CONVERT(datetime, f.ETime, 101)
order by CONVERT(datetime, f.ETime, 101)



select distinct d.PBatch BatchName, d.dcsID, d.ImageID, sum(d.NumPages) Images, pb.cordest BatchType, 
CONVERT(date, d.imagedatetime, 101) ExportDate, CONVERT(datetime, f.ETime, 101)
from document d
left join pmrImageIDMapping p
on d.dcsID = p.dcsid
left join PhysicalBatch pb
on d.PBatch = pb.PBatch
left join dmhsFTPDetails f
on d.PBatch = f.batchname
where d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
--and d.ImageDateTime >= '2019-03-05'
and  exists (select * from pmrImageIDMapping where d.dcsID = dcsid)
and exists (select * from dmhsFTPDetails where etime >= '2019-03-05' and d.PBatch = batchname)
--and p.insertdate < '2019-03-08'
and f.ETime >= '2019-03-08'
group by d.PBatch, d.dcsID, d.ImageID, pb.cordest, CONVERT(date, d.imagedatetime, 101), CONVERT(datetime, f.ETime, 101)
order by CONVERT(datetime, f.ETime, 101)


select * from pmrImageIDMapping where dcsid in (
'DCSID041905900001010029',
'DCSID041905900001010035')
