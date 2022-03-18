select distinct d.dcsID DCSID, UUID = '', ACKtoCSRA = '0', insertdate = '', f.ETime dmhstime, s.veteranID VeteranID, count(d.ImageID) NumDocs
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join smsDCSMapping s
on d.dcsID = s.dcsid
left join dmhsFTPDetails f
on d.PBatch = f.batchname
where p.cordest = 'vtg' and d.ImageDateTime >= '2018-10-15'
and not exists (select * from DCSID_UUID_mapping where d.dcsID = dcsID)
and exists (select * from stats where d.PBatch = batchname)
and exists (select * from dmhsFTPDetails where d.PBatch = batchname)
group by d.dcsID, f.ETime, s.veteranID




select distinct T.DCSID, 
v.uuid UUID,
T.ACKtoCSRA, T.insertdate, T.dmhstime, T.VeteranID, T.NumDocs, T.AttachmentsDownloaded, v.downloadedAttachments
FROM
(select distinct d.dcsID DCSID, 
--v.uuid UUID, 
ACKtoCSRA = '0', 
insertdate = '', f.ETime dmhstime, s.veteranID VeteranID, count(d.ImageID) NumDocs, (count(d.ImageID) - 1) AttachmentsDownloaded
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join smsDCSMapping s
on d.dcsID = s.dcsid
left join dmhsFTPDetails f
on d.PBatch = f.batchname
--left join CustomerDATA c
--on d.dcsID = c.dcsID
--left join vvFTPDetails v
--on c.FileNumber = v.filenumber and c.Lastname = v.veteranLastName and c.Firstname = v.veteranFirstName 
where p.cordest = 'vtg' and d.ImageDateTime >= '2018-10-15'
and not exists (select * from DCSID_UUID_mapping where d.dcsID = dcsID)
and exists (select * from stats where d.PBatch = batchname)
and exists (select * from dmhsFTPDetails where d.PBatch = batchname)
group by d.dcsID, f.ETime, s.veteranID) T
left join CustomerDATA c
on T.dcsID = c.dcsID
left join vvFTPDetails v
on c.FileNumber = v.filenumber and c.Lastname = v.veteranLastName and c.Firstname = v.veteranFirstName and v.downloadedAttachments = T.AttachmentsDownloaded
group by T.DCSID, 
v.uuid,
T.ACKtoCSRA, T.insertdate, T.dmhstime, T.VeteranID, T.NumDocs, T.AttachmentsDownloaded, v.downloadedAttachments
order by dcsID


select distinct uuid from vvFTPDetails
where sendAcknowledgeProcessing is null
and downloadDate >= '2018-10-01'
--and downloadDate <= '2018-10-31'
and source = 'csra'



select * from vvFTPDetails where uuid in (
'd3aa4bcc-deb6-421c-b64d-874fa7bec8ae',
'823195f9-6bbe-4a5d-bc85-804f8a2af5cc')


select * from document where dcsid = 'DCSID041830405009010014'


select uri, uuid, veteranLastName, veteranFirstName, fileNumber, downloadedAttachments, 
sum(cast(numberPages as int) + cast(numberPages1 as int) + cast(numberPages2 as int) + cast(numberPages3 as int) + cast(numberPages4 as int) + cast(numberPages5 as int) + cast(numberPages6 as int) + cast(numberPages7 as int) + cast(numberPages8 as int) + cast(numberPages9 as int) + cast(numberPages10 as int) + cast(numberPages11 as int) + cast(numberPages12 as int) + cast(numberPages13 as int) + cast(numberPages14 as int) + cast(numberPages15 as int) + cast(numberPages16 as int) + cast(numberPages17 as int) + cast(numberPages18 as int) + cast(numberPages19 as int) + cast(numberPages20 as int) + cast(numberPages21 as int) + cast(numberPages22 as int) + cast(numberPages23 as int) + cast(numberPages24 as int) + cast(numberPages25 as int) + cast(numberPages26 as int) + cast(numberPages27 as int) + cast(numberPages28 as int) + cast(numberPages29 as int) + cast(numberPages30 as int) + cast(numberPages31 as int) + cast(numberPages32 as int) + cast(numberPages33 as int) + cast(numberPages34 as int) + cast(numberPages35 as int) + cast(numberPages36 as int) + cast(numberPages37 as int) + cast(numberPages38 as int) + cast(numberPages39 as int) + cast(numberPages40 as int) + cast(numberPages41 as int) + cast(numberPages42 as int) + cast(numberPages43 as int) + cast(numberPages44 as int) + cast(numberPages45 as int) + cast(numberPages46 as int) + cast(numberPages47 as int) + cast(numberPages48 as int) + cast(numberPages49 as int) + cast(numberPages50 as int) + cast(numberPages51 as int) + cast(numberPages52 as int) + cast(numberPages53 as int) + cast(numberPages54 as int) + cast(numberPages55 as int) + cast(numberPages56 as int) + cast(numberPages57 as int) + cast(numberPages58 as int) + cast(numberPages59 as int) + cast(numberPages60 as int) + cast(numberPages61 as int) + cast(numberPages62 as int) + cast(numberPages63 as int) + cast(numberPages64 as int) + cast(numberPages65 as int) + cast(numberPages66 as int) + cast(numberPages67 as int) + cast(numberPages68 as int) + cast(numberPages69 as int) + cast(numberPages70 as int)) numPages
 from vvFTPDetails
