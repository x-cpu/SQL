---FaxChannel Report
select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT convert(nvarchar, Documents.CreationTime,101) as FaxDate, 
datepart(hour, Documents.CreationTime) As Hour, 
datepart(minute, Documents.CreationTime) As Minute, 
count(distinct HistoryTRX.ChannelUsed) as ChannelCNT
FROM   RightFax_VA.dbo.HistoryTRX HistoryTRX 
INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle
INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle
WHERE  HistoryTRX.ElapsedTime>0
group by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
order by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
')





select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT convert(nvarchar, RightFax_VA.Documents.CreationTime),101) as FaxDate, 
datepart(hour, RightFax_VA.Documents.CreationTime) As Hour, 
count(distinct HistoryTRX.ChannelUsed) as ChannelCNT
FROM   ((RightFax_VA.dbo.HistoryTRX HistoryTRX 
INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle) 
INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle) 
INNER JOIN RightFax_VA.dbo.DocFiles DocFiles ON Documents.DocFileDBA=DocFiles.handle
WHERE  HistoryTRX.ElapsedTime>0
group by convert(nvarchar, RightFax_VA.Documents.CreationTime,101), datepart(hour, RightFax_VA.Documents.CreationTimeTRDateTime)
order by convert(nvarchar, RightFax_VA.Documents.CreationTime,101), datepart(hour, RightFax_VA.Documents.CreationTimeTRDateTime)
')


select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT convert(nvarchar, History.TRDateTime,101) as FaxDate, 
datepart(hour, History.TRDateTime) As Hour, 
count(distinct HistoryTRX.ChannelUsed) as ChannelCNT
FROM   ((RightFax_VA.dbo.HistoryTRX HistoryTRX 
INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle) 
INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle) 
INNER JOIN RightFax_VA.dbo.DocFiles DocFiles ON Documents.DocFileDBA=DocFiles.handle
WHERE  HistoryTRX.ElapsedTime>0
group by convert(nvarchar, History.TRDateTime,101), datepart(hour, History.TRDateTime)
order by convert(nvarchar, History.TRDateTime,101), datepart(hour, History.TRDateTime)
')

--more efficient
select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT convert(nvarchar, History.TRDateTime,101) as FaxDate, 
datepart(hour, History.TRDateTime) As Hour, 
count(distinct HistoryTRX.ChannelUsed) as ChannelCNT
FROM   RightFax_VA.dbo.HistoryTRX HistoryTRX 
INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle
WHERE  HistoryTRX.ElapsedTime>0
group by convert(nvarchar, History.TRDateTime,101), datepart(hour, History.TRDateTime)
order by convert(nvarchar, History.TRDateTime,101), datepart(hour, History.TRDateTime)
')



select * from OpenQuery([CORP-VA-FAX01\P1], 
'SELECT convert(nvarchar, Documents.CreationTime,101) as FaxDate, 
datepart(hour, Documents.CreationTime) As Hour, 
datepart(minute, Documents.CreationTime) As Minute, 
count(distinct HistoryTRX.ChannelUsed) as ChannelCNT
FROM   RightFax_VA.dbo.HistoryTRX HistoryTRX 
INNER JOIN RightFax_VA.dbo.History History ON HistoryTRX.handle=History.handle
INNER JOIN RightFax_VA.dbo.Documents Documents ON History.Owner=Documents.handle
WHERE  HistoryTRX.ElapsedTime>0
group by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
order by convert(nvarchar, Documents.CreationTime, 101), datepart(hour, Documents.CreationTime), datepart(minute, Documents.CreationTime)
')