use dva
select sum(totalimages), count(*) as batches from turboscanng1.dbo.batches where wfstep=6 and jobid=8
and batchname in (select distinct pbatch from physicalbatch where cordest is null)
