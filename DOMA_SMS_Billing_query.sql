--DOMA count query with imagecount added by date
select convert(nvarchar, dF.AckTime, 101) UpdateDate, count(distinct p.imageid) #ofDocuments, sum(d.NumPages) #ofImages 
from pmrImageIDMapping p
left join document d
on p.imageID = d.ImageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null) 
--and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
group by convert(nvarchar, dF.AckTime, 101)
order by convert(nvarchar, dF.AckTime, 101)




--DOMA count query with imagecount added by date
select convert(nvarchar, dF.AckTime, 101) UpdateDate, count(distinct p.batchname) #ofBatches, count(distinct p.dcsid) #ofVETPackets, count(distinct p.imageid) #ofDocuments, sum(d.NumPages) #ofImages 
from pmrImageIDMapping p
left join document d
on p.imageID = d.ImageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null) 
--and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
group by convert(nvarchar, dF.AckTime, 101)
order by convert(nvarchar, dF.AckTime, 101)



--DOMA count query with imagecount added by hour
select convert(nvarchar, dF.AckTime, 101) UpdateDate, DATEPART(hh, dF.AckTime) as Hour, count(distinct p.imageid) docs, sum(d.NumPages) pages 
from pmrImageIDMapping p
left join document d
on p.imageID = d.imageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null and acktime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))) 
--and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
group by convert(nvarchar, dF.AckTime, 101), DATEPART(hh, dF.AckTime)
order by convert(nvarchar, dF.AckTime, 101), DATEPART(hh, dF.AckTime)




--DOMA count query with imagecount ONLY
select sum(d.NumPages) pages 
from pmrImageIDMapping p
left join document d
on p.imageID = d.imageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null and acktime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))) 



--DOMA count query with imagecount added by date and KEYSTROKES
select convert(nvarchar, dF.AckTime, 101) UpdateDate, count(distinct p.batchname) #ofBatches, 
count(distinct p.dcsid) #ofVETPackets, 
count(distinct p.imageid) #ofDocuments, 
sum(d.NumPages) #ofImages, 
sum(c.ks) "VetFile#Name Keystrokes"
--sum((len(d.Form526Data) - (len(d.Form526Data) - LEN(replace(d.form526data, ' ', '')))) - (len(d.Form526Data) - LEN(replace(d.form526data, ';', '')))) "526 Character Count"
from pmrImageIDMapping p
left join document d
on p.imageID = d.imageID
left join domaFTPDetails dF
on p.batchname = dF.batchname
left join cmpstats c
on p.dcsid = c.dcsid
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null) 
--and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
group by convert(nvarchar, dF.AckTime, 101)
order by convert(nvarchar, dF.AckTime, 101)

--------------------------------------------DOMA--TO--VBMS--------------------------------------------------------------------------------

---TOM report
select distinct d.imageid FileName, substring(p.XMLfilename, 0,18) PMR_BatchName, d.numpages #ofImages, d.docidDoctype DocID, d.Comments VBMSResponse from document d
left join pmrrecon p
on d.imageid = p.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-24 00:00:00'

---internal report with ftpstime
select distinct d.imageid FileName, substring(p.XMLfilename, 0,18) PMR_BatchName, d.numpages Images, d.docidDoctype DocID, max(d.ftpstime) VBMSUploadDateTime, d.Comments VBMSResponse from document d
left join pmrrecon p
on d.imageid = p.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-23 00:00:00'

--error
select distinct d.imageid FileName, p.FileNumber, p.Firstname, p.Lastname, d.Comments VBMSResponse from document d
left join pmrrecon p
on d.imageid = p.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-24 00:00:00' and d.Comments like 'Detail: CMSERR0001%' and d.ftpstime is null

--error2
select distinct d.pbatch, d.dcsid, d.Comments VBMSResponse from document d
left join pmrrecon p
on d.imageid = p.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-20 00:00:00' and d.Comments like 'Detail: CMSERR0001%' and d.ftpstime is null

--good
select distinct d.imageid FileName, p.FileNumber, substring(p.XMLfilename, 0,18) PMR_BatchName, d.numpages #ofImages, d.docidDoctype DocID, d.Comments VBMSResponse, ftpstime VBMSUploadDate from document d
left join pmrrecon p
on d.imageid = p.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-20 00:00:00'  and d.ftpstime is not null

--ftp error table 
select * from FTPError where imageid in (
'PMRID_3912927',
'PMRID_3913977',
'PMRID_3919147',
'PMRID_3920358')
-----------------------------------------------------------------------------------------------------------------SMS------------------below
--SMS count query with imagecount added by date
select convert(nvarchar, s.ackTime, 101) UploadDate, count(distinct d.imageid) #ofDocuments, sum(d.numpages) #ofImages  from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.ackTime is not null
group by convert(nvarchar, s.ackTime, 101) 
order by convert(nvarchar, s.ackTime, 101) 



--SMS count query with imagecount added by date
select convert(nvarchar, s.ackTime, 101) UploadDate, count(distinct s.batchname) #ofBatches, count(distinct s.dcsid) #ofVETPackets, count(distinct d.imageid) #ofDocuments, sum(d.numpages) #ofImages  from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.ackTime is not null
group by convert(nvarchar, s.ackTime, 101) 
order by convert(nvarchar, s.ackTime, 101) 


--SMS count query with imagecount added by hour
select convert(nvarchar, s.ackTime, 101) UploadDate, DATEPART(hh, s.ackTime) as Hour, count(distinct d.imageid) docs, sum(d.numpages) Pages  from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.ackTime is not null
and s.AckTime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
group by convert(nvarchar, s.ackTime, 101), DATEPART(hh, s.ackTime) 
order by convert(nvarchar, s.ackTime, 101), DATEPART(hh, s.ackTime) 


--SMS count query with imagecount ONLY
select sum(d.numpages) Pages  from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.ackTime is not null
and s.AckTime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))


--SMS count query with imagecount added by date and KEYSTROKES
select convert(nvarchar, s.ackTime, 101) UploadDate, count(distinct s.batchname) #ofBatches, count(distinct s.dcsid) #ofVETPackets, 
count(distinct d.imageid) #ofDocuments, 
sum(d.numpages) #ofImages, 
sum(c.ks) "VetFile#Name Keystrokes",  
sum((len(d.Form526Data) - (len(d.Form526Data) - LEN(replace(d.form526data, ';', ''))))) "526 Character Count"
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
left join cmpstats c
on s.dcsid = c.dcsid
where s.ackTime is not null
group by convert(nvarchar, s.ackTime, 101) 
order by convert(nvarchar, s.ackTime, 101) 



-----------------------------------------------------------------------------------------------------------------------------
--test queries
select sum((len(recvdate) - (len(recvdate) - len(replace(recvdate, '/', ''))))) from CustomerDATA where dcsid = 'DCSID041606000001010046'
select sum((len(recvdate) - (len(recvdate) - len(replace(recvdate, '/', '')))) + len(filenumber) + len(lastname) + len(firstname) + len(middleinitial) + len(zipcode)) from CustomerDATA where dcsid = 'DCSID041606000001010046'