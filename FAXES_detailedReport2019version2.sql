select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT distinct RightFax_VA.dbo.Documents.FaxDIDNum, RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
CASE 
WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' 
WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' 
ELSE ''Pending'' END AS ''Transmission Status'', 
RightFax_VA.dbo.HistoryTRX.RemoteID, 
RightFax_VA.dbo.historytrx.ani as FromPhone
FROM   RightFax_VA.dbo.DocFiles INNER JOIN
RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle
WHERE RightFax_VA.dbo.Documents.CreationTime >= ''2019-10-21'' and
RightFax_VA.dbo.Documents.CreationTime <= ''2019-10-27 23:59:59.999''                                      
--and RightFax_VA.dbo.Documents.Status in ( 6, 9)
and RightFax_VA.dbo.Documents.UniqueID like ''va%''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244265''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244279''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244266''
ORDER BY LocalCreationTime DESC')
UNION ALL
select * from OpenQuery([CORP-VA-FAX02\P1], 
'SELECT distinct RightFax_VA.dbo.Documents.FaxDIDNum, RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
CASE 
WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' 
WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' 
ELSE ''Pending'' END AS ''Transmission Status'', 
RightFax_VA.dbo.HistoryTRX.RemoteID, RightFax_VA.dbo.historytrx.ani as FromPhone
FROM   RightFax_VA.dbo.DocFiles INNER JOIN
RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle
WHERE RightFax_VA.dbo.Documents.CreationTime >= ''2019-10-21'' and
RightFax_VA.dbo.Documents.CreationTime <= ''2019-10-27 23:59:59.999''  
and RightFax_VA.dbo.Documents.UniqueID like ''va%''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244265''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244279''
and RightFax_VA.dbo.Documents.FaxDIDNum <> ''2485244266''
ORDER BY LocalCreationTime DESC')