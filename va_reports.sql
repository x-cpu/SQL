SELECT     COUNT(DISTINCT document.dcsID) AS Total_DcsID_Uploaded, 
max(convert(varchar, document.ftpstime, 101)) as Upload_Date, 
convert(varchar, manifestDCS.insertdate, 101) as CheckIN_Date
--DATEDIFF(day, max(convert(varchar, document.ftpstime, 101)), manifestDCS.insertdate) as Total_Days
FROM Document
join manifestDCS
on document.dcsID = manifestDCS.dcsID
WHERE     (ftpstime > '2012-10-29 00:00:00')
group by convert(varchar, manifestDCS.insertdate, 101)



checkindate, no of batches,   no of batches export,   no of batches ftped,    no of batches success




--by parent batch level 
select convert (nvarchar,manifestdcs.insertdate,101 ) as CheckINDate, count(distinct manifestDCS.pbatch) as CheckINBatchCNT, count(distinct substring(Document.PBatch,1,12)) as ExportBatches
from manifestdcs 
left join document 
on substring(document.PBatch,1,12) = manifestdcs.pbatch 
group by convert(nvarchar,manifestDCS.insertdate,101)

--by summary DCS level 
select convert (nvarchar,manifestdcs.insertdate,101 ) as CheckINDate, count(distinct manifestDCS.dcsid ) as DCSIdCNT, count(distinct document.DCSid) as FTPBatches
from manifestdcs 
left join document 
on substring(document.PBatch,1,12) = manifestdcs.pbatch 
group by convert(nvarchar,manifestDCS.insertdate,101)

--ftp summary report 
select convert(nvarchar,document.ftpstime,101) as Date, count(distinct pbatch ) as TotalBatches, count(distinct dcsid) As DCSCnt, count(*) as DocCount, Sum(Numpages) as TotalImages from document where ftpstime is not null and comments = 'success' 
group by convert(nvarchar,document.ftpstime,101)


--by batch level 
select convert (nvarchar,physicalbatch.invtime,101 ) as CheckINDate, count(distinct physicalbatch.PBatch) as CheckINBatchCNT, count(manifestdcs.pbatch) as #DcsID, count(distinct document.pbatch) as ExportBatches,
count(*)  as Export_Docs, sum(NumPages) as Export_Images, comments as Pub_ACK
from physicalbatch 
left join document 
on document.pbatch = physicalbatch.pbatch 
left join manifestDCS
on substring(PhysicalBatch.PBatch,1,12) = manifestdcs.pbatch 
group by convert(nvarchar,physicalbatch.invtime ,101), comments
order by CheckINDate
--end to end original 

      SELECT CONVERT(NVARCHAR,p.invtime,101) AS CheckINDate, 
      COUNT(DISTINCT p.PBatch) AS CheckINBatchCNT, 
      COUNT(DISTINCT m.dcsID) AS #DcsID, 
      COUNT(DISTINCT t.BatchName) AS TSWIPBatches, 
      SUM(t.TotalImages) AS TSWIPImages,
      COUNT(DISTINCT d.pbatch) AS ExportBatches,
      COUNT(DISTINCT d.ImageID) AS Export_Docs, 
      SUM(d.NumPages) AS Export_Images, 
      d.Comments AS Pub_ACK
      FROM PhysicalBatch p
      LEFT JOIN TurboscanNG1.dbo.Batches t
      ON t.BatchName = p.pbatch 
      LEFT JOIN document d
      ON d.pbatch = p.pbatch 
      LEFT JOIN manifestDCS m
      ON SUBSTRING(p.PBatch,1,12) = m.pbatch 
      GROUP BY CONVERT(NVARCHAR,p.invtime ,101), d.Comments
      ORDER BY CheckINDate


--end to end 

      SELECT CONVERT(NVARCHAR,p.invtime,101) AS CheckINDate, 
      COUNT(DISTINCT p.PBatch) AS CheckINBatchCNT, 
      COUNT(DISTINCT t.BatchName) AS TSWIPBatches, 
      SUM(t.TotalImages) AS TSWIPImages,
      COUNT(DISTINCT d.pbatch) AS ExportBatches,
	   count(distinct d.rmn) As RMN,
      COUNT(distinct d.dcsID) AS #DcsID, 
      COUNT(DISTINCT d.ImageID) AS Export_Docs, 
      SUM( d.NumPages) AS Export_Images
	  , count(d.comments) as ack
