--VERSION WITH NULLS EVERYTHING AND FILECHARCOUNTS AND DOR ADDED ALSO ALSO HAS COMMENTS COLUMN FOR THE MANUAL
--VERSION WITH NULLS EVERYTHING AND FILECHARCOUNTS AND DOR ADDED ALSO ALSO HAS COMMENTS COLUMN FOR THE MANUAL
select v.downloadDate "Date Received", vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name", d.received_date DOR,
"Document Count" = '1', sum(d.numpages) "Image Count",
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts, 
d.ImageID "Upload Filename", d.ftpstime "Date Uploaded", 
CASE
	WHEN d.comments = 'Skipped' then 'CMSERR0027'
	ELSE substring(d.Comments, 9, 11) 
END AS "FTU Error Code",
CASE
	WHEN DATEDIFF(day, v.downloadDate, d.ftpstime) >= 7 Then 'Manual'
	WHEN d.MA18doctype = 'Manual' Then 'Manual'
	Else ''
END AS "Comments"	
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
where vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
--and v.DCSID = 'DCSLH141703700000020012'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.received_date, d.ftpstime, d.Comments, d.MA18doctype
order by v.downloadDate, d.ftpstime asc



--VERSION WITH NULLS REMOVED AND FILECHARCOUNTS AND DOR ADDED
--VERSION WITH NULLS REMOVED AND FILECHARCOUNTS AND DOR ADDED
select v.downloadDate "Date Received", vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name", d.received_date DOR,
"Document Count" = '1', sum(d.numpages) "Image Count",
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts, 
d.ImageID "Upload Filename", d.ftpstime "Date Uploaded", 
CASE
	WHEN d.comments = 'Skipped' then 'CMSERR0027'
	ELSE substring(d.Comments, 9, 11) 
END AS "FTU Error Code"
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
where 
(d.Comments is not null or ftpstime is not null)
and vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.received_date, d.ftpstime, d.Comments
order by v.downloadDate, d.ftpstime asc




--VERSION WITH NULLS EVERYTHING AND FILECHARCOUNTS AND DOR ADDED
--VERSION WITH NULLS EVERYTHING AND FILECHARCOUNTS AND DOR ADDED
select v.downloadDate "Date Received", vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name", d.received_date DOR,
"Document Count" = '1', sum(d.numpages) "Image Count",
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts, 
d.ImageID "Upload Filename", d.ftpstime "Date Uploaded", 
CASE
	WHEN d.comments = 'Skipped' then 'CMSERR0027'
	ELSE substring(d.Comments, 9, 11) 
END AS "FTU Error Code"
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
where vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.received_date, d.ftpstime, d.Comments
order by v.downloadDate, d.ftpstime asc




--VERSION INCLUDING NULLS
--EVERYTHING VERSION EVERYTHING VERSION
select v.downloadDate "Date Received", vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name",
"Document Count" = '1', sum(d.numpages) "Image Count", d.ImageID "Upload Filename", d.ftpstime "Date Uploaded", substring(d.Comments, 9, 11) "FTU Error Code"
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
where vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.ftpstime, d.Comments
order by v.downloadDate, d.ftpstime asc


--VERSION WITH NULLS REMOVED
--VERSION WITH NULLS REMOVED
select v.downloadDate "Date Received", vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name",
"Document Count" = '1', sum(d.numpages) "Image Count", d.ImageID "Upload Filename", d.ftpstime "Date Uploaded", 
CASE
	WHEN d.comments = 'Skipped' then 'CMSERR0027'
	ELSE substring(d.Comments, 9, 11) 
END AS "FTU Error Code"
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
where 
(d.Comments is not null or ftpstime is not null)
and vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.ftpstime, d.Comments
order by v.downloadDate, d.ftpstime asc




--ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial) + len(c.zipcode) + (c.numDocs * 3)), 0) FileCharCounts

select * from vvFTPDetails  where vendor in ('msla', 'lhi')

select * from vvFTPDetails  where downloadDate > '2016-11-21' and dcsid is not null

select * from vvFTPDetails  where downloadDate > '2016-11-21' and dcsid is not null


select * from CustomerDATA where keydatetime > '2016-11-21' and pbatch like '14%'

select * from document where pbatch = '14163260000001' and ftpstime is null


select * from document where pbatch = '14163260000001' and ftpstime is not null

select * from document where pbatch = '14163270000001' and ftpstime is null
--Detail: CMSERR0027 - Unable to locate Veteran for filenumber 452217893 Message: Validation error(s). GUID: 77bce044-6447-48aa-899b-ccfa8db6889e UID: 77bce044-6447-48aa-899b-ccfa8db6889e

select * from document where pbatch = '14163270000001' and ftpstime is not null


select * from document where pbatch = '15163270000001' and ftpstime is null
select * from document where pbatch in ('15163270000001', '14163270000001')  and ftpstime is not null


select * from document where pbatch = '15163270000001' and ftpstime is not null

--setup for sendAcknowledgeProcessing
select distinct uri from vvFTPDetails where exists (
select * from document where pbatch in ('14163340000002') and Comments is not null and vvFTPDetails.DCSID = dcsID)
and sendAcknowledgeProcessing is null

select distinct uri from vvFTPDetails where exists (
select * from document where pbatch in ('14163300000001') and Comments is not null and vvFTPDetails.DCSID = dcsID)
and sendAcknowledgeProcessing is null

--check for sendAcknowledgeProcessing
select sendAcknowledgeProcessing, * from vvFTPDetails where exists (
select * from document where pbatch in ('14163270000001', '15163270000001') and Comments is not null and vvFTPDetails.DCSID = dcsID)
and sendAcknowledgeProcessing is null

--15163330000002
--14163330000001

select * from vvFTPDetails where downloadDate > '2016-11-27' and vendor = 'msla' and DCSID is null
select * from vvFTPDetails where downloadDate > '2016-11-27' and vendor = 'msla' and name like '%.jpg'

select * from vvFTPDetails where downloadDate >= '2016-12-02' and vendor = 'msla' and DCSID is not null
select * from vvFTPDetails where downloadDate > '2016-11-27' and vendor = 'msla' and DCSID is not null

select * from document where pbatch like '14%' or pbatch like '15%' and comments is not null and ftpstime is not null


select * from document where (pbatch like '14%' or pbatch like '15%')  and ftpstime is null and comments = 'Skipped'
select * from document where (pbatch like '14%' or pbatch like '15%') and ImageDateTime >= '2016-11-30'


select * from vvFTPDetails where downloadDate >= '2016-12-12' and vendor = 'lhi' and DCSID is not null
select * from document where (pbatch like '14%' or pbatch like '15%') and ImageDateTime >= '2016-12-07'

select * from vvFTPDetails where downloadDate >= '2016-12-08' and vendor = 'msla' and DCSID is not null
select * from document where (pbatch like '15%') and ImageDateTime >= '2016-11-01'
--

select * from vvFTPDetails where vendor in ('lhi', 'msla') and dcsid is null


select * from vvFTPDetails where name in (
'1621681317.pdf',
'1621681365.pdf',
'1621681403.pdf',
'1621681463.pdf',
'1621681615.pdf',
'1621681654.pdf')
