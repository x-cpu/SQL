use TURBOSCANNG1
select distinct CONVERT(varchar, DATEADD(hh, DATEDIFF(hour, GETUTCDATE(), GetDate()), DATEADD(ss, b.TimeStamp, '01/01/1970')), 101) Received,
'CustomerName' = 'VA',
CASE
	When b.BatchName like '04%' Then 'CMP'
	When b.BatchName like '02%' Then 'DD214/VALO'
	When b.BatchName like '09%' Then 'NVF'
	END JobName,
'ProcessType' = 'OpenBox',
b.BatchName, 
'Status' = 'WIP',
b.TotalImages ImageCount, 
'DocCount' = 0, 
'SiteName' = 'FP',
'CompleteDate' = '',
'Vertical' = 'Public Sector',
'Region' = 'NA',
'Country' = 'US',
'BillType' = 'NA',
'Sub-Process' = 'Scan'
from batches b
where (b.BatchName like '04%' or b.BatchName like '02%' or b.BatchName like '09%')
and b.BatchName not like '%test%'
order by Received, b.BatchName
