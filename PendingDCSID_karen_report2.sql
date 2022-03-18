select * from pending20170327_1


--To update Upload to VBMS status
update p
set [Uploaded to VBMS] = 'Uploaded'
from pending20170327_1 p
where [checked in but not in ts] is null
and [in ts - not yet exported] is null
and [uploaded to vbms] is null
and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)


--To update Upload to VBMS status
update p
set [checked in but not in ts] = 'Not in TS'
from pending20170327_2 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [checked in but not in ts] is null
and [in ts - not yet exported] is null
and [uploaded to vbms] is null
and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from pending20170327_2

select * from pending20170327_2
where [checked in but not in ts] is null
and [in ts - not yet exported] is null
and [uploaded to vbms] is null
and [not ours] is null


--To update Upload to VBMS status
update p
set [Uploaded to VBMS] = 'Uploaded'
from pending20170327_2 p
where [checked in but not in ts] is null
and [in ts - not yet exported] is null
and [uploaded to vbms] is null
and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)


--To update RMN values
--update d
--set d.rmn = m.rmn
--from pending20170327_2 d
--left join dva.dbo.manifestdcs m
--on d.dcsid = m.dcsid
--where d.rmn is null



--To update Not Ours
--update pending20170327_2
--set [Not Ours] = 'DCSID not showing CheckedIn'
--where rmn is null


--To Update In TS
--update p
--set [IN TS - Not yet exported] = 'work in progress TS'
--from pending20170327_2 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null and [Uploaded to VBMS] is null
--and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)




--To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Pending Upload - Exported from Turboscan'
--from pending20170327_2 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
----and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)
--and exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from pending20170327_2 p where [Not Ours] is not null


