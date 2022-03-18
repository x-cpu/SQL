select * from batches where BatchDesc like '%combination%'

select batchname, batchdesc, wfstep from batches where BatchDesc like '%combination%'

Invalid RMN & DCSID combination! RMN: 317VB0116144688S DCSID: HQI8QZHI9KW0FB


select * from batches where batchdesc like '%could%'

select * from batches where batchname = '02140850000302'

update batches
set batchstatus = '1'
where batchname = '02140850000302'


select * from batches where batchname in (
'02140860005403',
'02140880400504',
'02140870401003')
