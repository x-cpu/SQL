select * from TurboscanNG1.dbo.Batches where BatchLocation = '128' and WFStep = '4' and JobID = '11'
select * from TurboscanNG1.dbo.Batches where BatchLocation = '128' and WFStep = '6' and JobID = '11'

select batchname, BatchDesc, (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) from TurboscanNG1.dbo.Batches where BatchLocation = '128' and WFStep = '4' and JobID = '11'
where batchname in (
'02132630502803',
'02142620403005',
'02142770001301',
'02142770201602',
'02142940200201',
'02142940200401',
'02142940404101',
'02142940404201',
'02142950000701')



select b.batchname, b.BatchDesc, (DATEADD(hh, -5, DATEADD(ss, b.TimeStamp, '01/01/1970'))) as TScreationdate, p.BackDate 
from TurboscanNG1.dbo.Batches b
join dva.dbo.PhysicalBatch p
on b.batchname = p.PBatch
where b.BatchName like '04%'and b.WFStep <> '11'
order by p.BackDate


select * from turboscanng1.dbo.batches where batchname in 
(select distinct pbatch  from physicalbatch where pbatch like '04%' and backdate = '9/19/2014')




select batchname, BatchDesc, (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) from TurboscanNG1.dbo.Batches
where batchname in (
'02132630502803',
'02142620403005',
'02142770001301',
'02142770201602',
'02142940200201',
'02142940200401',
'02142940404101',
'02142940404201',
'02142950000701')
