--NVF Disassociated Doc Counts
select CONVERT(nvarchar, s.ackTime, 101) UploadDate, 
ISNULL(count(distinct d.imageid), 0) Docs, 
ISNULL((sum(d.numpages)), 0) Images
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.batchname like '09%'
and s.ackTime is not null
and s.ackTime >= '2020-01-01'
and s.ackTime <= '2020-04-03 23:59:59.999'
and exists (select * from dmhsFTPDetails where s.batchname = batchname)
and exists (select * from PhysicalBatch where s.batchname = pbatch and RMN like 'RMNDIS%')
group by CONVERT(nvarchar, s.ackTime, 101)

--NVF Disassociated KS Counts
select CONVERT(nvarchar, s.ackTime, 101) UploadDate, ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial) + len(c.zipcode) + (c.numDocs * 3)), 0) FileCharCounts
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
where s.ackTime is not null 
and s.batchname like '09%' 
and s.ackTime >= '2020-01-01'
and s.ackTime <= '2020-04-03 23:59:59.999'
and exists (select * from PhysicalBatch where s.batchname = pbatch and RMN like 'RMNDIS%')
group by CONVERT(nvarchar, s.ackTime, 101)