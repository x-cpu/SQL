select distinct s.batchname BatchName, d.ETime UploadDateTime 
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-28'
and d.ETime < '2019-01-28'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
order by s.batchname

select distinct s.batchname BatchName, d.ETime UploadDateTime 
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-25'
and d.ETime < '2019-01-25'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and s.batchname like '12%'
order by s.batchname


select distinct s.batchname BatchName, d.ETime UploadDateTime, s.veteranID 
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-28'
and d.ETime < '2019-01-28'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
order by s.batchname


select distinct s.batchname BatchName, convert(date, d.ETime, 101) UploadDateTime, s.veteranID 
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-28'
and d.ETime < '2019-01-28'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
order by s.batchname


select convert(date, d.ETime, 101) UploadDateTime, count(distinct s.batchname) Batches, count(distinct s.veteranID) Vets
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-30'
and d.ETime < '2019-01-30'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
group by convert(date, d.ETime, 101)
order by convert(date, d.ETime, 101)


select distinct convert(date, d.ETime, 101) UploadDate, s.batchname BatchName, s.veteranID VeteranID
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-30'
and d.ETime < '2019-01-30'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
group by convert(date, d.ETime, 101), s.batchname, s.veteranID 
order by convert(date, d.ETime, 101)



select * from dmhsFTPDetails d where exists (
select * from PMRFTU where insertdate >= '2019-01-14' and d.batchname = newpBatch) order by batchname
select * from smsDCSMapping where batchname = '04190040002001'
select * from dmhsCMPxmldownload where batchname = '04190040002001'

--ftu
select distinct s.batchname BatchName, d.ETime UploadDateTime 
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate >= '2019-01-14'
and s.ackTime is null
and s.insertdate < '2019-01-22'
and d.ETime < '2019-01-22'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and s.batchname like '12%'
order by s.batchname


--vtg
select distinct s.batchname BatchName, d.ETime UploadDateTime, count(s.veteranid) VetPackages 
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join PhysicalBatch p
on s.batchname = p.PBatch
where s.insertdate >= '2019-01-14'
and s.ackTime is not null
and s.insertdate < '2019-01-22'
and d.ETime < '2019-01-22'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and p.cordest = 'vtg'
group by s.batchname, d.ETime
order by s.batchname


select distinct dcsid, PBatch from document where pbatch in (
'04190170500601',
'04190180500501')


select * from vvFTPDetails where sendAcknowledgeProcessing >= '2019-01-14' and vendor = 'vetsgov'

--247

select * from smsDCSMapping where errTime is not null and insertdate >= '2019-01-14'

select distinct kbatch, max(releasedate) from stats where releasedate >= '2019-01-23 08:00'
group by kbatch


select distinct s.batchname, s.veteranID, s.xmlFilename, s.errTime ErrorDateTime, s., d.packageError, d.documentError
from smsDCSMapping s
left join dmhsCMPxmldownload d
on s.veteranID = d.comments
where s.errTime is not null 
and s.ackTime is null
and s.insertdate >= '2019-01-14'

select * from dmhsCMPxmldownload where batchname = '04190100003001'
select * from dmhsCMPxmldownload where insertdate >= '2019-01-22' and type = '.err'