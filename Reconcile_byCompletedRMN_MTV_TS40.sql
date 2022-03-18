select distinct pb.RMN, cc.claimtype BoxType, sum(ts.UserImagesProcessed) UserImagesProcessed, ts.TSModule
from [mtv-va-sql-1\p922].dva.dbo.PhysicalBatch pb
left join [mtv-va-sql-1\p922].dva.dbo.customerCheckIn cc
on pb.RMN = cc.RMN
left join TS_Audit ts
on pb.PBatch = ts.Batchname
left outer join [mtv-va-sql-1\p922].dva.dbo.stats s
on pb.Pbatch = s.kbatch
where pb.pbatch like '02%'
and pb.invtime >= '2016-11-01'
and ts.TSModule in ('DocID', 'ImageQC')
group by pb.RMN, cc.claimtype, ts.TSModule
having count(distinct pb.pbatch) = count(distinct s.kbatch)
order by pb.RMN



