select X.BatchName, X.RMN, X.TurboscanBatchLocation BatchLocation, X.BatchStatus,
CASE
	WHEN X.BatchStatus <> 'Exported' Then X.TotalImages
	ELSE NULL
	END OpenBox_Images
FROM
(select distinct p.PBatch BatchName, p.RMN, 
case 
		WHEN b.WFStep = 1 Then 'Capture'
		WHEN b.WFStep = 2 Then 'Enhance'
		WHEN b.WFStep = 3 Then 'Separation'
		WHEN b.WFStep = 4 Then 'ImageQC'
		WHEN b.WFStep = 5 Then 'AutoIndex'
		WHEN b.WFStep = 6 Then 'DocID'
		WHEN b.WFStep = 7 Then 'DocIDQC'
		WHEN b.WFStep = 8 Then 'Manual Index'
		WHEN b.WFStep = 9 Then 'Manual IndexQC'
		WHEN b.WFStep = 10 and batchlocation = 64 then 'Verification'
		WHEN b.WFStep = 11 and batchlocation <> 0 then 'Export' 
END
AS 'TurboscanBatchLocation',
case
		--WHEN ss.pBatch is not null then 'Exported/Uploaded/FTUd'
		--WHEN d.ftpstime is not null and not exists(select * from document where d.pbatch = pbatch
		--and ftpstime is null) Then 'Exported/Uploaded'
		WHEN s.kbatch is not null then 'Exported'
		WHEN BatchStatus = 1 Then 'Ready'
		WHEN BatchStatus = 2 Then 'In Process'
		WHEN BatchStatus = 4 Then 'Suspended'
		WHEN BatchStatus = 8 Then 'Auto-Fail'
		END
		AS 'BatchStatus', b.TotalImages
from PhysicalBatch p
left join TURBOSCANNG1.dbo.batches b
on p.PBatch = b.BatchName
left join stats s 
on p.PBatch = s.kbatch
left join DD214FTU ss
on p.PBatch = ss.pBatch
left join document d
on p.PBatch = d.PBatch
where p.PBatch like '02%' and p.InvTime >= '2020-01-29' and p.BatchClassName = 'VALO/VCIP'
group by p.PBatch, p.RMN, b.WFStep, b.BatchName, b.BatchLocation, s.kbatch, d.ftpstime, b.BatchStatus, b.TotalImages, d.PBatch, ss.pBatch) X
group by X.BatchName, X.RMN, X.TurboscanBatchLocation, X.BatchStatus, X.TotalImages
order by BatchName

--'VALO/VCIP'
--'DD214/VALO'

select * from DD214FTU