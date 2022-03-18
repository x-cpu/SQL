select * from dcssheetlookup_CACI

select * from dcssheetlookup
select * from pbatchDCS_comments


---test1
select distinct d.dcsid, d.pbatch 
into pbatchDCS_comments
from dcssheetlookup d 
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')


---test2
select distinct d.dcsid, d.pbatch, d.operid as firstcheckOper, max(d.insertdate) as firstcheckDate, dcsC.operid as thirdcheckOper, max(dcsC.insertdate) as thirdcheckDate  
into pbatchDCS_comments_Detailed
from dcssheetlookup d 
inner join dcssheetlookup_CACI dcsC
on d.dcsid = dcsC.dcsid
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')
group by d.dcsid, d.pbatch, d.operid, d.insertdate, dcsC.operid, dcsC.insertdate



select distinct d.dcsid, d.pbatch, d.operid as firstcheckOper, max(d.insertdate) as firstcheckDate, dcsC.operid as thirdcheckOper, max(dcsC.insertdate) as thirdcheckDate  from dcssheetlookup d 
inner join dcssheetlookup_CACI dcsC
on d.dcsid = dcsC.dcsid
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')
group by d.dcsid, d.pbatch, d.operid, d.insertdate, dcsC.operid, dcsC.insertdate









select * from dcssheetlookup_CACI where dcsid = 'HHT71H1JLJKBJM'
select * from dcssheetlookup where dcsid = 'HHT71H1JLJKBJM'


