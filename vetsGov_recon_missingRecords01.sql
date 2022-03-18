select z.DCSID, z.UUID, z.ACKtoCSRA, z.insertdate, z.dmhstime, z.VeteranID, z.NumDocs
into x20181102
FROM
(select distinct T.DCSID, 
v.uuid UUID,
T.ACKtoCSRA, T.insertdate, T.dmhstime, T.VeteranID, T.NumDocs, T.AttachmentsDownloaded, v.downloadedAttachments, T.numPages, v.numPages pages
FROM
(select distinct d.dcsID DCSID, 
--v.uuid UUID, 
ACKtoCSRA = '0', 
insertdate = '', f.ETime dmhstime, s.veteranID VeteranID, count(d.ImageID) NumDocs, (count(d.ImageID) - 1) AttachmentsDownloaded, sum(d.numpages) numPages
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
left join vvFTPDetails_temp v
--on c.FileNumber = v.filenumber and c.Lastname = v.veteranLastName and c.Firstname = v.veteranFirstName and v.downloadedAttachments = T.AttachmentsDownloaded
on c.FileNumber = v.filenumber and c.Lastname = v.veteranLastName and c.Firstname = v.veteranFirstName and v.numPages = T.numPages
group by T.DCSID, v.uuid, T.ACKtoCSRA, T.insertdate, T.dmhstime, T.VeteranID, T.NumDocs, T.AttachmentsDownloaded, T.numPages, v.downloadedAttachments, v.numPages) z
--where z.UUID is not null
order by dcsID







--finale

--select distinct v.uri, status = 'success', error = null, trycount=1, u.uuid, v.numberAttachments numberattachmentsUploaded, u.NumDocs TotalAfterSplitting, sizeflag=0, 
--PostUploadTime = null,
--PostUploadStatus = null,
--syskey = '',
--u.dmhstime UploadTimestamp
--into VetsUpload_temp4
--from DCSID_UUID_mapping_temp4 u
--left join vvFTPDetails v
--on u.uuid = v.uu