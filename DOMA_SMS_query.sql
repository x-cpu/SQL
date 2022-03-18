---received from SMS but not sent to DMHS from IC
select distinct comments VeteranID, XMLfilename from dmhsCMPxmldownload where not exists
(select * from smsDCSMapping where dmhsCMPxmldownload.comments = veteranID)
order by comments

---received SPLIT from SMS but not sent to DMHS from IC
select distinct comments VeteranID, XMLfilename from dmhsCMPxmldownload where not exists
(select * from smsDCSMapping where dmhsCMPxmldownload.comments = veteranID) and category = 'split'
order by comments

select * from smsDCSMapping where veteranID = '5034'

--SMS count query with imagecount added
select distinct pbatch BatchName, count(distinct dcsid) #ofVET, count(distinct imageid) #ofDocuments, sum(numpages) #ofImages from document where exists (
select * from dmhsFTPDetails where Document.pbatch = batchname and etime >= '2016-02-17 0:0:0' and etime <='2016-02-17 23:59:59.999')
group by PBatch


--SMS count query with imagecount added by date
select count(distinct d.pbatch) BatchName, count(distinct d.dcsid) #ofVET, count(distinct d.imageid) #ofDocuments, sum(d.numpages) #ofImages 
from document d
where exists (
select * from dmhsFTPDetails where d.pbatch = batchname and etime >= '2016-02-17 0:0:0' and etime <='2016-02-17 23:59:59.999')
group by d.PBatch

--SMS count query
select distinct pbatch, count(distinct dcsid) #ofVET, count(distinct imageid) #ofDocuments, sum(numpages) pages from document where exists (
select * from dmhsFTPDetails where Document.pbatch = batchname and etime >= '2016-02-29 0:0:0' and etime <='2016-02-29 23:59:59.999')
and pbatch like '04%'
group by PBatch

--SMS count query
select distinct pbatch, count(distinct dcsid) #ofVET, count(distinct imageid) #ofDocuments, sum(numpages) pages from document where exists (
select * from dmhsFTPDetails where Document.pbatch = batchname and etime >= '2016-02-29 0:0:0' and etime <='2016-02-29 23:59:59.999')
and pbatch like '04%'
group by PBatch



--DOMA count query with imagecount added
select distinct p.batchname BatchName, count(distinct p.dcsid) #ofVETPackets, count(distinct p.imageid) #ofDocuments, sum(d.NumPages) #ofImages from pmrImageIDMapping p
left join document d
on p.dcsid = d.dcsID
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
group by p.batchname

--DOMA count query with imagecount added by date
select convert(nvarchar, dF.AckTime, 101) UpdateDate, count(distinct p.batchname) #ofBatches, count(distinct p.dcsid) #ofVETPackets, count(distinct p.imageid) #ofDocuments, sum(d.NumPages) #ofImages 
from pmrImageIDMapping p
left join document d
on p.dcsid = d.dcsID
left join domaFTPDetails dF
on p.batchname = dF.batchname
where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null and AckTime >= '2016-02-19 0:0:0' and AckTime <='2016-02-19 23:59:59.999')
group by convert(nvarchar, dF.AckTime, 101)


--DOMA count query
select distinct batchname BatchName, count(distinct dcsid) #ofVETPackets, count(distinct imageid) #ofDocuments from pmrImageIDMapping
where exists (select * from domaFTPDetails where pmrImageIDMapping.batchname = batchname and acktime is not null and AckTime >= '2016-02-17 0:0:0' and AckTime <='2016-02-17 23:59:59.999')
group by batchname



--distinct by name
select distinct xmlfilename from dmhsCMPxmldownload where insertdate >= '2016-02-17 0:0:0' and insertdate <= '2016-02-17 23:59:59.999'


--special
select s.dcsid, s.veteranID, s.insertdate, s.ackTime, d.ETime from smsDCSMapping s
left join dmhsCMPxmldownload d
on substring(s.xmlFilename, 1, (len(s.xmlFilename) - 4)) = substring(d.xmlFilename, 1, (len(d.xmlFilename) - 4)) 
where s.ackTime is null and d.type = '.ack'



select * from pmrImageIDMapping

select * from domaFTPDetails

select * from smsDCSMapping where veteranID in (
'12567',
'12568')


select * from dmhserrormapping

select * from dmhsCMPxmldownload where batchname like '%12567%'

select * from dmhsFTPDetails

select * from pmrFTPDetails
delete from pmrrecon

select * from smsDCSMapping where xmlFilename = 'NEW-CSRA-4153.xml'
select * from dmhsCMPxmldownload where type = '.err'
select * from dmhsCMPxmldownload where type = '.err'
select * from dmhsCMPxmldownload where xmlFilename like 'split%'
select * from smsDCSMapping where status like 'split%'

select * from dmhsCMPxmldownload where xmlFilename = 'Completed-DMHS-5256.xml'

select * from dmhsCMPxmldownload where pZIP = '04160530000101.ZIP' and XMLfilename like 'new%'

