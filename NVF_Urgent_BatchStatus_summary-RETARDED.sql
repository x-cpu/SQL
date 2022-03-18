select distinct Z.RMN, count(distinct Z.BatchName) Batches, 
sum(CASE
	When ((Z.BatchStatus <> 'Not Available' and Z.BatchStatus not like 'Exported/%') or Z.BatchStatus = 'Exported') Then 1
	Else 0
	END) as DataCapture,
sum(CASE
	When (Z.BatchStatus like 'Exported/Uploaded%') Then 1
	Else 0
	END) as FTP,
sum(CASE
	When Z.BatchStatus = 'Exported/Uploaded/ACKd' Then 1
	Else 0
	END) as ACKd
FROM
(select distinct X.BatchName, X.RMN,
CASE 
	When X.DownloadedBatchName is null Then 'Not Available'
	When (select count(*) from smsDCSMapping where batchname = X.BatchName and acktime is not null) > 0 Then 'Exported/Uploaded/ACKd'
	When (X.ExportedBatchName is not null and X.UploadedBatchName is not null) Then 'Exported/Uploaded'
	When X.ExportedBatchName is not null Then 'Exported'
	When (X.TurboscanBatchName is not null and X.ExportedBatchName is null) Then 'Turboscan : ' + X.TurboscanBatchLocation + ' Status : ' + X.BatchStatus
	END BatchStatus
FROM
(select distinct n.BatchName, n.RMN, p.PBatch DownloadedBatchName, b.BatchName TurboscanBatchName, d.batchname UploadedBatchName, b.WFStep, 
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
							   WHEN b.WFStep = 10 and batchlocation = 64 then 'Verification'
							   WHEN b.WFStep = 11 and batchlocation <> 0 then 'Export' 
                        END
                        AS 'TurboscanBatchLocation',
case
		WHEN BatchStatus = 1 then 'Ready'
		WHEN BatchStatus = 2 then 'In Process'
		WHEN BatchStatus = 4 then 'Suspended'
		WHEN BatchStatus = 8 then 'Auto-Fail'
		END
		AS 'BatchStatus',
s.kbatch ExportedBatchName
from NVFurgents n
left join PhysicalBatch p
on n.batchname = p.pbatch
left join TURBOSCANNG1.dbo.batches b
on n.batchname = b.BatchName
left join stats s
on n.BatchName = s.kbatch
left join dmhsFTPDetails d
on n.BatchName = d.batchname) X) Z
group by  Z.RMN