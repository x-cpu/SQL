select distinct s.kbatch BatchName, 
count(distinct d.dcsid) TotalPackets, 
count(distinct a.dcsid) AutoCestPackets
from stats s
left join document d
on s.kbatch = d.PBatch
left join AutoCestRecon a
on s.kbatch = a.pbatch
where s.releasedate >= '2020-01-01'
and s.releasedate < '2020-02-01'
and s.kbatch like '04%'
and not exists 
(select * from PhysicalBatch 
where s.kbatch = pbatch and cordest = 'VTG')
group by s.kbatch


select distinct p.PBatch BatchName,
count(distinct d.dcsid) TotalPackets, 
count(distinct a.dcsid) AutoCestPackets
from PhysicalBatch p
left join document d
on p.pbatch = d.PBatch
left join AutoCestRecon a
on d.pbatch = a.pbatch
where p.cordest <> 'VTG'
and p.PBatch like '04%'
and exists (select * from stats 
where p.PBatch = kbatch 
and releasedate >= '2020-01-01' 
and releasedate < '2020-02-01')
group by p.PBatch, d.dcsID, a.dcsID
order by p.PBatch




select * from document where pbatch = '04193600000801'

select distinct s.kbatch BatchName, 
d.dcsid Packets, 
a.dcsid AutoCest
from stats s
left join document d
on s.kbatch = d.PBatch
left join AutoCestRecon a
on s.kbatch = a.pbatch
where s.releasedate >= '2020-01-01'
and s.releasedate < '2020-02-01'
and s.kbatch like '04%'
and not exists 
(select * from PhysicalBatch 
where s.kbatch = pbatch and cordest = 'VTG')
group by s.kbatch, d.dcsID, a.dcsID


