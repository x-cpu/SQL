--GDIT report
select 
convert(nvarchar, reportdate , 101) Received,
CustomerName = 'VA',
projecttype + '_' + counttype + '_' + clin JobName,
ProcessType = 'GDITPlatform',
BatchName = '',
Status = 'COMPLETED',
sum(total) ImageCount,
sum(total) DocCount,
SiteName = 'GDIT',
convert(nvarchar, reportdate , 101) CompletedDate,
Vertical = 'Public Sector',
Region = 'NA',
Country = 'US',
BillType = 'NA',
[Sub-Process] = 'Upload',
Boxes = '0',
Characters = '0'
from [ATHprojectSummary]
where reportdate>='1/1/2020 0:0:0' and reportdate < ='11/02/2020 23:59:59'
group by projecttype, counttype, convert(nvarchar, reportdate , 101) ,clin
order by projecttype, counttype, convert(nvarchar, reportdate , 101) ,clin




select distinct T.Received, 
CustomerName = 'VA',
T.JobName,
ProcessType = 'OpenBox',
T.BatchName,
Status = 'COMPLETED',
T.ImageCount, T.DocCount,
SiteName = 'MTV',
T.CompleteDate,
Vertical = 'Public Sector',
Region = 'NA',
Country = 'US',
BillType = 'NA',
[Sub-Process] = 'Upload',
T.Boxes, T.Characters
FROM
(select distinct CONVERT(varchar, p.InvTime, 101) Received, 
CASE
		WHEN d.PBatch like '01%' and d.RMN like '101%' then 'VAULT'
		WHEN d.PBatch like '01%' and d.RMN not like '101%' then 'RMC'
		WHEN d.pbatch like '02%' then 'ICMHS'
		WHEN d.pbatch like '07%' then 'BWN'
		WHEN d.pbatch like '08%' then 'REA'
	END JobName,
d.pbatch BatchName,
sum(numpages) ImageCount,
count(distinct imageid) DocCount,
CONVERT(varchar, ftpstime, 101) CompleteDate,
Boxes = 0,
Characters = 0
from document d
left join PhysicalBatch p
on d.pbatch = p.PBatch
where exists (select * from stats where d.pbatch = kbatch)
and ftpstime >= '2020-01-01'
and (d.pbatch like '01%' or d.pbatch like '02%' or d.pbatch like '07%' or d.pbatch like '08%')
group by d.PBatch, d.RMN, CONVERT(varchar, ftpstime, 101), CONVERT(varchar, p.InvTime, 101)) T
UNION
select distinct CONVERT(varchar, p.InvTime, 101) Received, 
CustomerName = 'VA',
CASE
		WHEN d.Pbatch like '01%' and d.RMN like '101%' then 'VAULT'
		WHEN d.PBatch like '01%' and d.RMN not like '101%' then 'RMC'
		WHEN d.PBatch like '02%' then 'ICMHS'
		WHEN d.PBatch like '07%' then 'BWN'
		WHEN d.pbatch like '08%' then 'REA'
	END JobName,
ProcessType = 'OpenBox',
d.RMN BatchName,
Status = 'COMPLETED',
ImageCount = 0,
DocCount = 0,
SiteName = 'MTV',
CONVERT(varchar, ftpstime,101) CompleteDate,
Vertical = 'Public Sector',
Region = 'NA',
Country = 'US',
BillType = 'NA',
[Sub-Process] = 'Upload',
Boxes = 1,
Characters = 0
from document d
left join PhysicalBatch p
on d.pbatch = p.PBatch
where exists (select * from stats where d.pbatch = kbatch)
and ftpstime >= '2020-01-01'
and ftpstime is not null
and CONVERT(varchar, p.InvTime, 101) is not null
and (d.pbatch like '01%' or d.pbatch like '02%' or d.pbatch like '07%' or d.pbatch like '08%')
group by d.PBatch, d.RMN,  CONVERT(varchar, ftpstime, 101), CONVERT(varchar, p.InvTime, 101)
order by JobName, BatchName



