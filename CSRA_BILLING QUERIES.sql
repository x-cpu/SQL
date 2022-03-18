--ALL BILLING QUERIES


select * from document where docidDoctype like '%4142%' and ImageDateTime > '2016-02-24'

--Total 4142s
--PMR/DOMA count query with imagecount added by date
select convert(nvarchar, dF.AckTime, 101) UploadDate, ISNULL(count(distinct p.imageid), 0) Docs, ISNULL(sum(d.NumPages), 0) Images 
from pmrImageIDMapping p
left join document d
on p.imageID = d.ImageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null) 
--and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
and d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
group by convert(nvarchar, dF.AckTime, 101)
order by convert(nvarchar, dF.AckTime, 101)


--toDOMA (.ERR)
select convert(nvarchar, dF.AckTime, 101) UploadDate, ISNULL(count(distinct p.imageid),0) Docs
--, sum(d.NumPages) Images 
from pmrImageIDMapping p
left join document d
on p.imageID = d.ImageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is null and comments is not null) 
--and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
and d.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
group by convert(nvarchar, dF.AckTime, 101)
order by convert(nvarchar, dF.AckTime, 101)


--fromDOMA
select * from pmrrecon




--PMR (.FTU)
select convert(nvarchar, dc.eTime, 101) UploadDate, count(distinct d.imageid) Docs, sum(d.NumPages) Images from pmrftu p 
left join document d
on p.DCSID = d.dcsID
left join dmhsCMPxmldownload dc
on p.newpBatch = dc.batchname
where dc.type = '.ack'
group by convert(nvarchar, dc.eTime, 101)
order by convert(nvarchar, dc.eTime, 101)



--PMR (toVBMS) Detailed 
select distinct d.imageid FileName, substring(p.XMLfilename, 0,18) PMR_BatchName, d.numpages Images, 
d.docidDoctype DocID, max(d.ftpstime) VBMSUploadDateTime, REPLACE(substring(d.Comments, 0, 19), 'Detail: ', '') VBMSResponse
from document d
left join pmrrecon p
on d.imageid = p.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-20 00:00:00'
group by d.ImageID, p.XMLfilename, d.numpages, d.docidDoctype, d.Comments


--PMR (toVBMS) by Date 
select convert(nvarchar, d.ftpstime, 101) UploadDate, count(distinct d.imageid) Docs, sum(d.numpages) Images
from document d
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-20 00:00:00'
and d.ftpstime is not null
group by convert(nvarchar, d.ftpstime, 101)
order by convert(nvarchar, d.ftpstime, 101)
 


 --DMHS Uploads by Date
select convert(nvarchar, s.ackTime, 101) UploadDate, count(distinct d.imageid) #ofDocuments, sum(d.numpages) #ofImages  from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.ackTime is not null
group by convert(nvarchar, s.ackTime, 101) 
order by convert(nvarchar, s.ackTime, 101) 
-----------------------------------MASTER BLASTER----------------------------------------------------------

---SMS counts by Date by Type
select distinct x.UploadDate, ISNULL(sum(x.FaxDocs), 0) FaxDocs, ISNULL(sum(x.FaxImages),0) FaxImages, ISNULL(sum(x.PaperDocs), 0) PaperDocs, ISNULL(sum(x.PaperImages), 0) PaperImages
FROM
(select convert(nvarchar, s.ackTime, 101) UploadDate,
CASE WHEN s.batchname like '04%' Then ISNULL(count(distinct d.imageid), 0) end FaxDocs,
CASE WHEN s.batchname like '04%' Then ISNULL(sum(d.numpages), 0) end FaxImages,
CASE WHEN s.batchname like '03%' Then ISNULL(count(distinct d.imageid), 0) end PaperDocs,
CASE WHEN s.batchname like '03%' Then ISNULL(sum(d.numpages), 0) end PaperImages
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.ackTime is not null 
group by convert(nvarchar, s.ackTime, 101), s.batchname) X
group by x.UploadDate
order by x.UploadDate


