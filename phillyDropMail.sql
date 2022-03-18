select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having ((CONVERT(varchar, InvTime, 101) = '05/15/2015') or (CONVERT(varchar, InvTime, 101) = '05/18/2015'))



select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/12/2015'
order by CONVERT(varchar, InvTime, 101) desc


select CONVERT(varchar, InvTime, 101) CheckINDate, count(distinct BoxNO) from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/12/2015'
order by CONVERT(varchar, InvTime, 101) desc