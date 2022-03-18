--By FromFAX
select distinct CONVERT(date, localcreationtime, 101) FaxDate, FromPhone,
Case
	When [transmission status] = 'OK' then count(distinct uniqueID)
	Else 0
	END as Success,
Case 
	When [transmission status] = 'Error' then count(distinct uniqueID)
	Else 0
	END as Error
from xtemp20190219fax
where uniqueID like 'va%'
group by  CONVERT(date, localcreationtime, 101), FromPhone, [transmission status] 
order by CONVERT(date, localcreationtime, 101)


--SUMMARY
select T.FaxDate, sum(T.Success) Success, sum(T.Error) Error
FROM
(select distinct CONVERT(date, localcreationtime, 101) FaxDate, 
Case
	When [transmission status] = 'OK' then count(distinct uniqueID)
	Else 0
	END as Success,
Case 
	When [transmission status] = 'Error' then count(distinct uniqueID)
	Else 0
	END as Error
from xtemp20190219fax
where uniqueID like 'va%'
group by  CONVERT(date, localcreationtime, 101), [transmission status] ) T
group by T.FaxDate
order by T.FaxDate


--FROM FAX feeder for the above 2 queries 
--RUN THIS ONE FIRST BEFORE top 2
--add insert into table at top 
select * from OpenQuery([CORP-VA-FAX01\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer, RightFax_VA.dbo.Documents.FaxDIDNum,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID, RightFax_VA.dbo.historytrx.ani as FromPhone

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

                            WHERE RightFax_VA.dbo.Documents.CreationTime >= ''2019-02-09'' and RightFax_VA.dbo.Documents.CreationTime <= ''2019-02-17'' and
                                     Status <> 10




                            ORDER BY LocalCreationTime DESC')
                                                    UNION ALL
                            select * from OpenQuery([CORP-VA-FAX02\P1], 
                            'SELECT distinct RightFax_VA.dbo.Documents.UniqueID, DATEADD(minute, DATEDIFF(minute, GetUtcDate(), GETDATE()), 
                                   RightFax_VA.dbo.Documents.CreationTime) AS LocalCreationTime, RightFax_VA.dbo.DocFiles.NumPages as ''Pages'',
                                   RightFax_VA.dbo.HistoryTRX.ElapsedTime, HistoryTRX.RemoteServer, RightFax_VA.dbo.Documents.FaxDIDNum,
                                          CASE WHEN RightFax_VA.dbo.Documents.Status = 6 THEN ''OK'' WHEN RightFax_VA.dbo.Documents.Status = 9 THEN ''Error'' ELSE ''Pending'' END AS ''Transmission Status'', 
                                      RightFax_VA.dbo.HistoryTRX.RemoteID, RightFax_VA.dbo.historytrx.ani as FromPhone

                            FROM   RightFax_VA.dbo.DocFiles INNER JOIN
                                   RightFax_VA.dbo.Documents ON RightFax_VA.dbo.DocFiles.handle = RightFax_VA.dbo.Documents.DocFileDBA INNER JOIN
                                   RightFax_VA.dbo.History ON RightFax_VA.dbo.Documents.handle = RightFax_VA.dbo.History.Owner INNER JOIN
                                   RightFax_VA.dbo.HistoryTRX ON RightFax_VA.dbo.History.handle = RightFax_VA.dbo.HistoryTRX.handle INNER JOIN
                                   RightFax_VA.dbo.Users ON RightFax_VA.dbo.Documents.OwnerID = RightFax_VA.dbo.Users.handle

                            WHERE RightFax_VA.dbo.Documents.CreationTime >= ''2019-02-09'' and RightFax_VA.dbo.Documents.CreationTime <= ''2019-02-17'' and
                                     Status <> 10



                            ORDER BY LocalCreationTime DESC')



select FromPhone, count(*) ErrorCount from temp20190219fax
where [transmission status] = 'error'
and uniqueID like 'va%'
group by FromPhone
order by errorcount desc


select FromPhone, RemoteID, count(*) ErrorCount from temp20190219fax
where [transmission status] = 'error'
and uniqueID like 'va%'
group by FromPhone, RemoteID
order by errorcount desc

select * from temp20190219fax
where [transmission status] = 'error'
and uniqueID like 'va%'
group by FromPhone
order by errorcount desc


select * from temp20190219fax
where 
--[transmission status] = 'error'
--and 
uniqueID like 'va%'
group by FromPhone
order by errorcount desc



