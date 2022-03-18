use dva
select  s.veteranID 'Packet ID', 
case 
       WHEN s.acktime is not null then 'ACK'
       WHEN s.errtime is not null then 'ERR'
END
AS 'Return Status',
convert(nvarchar,d.ETime,101) as 'Date Sent','CSRA' as Vendor
from dmhsFTPDetails d
left join smsDCSMapping s
on d.batchname = s.batchname
where 
d.stime >='3/27/2020 0:0:0'
and d.etime  <='3/27/2020 23:59:59'
and (d.batchname like '04%' or d.batchname like '17%')
and s.veteranID is not null
and s.veteranid not in (select distinct mailPacketID from autocestrecon where dmhsuploadtime is null and mailpacketid is not null)
