select distinct Y.UserName, Y.TotalImages, Y.TotalBatches, Y.NotWorkbatches,
ROUND(AVG(Y.Efficiency), 2) BatchSelectProcessPercent
FROM
(select distinct X.UserName, X.TotalImages, X.TotalBatches, X.NotWorkbatches,
Efficiency = 100 - (100 * cast(X.NotWorkbatches as float)/ cast(X.TotalBatches as float))
FROM
(select distinct T.UserName, ISNULL(sum(T.TotalImages), 0) TotalImages, ISNULL(sum(T.WorkedBatches), 0) + ISNULL(sum(T.NotWorkedBatches), 0) TotalBatches, 
ISNULL(sum(T.NotWorkedBatches), 0) NotWorkbatches
FROM
(select distinct username, ISNULL(sum(UserImagesProcessed), 0) TotalImages, BatchName,
CASE
	When ISNULL(sum(UserImagesProcessed), 0) > 0 then 1
	Else 0
	End WorkedBatches,
CASE
	When ISNULL(sum(UserImagesProcessed), 0) < 1 then 1
	Else 0
	End NotWorkedBatches
from ts_audit where TimeStamp >= '2018-02-04' and timestamp <= '2018-02-17 23:59:59.999'
and TSModule = 'docid' 
and batchname like '02%'
--and UserName in ('ljordan', 'ajones2', 'bbrown')
group by username, BatchName) T
group by T.UserName) X) Y
group by Y.UserName, Y.TotalImages, Y.TotalBatches, Y.NotWorkbatches
order by Y.TotalImages desc


select distinct batchname 
from ts_audit where  TimeStamp >= '2018-02-04' and timestamp <= '2018-02-17 23:59:59.999'and TSModule = 'docid' 
and batchname like '02%'
and UserName in ('ljordan', 'ajones2', 'bbrown')
group by batchname
having ISNULL(sum(UserImagesProcessed), 0) < 1