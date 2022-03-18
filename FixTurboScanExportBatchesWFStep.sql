---EXPORT FIXES
--view
select * from TurboscanNG1.dbo.batches where BatchLocation = 256 and WFStep = 10 and batchdesc = 'QA2 - DocID' order by BatchName
--fix
update TurboscanNG1.dbo.batches
set WFStep = 11 where BatchLocation = 256 and WFStep = 10 and batchdesc = 'QA2 - DocID' and JobID = 8

update TurboscanNG1.dbo.batches
set BatchStatus = 1 where BatchLocation = 256 and WFStep = 11 and batchdesc = 'QA2 - DocID' and BatchStatus = 8 and JobID = 8

--fix CMP
update TurboscanNG1.dbo.batches
set WFStep = 11 where BatchLocation = 256 and WFStep = 10 and batchdesc = 'QA2 - DocID' and JobID = 11

update TurboscanNG1.dbo.batches
set BatchStatus = 1 where BatchLocation = 256 and WFStep = 11 and batchdesc = 'QA2 - DocID' and BatchStatus = 8 and JobID = 11


---AUTOINDEX FIXES
--view
select * from TurboscanNG1.dbo.batches where WFStep = 5 and BatchStatus = 0
--fix
update turboscanng1.dbo.Batches
set BatchStatus = 1 where WFStep = 5 and BatchStatus = 0  and JobID = 8

