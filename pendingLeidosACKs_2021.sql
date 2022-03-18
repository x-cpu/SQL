select X.BatchName, X.veteranID, X.BatchType, X.ExportDateTime, d.ETime UploadDateTime
--CASE
--	WHEN d.ETime is null Then 'Pending Upload'
--	WHEN d.ETime is not null Then d.ETime
--	END UploadStatus
FROM
(select
CASE
	WHEN T.mailPacketID is not null then T.BatchName + RIGHT('00000000'+CAST(T.veteranID as varchar(8)),8)
	WHEN T.mailPacketID is null then T.BatchName
	END BatchName, T.veteranID, T.BatchType, T.ExportDateTime
FROM
(select distinct s.batchname BatchName, s.veteranID, a.mailPacketID,
CASE
	When s.batchname like '17%' then 'NCC'
	When s.batchname like '12%' then 'FTU'
	When s.batchname like '09%' then 'NVF'
	When p.cordest = 'vtg' then 'VetsGov'
	When p.cordest is null then 'COMP'
	When p.cordest = 'PMC' then 'PMC'
	When p.cordest = 'BVA' then 'BVA'
	When p.cordest = 'FID' then 'FID'
	Else 'null'
	END  BatchType, MAX(ss.releasedate) ExportDateTime
from smsDCSMapping s
left join physicalbatch p
on s.batchname = p.pbatch
left join AutoCestRecon a
on s.veteranID = a.mailPacketID
left join stats ss
on s.batchname = ss.kbatch
where s.insertdate >= '2019-12-01'
and s.insertdate < '2020-10-02'
and s.ackTime is null
and s.errTime is null
group by s.batchname, s.veteranID, a.mailPacketID, p.cordest) T) X
left join dmhsFTPDetails d
on X.BatchName = d.batchname
where X.BatchName not in (
'04202580099901',
'04202580099902',
'04202580099903',
'04202580099905',
'04201349888801',
'04202580099907',
'04202580099908',
'04201340999901',
'04201340888801',
'04201010099901',
'04200990099901')
order by X.ExportDateTime, X.BatchName

--select * from smsDCSMapping where batchname = '04202610020301'
--order by veteranID
