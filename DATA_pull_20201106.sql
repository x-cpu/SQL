
select distinct top(1) d.FileNumber, c.Firstname, c.MiddleInitial,
c.Lastname, c.ZipCode, T.PacketID, v.RoSiteID, T.BatchName, 
CASE
	WHEN T.batchname like '17%' then 'NCC'
	WHEN p.cordest is null then 'COMP'
	ELSE p.cordest
	END Source, ROSite = '',
d.ImageID, d.NumPages Images, d.docidDoctype, d.Form526Data Contentions, T.ackTime [DMHS ack date],
CASE
	WHEN T.status = 'COMPLETED' Then T.xmlModified
	ELSE NULL
	END [VBMS ack date]
FROM
(select distinct s.veteranID PacketID, s.batchname BatchName, s.dcsid, 
s.ackTime, s.xmlModified, s.status
from smsDCSMapping s
where s.ackTime >= '2020-11-05' 
--and s.ackTime < '2020-11-06 16:00'
and s.ackTime is not null
--and s.batchname like '04%' 
--or s.batchname like '17%') T
and s.batchname like '04%') T
left join PhysicalBatch p
on T.batchname = p.PBatch
left join document d
on T.batchname = d.PBatch
left join CustomerDATA c
on T.dcsid = c.dcsID
left join VeteranIDRoSiteID v
on T.PacketID = v.veteranID
where p.cordest = 'VTG'
group by d.FileNumber, c.Firstname, c.MiddleInitial, c.Lastname, c.ZipCode, T.PacketID, T.batchname,
p.cordest, d.ImageID, v.RoSiteID, d.NumPages, d.docidDoctype, d.Form526Data, T.ackTime, T.status, T.xmlModified