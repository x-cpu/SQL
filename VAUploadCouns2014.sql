SELECT ProcessDate
, SUM(CASE WHEN TSModule = 'ImageQC' THEN TotalImages ELSE 0 END) AS ImageQC
, SUM(CASE WHEN TSModule = 'DocID' THEN TotalImages ELSE 0 END) AS DocID
, SUM(CASE WHEN TSModule = 'Manual Index' THEN TotalImages ELSE 0 END) AS ManualIndex
, SUM(CASE WHEN TSModule = 'Verification' THEN TotalImages ELSE 0 END) AS Verification
FROM
(SELECT DISTINCT CONVERT(DATE, a.[TimeStamp], 101) as ProcessDate
, a.BatchName
, a.TSModule
, sum(a.userimagesprocessed) AS TotalImages
FROM TS_Audit a
WHERE [TimeStamp] >= '4/1/2014 0:0:0'
AND [TimeStamp] <= '4/30/2014 23:59:59'
---and a.batchname in (select distinct p.pbatch from physicalbatch as p, customercheckin as c where p.rmn=c.rmn and c.claimtype<>'C') 
GROUP BY CONVERT(DATE, [TimeStamp], 101)
, a.BatchName
, a.TSModule) AS TAB
GROUP BY ProcessDate
ORDER BY ProcessDate

select sum(UserImagesProcessed) from ts_audit where TimeStamp >= '2014-03-18 0:0:0' and timestamp <= '2014-03-18 15:0:0' and TSModule = 'docid'


SELECT ProcessDate
, SUM(CASE WHEN TSModule = 'ImageQC' THEN TotalImages ELSE 0 END) AS ImageQC
, SUM(CASE WHEN TSModule = 'DocID' THEN TotalImages ELSE 0 END) AS DocID
, SUM(CASE WHEN TSModule = 'Manual Index' THEN TotalImages ELSE 0 END) AS ManualIndex
, SUM(CASE WHEN TSModule = 'Verification' THEN TotalImages ELSE 0 END) AS Verification
FROM
(SELECT DISTINCT CONVERT(DATE, a.[TimeStamp], 101) as ProcessDate
, a.BatchName
, a.TSModule
, sum(a.userimagesprocessed) AS TotalImages
FROM TS_Audit a
WHERE [TimeStamp] >= '3/26/2014 0:0:0'
AND [TimeStamp] <= '3/26/2014 13:58:59'
---and a.batchname in (select distinct p.pbatch from physicalbatch as p, customercheckin as c where p.rmn=c.rmn and c.claimtype<>'C') 
GROUP BY CONVERT(DATE, [TimeStamp], 101)
, a.BatchName
, a.TSModule) AS TAB
GROUP BY ProcessDate
ORDER BY ProcessDate