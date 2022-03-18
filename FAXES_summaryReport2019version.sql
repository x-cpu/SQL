select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT distinct RemoteServer = ''CORP-VA-FAX01'', RightFax_VA.dbo.Documents.FaxDIDNum,
CASE
	When  RightFax_VA.dbo.Documents.FaxDIDNum in (''2485244260'', ''2485244261'',''2485244263'',''2485244264'') Then ''LOCAL''	
	When  RightFax_VA.dbo.Documents.FaxDIDNum in (''2485244262'', ''2485244267'',''2485244268'',''2485244269'') Then ''TOLL FREE''	
	END AS LineType,
count(distinct RightFax_VA.dbo.Documents.UniqueID) Count
from RightFax_VA.dbo.Documents 
where RightFax_VA.dbo.Documents.FaxDIDNum <> ''''
and RightFax_VA.dbo.Documents.CreationTime >= ''2019-10-21'' 
and RightFax_VA.dbo.Documents.CreationTime <= ''2019-10-27 23:59:59.999''  
and RightFax_VA.dbo.Documents.UniqueID like ''va%''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244265''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244266''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244279''
group by FaxDIDNum
order by FaxDIDNum')
UNION ALL
select * from OpenQuery([CORP-VA-FAX02\P1], 
'SELECT distinct RemoteServer = ''CORP-VA-FAX02'', RightFax_VA.dbo.Documents.FaxDIDNum, 
CASE
	When  RightFax_VA.dbo.Documents.FaxDIDNum in (''2485244260'', ''2485244261'',''2485244263'',''2485244264'') Then ''LOCAL''	
	When  RightFax_VA.dbo.Documents.FaxDIDNum in (''2485244262'', ''2485244267'',''2485244268'',''2485244269'') Then ''TOLL FREE''	
	END AS LineType,
count(distinct RightFax_VA.dbo.Documents.UniqueID) Count
from RightFax_VA.dbo.Documents 
where RightFax_VA.dbo.Documents.FaxDIDNum <> '''' 
and RightFax_VA.dbo.Documents.CreationTime >= ''2019-10-21'' 
and RightFax_VA.dbo.Documents.CreationTime <= ''2019-10-27 23:59:59.999''  
and RightFax_VA.dbo.Documents.UniqueID like ''va%''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244265''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244266''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244279''
group by FaxDIDNum
order by FaxDIDNum')


