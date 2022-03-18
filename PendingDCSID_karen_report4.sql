select * from pending20170410_2

select * from pending20170410_2
where [checked in but not in ts] is null
and [in ts - not yet exported] is null
and [uploaded to vbms] is null
and [not ours] is null


--update pending20170410_2
--set [not ours] = NULL, [checked in but not in ts] = NULL, [in ts - not yet exported] = NULL, [uploaded to vbms] = NULL


--update pending20170410_2
--set [in ts - not yet exported] = NULL


--To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Uploaded'
--from pending20170410_2 p
--where [checked in but not in ts] is null
--and [in ts - not yet exported] is null
--and [uploaded to vbms] is null
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)


--To Update In TS
--update p
--set [IN TS - Not yet exported] = 'work in progress TS (' + b.BatchName + ')'
--from pending20170410_2 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--left join [mtv-va-sql-4\p1].turboscanng1.dbo.batches b
--on m.Pbatch = b.BatchName
--where [Not Ours] is null 
--and [Uploaded to VBMS] is null 
--and [in ts - not yet exported] is null
--and [checked in but not in ts] is null
--and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select *, b.BatchName from pending20170410_2 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
left join [mtv-va-sql-4\p1].turboscanng1.dbo.batches b
on m.Pbatch = b.BatchName
where [Not Ours] is null 
and [Uploaded to VBMS] is null 
and [in ts - not yet exported] is null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches b where m.pbatch = BatchName)



----To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Pending Upload - Exported from Turboscan'
--from pending20170410_2 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null 
--and [Uploaded to VBMS] is null 
--and [IN TS - Not yet exported] is null 
--and [Checked In but Not in TS] is null
----and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)
--and exists (select * from dva.dbo.stats where m.pbatch = kbatch)






select * from dva.dbo.Document where pbatch = '02170761302506'




--To Update In Not In TS
--update p
--set [Checked In But Not in TS] = 'Not in TS But CheckedIN (' + m.Pbatch + ')'
--from pending20170410_2 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null 
--and [Uploaded to VBMS] is null 
--and [in ts - not yet exported] is null
--and [Checked In But Not in TS] is null
--and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
----and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select *, m.Pbatch from pending20170410_2 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null 
and [Uploaded to VBMS] is null 
and [in ts - not yet exported] is null
and [Checked In But Not in TS] is null
and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from dva.dbo.Document where dcsid = 'J0WK8JPABEA1I2'

select * from dva.dbo.manifestDCS where dcsid = 'IO08QQNH7PRF6K'


--update p
--set [Checked In But Not in TS] = 'Not in TS But CheckedIN' 
--from pending20170410_2 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null 
--and [Uploaded to VBMS] is null 
--and [in ts - not yet exported] is null
--and [Checked In But Not in TS] is null
--and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
----and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)
