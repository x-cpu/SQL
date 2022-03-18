use dva
select sum(UserImagesprocessed) AS Images, sum(UserProcTime) / 60 as Minutes
from TS_Audit where TSModule = 'AutoIndex'

use dva
select distinct t.wsid, w.wsname from TS_Audit t
right join turboscanNG1.dbo.workstation w
on w.wsid = t.wsid
where TSModule = 'AutoIndex' and t.timestamp >= '2014-03-18 08:0:0'

use dva
select * from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-03-18 13:0:0' order by timestamp, WSID

use TurboscanNG1
select * from batches where batchname like '021406202001%'

use dva
select sum(userimagesprocessed) from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-03-18 08:0:0'

use dva
select sum(userimagesprocessed) from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-13 0:0:0' and timestamp <= '2014-03-13 23:59:59'
select sum(userimagesprocessed) from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-14 0:0:0' and timestamp <= '2014-03-14 23:59:59'
select sum(userimagesprocessed) from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-15 0:0:0' and timestamp <= '2014-03-15 23:59:59'
select sum(userimagesprocessed) from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-16 0:0:0' and timestamp <= '2014-03-16 23:59:59'
select sum(userimagesprocessed) from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-17 0:0:0' and timestamp <= '2014-03-17 23:59:59'

--how many users and total images DocID'd per day
select count (distinct username) #ofPersons, sum(userimagesprocessed) TotImages from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-13 0:0:0' and timestamp <= '2014-03-13 23:59:59'
select count (distinct username) #ofPersons, sum(userimagesprocessed) TotImages from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-14 0:0:0' and timestamp <= '2014-03-14 23:59:59'
select count (distinct username) #ofPersons, sum(userimagesprocessed) TotImages from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-15 0:0:0' and timestamp <= '2014-03-15 23:59:59'
select count (distinct username) #ofPersons, sum(userimagesprocessed) TotImages from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-16 0:0:0' and timestamp <= '2014-03-16 23:59:59'
select count (distinct username) #ofPersons, sum(userimagesprocessed) TotImages from TS_Audit where TSModule = 'docid' and timestamp >= '2014-03-17 0:0:0' and timestamp <= '2014-03-17 23:59:59'



select * from Document where pbatch = '02133470209101'
select * from Stats where kbatch = '02133470209101'
select * from Stats_IBML where kbatch = '02140690302502'

select * from document where dcsid = 'HOR6FG07907HUB'
select * from TSErrorTracking where batchname = '02140730001502'
02140720205303

update document 
set filenumber = '429545007'
where filenumber = '426545007' and dcsid = 'HOR6FG07907HUB' 

update CustomerDATA 
set filenumber = '429545007'
where filenumber = '426545007' and dcsid = 'HOR6FG07907HUB' 

delete from Boxmapping where boxno = '74910'
delete from Boxmapping where boxno = '74291'