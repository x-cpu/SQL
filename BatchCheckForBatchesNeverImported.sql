select distinct t.pbatch BatchName, max(t.datemodified) DateModified,
CASE
	When b.batchname is not null then 'Turboscan'
	End BatchLocation
from tmpfaxtifname t 
left join TURBOSCANNG1.dbo.batches b
on t.pbatch = b.BatchName
--left join stats s
--on t.pbatch = s.kbatch
where not exists (select * from stats where t.pbatch = kbatch)
and t.datemodified >= '2019-09-01'
and BatchLocation is null
group by pbatch, b.BatchName
order by max(datemodified)