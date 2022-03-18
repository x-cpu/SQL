select count(distinct pb.pbatch) #ofBatches, count(distinct pb.RMN) #ofRMNs from PhysicalBatch pb where InvTime >= '2015-05-04 0:0:0' and InvTime <= '2015-05-07 23:59:59.999'


select count(distinct pb.pbatch) #ofBatches, count(distinct pb.RMN) #ofRMNs, cc.claimtype from PhysicalBatch pb 
left join customercheckin cc
on pb.rmn = cc.rmn
where pb.InvTime >= '2015-05-04 0:0:0' and pb.InvTime <= '2015-05-07 23:59:59.999'
and PBatch like '02%'
group by cc.claimtype


select count(distinct pb.pbatch) #ofBatches, count(distinct pb.RMN) #ofRMNs, cc.claimtype from PhysicalBatch pb 
left join customercheckin cc
on pb.rmn = cc.rmn
where pb.InvTime >= '2015-05-11 0:0:0' and pb.InvTime <= '2015-05-14 23:59:59.999'
and PBatch like '02%'
group by cc.claimtype


select count(distinct pb.pbatch) #ofBatches, count(distinct pb.RMN) #ofRMNs, cc.claimtype from PhysicalBatch pb 
left join customercheckin cc
on pb.rmn = cc.rmn
where pb.InvTime >= '2015-05-18 0:0:0' and pb.InvTime <= '2015-05-21 23:59:59.999'
and PBatch like '02%'
group by cc.claimtype