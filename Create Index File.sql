select distinct d.imageid + '|' + d.pbatch + '|' + d.dcsid + '|' + d.FileNumber + '|' 
+ RIGHT('00'+ISNULL(dd.DocID,''),5) + '|' + c.firstname + '|' + c.MiddleInitial + '|' 
+ c.Lastname + '|' + d.received_date + '|' + CONVERT(varchar(10), d.numpages) + '|'
+ '3/18/2020 10:19:15 AM' 
+ '|' + '3/18/2020 10:19:15 AM' 
+ '|' + d.PBatch + '\' +  d.imageid + '.pdf' + '|'
+ 'C' + '|' + '|' + '|' + d.RMN + '|'
from document d
left join docid.dbo.docid dd
on d.docidDoctype = dd.doctype
left join CustomerDATA c
on d.dcsid = c.dcsid
where d.PBatch = '02190251903302'