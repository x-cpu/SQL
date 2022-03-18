select distinct s.veteranID, d.XMLfilename, s.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, s.ackTime, d.insertdate ErrorDate, dd.docidDoctype DocType, o.DocID DocID_Value
from dmhsCMPxmldownload d
left join smsDCSMapping s
on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
left join document dd
on s.dcsid = dd.dcsID
left join docid.dbo.docid o
on dd.docidDoctype = o.DocType
where type = '.err'  and s.ackTime is null
and d.insertdate > DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 300, 0)
and dd.docidDoctype in (
'VA Form 28-1900 Disabled Veterans Application for Vocational Rehabilitation',
'VRE Correspondence',
'Fiduciary Program''s Version of Supplemental Claim') 
order by d.insertdate desc