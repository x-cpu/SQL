select distinct Y.RMN, Y.TrackingNo, sum(Y.Batches) Batches,
sum(Y.InProcess) InProcess, sum(Y.Exported) Exported, ISNULL(sum(Y.Uploaded), 0) Uploaded
FROM
(select distinct X.RMN, X.TrackingNo, count(distinct X.PBatch) Batches,
count(distinct X.PBatch) - count(distinct X.kbatch) InProcess,
count(distinct X.kbatch) Exported,
CASE
	When X.uploadBatchName is not null then count(distinct X.uploadBatchName)
	END Uploaded
FROM
(select distinct c.RMN, c.trackingno TrackingNo, p.PBatch,
s.kbatch, b.batchname, 
CASE
	When d.ftpstime is not null then d.PBatch
	END uploadBatchName
from PhysicalBatch p
left join customerCheckIn c
on p.RMN = c.RMN
left join stats s
on p.PBatch = s.kbatch
left join [mtv-va-sql-4\p1].turboscanng1.dbo.batches b
on p.pbatch = b.batchname
left join document d
on p.PBatch = d.PBatch
where c.claimtype = 'ompf'
and p.PBatch like '02%'
and c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
group by c.RMN, c.trackingno, p.pbatch, s.kbatch, b.BatchName, d.PBatch, d.ftpstime) X
group by X.RMN, X.TrackingNo, X.BatchName, X.uploadBatchName) Y
group by Y.RMN, Y.TrackingNo