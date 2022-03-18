--- FINAL 2015
select T.[Upload Date], T.RMN, T.dcsID, sum(T.[526 Character Count]) TotalCharCount, count(T.[Doc Count]) TotalDocs, d.Form526Data
FROM
(SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, imageid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '09/01/2015 0:0:0.000'
AND ftpstime <= '09/30/2015 23:59:59.999'
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, ImageID) T
left outer join document d
on T.ImageID = d.ImageID
group by T.[Upload Date], T.RMN, T.dcsID, T.[Doc Count], d.Form526Data
ORDER BY T.[Upload Date]



--- FINAL 2015
select T.[Upload Date], T.RMN, T.dcsID, sum(T.[526 Character Count]) TotalCharCount, count(T.[Doc Count]) TotalDocs, d.Form526Data
FROM
(SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, imageid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '03/01/2015 0:0:0.000'
AND ftpstime <= '03/15/2015 23:59:59.999'
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, ImageID) T
left outer join document d
on T.ImageID = d.ImageID
group by T.[Upload Date], T.RMN, T.dcsID, T.[Doc Count], d.Form526Data
ORDER BY T.[Upload Date]


--- FINAL 2015
select T.[Upload Date], T.RMN, T.dcsID, sum(T.[526 Character Count]) TotalCharCount, count(T.[Doc Count]) TotalDocs, d.Form526Data
FROM
(SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, imageid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '03/16/2015 0:0:0.000'
AND ftpstime <= '03/31/2015 23:59:59.999'
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, ImageID) T
left outer join document d
on T.ImageID = d.ImageID
group by T.[Upload Date], T.RMN, T.dcsID, T.[Doc Count], d.Form526Data
ORDER BY T.[Upload Date]




---new way excluding spaces --2015 latest that also excludes non 526 doc contention data
SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '03/01/2015 0:0:0.000'
AND ftpstime <= '03/31/2015 23:59:59.999'
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)


---raw monthly data
select T.[Upload Date], T.RMN, T.dcsID, T.[526 Character Count], d.Form526Data
FROM
(SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '03/01/2015 0:0:0.000'
AND ftpstime <= '03/31/2015 23:59:59.999'
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid) T
left join document d
on T.dcsID = d.dcsID
order by T.[Upload Date]




---raw monthly data  ---test query
SELECT  distinct DCSID, RMN, datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526Char,
Form526Data
FROM Document
WHERE ftpstime >= '03/01/2015 0:0:0.000' AND ftpstime <= '03/31/2015 23:59:59.999' and len(Form526Data) >= 1
and docidDoctype like 'VA 21-526%'
group by datepart(year, ftpstime), datepart(month, ftpstime), dcsid, RMN, Form526Data
order by year, month


---raw monthly data ---didn't work ---test query
select distinct t.dcsID, T.[Upload Date], T.RMN,  t.Total526Char, d.Form526Data
FROM
(SELECT  CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526Char,
Form526Data
FROM Document
WHERE ftpstime >= '03/01/2015 0:0:0.000' AND ftpstime <= '03/31/2015 23:59:59.999' and len(Form526Data) >= 1
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, Form526Data) T
--ORDER BY CONVERT(DATE, ftpstime, 101))T
left join document d
on t.Form526Data = d.Form526Data
--group by T.[Upload Date], T.RMN, t.dcsID, t.Total526Char, d.Form526Data
ORder by T.[Upload Date], T.RMN, t.dcsID, t.Total526Char, d.Form526Data








---new way excluding spaces
SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '10/01/2014 0:0:0.000'
AND ftpstime <= '10/03/2014 23:59:59.999'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)



---new way excluding spaces
SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '12/01/2014 0:0:0.000'
AND ftpstime <= '12/08/2014 23:59:59.999'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)






SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, SUM(CharCount) AS "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '10/01/2014 0:0:0.000'
AND ftpstime <= '10/30/2014 23:59:59.999'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)


SELECT 
SUM(CharCount) AS "526 Character Count"
FROM Document
WHERE ftpstime >= '07/01/2014 0:0:0.000'
AND ftpstime <= '07/31/2014 23:59:59.999'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)

sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526Char


---new way excluding spaces
SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '10/01/2014 0:0:0.000'
AND ftpstime <= '10/30/2014 23:59:59.999'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid
ORDER BY CONVERT(DATE, ftpstime, 101)

















select * from Stats_IBML where kbatch = '02141700008201'
select * from TS_Audit where batchname =  '02141700008201test'
2003
1944
1262
select * from TS_Audit where batchname =  '02141700008201'


select * from document where docidDoctype = 'VA 21-526 Veterans Application for Compensation or Pension' and Form526Data is not null and ftpstime > '2013-12-01 0:0:0'



select pbatch, ImageID, docidDoctype, RMN, dcsID from document where rmn = '314VB1104130025D' and dcsid = 'HNM74Q1C7PH3S8'
