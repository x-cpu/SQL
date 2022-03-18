select distinct s.batchname, s.veteranID, m.UUID, d.ETime UploadDateTime, s.ackTime, s.errTime from DCSID_UUID_mapping m
left join smsDCSMapping s
on m.DCSID = s.dcsid
left join dmhsFTPDetails d
on s.batchname = d.batchname
where m.uuid in (
'fa668e75-d3dd-4691-9bbb-5aac260dff9d',
'066d37fe-0ecb-4d3f-ae0c-6a3b20ccd989',
'96179fe6-e1ca-4790-8d85-f640562d4f68',
'371609de-788c-4191-8383-59121c897a29',
'3e9184df-27a1-4582-b207-4c637ab387c6',
'e98bcff3-723e-4c85-ad8d-0e9b38a10328',
'fce95070-0a5f-4e9d-8db2-90b0a74ab53c',
'b9908e5a-f6a4-4596-b178-eec483b45977',
'c919db90-8d4c-479f-be52-7c0a73e5a2f0')