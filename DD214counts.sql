select sum(numpages) as #ofImages, count(distinct imageid) Docs, docidDoctype as DocType from document where docidDoctype in (
--'Photographs',
'Certificate of Release or Discharge From Active Duty (e.g. DD 214, NOAA 56-16, PHS 1867)',
'DD 214 Certified Original - Certificate of Release or Discharge From Active Duty',
'DD 215 Corrected DD Form 214 Certificate of Release or Discharge From Active Duty',
'DPRIS - DD 214 Certified Original - Certificate of Release or Discharge From Active Duty',
'DPRIS - DD 215 Corrected DD 214 Certificate of Release or Discharge From Active Duty')
and ftpstime >= '05/1/2016 0:0:0' and ftpstime <= '05/31/2016 23:59:59.999'
group by docidDoctype