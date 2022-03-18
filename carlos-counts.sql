--query for carlos that shows scan count by date
select convert(varchar, releasedate, 101) as CaptureDate,sum(images)  as Images from stats_ibml 
where releasedate > '1/1/2013 0:0:1'
group by convert(varchar, releasedate, 101)



select sum(images)
from Stats_IBML
where releasedate between '2013-01-11 0:0:0' and '2013-01-11 23:59:59'

use DVA
select sum(images)
from Stats_IBML
where releasedate between '2013-01-31 0:0:0' and '2013-01-31 23:59:59'

select sum(images)
from Stats_IBML
where releasedate between '2013-02-02 0:0:0' and '2013-02-02 23:59:59'


select sum(images)
from Stats_IBML
where releasedate between '2013-02-08 0:0:0' and '2013-02-08 23:59:59'


select sum(numpages) from document where ImageDateTime > '1/25/2013 0:0:0' and ftpstime is null
select sum(numpages) from Document where ImageDateTime >'1/25/2013 0:0:0' and ImageDateTime < '2/5/2013 0:0:0' and ftpstime is null 



---query to connect to stats_ibml and export to see image count

--drop table xyz1
--drop table xyz2

USE DVA
select s.kbatch as BatchName, max(s.images) as CaptureImages, sum(d.numpages) as ExportImages, count(d.syskey) as docs into xyz2 from stats_ibml as s, document as d where d.pbatch = s.kbatch  
and s.releasedate  > '1/1/2012 0:0:0' group by s.kbatch order by s.kbatch 



select * from xyz2

select count(*) as docs, sum(numpages) as images from document where pbatch in 
(select distinct pbatch from xyz1)

select * from stats_ibml where kbatch ='02123050002301'
select sum(numpages) from document where pbatch='02123050002301'

use dva


use turboscanng1
SELECT * FROM XYZ2
select * from batches where batchname in 
(select distinct batchname from xyz2)

SELECT distinct B.BatchName ,X.CAPTUREIMAGES, br.appimagesprocessed AS ImagesINDocID, X.DOCS AS EXPORTDOCS, X.EXPORTIMAGES,
CASE B.BatchLocation
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
FROM Batches AS B , XYZ2 AS X, BATCHRESULTS AS BR
WHERE B.BATCHNAME = X.BATCHNAME
AND B.BATCHLOCATION = 0
AND BR.BATCHID = B.BATCHID
and br.appid = 128

BatchName	CAPTUREIMAGES	Imagesdocid	EXPORTIMAGES
02123140000802	1767	1490	1152

SELECT * FROM XYZ2 where batchname = '02123140000802'
SELECT * FROM batches where batchname = '02123140000802'

SELECT * FROM BATCHRESULTS WHERE BATCHID ='3429'

use dva
select * from xyz2

inner join 
--images on batches.batchid = images.batchid
dva.dbo.manifestDCS on substring(batches.BatchName, 1,12) = manifestDCS.pbatch 
--dbo.document on batches.BatchName = document.pbatch
WHERE BatchLocation >= 2 AND BatchLocation <= 256
--and batchlocation <> 64
and manifestdcs.insertdate < '12/20/2012 0:0:1'
order by [received date], batchlocation




select * from batches where batchname like '0213%'

select * from Stats_IBML order by releasedate desc


