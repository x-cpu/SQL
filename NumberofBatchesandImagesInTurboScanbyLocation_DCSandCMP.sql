---DCS STATUS  ----new v6 -modified3 for x-cpu 
use TurboscanNG1
select "Batch Location", 
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM (
select
distinct WFStep,
case 
       WHEN WFStep = 1 then 'Capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
END
AS "Batch Location",
BatchID, TotalImages
FROM Batches
WHERE 
WFStep >= 0 
AND WFStep <= 12
AND BatchStatus < 16
and jobid = 8
Group by WFStep, BatchLocation, BatchID, TotalImages) T
where "Batch Location" <> 'NULL'
Group by WFStep, "Batch Location"
Order by WFStep, "Batch Location"


---CMP STATUS  ----new v6 -modified3 for x-cpu 
use TurboscanNG1
select "Batch Location", 
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM (
select
distinct WFStep,
case 
       WHEN WFStep = 1 then 'Capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
END
AS "Batch Location",
BatchID, TotalImages
FROM Batches
WHERE 
WFStep >= 0 
AND WFStep <= 12
AND BatchStatus < 16
and jobid = 11
Group by WFStep, BatchLocation, BatchID, TotalImages) T
where "Batch Location" <> 'NULL'
Group by WFStep, "Batch Location"
Order by WFStep, "Batch Location"


select * from TurboscanNG1.dbo.batches where wfstep = 11 and jobid = '8' and batchlocation <> 0 
select * from TurboscanNG1.dbo.batches where wfstep = 11 and jobid = '8' and batchlocation = 0 order by WFStatus
select * from TurboscanNG1.dbo.batches where batchname = '03143190606501'




---# of Batches in each DCS and CMP queue
use TurboscanNG1
                        select BatchLocation, 
                        count(distinct (DCS + convert(varchar, BatchID))) as DCS#OfBatches,
                        count(distinct (CMP + convert(varchar, BatchID))) as CMP#OfBatches
                        FROM (
                        select
                        distinct WFStep,
                        case 
                               WHEN WFStep = 1 then 'Capture'
                               WHEN WFStep = 2 then 'Enhance'
                               WHEN WFStep = 3 then 'Separation'
                               WHEN WFStep = 4 then 'ImageQC'
                               WHEN WFStep = 5 then 'AutoIndex'
                               WHEN WFStep = 6 then 'DocID'
                               WHEN WFStep = 7 then 'DocIDQC'
                               WHEN WFStep = 8 then 'Manual Index'
                               WHEN WFStep = 9 then 'Manual IndexQC'
                               WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
                               WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
                        END
                        AS BatchLocation,
                        case
		                        WHEN JobID = 8 then 'DCS'
                        END
                        AS DCS,
                        case
		                        WHEN JobID = 11 then 'CMP'
                        END
                        AS CMP,
                        BatchID, TotalImages
                        FROM Batches
                        WHERE 
                        WFStep >= 0 
                        AND WFStep <= 12
                        AND BatchStatus < 16
                        and (jobid = 11 or jobid = 8)
                        Group by WFStep, BatchLocation, BatchID, TotalImages, JobID) T
                        where BatchLocation <> 'NULL'
                        Group by WFStep, BatchLocation
                        Order by WFStep, BatchLocation






---from code testing
use TurboscanNG1
                        select BatchLocation, 
                        count(BatchID) as TotalBatches,
                        SUM(TotalImages) as TotalImages
                        FROM (
                        select
                        distinct WFStep,
                        case 
                               WHEN WFStep = 1 then 'Capture'
                               WHEN WFStep = 2 then 'Enhance'
                               WHEN WFStep = 3 and batchlocation = 4 then 'Separation'
                               WHEN WFStep = 4 then 'ImageQC'
                               WHEN WFStep = 5 then 'AutoIndex'
                               WHEN WFStep = 6 then 'DocID'
                               WHEN WFStep = 7 then 'DocIDQC'
                               WHEN WFStep = 8 then 'Manual Index'
                               WHEN WFStep = 9 then 'Manual IndexQC'
                               WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
                               WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
                        END
                        AS BatchLocation,
                        BatchID, TotalImages
                        FROM Batches
                        WHERE 
                        WFStep >= 0 
                        AND WFStep <= 12
                        AND BatchStatus < 16
                        and jobid = 11
                        Group by WFStep, BatchLocation, BatchID, TotalImages) T
                        where BatchLocation <> 'NULL'
                        Group by BatchLocation
                        Order by BatchLocation

						
---from code testing
use TurboscanNG1
                        select BatchLocation, 
                        count(BatchID) as TotalBatches,
                        SUM(TotalImages) as TotalImages
                        FROM (
                        select
                        distinct WFStep,
                        case 
                               WHEN WFStep = 1 then 'Capture'
                               WHEN WFStep = 2 then 'Enhance'
                               WHEN WFStep = 3 and batchlocation = 4 then 'Separation'
                               WHEN WFStep = 4 then 'ImageQC'
                               WHEN WFStep = 5 then 'AutoIndex'
                               WHEN WFStep = 6 and batchlocation = 128 then 'DocID'
                               WHEN WFStep = 7 then 'DocIDQC'
                               WHEN WFStep = 8 then 'Manual Index'
                               WHEN WFStep = 9 then 'Manual IndexQC'
                               WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
                               WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
                        END
                        AS BatchLocation,
                        BatchID, TotalImages
                        FROM Batches
                        WHERE 
                        WFStep >= 0 
                        AND WFStep <= 12
                        AND BatchStatus < 16
                        and jobid = 11
                        Group by WFStep, BatchLocation, BatchID, TotalImages) T
                        where BatchLocation <> 'NULL'
                        Group by WFStep, BatchLocation
                        Order by WFStep, BatchLocation

						select * from Batches where WFStep = 6 and JobID = 11
						select * from Batches where WFStep = 3 and JobID = 8