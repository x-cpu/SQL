--- FINAL 2015
select T.[Upload Date], ISNULL(sum(T.[526 Character Count]), 0) DCS526CharCount
FROM
(SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, imageid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '02/17/2016 0:0:0.000'
AND ftpstime <= '02/29/2016 23:59:59.999'
and docidDoctype like 'VA 21-526%'
and pbatch like '02%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, ImageID) T
left outer join document d
on T.ImageID = d.ImageID
group by T.[Upload Date]
ORDER BY T.[Upload Date]




--- FINAL 2015
select T.[Upload Date], ISNULL(sum(T.[526 Character Count]), 0) TotalCharCount, d.Form526Data
FROM
(SELECT CONVERT(DATE, ftpstime, 101) AS "Upload Date",
rmn, dcsid, imageid, sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', '')))) "526 Character Count", COUNT(DISTINCT ImageID) AS "Doc Count"
FROM Document
WHERE ftpstime >= '02/17/2016 0:0:0.000'
AND ftpstime <= '02/29/2016 23:59:59.999'
and docidDoctype like 'VA 21-526%'
and pbatch like '02%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, ImageID) T
left outer join document d
on T.ImageID = d.ImageID
group by T.[Upload Date], d.Form526Data
ORDER BY T.[Upload Date]