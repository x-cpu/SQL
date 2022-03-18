select distinct T.BatchName, T.IncomingDate, T.UploadDate, T.Faxes,
CASE
	When T.TimeDate > T.CalcDate and T.TimeDate <> T.IncomingDate Then DATEDIFF(hour, CONVERT(varchar(10), T.TimeDate, 120) + ' 06:00:00', T.UploadDate)
	When T.CalcDate > T.TimeDate and T.CalcDate <> T.IncomingDate Then DATEDIFF(hour, CONVERT(varchar(10), T.CalcDate, 120) + ' 06:00:00', T.UploadDate)
	Else DATEDIFF(hour, T.IncomingDate, T.UploadDate)
	END Hours
FROM
(select X.BatchName, X.IncomingDate, d.ETime UploadDate, X.Faxes, CAST(X.IncomingDate as Time) aTime,
CASE
	When c.NonBusinessDay = '1' 
	Then DATEADD(dd,CASE WHEN DATEDIFF(dd,0,X.IncomingDate)%7 > 3 THEN 7-DATEDIFF(dd,0,X.IncomingDate)%7 ELSE 1 END,X.IncomingDate)
	Else X.IncomingDate
	END CalcDate,
CASE 
	When (CAST(X.IncomingDate as Time) > CAST('22:00:00' as Time) or CAST(X.IncomingDate as Time) < CAST('06:00:00' as Time)) and c.NonBusinessDay = '0' 
	Then DATEADD(dd,CASE WHEN DATEDIFF(dd,0,X.IncomingDate)%7 > 3 THEN 7-DATEDIFF(dd,0,X.IncomingDate)%7 ELSE 1 END,X.IncomingDate)
	Else X.IncomingDate
	END TimeDate
FROM
(select distinct t.pbatch BatchName, 
count(distinct t.tifname) Faxes, 
max(p.InvTime) IncomingDate
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
group by X.BatchName, X.IncomingDate, d.etime, X.Faxes, c.BusinessDay, c.NonBusinessDay, d.ETime) T

