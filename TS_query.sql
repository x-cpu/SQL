use TurboscanNG1 

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
As "Batch Location", 
batchlocation 
--into xyz1 
FROM Batches 
inner join 
--images on batches.batchid = images.batchid
dva.dbo.manifestDCS on substring(batches.BatchName, 1,12) = manifestDCS.pbatch 
--dbo.document on batches.BatchName = document.pbatch
WHERE BatchLocation >= 2 AND BatchLocation <= 256
order by [received date]


select * from batches
where BatchName like '%lunnie%'
--order by batchstatus

select * from batches
where BatchLocation = '128'
order by batchstatus

select * from xyz1
select count(*) as BatchCNT, sum([total images]) as ImgCNT, [batch location]  from xyz1  group by [batch location]

select rmn, [Batch Location]  from xyz group by rmn, [Batch Location] 




use dva

select * from manifestdcs where pbatch  not  in (select substring(kbatch,1,12) from stats_ibml )
and insertdate > '10/25/2012 00:0:1'
order by insertdate 


select * from physicalbatch  order by invtime


--SUMMARY by recvdate
SELECT  Sum(totalimages) as ImageCNT, convert(varchar, manifestDCS.insertdate, 101) as "Received Date",  
CASE BatchLocation
When 1 then 'capture'
WHEN 2 THEN 'Enhance'
WHEN 4 THEN 'Separation'
WHEN 8 THEN 'Auto Index' 
WHEN 64 THEN 'Verification'
WHEN 128 THEN 'QA'
WHEN 256 THEN 'Export'
END
As "Batch Location", 
batchlocation 
FROM Batches 
inner join 
dva.dbo.manifestDCS on substring(batches.BatchName, 1,12) = manifestDCS.pbatch 
WHERE BatchLocation >= 2 AND BatchLocation <= 256
group by [batchlocation], convert(varchar, manifestDCS.insertdate, 101)
order by [Batch Location]

--SUMMARY 
SELECT  Sum(totalimages) as ImageCNT,  
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
group by [batchlocation]
order by [Batch Location]



---5 days threshold turboscan wip
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
As "Batch Location", 
batchlocation 
--into xyz1 
FROM Batches 
inner join 
--images on batches.batchid = images.batchid
dva.dbo.manifestDCS on substring(batches.BatchName, 1,12) = manifestDCS.pbatch 
--dbo.document on batches.BatchName = document.pbatch
WHERE BatchLocation >= 2 AND BatchLocation <= 256
--and batchlocation <> 64
and manifestdcs.insertdate < '12/20/2012 0:0:1'
order by [received date], batchlocation


select * from batches where batchname ='02123550008901'
select * from batchresults where batchid ='6920'


SELECT b.UserName as "User Name", COUNT(a.BatchID) as Batches 
, SUM(a.AppImagesProcessed) as "Images Processed"
, ROUND((CONVERT(FLOAT, SUM(a.AppProcTime))/60)/60, 2) as "Process Time" 
, ROUND(CONVERT(FLOAT, SUM(a.AppProcTime))/SUM(a.AppImagesProcessed), 2) AS "Process Time Per Image"
, (ROUND(CONVERT(FLOAT, ((MAX(a.AppTimeStamp)-MIN(a.AppTimeStamp)) 
-SUM(a.AppProcTime))), 2) 
/COUNT(a.BatchID)/60) AS "AVG Time Between Batches"
FROM turboscanng1.dbo.BatchResults a 
RIGHT JOIN turboscanng1.dbo.Users b
ON a.UserID = b.UserID
WHERE(a.AppID = 128 )
AND dateadd(hh, -4,dateadd(ss,a.AppTimeStamp,'01/01/1970')) BETWEEN '11/01/2012' AND '11/28/2012' 
GROUP BY b.UserName ORDER BY SUM(a.AppImagesProcessed) DESC



EXEC [dbo].[VA_UploadTAT_Report]



