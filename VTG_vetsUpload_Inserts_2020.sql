select v.uuid, v.uri, v.numberAttachments, d.NumDocs, d.dmhstime, s.ackTime, v.sendAcknowledgeProcessing from DCSID_UUID_mapping d
left join vvFTPDetails v
on d.UUID = v.uuid
left join smsDCSMapping s
on d.DCSID = s.dcsid
where d.uuid in (
'1d6e021446a65de3ff31a75f',
'29c355c7-cf31-4035-98f1-df2e0e292ac9')
and not exists (select * from vetsupload where d.UUID = uuid)

--add record to vetsupload
INSERT INTO vetsupload (uuid, status, trycount, uri, numberattachmentsUploaded, TotalAfterSplitting, sizeflag, UploadTimestamp) 
VALUES ('1d6e021446a65de3ff31a75f', 'success', '1', '2020/03/17/13/24-42-578vetsgov-document-1d6e021446a65de3ff31a75f-e2c22cf2d95f642012f81f09d220eace.pdf', '0', '1', '0', '2020-03-27 18:30:50.063')

INSERT INTO vetsupload (uuid, status, trycount, uri, numberattachmentsUploaded, TotalAfterSplitting, sizeflag, UploadTimestamp) 
VALUES ('29c355c7-cf31-4035-98f1-df2e0e292ac9', 'success', '1', '2020/03/17/11/40-27-675vetsgov-document-29c355c7-cf31-4035-98f1-df2e0e292ac9-document.pdf', '1', '2', '0', '2020-03-27 18:30:50.063')


INSERT INTO vetsupload (uuid, status, trycount, uri, numberattachmentsUploaded, TotalAfterSplitting, sizeflag, UploadTimestamp) 
VALUES ('7c12476b-e20f-480c-970b-0f55670559a3', 'success', '1', '2020/03/24/14/33-10-943vetsgov-document-7c12476b-e20f-480c-970b-0f55670559a3-document.pdf', '3', '4', '0', '2020-03-27 18:30:50.063')

INSERT INTO vetsupload (uuid, status, trycount, uri, numberattachmentsUploaded, TotalAfterSplitting, sizeflag, UploadTimestamp) 
VALUES ('7d1cf609-410f-4b11-b67b-1f54a0eac3d0', 'success', '1', '2020/03/26/10/39-27-180vetsgov-document-7d1cf609-410f-4b11-b67b-1f54a0eac3d0-document.pdf', '5', '6', '0', '2020-03-27 18:30:50.063')

INSERT INTO vetsupload (uuid, status, trycount, uri, numberattachmentsUploaded, TotalAfterSplitting, sizeflag, UploadTimestamp) 
VALUES ('7fdca5d3-144a-420d-8f05-59187f520173', 'success', '1', '2020/03/26/17/03-28-500vetsgov-document-7fdca5d3-144a-420d-8f05-59187f520173-document.pdf', '0', '1', '0', '2020-03-27 18:30:50.063')