select BatchName from batches where batchlocation = '64' and exists
(select PBatch from dva.dbo.physicalbatch where rndaudit = 'Y' and batches.batchname = physicalbatch.pbatch)


select BatchName from batches where batchlocation = '64' and batchname in(
select PBatch from dva.dbo.physicalbatch where rndaudit = 'Y')


