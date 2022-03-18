select s.veteranID, c.ZipCode, ROSiteID = 'PM3', p.PBatch BatchName, s.dcsid DCSID, dd.docidDoctype DocType, dd.ImageID, d.ETime UploadDateTime
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join PhysicalBatch p
on s.batchname = p.PBatch
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join document dd
on s.dcsid = dd.dcsID
where veteranID in (
'7509567',
'7509570',
'7509844',
'7510650',
'7511336')
order by ImageID