select * from dmhsCMPxmldownload where XMLfilename = 'Completed-DMHS-3944875.xml'



select * from smsDCSMapping where errtime is not null and batchname = '04160530000101'




where pZIP = '04160530000101.zip'


select distinct batchname from dmhsCMPxmldownload where batchname in (
'04160520000401',
'04160520000501',
'04160520000601',
'04160530000201',
'04160530000101',
'04160530000301')
and type = '.err'

select * from dmhsCMPxmldownload where batchname = '04160530000301'

04160530000101
04160530000201
04160520000401
04160520000501
04160520000601



select * from smsDCSMapping where batchname = '04160530000101'



select * from dmhsFTPDetails where STime > '2016-02-22' and batchname like '04%'

select * from dmhsFTPDetails where batchname in (
'04160530000201',
'04160530000101')


select * from dmhsCMPxmldownload
select * from document where imageid like 'CSRA-1604829010002%'
select * from pmrFTPDetails



select * from FTPError where imageid = 'PMRID_3912927'

select * from pmrrecon where XMLfilename = '20160219230435640.xml'


select * from document where pbatch = '11160510005185'

--select distinct dcsid from docid.dbo.pmrrecon 

select count(*), dcsid from pmrrecon
group by dcsid
having count(*) > 1

select * from pmrrecon where dcsid = 'DCSDM111605100051940001'

select * from document where ImageID in (
'PMRID_3912927',
'PMRID_3913977')


select * from pmrrecon where ImageID in (
'PMRID_3912927',
'PMRID_3913977')







--select * into docid.dbo.smsDCSMapping20160221 from smsDCSMapping

--update query before ACKTime added to smsDCSMApping table
--update s
--set s.ackTime = d.ETime
--from smsDCSMapping s
--left join dmhsCMPxmldownload d
--on substring(s.xmlFilename, 1, (len(s.xmlFilename) - 4)) = substring(d.xmlFilename, 1, (len(d.xmlFilename) - 4)) 
--where s.ackTime is null and d.type = '.ack'


--update query before ERRTime added to smsDCSMApping table
--update s
--set s.errTime = d.ETime
--from smsDCSMapping s
--left join dmhsCMPxmldownload d
--on substring(s.xmlFilename, 1, (len(s.xmlFilename) - 4)) = substring(d.xmlFilename, 1, (len(d.xmlFilename) - 4)) 
--where s.ackTime is null and d.type = '.err' and s.errTime is null


select batchname, SUBSTRING(pzip, 0,15) from dmhsCMPxmldownload
where pzip is not null and batchname not like '04%'



select * into docid.dbo.dmhsCMPxmldownload20160221 from dmhsCMPxmldownload 



select * from dmhsCMPxmldownload where type = '.err'
select * from smsDCSMapping where veteranID in ('2285', '8182')
select * from smsDCSMapping where veteranID in ('12567', '12568')
select * from dmhserrormapping
select * from dmhsCMPxmldownload where xmlFilename = 'Completed-DMHS-155.xml'


select count(*) from users
select * from cmpRescanMapping



select * from CustomerDATA where pbatch = '04160490003401' and lastname = 'GRAHAM'
select * from document where pbatch = '04160470004401' and dcsid = 'DCSID041604700044010056'

--update CustomerDATA
--set Lastname = 'GRAHAM'
--where pbatch = '04160490003401' and lastname = '66666666'

select * from smsDCSMapping where veteranID = '12567'

select * from SMSVeteranID

--manually add to db 041605300003001
--select * from dmhsFTPDetails where batchname = '04160530003001'
select * from dmhsFTPDetails where STime > '2016-02-24 07:28:34.227'
select * from dmhsFTPDetails where batchname = 'Completed-CSRA-1783'

select count(*), batchname from dmhsFTPDetails
group by batchname
having count(*) > 1



select count(*) #ofInstances, xmlfilename,  min(insertdate) insertdate into docid.dbo.dmhstemp20160224 from dmhsCMPxmldownload
group by XMLfilename
having count(*) > 1
order by min(insertdate)


select * from smsDCSMapping where acktime is not null



select * from dmhsCMPxmldownload where XMLfilename = 'Completed-DMHS-158.xml'
---2016-02-19 09:12:57.713

select count(*) from dmhsCMPxmldownload where XMLfilename = 'Completed-DMHS-4066121.xml'

select * from smsDCSMapping where xmlFilename = 'New-CSRA-12694.xml'

--select * into docid.dbo.dmhsCMPxmldownload20160222x from dmhsCMPxmldownload 

select * from dmhsCMPxmldownload where XMLfilename = 'Completed-DMHS-499.xml'


select * from document where pbatch = '12160550000001'

select * from PMRFTU

---received from SMS but not sent to DMHS from IC
select distinct comments VeteranID, XMLfilename from dmhsCMPxmldownload where not exists
(select * from smsDCSMapping where dmhsCMPxmldownload.comments = veteranID)
order by comments

