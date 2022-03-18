select distinct t.pbatch BatchName, count(distinct t.tifname) Faxes, max(t.datemodified) DateModified
from tmpfaxtifname t
where not exists (select * from stats where t.pbatch = kbatch)
--and exists (select * from TURBOSCANNG1.dbo.batches where t.pbatch = BatchName)
and t.datemodified >= '2020-02-07'
--and t.datemodified >= '2020-01-01'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
group by t.pbatch
order by t.pbatch, max(t.datemodified)



select distinct t.pbatch BatchName, count(distinct t.tifname) Faxes, max(t.datemodified) DateModified
from tmpfaxtifname t
where not exists (select * from stats where t.pbatch = kbatch)
--and exists (select * from TURBOSCANNG1.dbo.batches where t.pbatch = BatchName)
and t.datemodified < '2020-02-07'
and t.datemodified >= '2020-01-01'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
group by t.pbatch
order by t.pbatch, max(t.datemodified)