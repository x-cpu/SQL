select * from pending20170317 where rmn is not null


select * from pending20170317_bckup

select count(*) from pending20170317


select * from pending20170317 where rmn <> ''



select distinct d.DCSID, m.RMN 
from pending20170317 d
left join dva.dbo.manifestdcs m
on d.dcsid = m.dcsid
order by RMN desc



select distinct d.DCSID, m.RMN 
from pending20170317 d
left join dva.dbo.manifestdcs m
on d.dcsid = m.dcsid
order by RMN desc

--To update RMN values
--update d
--set d.rmn = m.rmn
--from pending20170317x d
--left join dva.dbo.manifestdcs m
--on d.dcsid = m.dcsid
--where d.rmn = ''

select * from pending20170317 where rmn is not null

--select * into pending20170317x from pending20170317

--To update Not Ours
--update pending20170317x
--set [Not Ours] = 'DCSID not showing CheckedIn'
--where rmn is null

--reset everything to null for RERUN update
select * from pending20170317x
--update pending20170317x
--set [not ours] = null, [checked in but not in ts] = null, [Uploaded to VBMS] = null, [IN TS - Not yet exported] = null



select * from pending20170317 p
where [Not Ours] is null
and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)


select * from pending20170317 p
where [Not Ours] is null
and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)

--To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Uploaded'
--from pending20170317x p
--where [Not Ours] is null
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)


select * from pending20170317 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)

select * from pending20170317 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from pending20170317 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


--To Update In TS
--update p
--set [IN TS - Not yet exported] = 'work in progress TS'
--from pending20170317x p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null and [Uploaded to VBMS] is null
--and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)

----To Update In TS part 2
--update p
--set [IN TS - Not yet exported] = 'work in progress TS'
--from pending20170317x p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
--and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


--update docid.dbo.pending 
--set status = 'work in progress TS'
--From docid.dbo.pending p
--left join pbatchdcsmapping m
--on p.id = m.dcsid
--where exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and status =  'null'



--select * from dva.dbo.document where dcsid = 'IZSGCIK17EEW9K'

--update docid.dbo.pending 
--set status = 'work in progress TS'
--From docid.dbo.pending p
--left join pbatchdcsmapping m
--on p.id = m.dcsid
--where exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and status =  'null'



select * from pending20170317 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null


select * from pending20170317 p
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null
and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)



----To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Uploaded'
--from pending20170317 p
--where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and not exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)



select * from dva.dbo.PbatchDCSMapping where dcsid in (
'IZIP15HL-73YL4H',
'J046TDUZMU5JP0',
'J0B9TQA5T7ICTH',
'J0453AK6-CZMTKM',
'IZ9XDA7UHVNBH7')


select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where batchname in (
'02170551007102',
'02170601108603',
'02170761001507',
'02170761001905',
'02170761304303')

select * from DVA.dbo.Stats where kbatch in (
'02170551007102',
'02170601108603',
'02170761001507',
'02170761001905',
'02170761304303')



select * from pending20170317 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from pending20170317 p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
and  exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)



update p
set [Checked In but Not in TS] = 'Not in TS'
from pending20170317x p
left join dva.dbo.PbatchDCSMapping m
on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from pending20170317 p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null


select * from DVA.dbo.PbatchDCSMapping where dcsid = 'I6I7QRB1UA7GIH'

select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where BatchName = '02170681106010'



select * from pending20170317x p where [Not Ours] is not null
and exists (select * from dva.dbo.manifestDCS where p.DCSID = dcsID)


select * from dva.dbo.manifestDCS where dcsid in (
'J0B0MAJA66FY05',
'J0B99N8XD8PAN4',
'J0B3C42EHAFHA',
'J0B0QLNV-ZARPNQ',
'J0B99B4B3PRUYY',
'J09YM98V-CRG7W',
'J09W3YUP-MFFRLG',
'J0AZK0SAI2PBJP',
'J0B9EETLBXS862',
'J09Y81BN-XRBG6L',
'J09WGMKH-E8BIG7',
'J0AV9Y05IV45BU',
'J09UCT3Q-4JI2EK')

select * from pending20170317x p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
and exists (select * from pending20170317 where p.dcsid = DCSID)



select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where batchname = '02170761000903'
select * from dva.dbo.PbatchDCSMapping where dcsid = 'J047JGKNTU5PDT'


--To update Upload to VBMS status
--update p
--set [Uploaded to VBMS] = 'Pending Upload - Exported from Turboscan'
--from pending20170317x p
--left join dva.dbo.PbatchDCSMapping m
--on p.dcsid = m.dcsid
--where [Not Ours] is null and [Uploaded to VBMS] is null and [IN TS - Not yet exported] is null and [Checked In but Not in TS] is null
----and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is not null)
--and exists (select * from dva.dbo.document where p.dcsid = dcsid and ftpstime is null)
--and exists (select * from dva.dbo.stats where m.pbatch = kbatch)