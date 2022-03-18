use TurboscanNG1
select * from batches where batchname = '02131200210806'
select * from batches where jobid = '8' and wfstep = '11' and BatchStatus = '0' and batchlocation = '256'

update batches
set BatchStatus = '1'
where jobid = '8' and wfstep = '11' and BatchStatus = '0' and batchlocation = '256'


--to check if a batch was brought into Turboscan twice
select * from dva.dbo.Stats_IBML dva where exists (
select * from turboscanng1.dbo.Batches ts where batchdesc like 'batch has already been exported%' and wfstep = '11' and dva.kbatch = ts.BatchName) order by dva.kbatch

exec TS_GetIndexes_1 236689

use dva
select * from TS_Audit where batchname = '02140660301502'

select distinct dcsid, max(ftpstime) as UploadDateTime from document where dcsid in (
'HRXRHW9G4OHEO5',
'HRXRRD72DDAK7J',
'HRXRNO3DJD6GAS') group by dcsID


select * from document where dcsid = 'HS7JHK0TOD7UOR' order by imageid

use dva
select * from TSErrorTracking where batchname = '02140710001301'
delete from TSErrorTracking where batchname = '02140710001501'

select sum(TotalImages) from TS_Audit where tsmodule = 'autoindex' and TimeStamp >= '2014-03-12 0:0:0' and TimeStamp <= '2014-03-12 23:59:59'

1191822



select sum(TotalImages) from TS_Audit where tsmodule = 'autoindex' and TimeStamp >= '2014-03-13 0:0:0' and TimeStamp <= '2014-03-13 23:59:59'


942003




select sum(TotalImages) from TS_Audit where tsmodule = 'autoindex' and TimeStamp >= '2014-03-14 0:0:0' and TimeStamp <= '2014-03-14 23:59:59'



use TurboscanNG1 select * from batches where batchname like '021406202001%'
select * from batches where batchname = '02140690302502'
select * from batches where batchname = '02131200005801'

select pbatch, sum(numpages) images from document where comments like '%valid%' group by pbatch

use dva
select * from document where pbatch = '02140710507604'
select * from document where dcsid = 'HRCGIW0MM8ADDZ'

select * from document where pbatch = '02140410205304' order by imageid

use TurboscanNG1
select * from batches where batchname = '02140710507604'

select * from batches where BatchStatus = '0' and WFStep = 5 and batchlocation = 8

update batches
set BatchStatus = '1'
where BatchStatus = '0' and WFStep = 5 and batchlocation = 8


select * from Batches where BatchDesc like 'There is not enough space on the disk%'



update batches
set BatchDesc = '-'
where batchdesc = 'There is not enough space on the disk.' and WFStep = '11'