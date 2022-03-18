--user DOCID production
use DVA
select distinct T.UserName, sum(T.DCS_TotalImages) TotalDCSImages, sum(T.CMP_TotalImages) TotalCMPImages, sum(T.DCS_TotalImages + T.CMP_TotalImages) TotalImages, sum(T.TotalBatches)
FROM
(select distinct username,
CASE 
	when substring(BatchName, 0, 3) = '02' then ISNULL(sum(UserImagesProcessed),0) 
END
As DCS_TotalImages,
CASE 
	when substring(BatchName, 0, 3) <> '02' then ISNULL(sum(UserImagesProcessed),0)
END
As CMP_TotalImages,
count(distinct batchname) TotalBatches  
from ts_audit 
where TimeStamp >= '2015-07-13 0:0:0' 
and timestamp <= '2015-07-13 23:59:59.999' 
and TSModule = 'docid' 
group by username, BatchName)T
group by T.UserName




use DVA
select distinct username,
CASE 
	when substring(BatchName, 0, 3) = '02' then 'DCS'
END
As DCS,
CASE 
	when substring(BatchName, 0, 3) = '03' then 'CMP'
END
As CMP,
sum(UserImagesProcessed) DCS_TotalImages, 
count(distinct batchname) TotalBatches  
from ts_audit 
where TimeStamp >= '2015-07-13 0:0:0' 
and timestamp <= '2015-07-13 23:59:59.999' 
and TSModule = 'docid' 
--and batchname not like '02%'
group by username, BatchName



use DVA
select distinct T.UserName, sum(T.DCS_TotalImages) TotalDCSImages, sum(T.CMP_TotalImages) TotalCMPImages, sum(T.DCS_TotalImages + T.CMP_TotalImages) TotalImages, sum(T.TotalBatches)
FROM
(select distinct username,
CASE 
	when substring(BatchName, 0, 3) = '02' then ISNULL(sum(UserImagesProcessed),0) 
END
As DCS_TotalImages,
CASE 
	when substring(BatchName, 0, 3) <> '02' then ISNULL(sum(UserImagesProcessed),0)
END
As CMP_TotalImages,
count(distinct batchname) TotalBatches  
from ts_audit 
where TimeStamp >= '2015-07-13 0:0:0' 
and timestamp <= '2015-07-13 23:59:59.999' 
and TSModule = 'docid' 
group by username, BatchName)T
group by T.UserName







select * from Stats_IBML where kbatch in (
'02151910001803',
'02151910001804',
'02151140301103')
