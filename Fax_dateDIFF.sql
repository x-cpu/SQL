select t.uniqueid, t.localcreationtime, f.datemodified, DATEDIFF(day, t.localcreationtime, f.datemodified) datediff, f.pbatch BatchName from docid.dbo.faxTemp20170414 t
left join tmpfaxtifname f
on t.uniqueID = substring(f.tifname, 16, 15)
where t.[transmission status] = 'OK'
order by datediff desc


select t.uniqueid, t.localcreationtime, f.datemodified, DATEDIFF(day, t.localcreationtime, f.datemodified) datediff, f.pbatch BatchName from docid.dbo.faxTemp20161221 t
left join tmpfaxtifname f
on t.uniqueID = substring(f.tifname, 16, 15)
where t.[transmission status] = 'OK'
order by datediff desc


select * from tmpfaxtifname



select top(1000) *, SUBSTRING(tifname, 16, 15) from tmpfaxtifname  where datemodified > '2016-12-01'


select t.uniqueid, t.localcreationtime, f.datemodified, DATEDIFF(day, t.localcreationtime, f.datemodified) datediff from docid.dbo.faxTemp20161221 t
left join tmpfaxtifname f
on t.uniqueID = substring(f.tifname, 16, 15)
where t.[transmission status] = 'OK'
order by t.uniqueid
order by datediff desc




select * from  docid.dbo.faxTemp20161221 where uniqueid in (
'VA-585A7D9CE82D',
'VA-585A839FA168',
'VA-585A874FA207',
'VA-585A8699E8AE',
'VA-585A8234E862',
'VA-585A82FDA14B',
'VA-585A819AA10F',
'VA-585A8200A122')

select distinct uniqueid from docid.dbo.faxTemp20161221


select * from tmpfaxtifname where tifname like '%VA-585A8200A122%'





select * into docid.dbo.faxTemp20170414 from OpenQuery([CORP-VA-FAX01\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID, RightFax_VA.dbo.historytrx.ani as FromPhone

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

								   where
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status in ( 6, 9)
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''


                            ORDER BY LocalCreationTime DESC')
                                                    UNION ALL
                            select * from OpenQuery([CORP-VA-FAX02\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID, RightFax_VA.dbo.historytrx.ani as FromPhone

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

								   where
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status in ( 6, 9)
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''



                            ORDER BY LocalCreationTime DESC')