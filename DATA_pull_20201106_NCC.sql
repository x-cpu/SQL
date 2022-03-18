select distinct d.FileNumber, c.Firstname, c.MiddleInitial,
c.Lastname, c.ZipCode, T.PacketID, v.RoSiteID, T.BatchName, 
CASE
	WHEN T.batchname like '17%' then 'NCC'
	WHEN p.cordest is null then 'COMP'
	ELSE p.cordest
	END Source,
CASE
	WHEN p.cordest is null and T.BatchName like '04%' then '8445317818'
	WHEN p.cordest = 'BVA' then '8446788979'
	WHEN p.cordest = 'FID' then '8885816826'
	WHEN p.cordest = 'PMC' then '8446551604'
	WHEN p.cordest = 'VRE' then '8449231819'
	ELSE null
	END FAXno,
d.ImageID, d.NumPages Images, d.docidDoctype, d.Form526Data Contentions, d.received_date ReceivedDate, T.ackTime [DMHS ack date],
CASE
	WHEN T.status = 'COMPLETED' Then T.xmlModified
	ELSE NULL
	END [VBMS ack date]
FROM
(select distinct s.veteranID PacketID, s.batchname BatchName, s.dcsid, 
s.ackTime, s.xmlModified, s.status
from smsDCSMapping s
where s.ackTime >= '2020-10-16' and s.ackTime < '2020-11-01' 
--and s.ackTime < '2020-11-06 16:00'
and s.ackTime is not null
--and s.batchname like '04%' 
--or s.batchname like '17%') T
and s.batchname like '17%') T
left join PhysicalBatch p
on T.batchname = p.PBatch
left join document d
on T.batchname = d.PBatch
left join CustomerDATA c
on T.dcsid = c.dcsID
left join VeteranIDRoSiteID v
on T.PacketID = v.veteranID
--where p.cordest <> 'VTG'
--and SUBSTRING(p.PBatch, 9,1) <> '8'
group by d.FileNumber, c.Firstname, c.MiddleInitial, c.Lastname, c.ZipCode, T.PacketID, T.batchname,
p.cordest, d.ImageID, v.RoSiteID, d.NumPages, d.docidDoctype, d.Form526Data, d.received_date, T.ackTime, T.status, T.xmlModified