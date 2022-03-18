select distinct username,
case
WHEN TSModule = 'DocID' then '010163'
--WHEN TSModule = 'DocID QC' then '010163'
WHEN TSModule = 'ImageQC' then '010302'
END
as task_code, sum(TotalProcTime) TotalProcTime
into tempLOCSS_P
from TS_Audit 
left join PhysicalBatch p
on TS_Audit.batchname = p.PBatch
left join customerCheckIn c
on p.RMN = c.RMN
where TimeStamp >= '2016-06-20' and TimeStamp <= '2016-06-26 23:59:59.999'
and TSModule in (
'DocID', 
--'DocID QC', 
'ImageQC')
and c.claimtype <> 'C'
group by username, TSModule
