select T.UploadDate, T.BatchName, 
T.BatchType, 
sum(T.PackageCount) PackageCount, 
sum(T.ACK_Received) ACK_Received, 
sum(T.ERR_Received) ERR_Received, 
sum(T.Completed_Received) Completed_Received
FROM
(select distinct convert(date, d.ETime, 101) UploadDate, s.batchname BatchName, s.veteranID,
CASE
	When s.batchname like '17%' then 'NCC'
	When s.batchname like '12%' then 'FTU'
	When p.cordest = 'vtg' then 'VetsGov'
	When p.cordest is null then 'Regular'
	When p.cordest = 'PMC' then 'PMC'
	When p.cordest = 'BVA' then 'BVA'
	Else 'null'
	END  BatchType,
	count(distinct s.dcsid) PackageCount, 
	count(s.acktime) ACK_Received, 
	count(s.errTime) ERR_Received,
SUM(CASE
	When s.status = 'Completed' then 1
	Else 0
	END) Completed_Received
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join physicalbatch p
on s.batchname = p.pbatch
where s.insertdate >= '2019-09-01'
and s.insertdate < '2020-01-8'
and d.ETime < '2020-01-8'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and exists (select top(1) * from smsDCSMapping where s.batchname = batchname and ackTime is null)
group by convert(date, d.ETime, 101), s.batchname, s.veteranID, p.cordest, s.status) T
group by T.UploadDate, T.BatchName, T.BatchType
order by T.UploadDate
