                ---new v6
use TurboscanNG1
select
distinct WFStep, BatchLocation,
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep = 11 and batchlocation = 0 then 'Clean'
END
AS "Batch Location",
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM Batches
WHERE WFStep >= 0 AND WFStep <= 12
AND BatchStatus < 16
and jobid =8
Group by WFStep, Batchlocation
Order by WFStep, "Batch Location"




---new v6 CMP CMP CMP
use TurboscanNG1
select
distinct WFStep, BatchLocation,
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep =11 and batchlocation = 0 then 'Clean'
END
AS "Batch Location",
count(BatchID) as TotalBatches,
SUM(TotalImages) as TotalImages
FROM Batches
WHERE WFStep >= 0 AND WFStep <= 12
AND BatchStatus < 16
and jobid =11
Group by WFStep, Batchlocation
Order by WFStep, "Batch Location"




select * from Batches where batchname = '02141560009603'



select * from Batches where wfstep = '5' and BatchStatus = '2' and batchname not in (
'02141820409002',
'02141820005701',
'02141820007402',
'02132570411502',
'02141820205202',
'02141820406104',
'02141820002101',
'02141820403603',
'02141820405401',
'02141820002502',
'02141820207603',
'02141820407302',
'02141820206201',
'02141820007601',
'02141820007603',
'02141820406102',
'02141820405103') order by BatchName


select * from Batches where wfstep = '5' and BatchStatus = '2' and batchname not in (
'02141820204402',
'02141820205203',
'02141820205202',
'02132570411502',
'02132570408205',
'02141820204401',
'02141820406104',
'02141820402607',
'02132570209904',
'02141820407302',
'02141820405304',
'02141820205802',
'02141820405003',
'02141820005701',
'02132390001105',
'02132570209704',
'02132380002501',
'02141820404504',
'02141820405001',
'02141820005704',
'02141820406602') order by BatchName