--	  ,     d.Comments AS ACK
      FROM PhysicalBatch p
      LEFT JOIN TurboscanNG1.dbo.Batches t
      ON t.BatchName = p.pbatch 
      LEFT JOIN document d
      ON d.pbatch = p.pbatch 
      --LEFT JOIN manifestDCS m
      --ON SUBSTRING(p.PBatch,1,12) = m.pbatch 
	  where p.invtime >'10/26/2012 0:0:1'
      GROUP BY CONVERT(NVARCHAR,p.invtime ,101),
	  d.Comments
      ORDER BY CheckINDate

--report by batch / ftp
select convert(nvarchar,imagedatetime,101),pbatch, count(*) as Docs, sum(numpages) as Pages from document 
where pbatch like '02%'
group by convert(nvarchar,imagedatetime,101),pbatch 
order by convert(nvarchar,imagedatetime,101),pbatch




select count(*) as docs, sum(numpages) as pages,count(distinct pbatch ) as batches, count(distinct imageid) from document where pbatch in 
select * from document where pbatch  in 
(select pbatch  from physicalbatch  where invtime > '10/26/2012 0:0:1' and invtime <'10/26/2012 23:59:59')
 order by comments

select * from document 
select * from physicalbatch order by syskey 
3,37,144

select distinct pbatch from document where pbatch in 
(select pbatch  from PhysicalBatch where invtime > '10/26/2012 0:0:1' and invtime < '10/26/2012 23:59:59')


select distinct dcsid from document where dcsid not in (select distinct dcsid from manifestdcs)

select count(dcsid) 
from manifestDCS
where insertdate > '2012-10-25 00:00:01' and insertdate < '2012-10-25 23:59:59'




select * from CustomerDATA where pbatch = '02122980000101'
--delete from CustomerDATA where pbatch = '02122980000101'

select * from stats where kbatch = '02122980000101'
---delete from stats where kbatch = '02122980000101'

select * from document

select * from document where dcsid like 'H8BX1LR4XHKLPJ%'

select distinct pbatch  from document where len(dcsid ) > 14
---delete from document where pbatch = '02122980000101'


select dcsid  from manifestdcs group by dcsid having count(*)> 1




select * 
from document 
order by ftpstime desc


select * from physicalbatch where invtime > '10/29/2012'

select distinct  substring(pbatch,1,12)  from document where substring(pbatch,1,12) in 
(select distinct pbatch  from manifestdcs where insertdate > '10/26/2012 0:0:1' and insertdate < '10/26/2012 23:59:59')

--open batch 

--total docs and ftped
select count(*) as Docs, sum(numpages) as Pages
from document where ftpstime is not null 
and comments = 'success'




--total not ftped 
select count(*) as Docs, sum(numpages) as Pages
from document where ftpstime is null 


select * 
from document
where pbatch = '02123320002101'
order by filesize desc


select count(*), sum(filesize), sum(uploadprocesstime), count(distinct RMN) from document where ftpstime > '10/31/2012 20:00:00'  and ftpstime < '10/31/2012 20:59:59'


select count(*), sum(filesize), sum(uploadprocesstime), count(distinct RMN)  from document where ftpstime > '12/11/2012 20:00:00'  and ftpstime < '12/11/2012 20:59:59'


select count(*) as TotDocs, sum(filesize) as FileSize, sum(numpages) as NumPages, sum(uploadprocesstime), count(distinct RMN) as TotRMN  from document where ftpstime > '12/13/2012 00:00:00'  and ftpstime < '12/13/2012 23:59:59'


group by convert (nvarchar, ftpstime,101)


select * from physicalbatch where rmn in 
(select rmn  from customerCheckIn
where claimtype = 'p')


select 



select * from document 

