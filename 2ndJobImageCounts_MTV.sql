--ICMHS and RMC 2nd Job
select sum(T.Images) Images
FROM
(select SUM(TotalImages) 'Images'
from TurboscanNG_OCR1.dbo.Batches where batchlocation <> 0
and (batchname like '02%' or batchname like '01%')
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR2.dbo.Batches where batchlocation <> 0
and (batchname like '02%' or batchname like '01%')
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR3.dbo.Batches where batchlocation <> 0
and (batchname like '02%' or batchname like '01%')
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR4.dbo.Batches where batchlocation <> 0
and (batchname like '02%' or batchname like '01%')
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR5.dbo.Batches where batchlocation <> 0
and (batchname like '02%' or batchname like '01%')) T


--RMC 2nd Job
select sum(T.Images) Images
FROM
(select SUM(TotalImages) 'Images'
from TurboscanNG_OCR1.dbo.Batches where batchlocation <> 0
and batchname like '01%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR2.dbo.Batches where batchlocation <> 0
and batchname like '01%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR3.dbo.Batches where batchlocation <> 0
and batchname like '01%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR4.dbo.Batches where batchlocation <> 0
and batchname like '01%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR5.dbo.Batches where batchlocation <> 0
and batchname like '01%') T



--ICMHS 2nd Job
select sum(T.Images) Images
FROM
(select SUM(TotalImages) 'Images'
from TurboscanNG_OCR1.dbo.Batches where batchlocation <> 0
and batchname like '02%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR2.dbo.Batches where batchlocation <> 0
and batchname like '02%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR3.dbo.Batches where batchlocation <> 0
and batchname like '02%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR4.dbo.Batches where batchlocation <> 0
and batchname like '02%'
UNION
select SUM(TotalImages) 'Images'
from TURBOSCANNG_OCR5.dbo.Batches where batchlocation <> 0
and batchname like '02%') T
