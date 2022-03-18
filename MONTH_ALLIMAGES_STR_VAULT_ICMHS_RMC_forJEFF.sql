select distinct X.Month, SUM(X.AllImages) [All Images], SUM(X.STR) STR, SUM(X.VAULT) VAULT, SUM(X.ICMHS) ICMHS, SUM(X.RMC) RMC
FROM
(select MONTH(ftpstime) Month, 
sum(T.numpages) AllImages,
CASE 
	When t.PBatch like '02%' Then SUM(NumPages)
	END 'ICMHS',
CASE	
	When T.PBatch like '01%' and rmn not like '101%' then SUM(NumPages)
	END 'RMC',
CASE
	When docidDoctype like 'STR%' then SUM(numpages)
	END STR,
CASE 
	When pbatch like '01%' and rmn like '101%' then SUM(numpages)
	END VAULT	
FROM
(select *	
from document 
where ftpstime >= '2020-01-01' and ftpstime < '2020-08-28'
and (pbatch like '02%' or pbatch like '01%'))T
group by T.ftpstime, T.docidDoctype, T.RMN, T.PBatch)X
group by X.Month
order by X.Month