---SMS counts by Date by Type with character contention counts
--select distinct x.UploadDate, ISNULL(sum(x.FaxDocs), 0) FaxDocs, ISNULL(sum(x.FaxImages),0) FaxImages, ISNULL(sum(x.PaperDocs), 0) PaperDocs, ISNULL(sum(x.PaperImages), 0) PaperImages, sum(x.CharCounts) CharCounts
--FROM
--(select convert(nvarchar, s.ackTime, 101) UploadDate,
--CASE WHEN s.batchname like '04%' Then ISNULL(count(distinct d.imageid), 0) end FaxDocs,
--CASE WHEN s.batchname like '04%' Then ISNULL(sum(d.numpages), 0) end FaxImages,
--CASE WHEN s.batchname like '03%' Then ISNULL(count(distinct d.imageid), 0) end PaperDocs,
--CASE WHEN s.batchname like '03%' Then ISNULL(sum(d.numpages), 0) end PaperImages,
--sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial) + len(c.ZipCode)) CharCounts
--from smsDCSMapping s
--left join document d
--on s.dcsid = d.dcsID
--left join CustomerDATA c
--on s.dcsID = c.dcsID
--where s.ackTime is not null 
--group by convert(nvarchar, s.ackTime, 101), s.batchname) X
--group by x.UploadDate
--order by x.UploadDate


---SMS counts by Date by Type with FileCharCounts
select distinct x.UploadDate, ISNULL(sum(x.FaxDocs), 0) FaxDocs, ISNULL(sum(x.FaxImages),0) FaxImages, ISNULL(sum(x.PaperDocs), 0) PaperDocs, ISNULL(sum(x.PaperImages), 0) PaperImages, Y.CharCounts
FROM
(select convert(nvarchar, s.ackTime, 101) UploadDate,
CASE WHEN s.batchname like '04%' Then ISNULL(count(distinct d.imageid), 0) end FaxDocs,
CASE WHEN s.batchname like '04%' Then ISNULL(sum(d.numpages), 0) end FaxImages,
CASE WHEN s.batchname like '03%' Then ISNULL(count(distinct d.imageid), 0) end PaperDocs,
CASE WHEN s.batchname like '03%' Then ISNULL(sum(d.numpages), 0) end PaperImages
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
left join CustomerDATA c
on s.dcsID = c.dcsID
where s.ackTime is not null 
group by convert(nvarchar, s.ackTime, 101), s.batchname) X,
(select convert(nvarchar, s.acktime, 101) UploadDate, 
sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial) + len(c.ZipCode)) CharCounts 
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
where s.ackTime is not null 
group by convert(nvarchar, s.acktime, 101)) Y
where X.UploadDate = Y.UploadDate
group by x.UploadDate, Y.CharCounts
order by x.UploadDate




--test char counts for DCSID
--select sum((len(recvdate) - (len(recvdate) - len(replace(recvdate, '/', '')))) + len(filenumber) + len(lastname) + len(firstname) + len(middleinitial) + len(zipcode)) from CustomerDATA where dcsid = 'DCSID041606000001010046'


---SMS Char Counts
select convert(nvarchar, s.acktime, 101) UploadDate, 
sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial) + len(c.ZipCode)) CharCounts 
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
where s.ackTime is not null 
group by convert(nvarchar, s.acktime, 101)


---SMS Contention Counts
select convert(nvarchar, s.acktime, 101) UploadDate, 
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))) "526 Character Count" from smsDCSMapping s
left join Document d
on s.dcsid = d.dcsID
where s.ackTime is not null and d.docidDoctype like 'VA 21-526%'
group by convert(nvarchar, s.acktime, 101)
order by convert(nvarchar, s.acktime, 101)


select distinct s.dcsid, d.ImageID from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID 
where s.ackTime is not null and s.ackTime > '2016-02-17' and s.ackTime <= '2016-02-17 23:59:59.999'
and d.docidDoctype like 'VA 21-526%'



--contention without semicolon
select sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))) "526 Character Count"
from document where imagedatetime > '2016-02-29' and docidDoctype like 'va 21-526%'
and ImageID = 'CSRA_CMP_160602901P001000145'
