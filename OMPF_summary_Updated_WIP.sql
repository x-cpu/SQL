select distinct c.RMN, c.trackingno TrackingNo, count(distinct p.PBatch) Batches,
count(distinct s.kbatch) Exported,
CASE
	When d.ftpstime is not null then d.PBatch
	END uploadBatchName
from PhysicalBatch p
left join customerCheckIn c
on p.RMN = c.RMN
left join stats s
on p.PBatch = s.kbatch
--left join [mtv-va-sql-4\p1].turboscanng1.dbo.batches b
--on p.pbatch = b.batchname
left join document d
on p.PBatch = d.PBatch
where c.claimtype = 'ompf'
and p.PBatch like '02%'
and c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
group by c.RMN, c.trackingno, d.PBatch, d.ftpstime