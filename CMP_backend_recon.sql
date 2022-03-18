


use dva
SELECT d.DCSID
, d.PBatch
, MAX(d.ImageDateTime) AS ExportDate 
, ISNULL(CONVERT(NVARCHAR(10), f.ETime, 101), 'X') AS UploadToCACI
, ISNULL(CONVERT(NVARCHAR(10), dcs.XMLReturnFromCACI, 101), 'X') AS XMLReturnFromCACI
, ISNULL(CONVERT(NVARCHAR(10), d2.FTPtoVBMS, 101), 'X') AS FTPtoVBMS
FROM Document d 
LEFT JOIN FTPDetails f
ON f.BatchName = d.PBatch AND f.AckTime IS NOT NULL
LEFT JOIN (SELECT DISTINCT DCSID, MAX(InsertDate) AS XMLReturnFromCACI 
                  FROM CMPRecon 
                  GROUP BY DCSID) dcs
ON dcs.DCSID = d.DCSID
LEFT JOIN (SELECT DISTINCT d1.DCSID, MAX(d1.ftpstime) AS FTPtoVBMS 
                  FROM Document d1
                  WHERE d1.dcsID NOT IN (SELECT DISTINCT dcsID 
                                                      FROM Document 
                                                      WHERE dcsID = d1.dcsID AND ftpstime IS NULL)
                  GROUP BY d1.DCSID) d2
ON d2.DCSID = d.DCSID
WHERE SUBSTRING(d.PBatch, 1, 2) IN ('03','04','05') 
GROUP BY d.DCSID, d.PBatch, f.ETime, dcs.XMLReturnFromCACI, d2.FTPtoVBMS
ORDER BY MAX(d.ImageDateTime)

