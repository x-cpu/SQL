
select T.T1 + T.ClaimType + '|||' + T.RMN + '|' xData
FROM
(select distinct dd.ImageID + '|' 
+ dd.pbatch + '|' 
+ d.dcsID + '|' 
+ d.FileNumber 
+ '|00' + doc.docid + '|' 
+ cd.Lastname + '|' 
+ cd.MiddleInitial + '|' 
+ cd.Firstname + '|' 
+ d.received_date + '|'
+ convert(varchar(10), d.numpages) + '|||'
+ dd.pbatch + '\' + dd.ImageID + '.pdf' + '|'
T1, d.RMN,
case 
WHEN cc.claimtype = 'C' then 'C'
WHEN cc.claimtype <> 'C' then 'P'
End
AS ClaimType
from docid.dbo.ddEXPAffected dd
left join dva.dbo.document d
on dd.imageid = d.imageid and dd.pbatch = d.PBatch
left join docid.dbo.docid doc
on d.dociddoctype = doc.doctype
left join dva.dbo.CustomerDATA cd
on d.dcsid = cd.dcsID
left join dva.dbo.customerCheckIn cc
on d.RMN = cc.RMN
where dd.pbatch = '02162251212101') T


select * from dva.dbo.customerdata where pbatch = '02162071111203'
select * from dva.dbo.customerdata where dcsid = 'IR6O2WK1WDV1VH'

select distinct pbatch from ddEXPAffected

select * from ddEXPAffected where ImageID = 'CSRA_162303102P001269384'


select * from dva.dbo.customerCheckIn where insertdate > '2016-08-20' and (claimtype <> 'c' and claimtype <> 'p')
and exists (select * from dva.dbo.document where dva.dbo.customerCheckIn.rmn = rmn)


select * from dva.dbo.document where rmn = '313VB0728165784H'

--group by dd.ImageID, dd.pbatch, d.dcsID, d.FileNumber, doc.DocID, cd.Lastname, cd.MiddleInitial, cd.Firstname, d.received_date



