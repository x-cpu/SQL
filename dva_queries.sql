--query to get frequency of doctype
select dcsid, dociddoctype , count(*) as Cnt from document
where comments ='success'
group by dcsid,dociddoctype
order by dcsid, cnt desc


--query to get # images for each doctype 
select d.dcsid, cd.lastname, cd.firstname,cd.middleinitial, d.dociddoctype, d.numpages , ftpstime 
from document as d, customerdata as cd
where d.dcsid= cd.dcsid 
and d.comments ='success'
order by d.dcsid, d.dociddoctype 

select * from qa_log
select * from TSErrorTracking 



select prepid, sum(numpages) from document 
where ftpstime > '10/17/2012 0:0:1'
group by prepid 
prepid	(No column name)
003	1050
005	914

select distinct pbatch  from document 
where ftpstime > '10/17/2012 0:0:1'
02122640000604
02122890000501

select pbatch, sum(numpages) from document 
where ftpstime > '10/17/2012 0:0:1'
group by pbatch 
pbatch	(No column name)
02122640000604	914
02122890000501	1050


select * 
from exceptions  



select count(*) as docs, sum(numpages) from document where ftpstime is not null 



select * from manifestdcs where rmn 
not in (select rmn from physicalbatch)
order by insertdate 


select count(distinct RMN)
from manifestDCS
where insertdate between '2012-10-29 0:0:1' and '2012-11-04 00:00:00'
