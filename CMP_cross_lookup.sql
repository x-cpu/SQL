select count(imageid), sum(numpages) from document where ftpstime >= '2014-05-01 0:0:0' and ftpstime <= '2014-05-30 23:59:59.999' and pbatch like '03%'

--cmp upload counts by day
select  cast(ftpstime as date) UploadDate, count(imageid) TotalDocs, sum(numpages) TotalImages from document 
where pbatch like '03%' and ftpstime >= '2014-05-01 0:0:0' and ftpstime <= '2014-06-17 23:59:59.999'
group by cast(ftpstime as date) 

select distinct pobox from PhysicalBatch where pbatch like '03%'

select sum(NumPages) from Document where pbatch in (
select distinct kbatch from stats where kbatch like '03%') 


select * from FTPDetails where batchname in (
'03132600600201',
'03140160600501',
'03141470612201',
'03141560604601')



select * from Document where PBatch in (
'03132600600201',
'03140160600501',
'03141470612201',
'03141560604601')

use [TurboscanNG_ATL-VA-0004]
select * from Batches where BatchName like '03%'

use dva
select * from PhysicalBatch where pbatch like '03%' and pobox = 'St. Petersburg'

--by pobox CMP upload to portal
select f.batchname, p.POBox
from FTPDetails f
join PhysicalBatch p 
on f.batchname = p.PBatch
where p.PBatch like '03%' 
and p.pobox = 'Cleveland' 
or p.pobox = 'St. Petersburg'
and f.ETime > '2014-06-04 0:0:0' and f.AckTime is not null


select * from FTPDetails

--by pobox CMP upload to portal on 
select f.batchname, 'St. Petersburg' as POBox
from FTPDetails f
join CustomerDATA c
on f.batchname = c.PBatch
where c.PBatch like '03%' 
and c.ZipCode like '34%'
or c.ZipCode like '33%'
or c.ZipCode like '32%'
and f.AckTime is not null
and f.ETime > '2014-06-04 0:0:0'


--by pobox CMP upload to portal on 
select f.batchname, f.ETime, 'St. Petersburg' as POBox
from FTPDetails f
inner join CustomerDATA c
on f.batchname = c.PBatch
where c.PBatch like '03%' 
and c.ZipCode like '34%'
or c.ZipCode like '33%'
or c.ZipCode like '32%'
and f.AckTime is not null
and f.ETime > '2014-06-04 0:0:0'



--by pobox CMP upload to portal on 
select f.batchname, f.ETime, 'St. Petersburg' as POBox
from FTPDetails f
inner join CustomerDATA c
on f.batchname = c.PBatch
where c.PBatch like '03%' 
and (c.ZipCode like '34%'
or c.ZipCode like '33%'
or c.ZipCode like '32%')
and f.AckTime is not null
and f.ETime > '2014-05-18 0:0:0'

select f.batchname, f.ETime, 'St. Petersburg' as POBox
from FTPDetails f
inner join CustomerDATA c
on f.batchname = c.PBatch
where c.PBatch like '03%'  and c.ZipCode in (
(select distinct zipcode from zipcoderoj where  roj like '%peter%'))
and f.AckTime is not null
and f.ETime > '2014-05-18 0:0:0'

select * from PhysicalBatch where pobox = 'cleveland'


select distinct p.pobox, f.batchname + '.zip' zipfile, d.dcsID
from PhysicalBatch p
join FTPDetails f
on p.PBatch = f.batchname
join document d
on p.PBatch = d.PBatch
where p.pbatch like '03%'
and f.AckTime is not null




select distinct p.POBox,
f.batchname  zipfile, d.dcsID, p.invtime inventoryTime, f.ETime uploadDate
from PhysicalBatch p
join FTPDetails f
on p.PBatch = f.batchname
join document d
on p.PBatch = d.PBatch
where p.pbatch like '03%'
and f.AckTime is not null 
and p.POBox in  ('St. Petersburg','5235-Unsolicited','5236-Solicited')
order by p.InvTime


select * from physicalbatch where pobox like 'st%'

---these are bad batches we need to talk to chelsa
select * from ftpdetails where batchname  ='03132970600101'
03132970600101

select distinct pobox =
CASE p.pobox
when '5236-Solicited' then 'St. Petersburg'
when '5235-Unsolicited' then 'St. Petersburg'
else p.pobox
end,
f.batchname + '.zip' zipfile, d.dcsID, p.invtime inventoryTime, f.ETime uploadDate
from PhysicalBatch p
join FTPDetails f
on p.PBatch = f.batchname
join document d
on p.PBatch = d.PBatch
where p.pbatch like '03%'
and f.AckTime is not null and p.POBox in  ('St. Petersburg','5235-Unsolicited','5236-Solicited')
order by p.InvTime

select * from pobox 

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


select COUNT (DISTINCT DCSID) from document where pbatch in 
(select distinct batchname  from ftpdetails where batchname in 
(select distinct pbatch from customerdata where zipcode in 
(select distinct zipcode from zipcoderoj where  roj like '%peter%'))
and acktime is not null
)

select * from FTPDetails where batchname = '03141410600101'


select * from CustomerDATA where pbatch like '03%' and ZipCode <> '40202' order by datetimestamp

select * from FTPDetails where batchname = '03141390600401'

select * from ZipcodeRoj where zipcode = '33708'

select * from pobox where pobox = 'St. Petersburg'

SELECT p.SysKey
FROM ZipcodeRoj z
LEFT JOIN pobox p
ON z.ROJ = p.pobox
WHERE z.ZipCode = 33708

select * from ZipcodeRoj
select * from physicalbatch where pbatch = '03141280601601'
select * from physicalbatch where pobox = 'st. petersburg'


select * from FTPError

select * from PhysicalBatch where PBatch in (
'03141430604501',
'03141390601801',
'03141420603001',
'03141470605901')

select * from CustomerDATA where pbatch = '03141390600401'

select * from pobox where pobox = 'St. Petersburg'


select * from ZipcodeRoj where roj like 'st.%'
select * from ZipcodeRoj where zipcode like '34%' or zipcode like '32%' or zipcode like '33%'




use TurboscanNG1
select * from batches where batchname = '03141500602401'


select b.batchname 
from TurboscanNG1.dbo.batches b
join dva.dbo.PhysicalBatch pb
on b.batchname = pb.PBatch
--where b.WFStep = 3 
and pb.POBox = 'St. Petersburg'