select * from batches where wfstep<>'4' and wfstep <>'11' and batchname in (select distinct pbatch from dva.dbo.physicalbatch where cordest='1')

