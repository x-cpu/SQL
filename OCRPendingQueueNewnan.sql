 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem4' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_ATL-VA-0004].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch


 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem3' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_ATL-VA-0003].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch




 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem2' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_ATL-VA-0002].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch




 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem1' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_ATL-VA-0001].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch


SELECT BatchName FROM [TurboscanNG_ATL-VA-0001].dbo.batches 
group by batchname
having	count(batchname) > 1 


select distinct pbatch from document where ftpstime is null and OCRExportTime is null

select * from document where pbatch in (
'02130990000203',
'02131020203803',
'02131060005503')


select * from document where pbatch = '02130990000203'
select * from stats where kbatch = '02130990000203'
