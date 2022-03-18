--Combined
select ISNULL(sum(Z.OutsideTAT), 0) OutsideTAT, ISNULL(sum(Z.InsideTAT), 0) InsideTAT, ISNULL(sum(Z.OutsideTAT), 0) + ISNULL(sum(Z.InsideTAT), 0) Total
FROM
(select 
CASE
	When X.datemodified <  DATEADD(HOUR, -48, GETDATE()) and X.datemodified >= '2020-01-01'
	Then ISNULL(sum(X.Faxes),0)
	End OutsideTAT,
CASE
	When X.datemodified >= DATEADD(HOUR, -48, GETDATE())
	Then ISNULL(sum(X.Faxes),0)
	End InsideTAT
FROM
(select distinct t.pbatch BatchName, count(distinct t.tifname) Faxes, max(t.datemodified) DateModified
from tmpfaxtifname t
where not exists (select * from stats where t.pbatch = kbatch)
--and exists (select * from TURBOSCANNG1.dbo.batches where t.pbatch = BatchName)
and not exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest = 'vtg')
--and exists (select * from PhysicalBatch where t.pbatch = pbatch and cordest <> 'vtg')
and t.pbatch like '04%'
and t.datemodified >= '2020-01-01'
group by t.pbatch) X
group by x.DateModified) Z