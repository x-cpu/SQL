select distinct T.UploadDate, 
ISNULL(sum(T.[FCS Docs]), 0) 'FCS Docs',
ISNULL(sum(T.[FCS Images]), 0) 'FCS Images',
ISNULL(sum(T.[OMPF Docs]), 0) 'OMPF Docs',
ISNULL(sum(T.[OMPF Images]), 0) 'OMPF Images',
ISNULL(sum(T.[RMC Docs]), 0) 'RMC Docs',
ISNULL(sum(T.[RMC Images]), 0) 'RMC Images'
FROM
(select distinct CONVERT(nvarchar, ftpstime, 101) UploadDate, pbatch,
CASE
	WHEN pbatch like '02%' and not exists (select * from customerCheckIn
	where document.RMN = RMN and claimtype = 'OMPF') Then count(distinct ImageID)
	END 'FCS Docs',
CASE
	WHEN pbatch like '02%' and not exists (select * from customerCheckIn
	where document.RMN = RMN and claimtype = 'OMPF') Then sum(numpages)
	END 'FCS Images',
CASE
	WHEN pbatch like '02%' and exists (select * from customerCheckIn
	where document.RMN = RMN and claimtype = 'OMPF') Then count(distinct ImageID)
	END 'OMPF Docs',
CASE
	WHEN pbatch like '02%' and exists (select * from customerCheckIn
	where document.RMN = RMN and claimtype = 'OMPF') Then sum(numpages)
	END 'OMPF Images',
CASE
	WHEN pbatch like '01%' Then count(distinct ImageID)
	END 'RMC Docs',
CASE
	WHEN pbatch like '01%' Then sum(numpages)
	END 'RMC Images'
from document 
where ftpstime >= CAST(DATEADD(DAY,-DAY(GETDATE())+1, CAST(GETDATE() AS DATE)) AS DATETIME)
group by CONVERT(nvarchar, ftpstime, 101), pbatch, RMN) T
group by T.UploadDate
order by T.UploadDate

