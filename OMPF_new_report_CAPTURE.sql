select BatchName, Username, wsid, TSModule,UserImagesProcessed,UserProcTime,Timestamp 
from ts_audit 
where tsmodule = 'capture' 
and username <>'tsservice' 
and (batchname like '01%' or batchname like '02%')
and TimeStamp >= dateadd(day,datediff(day,1,GETDATE()),0)
and TimeStamp < dateadd(day,datediff(day,0,GETDATE()),0)


select * from batches where batchname = '02203001701601'