 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem1' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_OCR1].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch

 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem2' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_OCR2].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch

 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem3' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_OCR3].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch


 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem4' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_OCR4].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch