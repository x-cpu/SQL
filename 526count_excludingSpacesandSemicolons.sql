--good test sample MAIN
SELECT  datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526Char
FROM Document
WHERE ftpstime >= '05/01/2014 0:0:0.000' AND ftpstime <= '09/30/2014 23:59:59.999'
group by datepart(year, ftpstime), datepart(month, ftpstime)
order by year, month


--good test sample MAIN
SELECT  datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526CharWithoutSpaces,
SUM(CharCount) Total526Char
FROM Document
WHERE ftpstime >= '05/01/2014 0:0:0.000' AND ftpstime <= '09/30/2014 23:59:59.999'
group by datepart(year, ftpstime), datepart(month, ftpstime)
order by year, month


--CMP
SELECT  datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526CharWithoutSpaces,
SUM(CharCount) Total526Char
FROM Document
WHERE ftpstime >= '05/01/2014 0:0:0.000' AND ftpstime <= '09/30/2014 23:59:59.999'
and pbatch not like '02%'
group by datepart(year, ftpstime), datepart(month, ftpstime)
order by year, month

--nonCMP
SELECT  datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526CharWithoutSpaces,
SUM(CharCount) Total526Char
FROM Document
WHERE ftpstime >= '05/01/2014 0:0:0.000' AND ftpstime <= '09/30/2014 23:59:59.999'
and pbatch  like '02%'
group by datepart(year, ftpstime), datepart(month, ftpstime)
order by year, month


select 


SELECT (len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))) AS "526 Character Count MAY2014"
FROM Document
WHERE ftpstime >= '05/01/2014 0:0:0.000'
AND ftpstime <= '05/31/2014 23:59:59.999'

SELECT  SUM(CharCount) - SUM(LEN(replace(form526data, ' ', ''))) - SUM(LEN(replace(form526data, ';', ''))) AS "526 Character Count JUNE2014"
FROM Document
WHERE ftpstime >= '06/01/2014 0:0:0.000'
AND ftpstime <= '06/30/2014 23:59:59.999'

SELECT  SUM(CharCount) - SUM(LEN(replace(form526data, ' ', ''))) - SUM(LEN(replace(form526data, ';', '')))  AS "526 Character Count JULY2014"
FROM DocumentSkor
WHERE ftpstime >= '07/01/2014 0:0:0.000'
AND ftpstime <= '07/31/2014 23:59:59.999'

SELECT  SUM(CharCount) - SUM(LEN(replace(form526data, ' ', ''))) - SUM(LEN(replace(form526data, ';', ''))) AS "526 Character Count AUGUST2014"
FROM Document
WHERE ftpstime >= '08/01/2014 0:0:0.000'
AND ftpstime <= '08/31/2014 23:59:59.999'


SELECT  SUM(CharCount) - SUM(LEN(replace(form526data, ' ', ''))) - SUM(LEN(replace(form526data, ';', ''))) AS "526 Character Count SEPTEMBER"
FROM Document
WHERE ftpstime >= '09/01/2014 0:0:0.000'
AND ftpstime <= '09/30/2014 23:59:59.999'


select * from document where Form526Data is not null and ftpstime > '2014-10-13 0:0:0' order by Form526Data desc


Knees-Tendonitis;Hearing-Tinnitus;Burn Pit;Vision loss


CACI_CMP_142492901P001007276

--good test sample MAIN
SELECT  datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526Char
FROM Document
WHERE ImageID = 'CACI_CMP_142492901P001007276' or ImageID = 'CACI_CMP_142812902P001024279'
group by datepart(year, ftpstime), datepart(month, ftpstime)
order by year, month


--good test sample
SELECT  (len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))  Total526Char
FROM Document
WHERE ImageID = 'CACI_CMP_142492901P001007276' or ImageID = 'CACI_CMP_142812902P001024279'



select * from document where imageid = 'CACI_CMP_142812902P001024279'

 SUM(CharCount) - SUM(LEN(replace(form526data, ' ', ''))) - SUM(LEN(replace(form526data, ';', '')))


--semicolons
(len(Form526Data) - LEN(replace(form526data, ';', '')))

--spaces
(len(Form526Data) - LEN(replace(form526data, ' ', ''))) 

