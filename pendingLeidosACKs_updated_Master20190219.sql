--this is it
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
and s.insertdate < '2019-02-19'
and d.ETime < '2019-02-19'
and exists (select * from dmhsFTPDetails where s.batchname = batchname and ETime is not null)
and exists (select * from smsDCSMapping where s.batchname = batchname and ackTime is null)
group by convert(date, d.ETime, 101), s.batchname, s.veteranID, s.ackTime, s.errTime, p.cordest, s.status, s.xmlModified, cd.packageError



select * from LeidosACKResults20190219 where batchtype = 'NCC'

--28180
select * from smsdcsmapping where batchname = '04190180500501'
select * from LeidosACKResults20190214
group by packetid
having count(*) > 1
where errtime is not null



select * from smsdcsmapping where batchname = '04190100500501' and acktime is not null
--04190420009401.zip
--04190420009501.zip

--04190100500501.zip
--04190020009601.zip
--04190070006801.zip

--delete from smsDCSMapping where batchname = '04190070006801' and acktime is null

 select * from smsDCSMapping where batchname = '04190070006801' and acktime is null