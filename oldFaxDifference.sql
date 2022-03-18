select pb.RecvDate ReceivedDate, count(distinct b.pbatch) Batches, count(distinct f.tifname) Faxes, count(distinct d.dcsid) DCSIDs,
--, count(distinct d.pbatch) #ofBatchesExported 
(count(distinct d.dcsid) - count(distinct f.tifname)) Diff
from batch20160121 b
left join PhysicalBatch pb
on b.pbatch = pb.pbatch
left join tmpfaxtifname f
on b.pbatch = f.pbatch
left join CustomerDATA d
on b.pbatch = d.PBatch
group by pb.RecvDate



---by batch
select pb.RecvDate ReceivedDate, b.pbatch BatchName, count(distinct f.tifname) Faxes, count(distinct d.dcsid) DCSIDs,
--, count(distinct d.pbatch) #ofBatchesExported 
(count(distinct d.dcsid) - count(distinct f.tifname)) Diff
from batch20160121 b
left join PhysicalBatch pb
on b.pbatch = pb.pbatch
left join tmpfaxtifname f
on b.pbatch = f.pbatch
left join CustomerDATA d
on b.pbatch = d.PBatch
group by pb.RecvDate, b.pbatch