--by VET
select distinct convert(date, d.ETime, 101) UploadDate, s.batchname + '.zip' BatchName, s.veteranID PacketID,
CASE
	When s.batchname like '17%' then 'NCC'
	When s.batchname like '12%' then 'FTU'
	When p.cordest = 'vtg' then 'VetsGov'
	When p.cordest is null then 'Regular'
	When p.cordest = 'PMC' then 'PMC'
	When p.cordest = 'BVA' then 'BVA'
	Else 'null'
	END  BatchType, s.ackTime, s.errTime, cd.packageError ErrorMsg, s.Status, s.xmlModified xmlTime 
	--into LeidosACKResults20190219
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join physicalbatch p
on s.batchname = p.pbatch
left join dmhsCMPxmldownload cd
on s.veteranID = cd.comments and cd.type = '.ERR'
where s.insertdate >= '2019-01-13'
and s.ackTime is null
and s.insertdate < '2019-02-21'
and d.ETime < '2019-02-21'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and exists (select * from smsDCSMapping where s.batchname = batchname and ackTime is null)
--and exists (select * from ncc_split where s.batchname = SUBSTRING(batchname, 0, 15))
group by convert(date, d.ETime, 101), s.batchname, s.veteranID, s.ackTime, s.errTime, p.cordest, s.status, s.xmlModified, cd.packageError

--summary
select distinct convert(date, d.ETime, 101) UploadDate, s.batchname + '.zip' BatchName,
CASE
	When s.batchname like '17%' then 'NCC'
	When s.batchname like '12%' then 'FTU'
	When p.cordest = 'vtg' then 'VetsGov'
	When p.cordest is null then 'Regular'
	When p.cordest = 'PMC' then 'PMC'
	When p.cordest = 'BVA' then 'BVA'
	Else 'null'
	END  BatchType, s.ackTime, s.errTime, cd.packageError ErrorMsg, s.Status, s.xmlModified xmlTime 
	--into LeidosACKResults20190219
from smsDCSMapping s
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join physicalbatch p
on s.batchname = p.pbatch
left join dmhsCMPxmldownload cd
on s.veteranID = cd.comments and cd.type = '.ERR'
where s.insertdate >= '2019-01-13'
--and s.ackTime is null
and s.insertdate < '2019-02-21'
and d.ETime < '2019-02-21'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and exists (select * from smsDCSMapping where s.batchname = batchname and ackTime is null)
--and exists (select * from ncc_split where s.batchname = SUBSTRING(batchname, 0, 15))
group by convert(date, d.ETime, 101), s.batchname, s.ackTime, s.errTime, p.cordest, s.status, s.xmlModified, cd.packageError


select * from LeidosACKResults20190219 where batchtype = 'ncc'
--28051

select veteranid, acktime
from smsDCSMapping s
where exists (select * from ncc_split where s.batchname = SUBSTRING(batchname, 0, 15))
and acktime is null

--2157

select distinct l.batchname, count(distinct s.veteranID) Packets
from LeidosACKResults20190219 l
left join smsDCSMapping s
on SUBSTRING(l.batchname, 0, 15) = SUBSTRING(s.batchname, 0, 15)
where l.batchname like '17%'
and not exists (select * from ncc_split where SUBSTRING(l.batchname, 0, 15) = SUBSTRING(batchname, 0, 15))
group by l.batchname

--select * from dmhsFTPDetails where batchname = '17190380000002'

--29