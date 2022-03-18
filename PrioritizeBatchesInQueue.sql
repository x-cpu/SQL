select * from TurboscanNG1.dbo.batches b
left join dva.dbo.physicalbatch p
on b.batchname = p.pbatch
left join dva.dbo.customercheckin c
on p.rmn = c.rmn
where b.WFStep = '2' and b.BatchStatus = '1'
and c.claimtype <> 'c'


update b
set b.priority = 1
from TurboscanNG1.dbo.batches b
left join dva.dbo.physicalbatch p
on b.batchname = p.pbatch
left join dva.dbo.customercheckin c
on p.rmn = c.rmn
where b.WFStep = '2' and b.BatchStatus = '1' and b.Priority = '2'
and c.claimtype <> 'c'