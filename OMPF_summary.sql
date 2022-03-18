select distinct Y.RMN, Y.TrackingNo, ISNULL(sum(Y.Batches), 0) Batches,
ISNULL(sum(Y.InProcess), 0) InProcess,
ISNULL(sum(Y.Exported), 0) Exported
FROM
(select distinct X.RMN, X.TrackingNo, count(distinct X.pbatch) Batches,
CASE
	When X.BatchName is not null and X.kbatch is null  then count(distinct X.batchname)
	When X.PBatch is not null and X.kbatch is null then count(distinct X.PBatch)
	END InProcess,
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
group by X.RMN, X.TrackingNo, X.BatchName, X.kbatch, X.PBatch, X.uploadBatchName) Y
group by Y.RMN, Y.TrackingNo
order by Y.RMN