where sendAcknowledgeProcessing is null
and downloadDate >= '2018-10-01'
--and downloadDate <= '2018-10-31'
and source = 'csra'
and uuid in (
'd3aa4bcc-deb6-421c-b64d-874fa7bec8ae',
'823195f9-6bbe-4a5d-bc85-804f8a2af5cc')
group by uri, uuid, veteranLastName, veteranFirstName, fileNumber, downloadedAttachments




--select uri, uuid, veteranLastName, veteranFirstName, fileNumber, downloadedAttachments, 
--sum(cast(numberPages as int)) +
--ISNULL(sum(cast(numberPages1 as int) + cast(numberPages2 as int) + cast(numberPages3 as int) + cast(numberPages4 as int) + cast(numberPages5 as int) + cast(numberPages6 as int) + cast(numberPages7 as int) + cast(numberPages8 as int) + cast(numberPages9 as int) + cast(numberPages10 as int) + cast(numberPages11 as int) + cast(numberPages12 as int) + cast(numberPages13 as int) + cast(numberPages14 as int) + cast(numberPages15 as int) + cast(numberPages16 as int) + cast(numberPages17 as int) + cast(numberPages18 as int) + cast(numberPages19 as int) + cast(numberPages20 as int) + cast(numberPages21 as int) + cast(numberPages22 as int) + cast(numberPages23 as int) + cast(numberPages24 as int) + cast(numberPages25 as int) + cast(numberPages26 as int) + cast(numberPages27 as int) + cast(numberPages28 as int) + cast(numberPages29 as int) + cast(numberPages30 as int) + cast(numberPages31 as int) + cast(numberPages32 as int) + cast(numberPages33 as int) + cast(numberPages34 as int) + cast(numberPages35 as int) + cast(numberPages36 as int) + cast(numberPages37 as int) + cast(numberPages38 as int) + cast(numberPages39 as int) + cast(numberPages40 as int) + cast(numberPages41 as int) + cast(numberPages42 as int) + cast(numberPages43 as int) + cast(numberPages44 as int) + cast(numberPages45 as int) + cast(numberPages46 as int) + cast(numberPages47 as int) + cast(numberPages48 as int) + cast(numberPages49 as int) + cast(numberPages50 as int) + cast(numberPages51 as int) + cast(numberPages52 as int) + cast(numberPages53 as int) + cast(numberPages54 as int) + cast(numberPages55 as int) + cast(numberPages56 as int) + cast(numberPages57 as int) + cast(numberPages58 as int) + cast(numberPages59 as int) + cast(numberPages60 as int) + cast(numberPages61 as int) + cast(numberPages62 as int) + cast(numberPages63 as int) + cast(numberPages64 as int) + cast(numberPages65 as int) + cast(numberPages66 as int) + cast(numberPages67 as int) + cast(numberPages68 as int) + cast(numberPages69 as int) + cast(numberPages70 as int)),0) numPages
-- into vvFTPDetails_temp
-- from vvFTPDetails
--where sendAcknowledgeProcessing is null
--and downloadDate >= '2018-10-01'
----and downloadDate <= '2018-10-31'
--and source = 'csra'
----and uuid in (
----'d3aa4bcc-deb6-421c-b64d-874fa7bec8ae',
----'823195f9-6bbe-4a5d-bc85-804f8a2af5cc')
--group by uri, uuid, veteranLastName, veteranFirstName, fileNumber, downloadedAttachments





select uri, uuid, veteranLastName, veteranFirstName, fileNumber, downloadedAttachments, 
sum(cast(numberPages as int)) +
ISNULL(sum(cast(numberPages1 as int)), 0) NumPages
 from vvFTPDetails
where sendAcknowledgeProcessing is null
and downloadDate >= '2018-10-01'
--and downloadDate <= '2018-10-31'
and source = 'csra'
and uuid in (
'd3aa4bcc-deb6-421c-b64d-874fa7bec8ae',
'823195f9-6bbe-4a5d-bc85-804f8a2af5cc')
group by uri, uuid, veteranLastName, veteranFirstName, fileNumber, downloadedAttachments