SELECT distinct BatchName as "Batch Name", manifestDCS.RMN, totalimages as "Total Images", convert(varchar, manifestDCS.insertdate, 100) as "Received Date", 
--count(document.docidDoctype) as "Total Documents",
--count(images.imageid) as "Total Documents",
CASE BatchLocation
When 1 then 'capture'
WHEN 2 THEN 'Enhance'
WHEN 4 THEN 'Separation'
WHEN 8 THEN 'Auto Index' 
WHEN 64 THEN 'Verification'
WHEN 128 THEN 'QA'
WHEN 256 THEN 'Export'
END
As "Batch Location"
--into xyz 
FROM Batches 
inner join 
--images on batches.batchid = images.batchid
dva.dbo.manifestDCS on substring(batches.BatchName, 1,12) = manifestDCS.pbatch 
--dbo.document on batches.BatchName = document.pbatch
WHERE BatchLocation >= 2 AND BatchLocation <= 256
order by [Batch Location]




select * from xyz

select rmn, [Batch Location]  from xyz group by rmn, [Batch Location] 
