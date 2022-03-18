select * from OpenQuery([CORP-VA-FAX01\P1], 
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

                            WHERE DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) >= dateadd(day,datediff(day,1,GETDATE()),0) and DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) <= dateadd(day,datediff(day,0,GETDATE()),0) and 
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

                            WHERE DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) >= dateadd(day,datediff(day,1,GETDATE()),0) and DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) <= dateadd(day,datediff(day,0,GETDATE()),0) and 
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status in ( 6, 9)
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''



                            ORDER BY LocalCreationTime DESC')


select * from tmpfaxtifname where tifname like '%VA-5771BA968F95%'


select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT convert(nvarchar, History.TRDateTime,101) as FaxDate, datepart(hour, History.TRDateTime) As Hour, count(distinct HistoryTRX.ChannelUsed) as ChannelCNT
FROM   ((RightFax_VA.dbo.HistoryTRX HistoryTRX INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle) INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle) INNER JOIN RightFax_VA.dbo.DocFiles DocFiles ON Documents.DocFileDBA=DocFiles.handle
WHERE  HistoryTRX.ElapsedTime>0
group by convert(nvarchar, History.TRDateTime,101), datepart(hour, History.TRDateTime)
order by convert(nvarchar, History.TRDateTime,101), datepart(hour, History.TRDateTime)
')


--search for specific fax by FromPhone
select * from OpenQuery([CORP-VA-FAX01\P1], 
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

                            WHERE RightFax_VA.dbo.historytrx.ani = ''2087801381'' and 
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

                            WHERE RightFax_VA.dbo.historytrx.ani = ''2087801381'' and  
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status in ( 6, 9)
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''



                            ORDER BY LocalCreationTime DESC')






--search for specific fax by NAME
select * from OpenQuery([CORP-VA-FAX01\P1], 
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

                            WHERE RightFax_VA.dbo.documents.uniqueID = ''VA-5850160E00FF'' and 
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

                            WHERE RightFax_VA.dbo.documents.uniqueID = ''VA-5850160E00FF''  and  
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status in ( 6, 9)
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''



                            ORDER BY LocalCreationTime DESC')

							


--DATE DIFF lookup

select t.uniqueid, t.localcreationtime, f.datemodified, DATEDIFF(day, t.localcreationtime, f.datemodified) datediff from docid.dbo.faxTemp20161221 t
left join tmpfaxtifname f
on t.uniqueID = substring(f.tifname, 16, 15)
where t.[transmission status] = 'OK'
order by datediff desc
