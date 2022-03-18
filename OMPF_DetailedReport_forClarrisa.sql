select distinct T.RMN, T.TrackingNo, T.BatchName, 
T.OpenBoxBatchLocation, 
CASE
	When T.BatchStatus = 'Exported' Then 'Exported [' + CAST((T.TotalDocs - T.TotalUploaded) as varchar(50)) + 
	' of ' + CAST((T.TotalDocs) as varchar(100)) + ' doc(s) pending upload]'
	When T.BatchStatus = 'Pending OpenBox Import' and i.BatchName is null Then 'Pending IBML Scan'
	Else T.BatchStatus
	END BatchStatus,
T.TotalImages
FROM
(select distinct c.RMN, c.trackingno TrackingNo, p.PBatch BatchName,
--, d.dcsID
case 
	WHEN b.WFStep = 1 Then 'Capture'
	WHEN b.WFStep = 2 Then 'Enhance1'
	WHEN b.WFStep = 3 Then 'FOCR'
	WHEN b.WFStep = 4 Then 'Enhance2'
	WHEN b.WFStep = 5 Then 'Separation'
	WHEN b.WFStep = 6 Then 'ImageQC'
	WHEN b.WFStep = 7 Then 'AutoIndex'
	WHEN b.WFStep = 8 Then 'DocID'
	WHEN b.WFStep = 9 Then 'DocIDQC'
	WHEN b.WFStep = 10 Then 'Manual Index'
	WHEN b.WFStep = 11 Then 'Manual IndexQC'
	WHEN b.WFStep = 12 and batchlocation = 64 then 'Verification'
	WHEN b.WFStep = 13 and batchlocation <> 0 then 'Export' 
END
AS 'OpenBoxBatchLocation',
case
	WHEN s.kbatch is not null then 'Exported'
	WHEN BatchStatus = 1 Then 'Ready'
	WHEN BatchStatus = 2 Then 'In Process'
	WHEN BatchStatus = 4 Then 'Suspended'
	WHEN BatchStatus = 8 Then 'Auto-Fail'
	WHEN s.kbatch is null and b.BatchName is null then 'Pending OpenBox Import'
END
AS 'BatchStatus', b.TotalImages, count (distinct d.imageID) TotalDocs, count (distinct d.ftpstime) TotalUploaded
from customerCheckIn c 
left join PhysicalBatch p
on c.RMN = p.RMN
left join stats s
on p.PBatch = s.kbatch
left join [mtv-va-sql-4\p1].turboscanng1.dbo.batches b
on p.pbatch = b.batchname
left join document d
on p.PBatch = d.PBatch
where c.claimtype = 'ompf'
and p.PBatch like '02%'
and p.InvTime >= '2020-06-01'
and c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
and d.ftpstime is null
group by c.RMN, c.trackingno, p.PBatch, b.WFStep, b.BatchLocation, b.BatchStatus, s.kbatch, b.batchname, b.TotalImages) T
left join [mtv-va-sql-2\p923].IBMLTEST_Data.dbo.batchtable i
on T.BatchName = i.BatchName
order by T.RMN, T.TrackingNo, T.BatchName



