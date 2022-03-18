select * from docid.dbo.pending

select * from docid.dbo.pending where status =  'null'

--update docid.dbo.pending
--set status = 'null'

--NOTCSRA
select * from docid.dbo.pending p
where not exists (select * from manifestDCS where p.id = dcsid)

--update docid.dbo.pending
--set status = 'NOTCSRA'
--where not exists (select * from manifestDCS where docid.dbo.pending.id = dcsid)


--Uploaded
select * from docid.dbo.pending p
where exists (select * from document where p.id = dcsid and ftpstime is not null)
and not exists (select * from document where p.id = dcsid and ftpstime is null)

--update docid.dbo.pending
--set status = 'Uploaded'
--where exists (select * from document where docid.dbo.pending.id = dcsid and ftpstime is not null)
--and not exists (select * from document where docid.dbo.pending.id = dcsid and ftpstime is null)


--Export_notuploaded
select * from docid.dbo.pending p
where exists (select * from document where p.id = dcsid and ftpstime is null)

--update docid.dbo.pending
--set status = 'exported_notuploaded'
--where exists (select * from document where docid.dbo.pending.id = dcsid and ftpstime is null)


--work in progress TS
select * from docid.dbo.pending p
left join manifestdcs m
on p.id = m.dcsid
where exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = substring(batchname, 1, 12))
and status is null

select * from docid.dbo.pending p
left join pbatchdcsmapping m
on p.id = m.dcsid
where exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and status is null



--update docid.dbo.pending 
--set status = 'work in progress TS'
--From docid.dbo.pending p
--left join pbatchdcsmapping m
--on p.id = m.dcsid
--where exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and status =  'null'





select * from manifestDCS where dcsid in (
'IYYM0FLB-P1045Z',
'IYYHEQWLM9MYI',
'IYYKTSKK-TH1CYV',
'IYYO574Q-14KWHS',
'IYYSVXO2-RTDTTB',
'IYYO311EA1P1J5')


select p.id, m.pbatch from docid.dbo.pending p
left join manifestdcs m
on p.id = m.dcsid
order by m.pbatch

select distinct dcsID from document where dcsid IN (
'IYXBGFKG-RUK164',
'IYQ0ITQ7-HW60PA',
'IYVRMW7V3L0ZQR',
'IY5YZW1XRMMOH4',
'IYD41V9246IOXB',
'IYQAB78EFCXYBT') and ftpstime is null