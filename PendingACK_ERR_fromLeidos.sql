select distinct d.batchname BatchName, 
d.ETime UploadDateTime, s.veteranID 'VeteranID/PacketID',
CASE
	When d.batchname like '17%' then 'API-NCC-CallCenter'
	When SUBSTRING(d.batchname, 9, 1) = 5 then 'API - VetsGov'
	Else 'Fax'
	End as Type
--, round((d.bytesize/1024)/1024, 2) BatchSize_mb, max(s.acktime) AckTime, 
--max(s.errtime) ErrTime 
from dmhsFTPDetails d
left join smsDCSMapping s
on d.batchname = s.batchname
where 
--round((bytesize/1024)/1024, 2) > 50 and 
s.ackTime is  null
and s.errTime is  null
and d.ETime >= '2019-09-01'
and d.ETime < '2019-10-01'
and (d.batchname like '04%' or d.batchname like '17%')
group by d.batchname, d.ETime, s.veteranID
order by d.batchname  desc



select * from smsDCSMapping where batchname = '04192680012901'