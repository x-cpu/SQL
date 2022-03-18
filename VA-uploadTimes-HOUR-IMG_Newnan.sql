--hourly ftp img volume , size
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images, (sum(filesize)/(1024*1024)) as FTPSizeMB from Document where ftpstime > '6/24/2013 0:0:1' 
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 


--hourly ftp img volume  
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images from Document where ftpstime > '02/21/2014 0:0:0'
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 


select * from manifestdcs where rmn = '316vb0718138776d'

select * from Boxmapping where dcsid = 'HJBJ08RPZ2ET3L'

select * from Document where dcsid = 'HLS3C1V1O0GVRA'
select * from Document where PBatch = '02132070203201'

select * from Stats_IBML where batchname = '02885707'

select * from Boxmapping where dcsid = 'HK5UGOV278HD2H'

"select count(distinct d.ImageID) as doccount, count(d.ftpstime) as docsftp from document  d join Stats_IBML si on d.PBatch = si.kbatch where si.batchname = '" + xdir + "'"


"select count(distinct ImageID) as doccount, count(ftpstime) as docsftp from document where pbatch = '" + xdir + "'"

select COUNT(distinct batchname), count(distinct (batchname + convert(varchar, docid))) 
from qa_log 
where tsmodule = 'Manual Index' and batchname = '02131690001303'
and timestamp > '2013-06-21 0:0:0' and TimeStamp < '2013-06-21 23:59:59'

select *
from qa_log 
where tsmodule = 'Manual Index'  and batchname = '02131690001303'
and timestamp > '2013-06-21 0:0:0' and TimeStamp < '2013-06-21 23:59:59'

select count (distinct batchname) as "Total Reviewed Batches", count(*) as "Total Reviewed Documents", max(TotalDocs) as "Total Documents"
from QA_Log where tsmodule = 'Manual Index' and timestamp between '2013-08-18' and '2013-08-24'

select count (distinct batchname) as "Total Reviewed Batches", count(distinct (batchname + convert(varchar, docid))) as "Total Reviewed Documents", sum(max(totaldocs)) as "Total Documents"
from QA_Log where tsmodule = 'Manual Index' and timestamp between '2013-08-18' and '2013-08-24' group by BatchName

select count (distinct batchname) as "Total Reviewed Batches", count(distinct (batchname + convert(varchar, docid))) as "Total Reviewed Documents", sum(distinctmax(TotalDocs)) as "Total Documents"
from QA_Log where tsmodule = 'Manual Index' and timestamp between '2013-08-18' and '2013-08-24'

select COUNT(distinct batchname), sum(distinct max(TotalDocs)) 
from qa_log 
where tsmodule = 'Manual Index' and batchname = '02131690001303'
and timestamp > '2013-06-21 0:0:0' and TimeStamp < '2013-06-21 23:59:59'


select distinct batchname, count (distinct batchname) as "Total Reviewed Batches", count(distinct (batchname + convert(varchar, docid))) as "Total Reviewed Documents", max(TotalDocs) as "Total Documents"
from QA_Log 
where tsmodule = 'Manual Index' and timestamp between '2013-08-18' and '2013-08-24' group by BatchName

select max(totalimages) from TS_Audit where BatchName = '02131350203703' and TSModule = 'docid'

select count(id) from TSErrorTracking where batchname = '02131350203703' and tsmodule = 'manual index'


select distinct q.batchname, count (distinct q.batchname) as "Total Reviewed Batches", count(distinct (q.batchname + convert(varchar, q.docid))) as "Total Reviewed Documents", max(q.TotalDocs) as "Total Documents",
max(t.totalimages) as "Total Images", count(te.id) as "Total Errors"
from QA_Log q
join TS_Audit t
on q.BatchName = t.BatchName
join TSErrorTracking te
on q.BatchName = te.batchname 
where q.tsmodule = 'Manual Index' and q.timestamp between '2013-08-18' and '2013-08-24' 
and t.TSModule = 'docid'
and q.TSModule = 'manual index'  and te.errordatetime between '2013-08-18' and '2013-08-24' 
group by q.BatchName




----query for total batches
select distinct batchname from qa_log where timestamp > '8/18/2013 0:0:0' and timestamp < '8/24/2013 23:59:59'
and tsmodule = 'manual index'

-----query for total batches

select * from qa_log
select * from ts_audit
select batchname ,max(totalimages) as images from ts_audit where batchname in 
(select distinct batchname from qa_log where timestamp > '8/18/2013 0:0:0' and timestamp < '8/24/2013 23:59:59'
and tsmodule = 'manual index'
)
and tsmodule = 'docid'
group by batchname

select * from TSErrorTracking where errordatetime > '8/18/2013 0:0:0' and errordatetime  <'8/24/2013 23:59:59'
and tsmodule = 'manual index'


select * from TSErrorTracking where batchname = '02131350203703' and TSModule = 'Manual Index'

