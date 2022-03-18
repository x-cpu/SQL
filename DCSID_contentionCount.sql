
select count(distinct s.DCSID) TotalDCSIDs,
CASE
	When d.Form526Data <> '' then count(distinct d.dcsid)
	End DCSIDsWithContentions
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.insertdate >= '2019-03-01'
and exists (select * from stats where s.batchname = kbatch)
and exists (select * from dmhsFTPDetails where s.batchname = batchname)
group by s.DCSID, d.dcsID, d.Form526Data



select SUM(T.TotalDCSIDs), SUM(T.DCSIDsWithContentions)
FROM
(select count(distinct s.DCSID) TotalDCSIDs,
CASE
	When d.Form526Data <> '' then count(distinct d.dcsid)
	End DCSIDsWithContentions
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
--left join PhysicalBatch p
--on s.batchname = p.PBatch
where s.insertdate >= '2019-03-01'
and exists (select * from stats where s.batchname = kbatch)
and exists (select * from dmhsFTPDetails where s.batchname = batchname)
and exists (select * from PhysicalBatch where s.batchname = pbatch and cordest <> 'VTG')
--and p.cordest <> 'VTG'
group by s.DCSID, d.dcsID, d.Form526Data) T



--Non-VTG
--(No column name)	(No column name)
--67493	687

--VTG
--(No column name)	(No column name)
--8333	2007


select SUM(T.TotalDCSIDs), SUM(T.DCSIDsWithContentions)
FROM
(select count(distinct s.DCSID) TotalDCSIDs,
CASE
	When d.Form526Data <> '' then count(distinct d.dcsid)
	Else '0'
	End DCSIDsWithContentions
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.insertdate >= '2019-03-01'
and exists (select * from stats where s.batchname = kbatch)
and exists (select * from dmhsFTPDetails where s.batchname = batchname)
and exists (select * from PhysicalBatch where s.batchname = pbatch and cordest = 'VTG')
group by s.DCSID, d.dcsID, d.Form526Data) T


---this one
select SUM(T.TotalDCSIDs), SUM(T.DCSIDsWithContentions)
FROM
(select count(distinct s.DCSID) TotalDCSIDs,
CASE
	When d.Form526Data <> '' then count(distinct d.dcsid)
	Else '0'
	End DCSIDsWithContentions,
CASE
	When d.Form526Data <> '' then count(distinct d.Form526Data)
	Else '0'
	End TotalContentions
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where d.imagedatetime >= '2019-03-01' and s.batchname like '04%'
and exists (select * from stats where s.batchname = kbatch)
and exists (select * from dmhsFTPDetails where s.batchname = batchname)
and exists (select * from PhysicalBatch where s.batchname = pbatch and cordest = 'VTG')
group by s.DCSID, d.dcsID, d.Form526Data) T


select count(distinct s.DCSID) TotalDCSIDs
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where d.imagedatetime >= '2019-03-01' and s.batchname like '04%'
and exists (select * from stats where s.batchname = kbatch)
and exists (select * from dmhsFTPDetails where s.batchname = batchname)
and exists (select * from PhysicalBatch where s.batchname = pbatch and cordest <> 'VTG')
group by s.DCSID, d.dcsID, d.Form526Data