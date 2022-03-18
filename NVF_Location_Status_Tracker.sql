select distinct x.Batchname, x.RMN,
case 
		WHEN b.WFStep = 1 then 'Capture'
		WHEN b.WFStep = 2 then 'Enhance'
		WHEN b.WFStep = 3 then 'Separation'
		WHEN b.WFStep = 4 then 'ImageQC'
		WHEN b.WFStep = 5 then 'AutoIndex'
		WHEN b.WFStep = 6 then 'DocID'
		WHEN b.WFStep = 7 then 'DocIDQC'
		WHEN b.WFStep = 8 then 'Manual Index'
		WHEN b.WFStep = 9 then 'Manual IndexQC'
		WHEN b.WFStep = 10 and b.batchlocation = 64 then 'Verification'
		WHEN b.WFStep = 11 and b.batchlocation <> 0 then 'Export' 
END
AS 'TurboscanBatchLocation', 
case
		WHEN b.BatchStatus = 1 then 'Ready'
		WHEN b.BatchStatus = 2 then 'In Process'
		WHEN b.BatchStatus = 4 then 'Suspended'
		WHEN b.BatchStatus = 8 then 'Auto-Fail'
		When (select count(distinct dcsid) from smsDCSMapping where x.BatchName = smsDCSMapping.batchname and acktime is not null) =
		(select count(distinct dcsid) from document where x.Batchname = document.pbatch) 
		and (select count(distinct dcsid) from smsDCSMapping where x.BatchName = smsDCSMapping.batchname and acktime is not null) >= 1 Then 'Exported/Uploaded'
		When (select count(*) from stats where x.batchname = stats.kbatch) >=1 then 'Exported'
		When (select count(*) from PhysicalBatch where x.batchname = PhysicalBatch.PBatch) <1 then 'Pending Import into TS'
		END
		AS 'BatchStatus'
from xnvf_20200513 x
left join TURBOSCANNG1.dbo.batches b
on x.Batchname = b.batchname


select * from smsDCSMapping where batchname in (
'09200271603901',
'09200271603902',
'09200271603903',
'09200271603904',
'09200271603905',
'09200271603906',
'09200271603907',
'09200271603908',
'09200271603909',
'09200271603910')