select distinct CONVERT(varchar, max(ftpstime),101) UploadDate, 
'CustomerName' = 'VA',
CASE
	When pbatch like '01%' then 'RMC'
	When pbatch like '02%' then 'ICMHS'
	When pbatch like '07%' then 'BWN'
	END JobName,
'ProcessType' = 'OpenBox',
pbatch BatchName,
'Status' = 'Exported',
sum(numpages) ImageCount,
count(distinct imageid) DocCount,
'SiteName' = 'MTV',
CONVERT(varchar, max(ftpstime),101) CompleteDate,
'Vertical' = 'Public Sector',
'Region' = 'NA',
'Country' = 'US',
'BillType' = 'NA',
'Sub-Process' = 'Upload'
from document
where exists (select * from stats where pbatch = kbatch)
and ftpstime >= '2020-01-01'
and ftpstime is not null
and (pbatch like '01%' or pbatch like '02%' or pbatch like '07%')
group by PBatch