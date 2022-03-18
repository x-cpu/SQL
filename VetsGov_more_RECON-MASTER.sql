--vetsgov recon
select distinct v.downloaddate, v.uuid,
CASE
	WHEN f.batchname is not null Then 'Yes'
	END Uploaded,
CASE
	WHEN a.dcsID is not null then 'Yes'
	END AutoCestRecord,
CASE
	WHEN d.UUID is not null then 'Yes'
	END PostProcessed,
CASE
	WHEN u.UUID is not null then 'Yes'
	END VetsUpload
from vvFTPDetails v
left join DCSID_UUID_mapping d
on v.uuid = d.UUID
left join AutoCestRecon a
on d.DCSID = a.dcsID
left join VetsUpload u
on v.uuid = u.uuid
left join dmhsFTPDetails f
on SUBSTRING(d.dcsid, 6, 14) = substring(f.batchname, 1, 14)
where v.source = 'csra' 
and v.vendor = 'vetsgov'
and v.sendAcknowledgeProcessing is null
order by v.downloaddate

select uuid, uri, sendAcknowledgeProcessing from vvFTPDetails where uuid in (
'ae938eff-8d73-4c9f-9c29-4450483ba3cc',
'54c6f0cf-6d39-459b-aec2-b1d1fcd25e80')


select * from DCSID_UUID_mapping where uuid in (
'ae938eff-8d73-4c9f-9c29-4450483ba3cc',
'54c6f0cf-6d39-459b-aec2-b1d1fcd25e80')

select * from VetsUpload where uuid in (
'ae938eff-8d73-4c9f-9c29-4450483ba3cc',
'54c6f0cf-6d39-459b-aec2-b1d1fcd25e80')

--update vetsupload 
--set postuploadstatus= '200',postuploadtime='2020-02-10 11:21:42.967'
--where uuid = '54c6f0cf-6d39-459b-aec2-b1d1fcd25e80'


select * from vvFTPDetails where uuid in (
'ae938eff-8d73-4c9f-9c29-4450483ba3cc',
'54c6f0cf-6d39-459b-aec2-b1d1fcd25e80')

--add record to vetsupload
--INSERT INTO vetsupload (uuid, status, trycount, uri, numberattachmentsUploaded, TotalAfterSplitting, sizeflag, UploadTimestamp) 
--VALUES ('54c6f0cf-6d39-459b-aec2-b1d1fcd25e80', 'success', '1', '2020/02/06/14/14-04-165vetsgov-document-54c6f0cf-6d39-459b-aec2-b1d1fcd25e80-document.pdf', '1', '1', '0', '2020-02-10 11:21:42.967')





select * from smsDCSMapping where dcsid in (
'DCSID042003805156010001',
'DCSID042004105029010001')



select * from PhysicalBatch where pbatch in (
'04200380515601',
'04200410502901')


select * from DCSID_UUID_mapping where uuid in (
'fa668e75-d3dd-4691-9bbb-5aac260dff9d',
'066d37fe-0ecb-4d3f-ae0c-6a3b20ccd989',
'96179fe6-e1ca-4790-8d85-f640562d4f68',
'371609de-788c-4191-8383-59121c897a29',
'3e9184df-27a1-4582-b207-4c637ab387c6',
'e98bcff3-723e-4c85-ad8d-0e9b38a10328',
'fce95070-0a5f-4e9d-8db2-90b0a74ab53c',
'b9908e5a-f6a4-4596-b178-eec483b45977',
'c919db90-8d4c-479f-be52-7c0a73e5a2f0')



select * from vvFTPDetails where uuid in (
'fa668e75-d3dd-4691-9bbb-5aac260dff9d',
'066d37fe-0ecb-4d3f-ae0c-6a3b20ccd989',
'96179fe6-e1ca-4790-8d85-f640562d4f68',
'371609de-788c-4191-8383-59121c897a29',
'3e9184df-27a1-4582-b207-4c637ab387c6',
'e98bcff3-723e-4c85-ad8d-0e9b38a10328',
'fce95070-0a5f-4e9d-8db2-90b0a74ab53c',
'b9908e5a-f6a4-4596-b178-eec483b45977',
'c919db90-8d4c-479f-be52-7c0a73e5a2f0')

select * from SMSCompleted where VeteranID in (
'8308426',
'8306442',
'8307971',
'8308104',
'8308266',
'8308343',
'8307965',
'8312309',
'8312397')


select * from smsDCSMapping 
where VeteranID in (
'8308426',
'8306442',
'8307971',
'8308104',
'8308266',
'8308343',
'8307965',
'8312309',
'8312397')