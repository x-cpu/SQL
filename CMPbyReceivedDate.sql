select * from cmpcheckin

select c.insertdate, count(c.env), p.pobox from cmpcheckin c
left join PhysicalBatch p
on c.pbatch = p.PBatch
where p.PBatch not like '02%'
group by insertdate, pobox
order by insertdate


select * from PhysicalBatch where pbatch like '03%'

select distinct pobox =
CASE p.pobox
when '5236-Solicited' then 'St. Petersburg'
when '5235-Unsolicited' then 'St. Petersburg'
else p.pobox
end,
f.batchname batchname, d.dcsID, p.invtime inventoryTime, f.ETime uploadDate
from PhysicalBatch p
join FTPDetails f
on p.PBatch = f.batchname
join document d
on p.PBatch = d.PBatch
where p.pbatch like '03%'
and f.AckTime is not null and len(d.dcsID)=23
order by p.InvTime



select * from document where dcsid = 'HU5JPUS5FAP72'