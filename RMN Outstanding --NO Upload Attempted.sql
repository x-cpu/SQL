--RMN Outstanding --NO Upload Attempted
--no Vault
select distinct d.PBatch BatchName, d.rmn RMN, 
CASE
	When c.claimtype = 'C' then 'C'
	When c.claimtype <> 'C' then 'P'
	Else '?'
	END ClaimType, max(d.imagedatetime) ExportDateTime
from document d
left join customerCheckIn c
on d.rmn = c.rmn
where ftpstime is null and comments is null 
and ImageDateTime >= '2019-01-01'
and ImageDateTime < '2020-05-01'
and (d.PBatch like '01%' or d.PBatch like '02%')
--below to exclude Vault
and d.RMN not like '101%'
and exists (select * from stats where d.PBatch = kbatch)
and not exists (select * from document where d.PBatch = pbatch and ftpstime is not null)
and not exists (select * from document where d.PBatch = pbatch and Comments is not null)
group by d.PBatch, d.RMN, c.claimtype
order by ExportDateTime




--RMN Outstanding --NO Upload Attempted
--NO Vault
--NO remaining RMN batches to be exported
--Showing batch count comparison
select distinct d.PBatch BatchName, d.rmn RMN, 
CASE
	When c.claimtype = 'C' then 'C'
	When c.claimtype <> 'C' then 'P'
	Else '?'
	END ClaimType, max(d.imagedatetime) ExportDateTime, 
count(distinct p.pbatch) CheckedInBatchCount,
count(distinct s.kbatch) ExportedBatchCount
from document d
left join customerCheckIn c
on d.RMN = c.RMN
left join PhysicalBatch p
on d.RMN = p.RMN
left join Stats s
on d.RMN = s.RMN
where ftpstime is null and comments is null 
and ImageDateTime >= '2019-01-01'
and ImageDateTime < '2020-05-01'
and (d.PBatch like '01%' or d.PBatch like '02%')
--below to exclude Vault
and d.RMN not like '101%'
and exists (select * from stats where d.PBatch = kbatch)
and not exists (select * from document where d.PBatch = pbatch and ftpstime is not null)
and not exists (select * from document where d.PBatch = pbatch and Comments is not null)
group by d.PBatch, d.RMN, c.claimtype
order by ExportDateTime




--RMN Outstanding --NO Upload Attempted
--NO Vault
--NO remaining RMN batches to be exported
--NOT showing batch count comparison
select distinct d.PBatch BatchName, d.rmn RMN, 
CASE
	When c.claimtype = 'C' then 'C'
	When c.claimtype <> 'C' then 'P'
	Else '?'
	END ClaimType, max(d.imagedatetime) ExportDateTime
--count(distinct p.pbatch) CheckedInBatchCount,
--count(distinct s.kbatch) ExportedBatchCount
from document d
left join customerCheckIn c
on d.RMN = c.RMN
left join PhysicalBatch p
on d.RMN = p.RMN
left join Stats s
on d.RMN = s.RMN
where ftpstime is null and comments is null 
and ImageDateTime >= '2019-01-01'
and ImageDateTime < '2020-05-01'
and (d.PBatch like '01%' or d.PBatch like '02%')
--below to exclude Vault
and d.RMN not like '101%'
and exists (select * from stats where d.PBatch = kbatch)
and not exists (select * from document where d.PBatch = pbatch and ftpstime is not null)
and not exists (select * from document where d.PBatch = pbatch and Comments is not null)
group by d.PBatch, d.RMN, c.claimtype
having count(distinct p.pbatch) = count(distinct s.kbatch)
order by ExportDateTime



select distinct pbatch from PhysicalBatch where rmn = '376VB0516186090D'

select distinct Kbatch from Stats where rmn = '376VB0516186090D'

select * from document where pbatch = '02200581208701'