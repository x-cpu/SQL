select T.UploadDate, T.BatchName, T.BatchType, sum(T.PackageCount) PackageCount, sum(T.ACK_Received) ACK_Received, sum(T.Completed_Received) Completed_Received, T.Comments
FROM
(select distinct top (10) convert(date, d.ETime, 101) UploadDate, s.batchname BatchName, 
CASE
	When p.cordest = 'vtg' then 'VetsGov'
	When p.cordest is null then 'Regular'
	END  BatchType,
	count(s.dcsid) PackageCount, count(distinct s.acktime) ACK_Received, 
SUM(CASE
	When s.status = 'Completed' then 1
	Else 0
	END) Completed_Received,
CASE
	When b.batchname is not null then 'Batch exists in /CSRA/CM/Archive directory on Leidos sFTP'
	When b.batchname is null then ''
	END As Comments
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join xLeidosArchiveBatches b
on s.batchname = b.batchname
left join physicalbatch p
on s.batchname = p.pbatch
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-31'
and d.ETime < '2019-01-31'
and s.errTime is null
and p.cordest is null
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
group by convert(date, d.ETime, 101), s.batchname,b.batchname, p.cordest, s.status) T
group by T.UploadDate, T.BatchName, T.BatchType, T.Comments
order by T.UploadDate
