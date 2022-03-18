--updated
select * from docid.dbo.tmpcorpfax1

select *  from OpenQuery([CORP-VA-FAX01\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

                            WHERE CreationTime >= ''2016-06-14 0:0:0'' and CreationTime <= ''2016-06-14 23:59:59.999'' and 
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status = 6
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
                                      RightFax_VA.dbo.HistoryTRX.RemoteID

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

                            WHERE CreationTime >= ''2016-06-14 0:0:0'' and CreationTime <= ''2016-06-14 23:59:59.999'' and 
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status = 6
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''


                            ORDER BY LocalCreationTime DESC')

--eastern time

select *  from OpenQuery([CORP-VA-FAX01\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.History.TRDateTime as TransmissionTimeStamp, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

                            WHERE TRDateTime >= ''2016-06-14 0:0:0'' and TRDateTime <= ''2016-06-14 23:59:59.999'' and 
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status = 6
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''

                            ORDER BY TransmissionTimeStamp DESC')
                                                    UNION ALL
                            select * from OpenQuery([CORP-VA-FAX02\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.History.TRDateTime as TransmissionTimeStamp, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

                            WHERE TRDateTime >= ''2016-06-14 0:0:0'' and TRDateTime <= ''2016-06-14 23:59:59.999'' and 
                                     Status <> 10
									 and RightFax_VA.dbo.Documents.Status = 6
									 and RightFax_VA.dbo.Documents.UniqueID like ''va%''
									 and RightFax_VA.dbo.HistoryTRX.RemoteID <> ''49 115 xxxxxxxx     ''
									 and RightFax_VA.dbo.Documents.FaxDIDNum = ''2485244260''


                            ORDER BY TransmissionTimeStamp DESC')



---MASTER showing Coversheet
select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
       RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime,RightFax_VA.dbo.Documents.UniqueID, RightFax_VA.dbo.HistoryTRX.ChannelUsed, Documents.FCSFile as ''Coversheet Pages'',RightFax_VA.dbo.DocFiles.NumPages as ''Attached Pages'',
       RightFax_VA.dbo.HistoryTRX.ElapsedTime, 
              CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
          RightFax_VA.dbo.HistoryTRX.RemoteID, 
       RightFax_VA.dbo.Documents.FaxDIDNum, RightFax_VA.dbo.Users.UserID, RightFax_VA.dbo.Users.UserName, RightFax_VA.dbo.Documents.ToContactNum, RightFax_VA.dbo.Documents.ToName, RightFax_VA.dbo.Documents.ToCompany, RightFax_VA.dbo.Documents.FromName

FROM   RightFax_VA.dbo.DocFiles INNER JOIN
       RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
       RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
       RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
       RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

WHERE CreationTime >= DATEADD(DAY, -30, GETDATE()) and 
         Status <> 10

ORDER BY LocalCreationTime DESC')


--quick lookup
select top(100) * from tmpfaxtifname 
--order by tifname desc
where tifname like '%VA-5745F38D5A13%'



---MASTER showing Coversheet modify for code using specific date range with RemoteServer, **Channe
select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
       RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime,RightFax_VA.dbo.Documents.UniqueID, RightFax_VA.dbo.HistoryTRX.ChannelUsed, Documents.FCSFile as ''Coversheet Pages'',RightFax_VA.dbo.DocFiles.NumPages as ''Attached Pages'',
       RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer,
              CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
          historytrx.ani as FromPhone, RightFax_VA.dbo.HistoryTRX.RemoteID, 
       RightFax_VA.dbo.Documents.FaxDIDNum, RightFax_VA.dbo.Users.UserID, RightFax_VA.dbo.Users.UserName, RightFax_VA.dbo.Documents.ToContactNum, RightFax_VA.dbo.Documents.ToName, RightFax_VA.dbo.Documents.ToCompany, RightFax_VA.dbo.Documents.FromName

FROM   RightFax_VA.dbo.DocFiles INNER JOIN
       RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
       RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
       RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
       RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

WHERE CreationTime >= ''2016-05-01 0:0:0'' and CreationTime <= ''2016-06-09 0:0:0''and 
         Status <> 10

ORDER BY LocalCreationTime DESC')


select * from OpenQuery([CORP-VA-FAX01\P1], 
                            'SELECT DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
       RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.Documents.UniqueID, RightFax_VA.dbo.HistoryTRX.ChannelUsed, RightFax_VA.dbo.DocFiles.NumPages, 
       RightFax_VA.dbo.HistoryTRX.ElapsedTime, 
              CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
          RightFax_VA.dbo.HistoryTRX.RemoteID, 
       RightFax_VA.dbo.Documents.FaxDIDNum, RightFax_VA.dbo.Users.UserID, RightFax_VA.dbo.Users.UserName, RightFax_VA.dbo.Documents.ToContactNum, RightFax_VA.dbo.Documents.ToName, RightFax_VA.dbo.Documents.ToCompany, RightFax_VA.dbo.Documents.FromName

FROM   RightFax_VA.dbo.DocFiles INNER JOIN
       RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
       RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
       RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
       RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

WHERE CreationTime >= DATEADD(DAY, -30, GETDATE()) and 
         Status <> 10

ORDER BY LocalCreationTime DESC')



--by pages
select * from OpenQuery([CORP-VA-FAX01\P1], 
                            'SELECT DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
       RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.Documents.UniqueID, RightFax_VA.dbo.HistoryTRX.ChannelUsed, RightFax_VA.dbo.DocFiles.NumPages, 
       RightFax_VA.dbo.HistoryTRX.ElapsedTime, 
              CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
          RightFax_VA.dbo.HistoryTRX.RemoteID, 
       RightFax_VA.dbo.Documents.FaxDIDNum, RightFax_VA.dbo.Users.UserID, RightFax_VA.dbo.Users.UserName, RightFax_VA.dbo.Documents.ToContactNum, RightFax_VA.dbo.Documents.ToName, RightFax_VA.dbo.Documents.ToCompany, RightFax_VA.dbo.Documents.FromName

FROM   RightFax_VA.dbo.DocFiles INNER JOIN
       RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
       RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
       RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
       RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

WHERE CreationTime >= DATEADD(DAY, -30, GETDATE()) and 
         Status <> 10

ORDER BY NumPages asc')


