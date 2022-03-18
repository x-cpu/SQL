select CONVERT(nvarchar, Z.IncomingDate, 101) IncomingDate, ISNULL(sum(Z.Faxes), 0) TotalRecv, 
(ISNULL(sum(Z.Faxes),0) - (ISNULL(sum(Z.[6Hrs]), 0) + ISNULL(sum(Z.[12Hrs]), 0) + ISNULL(sum(Z.[24Hrs]), 0) + ISNULL(sum(Z.[48Hrs]), 0)  + ISNULL(sum(Z.More48Hrs), 0))) WIP,
ISNULL(sum(Z.[6Hrs]), 0) '6Hrs', 
ISNULL(sum(Z.[12Hrs]), 0) '12Hrs',
ISNULL(sum(Z.[24Hrs]), 0) '24Hrs',
ISNULL(sum(Z.[48Hrs]), 0) '48Hrs',
ISNULL(sum(Z.More48Hrs), 0) 'More48Hrs'
FROM
(select Y.BatchName, Y.Faxes, Y.IncomingDate, Y.UploadDate, 
CASE
	When Y.TotalHours <=6 Then Y.Faxes
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
	END 'More48Hrs'
FROM
(select X.BatchName, X.IncomingDate, d.ETime UploadDate, X.Faxes, 
DATEDIFF(hour, X.IncomingDate, d.ETime) - (DATEDIFF(wk, X.IncomingDate, d.ETime) * 48) -
case when DATEPART(dw, X.IncomingDate) = 1 then 48 else 0 end +
case when DATEPART(dw, d.ETime) = 1 then 48 else 0 end TotalHours
FROM
(select distinct t.pbatch BatchName, 
count(distinct t.tifname) Faxes, 
max(p.InvTime) IncomingDate
from tmpfaxtifname t
left join PhysicalBatch p
on t.pbatch = p.PBatch
where t.pbatch like '04%'
and p.InvTime >= '2020-03-02'
--and t.datemodified >= '2020-03-02'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
and exists (select * from PhysicalBatch where t.pbatch = pbatch and RNDAudit is null)
group by t.pbatch) X
left join Calendar c
on convert(date, X.IncomingDate, 101) = c.CalendarDate
left join dmhsFTPDetails d
on X.BatchName = d.batchname
group by X.BatchName, X.IncomingDate, d.etime, X.Faxes, c.BusinessDay, c.NonBusinessDay, d.ETime) Y) Z
group by CONVERT(nvarchar, Z.IncomingDate, 101) 




--byBatch
select X.BatchName, X.IncomingDate, d.ETime UploadDate, X.Faxes, 
DATEDIFF(hour, X.IncomingDate, d.ETime) - (DATEDIFF(wk, X.IncomingDate, d.ETime) * 48) -
case when DATEPART(dw, X.IncomingDate) = 1 then 48 else 0 end +
case when DATEPART(dw, d.ETime) = 1 then 48 else 0 end TotalHours
FROM
(select distinct t.pbatch BatchName, 
count(distinct t.tifname) Faxes, 
max(p.InvTime) IncomingDate
from tmpfaxtifname t
left join PhysicalBatch p
on t.pbatch = p.PBatch
where t.pbatch like '04%'
and p.InvTime >= '2020-03-02'
--and t.datemodified >= '2020-03-02'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
and exists (select * from PhysicalBatch where t.pbatch = pbatch and RNDAudit is null)
group by t.pbatch) X
left join Calendar c
on convert(date, X.IncomingDate, 101) = c.CalendarDate
left join dmhsFTPDetails d
on X.BatchName = d.batchname
group by X.BatchName, X.IncomingDate, d.etime, X.Faxes, c.BusinessDay, c.NonBusinessDay, d.ETime
order by X.IncomingDate, X.BatchName




--byPacket
select distinct X.BatchName, X.IncomingDate, d.ETime UploadDate, X.Faxes, s.veteranID,
DATEDIFF(hour, X.IncomingDate, d.ETime) - (DATEDIFF(wk, X.IncomingDate, d.ETime) * 48) -
case when DATEPART(dw, X.IncomingDate) = 1 then 48 else 0 end +
case when DATEPART(dw, d.ETime) = 1 then 48 else 0 end TotalHours
FROM
(select distinct t.pbatch BatchName, 
count(distinct t.tifname) Faxes, 
max(p.InvTime) IncomingDate
from tmpfaxtifname t
left join PhysicalBatch p
on t.pbatch = p.PBatch
where t.pbatch like '04%'
and p.InvTime >= '2020-03-02'
--and t.datemodified >= '2020-03-02'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
and exists (select * from PhysicalBatch where t.pbatch = pbatch and RNDAudit is null)
group by t.pbatch) X
left join Calendar c
on convert(date, X.IncomingDate, 101) = c.CalendarDate
left join dmhsFTPDetails d
on X.BatchName = d.batchname
left join smsDCSMapping s
on d.batchname = s.batchname
group by X.BatchName, X.IncomingDate, d.etime, X.Faxes, c.BusinessDay, c.NonBusinessDay, d.ETime, s.veteranID
order by X.IncomingDate, X.BatchName
