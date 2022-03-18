select T.UploadDate, T.BatchName, 
T.veteranID,
T.BatchType, 
sum(T.PackageCount) PackageCount, 
sum(T.ACK_Received) ACK_Received, 
--count(distinct s.ackTime) ACK_Received,
sum(T.ERR_Received) ERR_Received, 
sum(T.Completed_Received) Completed_Received
--, 
--T.Comments
--, b.batchname BatchNameFromList
--into xLeidosACKResults_List20190219x
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
	count(distinct s.acktime) ACK_Received, 
	count(distinct s.errTime) ERR_Received,
SUM(CASE
	When s.status = 'Completed' then 1
	Else 0
	END) Completed_Received
--CASE
--	When b.batchname is not null then 'Batch exists within list provided today' 
--	When b.batchname is null then ''
--	END As Comments
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
--left join xLeidosZips b
--on s.batchname = SUBSTRING(b.batchname, 0, 15)
left join physicalbatch p
on s.batchname = p.pbatch
where s.insertdate >= '2019-01-13'
and s.ackTime is null
and s.insertdate < '2019-3-11'
and d.ETime < '2019-3-11'
--and s.errTime is null
--and p.cordest is null
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and exists (select top(1) * from smsDCSMapping where s.batchname = batchname and ackTime is null)
--and exists (select * from smsDCSMapping where s.batchname = batchname and ackTime is not null and errTime is null)
--and s.batchname in (
--'04190090500601',
--'04190100500501')
--and not exists (select * from xLeidosZips where s.batchname = SUBSTRING(batchname, 0, 15))
group by convert(date, d.ETime, 101), s.batchname, s.veteranID, p.cordest, s.status) T
--left join xLeidosZips b
--on T.BatchName = SUBSTRING(b.batchname, 0, 15)
--left join smsDCSMapping s
--on T.BatchName = s.batchname
group by T.UploadDate, T.BatchName, T.veteranID, T.BatchType
--, b.batchname
order by T.UploadDate



--