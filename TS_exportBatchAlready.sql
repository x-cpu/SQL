
select tsb.batchname,  tsb.batchdesc from turboscanNG1.dbo.batches tsB where tsb.batchdesc = 'Batch has already been exported!' and tsb.wfstep = '11' order by tsb.BatchName


select * from turboscanNG1.dbo.batches tsB where tsb.batchdesc = 'Batch has already been exported!' and tsb.wfstep = '11' order by tsb.BatchName



select distinct d.pbatch from dva.dbo.document d where ftpstime is not null and d.pbatch in (
select tsb.batchname from turboscanNG1.dbo.batches tsB where tsb.batchdesc = 'Batch has already been exported!' and tsb.wfstep = '11')
