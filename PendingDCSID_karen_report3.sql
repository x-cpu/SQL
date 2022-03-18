select * from pending20170410
where [checked in but not in ts] is null
and [in ts - not yet exported] is null
and [uploaded to vbms] is null
and [not ours] is null



--To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Uploaded'
--from pending20170410 p
--where [checked in but not in ts] is null
--and [in ts - not yet exported] is null
--and [uploaded to vbms] is null
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)


--To Update In TS
--update p
--set [IN TS - Not yet exported] = 'work in progress TS'
--from pending20170410 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null 
--and [Uploaded to VBMS] is null 
--and [in ts - not yet exported] is null
--and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)



--To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Pending Upload - Exported from Turboscan'
--from pending20170410 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
----and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)
--and exists (select * from dva.dbo.stats where m.pbatch = kbatch)




--To Update In Not In TS
--update p
--set [Checked In But Not in TS] = 'Not in TS But CheckedIN'
--from pending20170410 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null 
--and [Uploaded to VBMS] is null 
--and [in ts - not yet exported] is null
--and [Checked In But Not in TS] is null
--and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
----and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from pending20170410 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null 
and [Uploaded to VBMS] is null 
and [in ts - not yet exported] is null
and [Checked In But Not in TS] is null
and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


--To update C 2 P
--update p
--set [Complete To Pending] = 'True'
--from pending20170410 p
--where exists (select * from c2p_20170410 where p.rmn = rmn)

select * from pending20170410 p
where exists (select * from c2p_20170410 where p.rmn = rmn)

select * from c2p_20170410 where rmn in (
'376VB0217171444A',
'377VB0220175123F',
'376VB0228173069A')

select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where BatchName in (
'02170931406310',
'02170871009005',
'02170881002602',
'02170411513501',
'02170901605503',
'02170931505901',
'02170901605503',
'02170941408907',
'02170681301301',
'02170941409906',
'02170411405301',
'02170761602823',
'02170751102315',
'02170791301603',
'02170891008303')


select * from  dva.dbo.PbatchDCSMapping where dcsid in (
'IYQ6QMJ0-ZEE5XV',
'IYUG83OYYRECZP',
'IZZOF7QMN0XFA3',
'J09OPU8E-MKXHAM',
'J09QZEBGNTWJ2W',
'J0CKXVZM-AVMC35',
'J0NTKKE4NW43ZZ',
'J0O4ELLE-4OH14O',
'J0SE9D8Z-5XYICD',
'J0TT7PSB-VQTZJP',
'J0TQQ12Q-QBN8V4',
'J0VA4YEB8RGFN3',
'J0VACPR5OBRZNA',
'J0WCAN3P-MBU3GZ',
'J0WHMMR4GKY8A4')



select *, m.Pbatch from pending20170410 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [In TS - Not Yet Exported] is not null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)


select * from pending20170410 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [In TS - Not Yet Exported] is not null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)