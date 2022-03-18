--shipped total STR document, total DCSID, and total Boxes
select count(d.imageid) NumDocs, count(distinct T.dcsID) NumDCSIDs, count(distinct T.boxno) NumBoxes
From 
(select distinct a.dcsID, b.boxno
from Boxmapping a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno >= '1'
and b.BoxType = 'STR'
group by a.dcsID, b.BoxNO) T
join document d
on T.dcsid = d.dcsid
where d.docidDoctype like 'STR%'
and (d.ImageID like '%p00%' or ImageID like '%p01%')
and d.dcsID = 'HZWTKTDVGIB34T'



--shipped total STR document, total DCSID, and total Boxes
select count(d.imageid) NumDocs, count(distinct T.dcsID) NumDCSIDs, count(distinct T.boxno) NumBoxes
From 
(select distinct a.dcsID, b.boxno
from Boxmapping a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno >= '1'
and b.BoxType = 'STR'
group by a.dcsID, b.BoxNO) T
join document d
on T.dcsid = d.dcsid
where d.docidDoctype like 'STR%'
and (d.ImageID like '%p00%' or ImageID like '%p01%')





select * from document where dcsid = 'HZWTKTDVGIB34T' and docidDoctype like 'STR%'




--shipped total DCSID and Boxes by ADMIN type
select count(distinct a.dcsID) NumDCSIDs, count(distinct b.boxno) NumBoxes
from Boxmapping a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno > '1'
and b.BoxType = 'ADMIN'

--shipped total DCSID and Boxes by STR type
select count(distinct a.dcsID) NumDCSIDs, count(distinct b.boxno) NumBoxes
from Boxmapping a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno > '1'
and b.BoxType = 'STR'


select * from Boxmapping where BoxType = 'str' and dcsid = 'HZWTKTDVGIB34T'

select * from Boxmapping where BoxNO = '133992'
select * from document where dcsid = 'HZWTKTDVGIB34T' and docidDoctype like 'STR%'