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
and f.AckTime is not null and len(d.dcsID)=23 and d.ImageDateTime > '2014-06-05 00:00:00'
order by p.InvTime


select distinct pobox =
CASE
when p.pobox = '5236-Solicited' and p.CRCDestination is null then 'St. Petersburg'
when p.pobox = '5235-Unsolicited' and p.CRCDestination is null then 'St. Petersburg'
when p.pobox = '5236-Solicited' then p.CRCDestination
when p.pobox = '5235-Unsolicited' then p.CRCDestination
else p.pobox
end,
f.batchname batchname, d.dcsID, p.invtime inventoryTime, f.ETime uploadDate
from PhysicalBatch p
join FTPDetails f
on p.PBatch = f.batchname
join document d
on p.PBatch = d.PBatch
where p.pbatch like '03%'
and f.AckTime is not null and len(d.dcsID)=23 and d.ImageDateTime > '2014-06-05 00:00:00'
order by p.InvTime



select * from FTPDetails