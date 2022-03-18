select * from OpenQuery([CORP-VA-FAX01\P1], 
                        'SELECT convert(nvarchar, Documents.CreationTime,101) as FaxDate, 
                        datepart(hour, Documents.CreationTime) As Hour, 
                        datepart(minute, Documents.CreationTime) As Minute, 
                        count(distinct HistoryTRX.ChannelUsed) as ChannelCNT, HistoryTRX.RemoteServer
                        FROM   RightFax_VA.dbo.HistoryTRX HistoryTRX 
                        INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle
                        INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle
                        WHERE  HistoryTRX.ElapsedTime>0
                        AND Documents.CreationTime >= dateadd(day,datediff(day,1,GETDATE()),0) 
                        AND Documents.CreationTime <= dateadd(day,datediff(day,0,GETDATE()),0)
                        group by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
                        order by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
                        ')
                                                    UNION ALL
                            select * from OpenQuery([CORP-VA-FAX02\P1], 
                        'SELECT convert(nvarchar, Documents.CreationTime,101) as FaxDate, 
                        datepart(hour, Documents.CreationTime) As Hour, 
                        datepart(minute, Documents.CreationTime) As Minute, 
                        count(distinct HistoryTRX.ChannelUsed) as ChannelCNT, HistoryTRX.RemoteServer
                        FROM   RightFax_VA.dbo.HistoryTRX HistoryTRX 
                        INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle
                        INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle
                        WHERE  HistoryTRX.ElapsedTime>0
                        AND Documents.CreationTime >= dateadd(day,datediff(day,1,GETDATE()),0) 
                        AND Documents.CreationTime <= dateadd(day,datediff(day,0,GETDATE()),0)
                        group by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
                        order by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
                        ')