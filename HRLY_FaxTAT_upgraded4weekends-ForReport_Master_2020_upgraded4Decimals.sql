select CONVERT(nvarchar, Z.IncomingDate, 101) IncomingDate, ISNULL(sum(Z.Faxes), 0) TotalRecv, 
(ISNULL(sum(Z.Faxes),0) - 
(ISNULL(sum(Z.[3Hrs]), 0) + ISNULL(sum(Z.[5Hrs]), 0) + ISNULL(sum(Z.[6Hrs]), 0) + ISNULL(sum(Z.[12Hrs]), 0) + ISNULL(sum(Z.[24Hrs]), 0) + ISNULL(sum(Z.[48Hrs]), 0)  + ISNULL(sum(Z.More48Hrs), 0))) WIP,
ISNULL(sum(Z.[3Hrs]), 0) '3Hrs', 
ISNULL(sum(Z.[5Hrs]), 0) '5Hrs', 
ISNULL(sum(Z.[6Hrs]), 0) '6Hrs', 
ISNULL(sum(Z.[12Hrs]), 0) '12Hrs',
ISNULL(sum(Z.[24Hrs]), 0) '24Hrs',
ISNULL(sum(Z.[48Hrs]), 0) '48Hrs',
ISNULL(sum(Z.More48Hrs), 0) 'More48Hrs', ROUND(AVG(CAST(Z.TotalHours AS float)), 2)  "AverageTime/Packet"
FROM
(select Y.BatchName, Y.Faxes, Y.IncomingDate, Y.UploadDate, 
CASE
	When Y.TotalHours <=3 Then Y.Faxes
	END '3Hrs',
CASE
	When Y.TotalHours >3 and Y.TotalHours <=5 Then Y.Faxes
	END '5Hrs',
CASE
	When Y.TotalHours >5 and Y.TotalHours <=6 Then Y.Faxes
	END '6Hrs',
CASE
	When Y.TotalHours >6 and Y.TotalHours <=12 Then Y.Faxes
	END '12Hrs',
CASE
	When Y.TotalHours >12 and  Y.TotalHours <=24   Then Y.Faxes
	END '24Hrs',
CASE
	When Y.TotalHours >24 and  Y.TotalHours <=48   Then Y.Faxes
	END '48Hrs',
CASE
	When Y.TotalHours >48 Then Y.Faxes
	END 'More48Hrs', sum(Y.TotalHours) TotalHours
FROM
(select distinct T.BatchName, T.IncomingDate, T.UploadDate, T.Faxes,
CASE
	When T.TimeDate > T.CalcDate and T.TimeDate <> T.IncomingDate Then CAST(DATEDIFF(hour, CONVERT(varchar(10), T.TimeDate, 120) + ' 06:00:00', T.UploadDate) as decimal (10,2))
	When T.CalcDate > T.TimeDate and T.CalcDate <> T.IncomingDate Then CAST(DATEDIFF(hour, CONVERT(varchar(10), T.CalcDate, 120) + ' 06:00:00', T.UploadDate) as decimal (10,2))
	When DATEPART(dw, T.IncomingDate) = 6 and DATEPART(dw, T.UploadDate) = 2 Then CAST(DATEDIFF(hour, T.IncomingDate, T.UploadDate) as decimal (10,2)) - 
	CAST(DATEDIFF(hour, CONVERT(varchar(10), T.IncomingDate, 120) + ' 22:00:00', CONVERT(varchar(10), T.NextBusinessDay, 120) + ' 06:00:00') as decimal (10,2))
	Else CAST(DATEDIFF(hour, T.IncomingDate, T.UploadDate) as decimal (10,2))
	END TotalHours
FROM
(select X.BatchName, X.IncomingDate, d.ETime UploadDate, X.Faxes, CAST(X.IncomingDate as Time) aTime,
CASE
	When c.NonBusinessDay = '1' 
	Then DATEADD(dd,CASE WHEN DATEDIFF(dd,0,X.IncomingDate)%7 > 3 THEN 7-DATEDIFF(dd,0,X.IncomingDate)%7 ELSE 1 END,X.IncomingDate)
	Else X.IncomingDate
	END CalcDate,
CASE 
	When (CAST(X.IncomingDate as Time) > CAST('22:00:00' as Time) and CAST(X.IncomingDate as Time) <= CAST('23:59:59.999' as Time)) and c.NonBusinessDay = '0' 
	Then DATEADD(dd,CASE WHEN DATEDIFF(dd,0,X.IncomingDate)%7 > 3 THEN 7-DATEDIFF(dd,0,X.IncomingDate)%7 ELSE 1 END,X.IncomingDate)
	When (CAST(X.IncomingDate as Time) > CAST('00:00:00' as Time) and CAST(X.IncomingDate as Time) <= CAST('05:59:59.999' as Time)) and c.NonBusinessDay = '0' 
	Then CONVERT(varchar(10), X.IncomingDate, 120) + ' 06:00:00'
	Else X.IncomingDate
	END TimeDate, X.NextBusinessDay
FROM
(select distinct t.pbatch BatchName, 
count(distinct t.tifname) Faxes, 
max(p.InvTime) IncomingDate, 
DATEADD(dd,CASE WHEN DATEDIFF(dd,0,max(p.InvTime))%7 > 3 THEN 7-DATEDIFF(dd,0,max(p.InvTime))%7 ELSE 1 END,max(p.InvTime)) NextBusinessDay
from tmpfaxtifname t
left join PhysicalBatch p
on t.pbatch = p.PBatch
where t.pbatch like '04%'
and p.InvTime >= '2020-02-17'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
and exists (select * from PhysicalBatch where t.pbatch = pbatch and RNDAudit is null)
group by t.pbatch) X
left join Calendar c
on convert(date, X.IncomingDate, 101) = c.CalendarDate
left join dmhsFTPDetails d
on X.BatchName = d.batchname
group by X.BatchName, X.IncomingDate, d.etime, X.Faxes, X.NextBusinessDay, c.BusinessDay, c.NonBusinessDay, d.ETime) T) Y
where not exists (select * from stagingACZip where Y.BatchName = batchname and Y.TotalHours is null)
and not exists (select * from exceptionTAT where Y.BatchName = batchname)
group by Y.BatchName, Y.Faxes, Y.IncomingDate, Y.UploadDate, Y.TotalHours) Z
group by CONVERT(nvarchar, Z.IncomingDate, 101) 





--select * from stagingACZip