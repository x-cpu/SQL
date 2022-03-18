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
WHERE ftpstime >= '09/01/2015 0:0:0.000'
AND ftpstime <= '09/30/2015 23:59:59.999'
and docidDoctype like 'VA 21-526%'
GROUP BY CONVERT(DATE, ftpstime, 101), rmn, dcsid, ImageID) T
left outer join document d
on T.ImageID = d.ImageID
group by T.[Upload Date], T.RMN, T.dcsID, T.[Doc Count], d.Form526Data
ORDER BY T.[Upload Date]



select distinct batchname, max(AckTime) 
from FTPDetails 
where AckTime >= '2015-11-01 0:0:0' and AckTime <= '2015-11-30 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null



---526 CMP Char Count by portal date
select distinct convert(date, f.acktime, 101) UploadDate, d.RMN, d.dcsID, d.ImageID,
sum((len(d.Form526Data) - (len(d.Form526Data) - LEN(replace(d.form526data, ' ', '')))) - (len(d.Form526Data) - LEN(replace(d.form526data, ';', '')))) "526CharCount"
from FTPDetails f
left join document d
on f.batchname = d.PBatch
where f.AckTime >= '2016-02-01 0:0:0' and f.AckTime <= '2016-02-16 23:59:59.999' 
and  substring(f.batchname,1,2) in ('03','04','05')
and f.AckTime is not null
and f.comments is null
group by convert(date, f.acktime, 101), d.RMN, d.dcsID, d.ImageID