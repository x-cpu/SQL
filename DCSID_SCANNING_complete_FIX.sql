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
where d.imageid = 'CSRA_192943107P001042089'


--JE5Z7DA3-P6RG7J
--JEEAK7909DX9WN
--JEHG8A0NEVSF0H
--JEEIH0H9-Z8B9GK
--JEIN6P4Y-AIQ4IR

--CSRA_193163103P001007460
--CSRA_192393101P001031659
--CSRA_193023106P001027856
--CSRA_193183106P001152829
--CSRA_192943107P001042089


select top(1) * from document where dcsid = 'JEEAK7909DX9WN' order by ftpstime desc


--update document
--set OrgID = 'DCSSCANNINGCOMPLETE', MA18doctype = 'UPDATEDOCUMENT001'
--where ImageID = 'CSRA_192943107P001042089'


--select * into document20200320 from document where imageid in (
--'CSRA_193163103P001007460',
--'CSRA_192393101P001031659',
--'CSRA_193023106P001027856',
--'CSRA_193183106P001152829',
--'CSRA_192943107P001042089')


--update document
--set ftpstime = null
--where imageid in (
--'CSRA_193163103P001007460',
--'CSRA_192393101P001031659',
--'CSRA_193023106P001027856',
--'CSRA_193183106P001152829',
--'CSRA_192943107P001042089')


select imageid, pbatch, ftpstime, DCSIDComplete from document where imageid in (
'CSRA_193163103P001007460',
'CSRA_192393101P001031659',
'CSRA_193023106P001027856',
'CSRA_193183106P001152829',
'CSRA_192943107P001042089')