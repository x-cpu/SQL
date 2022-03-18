select distinct d.RMN, count(distinct d.pbatch) Batches, 
sum(numpages) Images, 
max(ftpstime) UploadDateTime 
from document d
left join customerCheckIn c
on d.RMN = c.RMN
where d.PBatch like '02%'
and d.ftpstime >= '2020-09-21'
and d.ftpstime < '2020-09-22'
and c.claimtype = 'ompf'
and d.ftpstime is not null
and not exists (select * from document where ftpstime >= '2020-09-22' and d.RMN = RMN)
--and not exists (select * from document where ftpstime < '2020-09-21' and d.RMN = RMN)
group by d.RMN
order  by max(d.ftpstime)