select DISTINCT convert(varchar, manifestdcs.insertdate,101),  DCSID, RMN, pbatch  from manifestdcs where pbatch not in  
(select substring (pbatch ,1,12) from document )
AND INSERTDATE < '10/25/2012 0:0:1'



select * from document where ftpstime is not null 

select * from document where dcsID = 'H79AGLKPKOYMFM' or dcsid = 'H7DFIORHVP16DA'

-- batches checked in but not in export
select distinct pbatch  from manifestdcs where pbatch not in 
(select distinct substring(pbatch,1,12) from document)


select count(*) as Docs, sum(numpages) as Pages
from document where ftpstime is not null 
and comments = 'success'
and dcsID = 'H85XBGY0KQ4JXS'


select imagedatetime,* from document where ftpstime is null order by imagedatetime 
--batches exported today
select distinct pbatch  from document where imagedatetime > '12/1/2012 0:0:1'


select * from document where pbatch = '02123050002601'

--end to end summary
    -- Insert statements for procedure here
    SELECT COUNT(DISTINCT p.RMN) AS "RMNCI",
    COUNT(DISTINCT p.pbatch) as "BatchesCI",     
    COUNT(DISTINCT d.PBatch) as "BatchesExp", 
    SUM(d.NumPages) AS "ImagesExp", 
    SUM(CASE WHEN t.BatchLocation = 1 THEN 1 ELSE 0 END) AS "Capture",
    SUM(CASE WHEN t.BatchLocation = 2 THEN 1 ELSE 0 END) AS "Enhance",
    SUM(CASE WHEN t.BatchLocation = 4 THEN 1 ELSE 0 END) AS "Separate",
    SUM(CASE WHEN t.BatchLocation = 128 AND t.WFStatus = 0 THEN 1 ELSE 0 END) AS "ImageQC",
    SUM(CASE WHEN t.BatchLocation = 8 THEN 1 ELSE 0 END) AS "AutoIndex",
    SUM(CASE WHEN t.BatchLocation = 128 AND t.WFStatus = 256 THEN 1 ELSE 0 END) AS "DocID",
    SUM(CASE WHEN t.BatchLocation = 64 THEN 1 ELSE 0 END) AS "Verify",
    SUM(CASE WHEN t.BatchLocation = 32 THEN 1 ELSE 0 END) AS "ManualIndex",
    SUM(CASE WHEN t.BatchLocation = 256 THEN 1 ELSE 0 END) AS "Export"
    FROM PhysicalBatch p
    LEFT JOIN TurboscanNG1.dbo.Batches t
    ON t.BatchName = p.PBatch
    LEFT JOIN Document d
    ON d.PBatch = p.PBatch
	WHERE p.InvTime IS NOT NULL
	AND ((CONVERT(varchar(10), p.InvTime, 101) >= '09/01/2012') 
	AND (CONVERT(varchar(10), p.InvTime, 101) <= '12/31/2012'))

END

----'11/1 thru 11/30
select dcsid, count(*) as doccnt, sum(numpages) as imgs from document where imagedatetime >'11/1/2012 0:0:0' group by dcsid


select convert(varchar(10),ftpstime, from document 


select convert(varchar(10),imagedatetime,101), prepid, count(*) as docscnt from document 
where prepid <>''
group by convert(varchar(10),imagedatetime,101), prepid 
order by convert(varchar(10),imagedatetime,101)



select count(*)  from document
select count(*) from document where prepid =''
select count(*) from document where prepid <>''


select * from qa_log order by syskey desc


select distinct prepid
from Document
order by PrepID desc


select *
from document
where ImageDateTime between '2012-12-13 0:0:0' and '2012-12-13 23:59:59'
and ftpstime is null


--query for carlos that shows scan count by date
select convert(varchar, releasedate, 101) as CaptureDate,sum(images)  as Images from stats_ibml 
where releasedate > '1/1/2013 0:0:1'
group by convert(varchar, releasedate, 101)


--remove quality
select * from locsemp

select * from TSErrorTracking where errordatetime between '2013-01-14 0:0:0' and '2013-01-15 23:59:59' and username in (
select distinct emp from locsemp)