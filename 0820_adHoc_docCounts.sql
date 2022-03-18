select DATEPART(yyyy, ftpstime) Year, docidDoctype DocType, 
count(imageid) Docs 
from document where docidDoctype like 'VA 21-0820%' and 
ftpstime > '2015-01-01 0:0:0'
group by DATEPART(yyyy, ftpstime), docidDoctype
order by DATEPART(yyyy, ftpstime), docidDoctype

select DATEPART(yyyy, ftpstime) Year, count(imageid) from document where ftpstime > '2015-01-01 0:0:0'
group by DATEPART(yyyy, ftpstime)




select DATEPART(yyyy, ftpstime) Year, docidDoctype, 
CASE
	when docidDoctype = 'VA 21-0820 Report of General Information' then 'VA 21-0820 Report of General Information'
	when docidDoctype = 'VA 21-0820a Report of First Notice of Death' then 'VA 21-0820a Report of First Notice of Death'
	when docidDoctype = 'VA 21-0820b Report of Nursing Home or Assisted Living Information' then 'VA 21-0820b Report of Nursing Home or Assisted Living Information'
	when docidDoctype = 'VA 21-0820c Report of Defense Finance & Accounting Service (DFAS)' then 'VA 21-0820c Report of Defense Finance & Accounting Service (DFAS)'
	when docidDoctype = 'VA 21-0820d Report of Non-Receipt of Payment' then 'VA 21-0820d Report of Non-Receipt of Payment'
	when docidDoctype = 'VA 21-0820e Report of Incarceration' then 'VA 21-0820e Report of Incarceration'
	when docidDoctype = 'VA 21-0820f Report of Month of Death' then 'VA 21-0820 Report of General Information'
	Else 'other'
END
as DocType,
count(imageid) Docs 
from document where docidDoctype like 'VA 21-0820%'
and ftpstime > '2015-01-01 0:0:0'
group by DATEPART(yyyy, ftpstime), docidDoctype
order by DATEPART(yyyy, ftpstime)