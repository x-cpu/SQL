--FAX data pull 
select distinct Z.FileNumber, UPPER(Z.Firstname) FirstName, UPPER(Z.MiddleInitial) MiddleInitial, REPLACE(UPPER(Z.Lastname), char(9), ' ') LastName,
Z.ZipCode, Z.PacketID, Z.RoSiteID, Z.BatchName,
CASE
	WHEN p.cordest is null then 'COMP'
	ELSE p.cordest
	END Source,
CASE
	WHEN p.cordest is null then '8445317818'
	WHEN p.cordest = 'BVA' then '8446788979'
	WHEN p.cordest = 'FID' then '8885816826'
	WHEN p.cordest = 'PMC' then '8446551604'
	WHEN p.cordest = 'VRE' then '8449231819'
	ELSE null
	END FAXno,
Z.ImageID, Z.NumPages Images, RIGHT('00000'+ISNULL(d.docid,''), 5) DocID, Z.Form526Data Contentions, 
Z.received_date ReceivedDate, Z.ackTime [DMHS ack date],
CASE
	WHEN Z.status = 'COMPLETED' then Z.xmlModified
	ELSE NULL
	END [VBMS ack date]
FROM
(select distinct Y.PacketID, Y.BatchName, Y.dcsid, Y.ackTime, Y.xmlModified, Y.status,
Y.ImageID, Y.FileNumber, Y.NumPages, Y.docidDoctype, Y.Form526Data, Y.received_date,
Y.Firstname, Y.MiddleInitial, Y.Lastname, Y.ZipCode,
v.RoSiteID
FROM
(select distinct X.PacketID, X.BatchName, X.dcsid, X.ackTime, X.xmlModified, X.status, 
X.ImageID, X.FileNumber, X.NumPages, X.docidDoctype, X.Form526Data, X.received_date,
c.Firstname, c.MiddleInitial, c.Lastname, c.ZipCode
FROM
(select distinct T.PacketID, T.BatchName, T.dcsid, T.ackTime, T.xmlModified, T.status,
d.ImageID, d.FileNumber, d.NumPages, d.docidDoctype, d.Form526Data, d.received_date
FROM
(select distinct s.veteranID PacketID, s.batchname BatchName, s.dcsid, 
s.ackTime, s.xmlModified, s.status
from smsDCSMapping s
where s.ackTime >= '2018-05-01' and s.ackTime < '2018-09-01' 
and s.ackTime is not null
and s.batchname like '04%'
and SUBSTRING(s.batchname, 9,1) <> '5') T
left join document d
on T.dcsid = d.dcsID) X
left join CustomerDATA c
on X.dcsid = c.dcsID) Y
left join VeteranIDRoSiteID v
on Y.PacketID = v.veteranID) Z
left join PhysicalBatch p
on Z.BatchName = p.PBatch
left join docid.dbo.docid d
on Z.docidDoctype = d.DocType
and exists (select * from stats where Z.BatchName = kbatch)
where Z.ImageID is not null
order by Z.ImageID

