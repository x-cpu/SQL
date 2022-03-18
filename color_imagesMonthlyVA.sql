select sum(numpages) as #ofImages, docidDoctype as DocType from document where docidDoctype in (
'Photographs',
'Certificate of Release or Discharge From Active Duty (e.g. DD 214, NOAA 56-16, PHS 1867)',
'DD 214 Certified Original - Certificate of Release or Discharge From Active Duty',
'DD 215 Corrected DD Form 214 Certificate of Release or Discharge From Active Duty',
'DPRIS - DD 214 Certified Original - Certificate of Release or Discharge From Active Duty',
'DPRIS - DD 215 Corrected DD 214 Certificate of Release or Discharge From Active Duty')
and ftpstime > '08/1/2015 0:0:1' and ftpstime < '08/31/2015 23:59:59'
group by docidDoctype


select sum(numpages), docidDoctype from document where docidDoctype in (
'Photographs',
'Certificate of Release or Discharge From Active Duty (e.g. DD 214, NOAA 56-16, PHS 1867)',
'DD 214 Certified Original - Certificate of Release or Discharge From Active Duty',
'DD 215 Corrected DD Form 214 Certificate of Release or Discharge From Active Duty',
'DPRIS - DD 214 Certified Original - Certificate of Release or Discharge From Active Duty',
'DPRIS - DD 215 Corrected DD 214 Certificate of Release or Discharge From Active Duty')
and ftpstime > '7/1/2013 0:0:1' and ftpstime < '6/30/2013 23:59:59'
group by docidDoctype


SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, SUM(CharCount) AS "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '08/01/2013'
AND ftpstime <= '08/31/2013'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)




select * from TurboscanNG1.dbo.batches where batchname = '02150150300501'
select * from document where pbatch = '02150150300501'

