---DCS Export Queue STATUS  
use TurboscanNG1
select "Batch Location", 
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM (
select
distinct WFStep,
case 
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
END
AS "Batch Location",
BatchID, TotalImages
FROM Batches
WHERE 
WFStep >= 0 
AND WFStep <= 12
AND BatchStatus < 16
and jobid = 8 and batchdesc <> 'Batch has already been exported!'
Group by WFStep, BatchLocation, BatchID, TotalImages) T
where "Batch Location" <> 'NULL'
Group by WFStep, "Batch Location"
Order by WFStep, "Batch Location"


---CMP Export Queue STATUS  
use TurboscanNG1
select "Batch Location", 
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM (
select
distinct WFStep,
case 
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
END
AS "Batch Location",
BatchID, TotalImages
FROM Batches
WHERE 
WFStep >= 0 
AND WFStep <= 12
AND BatchStatus < 16
and jobid = 11 and batchdesc <> 'Batch has already been exported!'
Group by WFStep, BatchLocation, BatchID, TotalImages) T
where "Batch Location" <> 'NULL'
Group by WFStep, "Batch Location"
Order by WFStep, "Batch Location"


---CMP PMR Export Queue STATUS  
use TurboscanNG1
select "Batch Location", 
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM (
select
distinct WFStep,
case 
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
END
AS "Batch Location",
BatchID, TotalImages
FROM Batches
WHERE 
WFStep >= 0 
AND WFStep <= 12
AND BatchStatus < 16
and jobid = 11 and batchdesc <> 'Batch has already been exported!'
and exists (select * from dva.dbo.PhysicalBatch where pbatch like '03%' and BatchClassName = 'PMR' and batchname = dva.dbo.PhysicalBatch.pbatch)
Group by WFStep, BatchLocation, BatchID, TotalImages) T
where "Batch Location" <> 'NULL'
Group by WFStep, "Batch Location"
Order by WFStep, "Batch Location"

--select * from dva.dbo.PhysicalBatch where pbatch like '03%' and BatchClassName = 'PMR'


select * from TurboscanNG1.dbo.batches 
where WFStep = 11 and batchlocation <> 0 
and batchdesc <> 'Batch has already been exported!'
and (jobid = 11 or jobid = 8)