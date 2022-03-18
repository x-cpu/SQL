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
from vvlookup20200210 v
left join DCSID_UUID_mapping d
on v.uuid = d.UUID
left join AutoCestRecon a
on d.DCSID = a.dcsID
left join VetsUpload u
on v.uuid = u.uuid
left join dmhsFTPDetails f
on SUBSTRING(d.dcsid, 6, 14) = f.batchname
order by v.downloaddate



select SUBSTRING(dcsid, 6, 14) from DCSID_UUID_mapping where uuid in (
'ccdfe793-8af2-4041-a256-f0fe52a26ab6',
'fe55d162-76ea-48aa-beae-83a02beb6853')


select * from dmhsFTPDetails where batchname = '04200350516001'


select * from vvFTPDetails where sendAcknowledgeProcessing is null and uuid in (
'b6b03205-9683-459d-8682-7b25b12f4d7c',
'fa668e75-d3dd-4691-9bbb-5aac260dff9d',
'066d37fe-0ecb-4d3f-ae0c-6a3b20ccd989',
'96179fe6-e1ca-4790-8d85-f640562d4f68',
'371609de-788c-4191-8383-59121c897a29',
'3e9184df-27a1-4582-b207-4c637ab387c6',
'e98bcff3-723e-4c85-ad8d-0e9b38a10328',
'fce95070-0a5f-4e9d-8db2-90b0a74ab53c',
'b9908e5a-f6a4-4596-b178-eec483b45977',
'c919db90-8d4c-479f-be52-7c0a73e5a2f0')




select * from vvFTPDetails where sendAcknowledgeProcessing is null and uuid in (
'b6b03205-9683-459d-8682-7b25b12f4d7c',
'fa668e75-d3dd-4691-9bbb-5aac260dff9d',
'066d37fe-0ecb-4d3f-ae0c-6a3b20ccd989',
'96179fe6-e1ca-4790-8d85-f640562d4f68',
'371609de-788c-4191-8383-59121c897a29',
'3e9184df-27a1-4582-b207-4c637ab387c6',
'e98bcff3-723e-4c85-ad8d-0e9b38a10328',
'fce95070-0a5f-4e9d-8db2-90b0a74ab53c',
'b9908e5a-f6a4-4596-b178-eec483b45977',
'c919db90-8d4c-479f-be52-7c0a73e5a2f0')


select * from DCSID_UUID_mapping d
 where uuid in (
'b6b03205-9683-459d-8682-7b25b12f4d7c',
'fa668e75-d3dd-4691-9bbb-5aac260dff9d',
'066d37fe-0ecb-4d3f-ae0c-6a3b20ccd989',
'96179fe6-e1ca-4790-8d85-f640562d4f68',
'371609de-788c-4191-8383-59121c897a29',
'3e9184df-27a1-4582-b207-4c637ab387c6',
'e98bcff3-723e-4c85-ad8d-0e9b38a10328',
'fce95070-0a5f-4e9d-8db2-90b0a74ab53c',
'b9908e5a-f6a4-4596-b178-eec483b45977',
'c919db90-8d4c-479f-be52-7c0a73e5a2f0')

select * from smsDCSMapping where batchname = '04200250500501'


select * from dmhsFTPDetails where batchname = '04200250500501'


select * from smsDCSMapping where dcsid in (
'DCSID042002605013010052',
'DCSID042002605011010038',
'DCSID042002505005010006',
'DCSID042002505005010139',
'DCSID042002505005010301',
'DCSID042002705014010069',
'DCSID042002705007010102',
'DCSID042002705001010182',
'DCSID042002705015010070')