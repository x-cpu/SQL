select sum(images)
from Stats_IBML
where releasedate between '2013-01-03 0:0:0' and '2013-01-03 23:59:59'


select sum(images)
from Stats_IBML
where releasedate between '2013-01-04 0:0:0' and '2013-01-04 23:59:59'


select sum(images)
from Stats_IBML
where releasedate between '2013-01-05 0:0:0' and '2013-01-05 23:59:59'


select sum(images)
from Stats_IBML
where releasedate between '2013-01-06 0:0:0' and '2013-01-06 23:59:59'


select sum(images)
from Stats_IBML
where releasedate between '2013-01-09 0:0:0' and '2013-01-09 23:59:59'




select sum(images)
from Stats_IBML
where releasedate between '2013-01-08 0:0:0' and '2013-01-08 23:59:59'


select *
from physicalbatch


select *
from Document
where PBatch = '02123030002901'



select distinct 
from document
where ftpstime is not null and comments = 'success'



select * from manifestdcs 
where pbatch in 
(select distinct substring(pbatch


select distinct substring(pbatch 1,12) into xyz_pending from document where ftpstime is null 

select *
from document

select count (distinct rmn) as rmn, count(*) as docs, sum(numpages) as images from document where substring(pbatch,1,12) in 
(select distinct pbatch from manifestdcs where insertdate > '10/29/2012 0:0:1' and insertdate <'11/9/2012 23:59:59')

select count (distinct rmn) as rmn, count(*) as docs, sum(numpages) as images from document where pbatch in 
(select distinct pbatch from physicalbatch where invtime > '10/29/2012 0:0:1' and invtime  <'11/9/2012 23:59:59')


select * from physicalbatch order by syskey 


select * from document where imagedatetime > '1/9/2013' order by syskey 

select * 
from TSErrorTracking
where batchname = '02123060000103'


select *
from document
where dcsid = 'HA44U96OOHXZQ9'

select *
from document
where filenumber = '251195576'