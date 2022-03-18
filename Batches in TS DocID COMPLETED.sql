select b.batchname, cc.claimtype, b.totalimages, b.batchdesc, p.InvTime from batches b
left join dva.dbo.PhysicalBatch p
on b.BatchName = p.pbatch
left join dva.dbo.customerCheckIn cc
on p.RMN = cc.RMN
--where JobID in ('8', '11')
where b.JobID in ('8')
and cc.claimtype = 'c'
and b.wfstep <=  6
order by b.batchname


