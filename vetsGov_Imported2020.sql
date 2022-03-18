select v.uuid, LEN(v.uuid),
CASE 
	When  (select count(*) from tmpfaxtifname where SUBSTRING(tifname, 16, LEN(v.uuid)) = v.uuid) >= 1 then 1
	Else 0
	END Imported
from vvFTPDetails v
where v.uuid in (
'7039a2d9ef7e67801c0da130',
'7039a2d9ef7e67801c0da130',
'704b3160-8ab2-4866-b9d5-7a82efe3815c',
'7101f901-b731-40cd-88f4-11c1bcfa8e11',
'11451c7f-3a56-4f99-9fdb-7ff5d3b1863e',
'31f47e18-3393-4a8a-85d1-3b3c36ee54a5')