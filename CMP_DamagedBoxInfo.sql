--select distinct dcsid, pbatch, max(f.AckTime) UploadtoPortalDate from Document d
select distinct dcsid, pbatch from Document d
left join FTPDetails f
on d.PBatch = f.batchname
 where pbatch in (
'03160280614101',
'03160280614201',
'03160280614301',
'03160280614401',
'03160280614501')
group by dcsid, PBatch order by dcsID



select count (distinct pbatch) from Document d
left join FTPDetails f
on d.PBatch = f.batchname
 where pbatch in (
'03160280614101',
'03160280614201',
'03160280614301',
'03160280614401',
'03160280614501')



select pbatch, pobox, CRCDestination pobox2, InvTime from PhysicalBatch where pbatch in (
'03151890610001',
'03151890610101',
'03151890610201',
'03151890610301',
'03151890610401',
'03151890610501',
'03151890610601',
'03151890610701',
'03151890611201',
'03151890611301',
'03151890611401',
'03151890611501',
'03151890611601',
'03151890611701',
'03151890611801')


select distinct kbatch from stats where kbatch in (
'03152970610701',
'03152970610801',
'03152970611601',
'03152970611701')



select * from cmpcheckin_bck where pbatch in (
'03151290605201')

select * from PhysicalBatch_bck where pbatch in (
'03151290605201')

select * from PhysicalBatch where pbatch = '03151290605201'

select * from Stats_IBML where batchname = '03151290605201'

select PBatch, CONVERT(varchar, InvTime, 101) CheckINDate from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, CONVERT(varchar, InvTime, 101) 
having ((CONVERT(varchar, InvTime, 101) = '05/15/2015') or (CONVERT(varchar, InvTime, 101) = '05/18/2015'))

select * from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail' order by InvTime