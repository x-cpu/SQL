


--upload
select distinct c.imageid, c.DCSID from cmprecon c
join document d
on c.DCSID = d.dcsID
where c.insertdate < '2014-10-01 0:0:0' and c.DocumentStatus = 'upload'
and c.DCSID in (select distinct dcsid from document where (pbatch like '03%' or pbatch like '04%' or pbatch like '05%' ) and ftpstime > '2014-10-01 0:0:0')
and c.ImageID in (select distinct ImageID from FTPError where insertdate < '2014-10-01 0:0:0')
and c.DCSID not in (select distinct dcsid from stpetedcsid)



--error
select distinct c.imageid, c.DCSID from cmprecon c
join document d
on c.DCSID = d.dcsID
where c.insertdate < '2014-10-01 0:0:0'  and c.DocumentStatus = 'upload'
and c.DCSID in (select distinct dcsid from document where (pbatch like '03%' or pbatch like '04%' or pbatch like '05%' ) and ftpstime is null)
and c.ImageID in (select distinct ImageID from FTPError where insertdate <= '2014-10-01 0:0:0')
and c.ImageID in (select distinct ImageID from FTPError where insertdate >= '2014-10-01 0:0:0')
and c.DCSID not in (select distinct dcsid from stpetedcsid)


--pending OUTSIDE
select distinct c.imageid, c.DCSID 
---into nonstpetedcsid
from cmprecon c
join document d
on c.DCSID = d.dcsID
where c.insertdate < '2014-10-01 0:0:0' and c.DocumentStatus = 'upload'
and c.DCSID in (select distinct dcsid from document where (pbatch like '03%' or pbatch like '04%' or pbatch like '05%' ) and ftpstime is null)
and c.ImageID in (select distinct ImageID from FTPError where insertdate <= '2014-10-01 0:0:0')
and c.ImageID not in (select distinct ImageID from FTPError where insertdate >= '2014-10-01 0:0:0')
order by  c.DCSID

DCSID031419006063010027

select * from document where dcsid = 'DCSID031419006063010027'

select * from document where imageid = 'CACI_CMP_141912901P001001347'

select * from FTPError where imageid = 'CACI_CMP_141912901P001001347'

select sum(d.numpages), d.imageid, d.dcsid from document d
join nonstpetedcsid n
on d.ImageID = n.ImageID 
group by d.imageid, d.dcsid
order by d.dcsid


DCSID041421300013010061

select * from cmprecon where DCSID = 'DCSID041421300013010061'

DCSID031422106340010022