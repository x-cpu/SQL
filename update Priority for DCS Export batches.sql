--update Priority for DCS Export batches
update TurboscanNG1.dbo.batches 
set priority = 1
where WFStep = 11 and batchlocation <> 0 and jobid = 8 and batchstatus = 1 and priority = 2 


select * from TurboscanNG1.dbo.batches 
where WFStep = 11 and batchlocation <> 0 and jobid = 8 and batchstatus = 1 and priority = 2

select sum(images) from Stats where releasedate > '2015-03-09 08:00:00'

select * from TurboscanNG1.dbo.batches 
where WFStep = 11 and batchlocation <> 0 and jobid = 11 and batchstatus = 1 and priority = 2




select * from TurboscanNG1.dbo.batches 
where WFStep = 11 and batchlocation <> 0 and jobid = 8 and batchstatus = 8





select * from TurboscanNG1.dbo.batches 
where WFStep = 11 and batchlocation <> 0 and jobid = 11 and batchstatus = 8



select * from PhysicalBatch where RMN in (
'322vb0225150688d',
'318vb0225151632g',
'317vb0226159955s',
'326vb0226156534a')

update PhysicalBatch
set RNDAudit = 'Y'
where RMN in (
'322vb0225150688d',
'318vb0225151632g',
'317vb0226159955s',
'326vb0226156534a')

select * from TurboscanNG1.dbo.batches tb
join PhysicalBatch p
on tb.batchname = p.PBatch
where WFStep = 11 and batchlocation <> 0 and jobid = 8 and batchstatus = 1 and priority = 2




--update Priority for CMP Export batches
update TurboscanNG1.dbo.batches 
set priority = 1
where WFStep = 11 and batchlocation <> 0 and jobid = 11 and batchstatus = 1 and priority = 2 
and batchname in (
'03150580641401',
'03150610615601',
'03150610627901',
'03150580642901',
'03150610615701',
'03150580641201',
'03150580641101',
'03150580641301',
'03150610627701',
'03150580642501',
'03150580641801',
'03150590602601',
'03150580642801',
'03150580641501',
'03150580641601',
'03150580642001',
'03150580642701',
'03150580641901',
'03150580642601')


select * from FTPDetails where batchname = '05142020000001'

select * from PhysicalBatch where pbatch = '05142020000001'

select * from cmpcheckin where pbatch = '05142020000001'


select * from Document where pbatch = '05142020000001'