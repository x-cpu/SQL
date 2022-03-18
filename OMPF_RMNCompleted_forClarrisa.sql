select distinct r.RMN, CONVERT(varchar, max(p.invtime), 101) CheckInDate, 
CONVERT(varchar, max(d.ftpstime), 101) UploadDate, 
CONVERT(varchar, max(b.insertdate), 101) CheckOutDate
--,
--[Completed (y/n)] = 'y'
from RMNCompleted_OMPF r
left join customerCheckIn c
on r.RMN = c.RMN
left join PhysicalBatch p
on r.RMN = p.RMN
left join document d
on r.RMN = d.RMN
left join Boxmapping b
on d.dcsID = b.dcsID
where c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
group by r.RMN
UNION
select distinct c.RMN, 
CONVERT(varchar, max(p.invtime), 101) CheckInDate,
--'UploadDate' = '',
'UploadDate' = null,
--CONVERT(varchar, getdate(), 101) CheckOutDate,
'CheckOutDate' = null
--,
--[Completed (y/n)] = 'n'
from customerCheckIn c
left join PhysicalBatch p
on c.RMN = p.RMN
left join document d
on c.RMN = d.RMN
where not exists (select * from RMNCompleted_OMPF where c.RMN = RMN)
and c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
and c.claimtype = 'ompf'
group by c.RMN



