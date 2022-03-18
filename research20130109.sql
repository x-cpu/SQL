
---by dcsid lookup
select *
from customerdata
where dcsID = 'H9R52BT5M0L79O'

select *
from Document
where dcsID = 'H9R52BT5M0L79O'

select *
from manifestDCS
where dcsID = 'H9R52BT5M0L79O'


select sum(docs)
from stats
where kbatch = '02123350013901'

select count(*)
from Document
where PBatch = '02123350013901'



select distinct dcsid from document
where ftpstime is not null and comments = 'success'
and dcsid not in (select distinct dcsID from CustomerDATA)

select pbatch, dcsID, FileNumber, RMN, participantID, count(*) from document where dcsid in 
(select distinct dcsid from document
where dcsid not in (select distinct dcsID from CustomerDATA))
and ftpstime is not null
group by pbatch, dcsID, FileNumber, RMN


select *
from Document
where dcsID = 'H8HJGI8ZBYTNP4'

select *
from customerdata 
where rmn = '308VB1019120001C'
--H8HGJ2PQADK8U1


select * from Document where dcsID = 'H8HGJ2PQADK8U1'
--02122990001002


select sum(numpages)
from document
where ftpstime between '2012-11-01 0:0:0' and '2012-11-30 23:59:59'

select kbatch, sum(docs) as docs, releasedate, images from stats
group by kbatch, releasedate, images
having suM(docs) = 149 


select distinct PBatch
from document
where ftpstime between '2013-01-08 0'

select pbatch , min(syskey), max(syskey)  from document where ftpstime > '11/20/2012 0:0:1' and ftpstime < '11/20/2012 23:59:59' 
group by pbatch 

select * from stats 

select pbatch, count(*) from document
where pbatch in (
'02123060000107',
'02123050005101',
'02123050002301',
'02123050003801',
'02123050005601',
'02123060001205',
'02123060004401',
'02123100002801',
'02123110001002',
'02123330016701')
--and imagedatetime between '11/20/2012 0:0:1' and '11/20/2012 23:59:59'
group by pbatch 
order by ftpstime 



select * from document
where rmn = '322VB1123120020D' and pbatch = '02123330016701'

select *
from stats_ibml
order by syskey desc

kbatch
02123560018301


select * from document
where pbatch = '02123390012801'

select sum(numpages), count(*)
select *
from document
where ftpstime is null and ImageDateTime < '2012-12-21 23:59:59'
order by pbatch, NumPages desc


select distinct dcsid from document where dcsid 
not in (select distinct dcsid from manifestdcs where insertdate > '11/1/2012 0:0:1' and insertdate <'12/31/2012 23:59:59')

