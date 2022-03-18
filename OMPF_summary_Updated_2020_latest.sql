--OMPF summary
select distinct T.RMN, T.TrackingNo, ISNULL(sum(T.Batches), 0) Batches, 
ISNULL(sum(T.Batches), 0) - ISNULL(sum(T.Exported), 0) InProgress,
ISNULL(sum(T.Exported), 0) Exported, count(distinct T.uploadBatchName) Uploaded
FROM
(select distinct c.RMN, c.trackingno TrackingNo, count(distinct p.PBatch) Batches,
count(distinct s.kbatch) Exported,
CASE
	When d.ftpstime is not null then d.PBatch
	END uploadBatchName
from customerCheckIn c 
left join PhysicalBatch p
on c.RMN = p.RMN
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
group by c.RMN, c.trackingno, d.PBatch, d.ftpstime) T
group by T.RMN, T.TrackingNo
