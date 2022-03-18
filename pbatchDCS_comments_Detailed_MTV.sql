---test1
select distinct d.dcsid, d.pbatch 
--into pbatchDCS_comments
from dcssheetlookup d 
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')


select distinct dc.dcsid, dc.pbatch, pc.firstcheck as firstcheckOper, max(pc.insertdat) as firstcheckDate, dc.operid as thirdcheckOper, max(dc.insertdate) as thirdcheckDate   
into pbatchDCS_comments_Detailed
from dcssheetlookup_CACI dc 
inner join pbatch_comments pc
on dc.pbatch = pc.pbatch
where dc.secondcheck = 'TrueError' and dc.dcsid <> ''
group by dc.dcsid, dc.pbatch, pc.firstcheck, pc.insertdat, dc.operid, dc.insertdate



select distinct dcsid from pbatchDCS_comments

select distinct dcsid from dcssheetlookup_CACI where dcsid in (
'HI4WAQ5F5DUZAC',
'HIW0HTLJ6PNEM3',
'HIW1L8IA8AW96W',
'HIW291TIBDE1TM',
'HIW2DQ9ZELTWA0',
'HIW2TIS8VQVWFD',
'HIW3GLABYODZU3',
'HIW3HWE3ZBOMH0',
'HIX2DBHWUYSXO2')



select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'cannotfix'

select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'cannotfix'

---test2
select distinct d.dcsid, d.pbatch, d.operid as firstcheckOper, max(d.insertdate) as firstcheckDate, dcsC.operid as thirdcheckOper, max(dcsC.insertdate) as thirdcheckDate  
--into pbatchDCS_comments_Detailed
from dcssheetlookup d 
inner join dcssheetlookup_CACI dcsC
on d.dcsid = dcsC.dcsid
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')
group by d.dcsid, d.pbatch, d.operid, d.insertdate, dcsC.operid, dcsC.insertdate



---test3
select distinct d.dcsid, d.pbatch 
--into pbatchDCS_comments
from dcssheetlookup d 
where exists (
select * from dcssheetlookup_CACI dc where d.dcsid = dc.dcsid and secondcheck = 'TrueError')
