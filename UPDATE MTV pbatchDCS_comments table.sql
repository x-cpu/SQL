---UPDATE MTV pbatchDCS_comments table
insert into pbatchDCS_comments
select distinct d.dcsid, d.pbatch 
from dcssheetlookup d 
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')
and d.dcsid not in (select distinct dcsid from pbatchDCS_comments)
and d.dcsid <> ''



--UPDATE MTV pbatchDCS_comments table
insert into pbatchDCS_comments_Detailed
select distinct d.dcsid, d.pbatch, d.operid as firstcheckOper, max(d.insertdate) as firstcheckDate, dcsC.operid as thirdcheckOper, max(dcsC.insertdate) as thirdcheckDate 
from dcssheetlookup d 
inner join dcssheetlookup_CACI dcsC
on d.dcsid = dcsC.dcsid
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')
and d.dcsid not in (select distinct dcsid from pbatchDCS_comments_Detailed)
and d.dcsid <> ''
group by d.dcsid, d.pbatch, d.operid, d.insertdate, dcsC.operid, dcsC.insertdate


