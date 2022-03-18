SELECT  manifestDCS.RMN, manifestDCS.dcsID, 
convert(varchar, manifestDCS.insertdate, 100) as "Received Date", 
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
FROM Batches 
inner join 
dva.dbo.manifestDCS on substring(batches.BatchName, 1,12) = manifestDCS.pbatch 
WHERE BatchLocation >= 2 AND BatchLocation <= 256
order by [Batch Location]


