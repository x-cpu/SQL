SELECT *
FROM sys.Tables order by name

use TS09
select count(*) from BatchResults where jobid = '8'

use TS05
select count(*) from BatchResults where jobid = '8'

use ts05
select * from BatchResults where JobID = '8'

use TS09
select * from BatchResults where JobID = '8'

use ts05
select count(*) from batches

use ts09
select count(*) from batches

select * from jobs


use TurboScanNG2
select count(*) from BatchResults where jobid = '8'


select br.batchid, b.BatchName, b.BatchLocation,count(br.BatchID) 
from batchresults br
LEFT JOIN Batches b
ON b.BatchID = br.BatchID  
where br.jobid='8'  
group by  br.batchid, b.BatchName, b.BatchLocation having count(br.BatchID) = 9 order by count(br.BatchID)

use TurboScanNG2
select br.batchid, b.BatchName, b.BatchLocation, b.WFStep,count(br.BatchID) 
from batchresults br
LEFT JOIN Batches b
ON b.BatchID = br.BatchID  
where br.jobid='8'  and  b.WFStep = 10
group by  br.batchid, b.BatchName, b.BatchLocation,  b.WFStep having count(br.BatchID) = 11 order by count(br.BatchID)

use TS05
select * from batches where batchlocation = '128' and wfstatus = '256'


use turboscanng2
GO
DISABLE TRIGGER [dbo].[trg_RNDAudit] ON [dbo].[BatchResults] 
GO


