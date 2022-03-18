
---main updated

select distinct c.dcsID, c.BoxType, T.BoxNO, T.shipmentno, T.PaletteWithinShipment
                            FROM (select distinct BoxNO, PaletteWithinShipment, shipmentno
                            from CMPBoxmapping where shipmentno = '48') T
                            left join CMPBoxmapping c
                            on T.BoxNO = c.BoxNO
                            order by T.PaletteWithinShipment, T.BoxNO


select * from CMPBoxmapping where BoxNO = 'c17875'


--update CMPBoxmapping
--set shipmentno = '44', PaletteWithinShipment = '1', palette_date = '2017-03-08'
--where BoxNO = 'c17871'

--update CMPBoxmapping
--set shipmentno = '45', PaletteWithinShipment = '1', palette_date = '2017-03-08'
--where BoxNO = 'c17872'

--update CMPBoxmapping
--set shipmentno = '46', PaletteWithinShipment = '1', palette_date = '2017-03-08'
--where BoxNO = 'c17873'

--update CMPBoxmapping
--set shipmentno = '47', PaletteWithinShipment = '1', palette_date = '2017-04-13'
--where BoxNO = 'c17874'

--update CMPBoxmapping
--set shipmentno = '48', PaletteWithinShipment = '1', palette_date = '2017-04-13'
--where BoxNO = 'c17875'



select * from CMPBoxmapping where BoxNO = 'c17870'


select distinct BoxNO, PaletteWithinShipment, shipmentno
                            from CMPBoxmapping where shipmentno = '1' and PaletteWithinShipment = '5'

--main good for report
select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from CMPBoxmapping as a
join CMPBoxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '8'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO


--main good for report
select distinct dcsID, BoxType,  BoxNO, shipmentno, PaletteWithinShipment 
from CMPBoxmapping 
where shipmentno = '6'
group by dcsID, BoxType, BoxNO, shipmentno, PaletteWithinShipment
order by PaletteWithinShipment, BoxNO

--main good for report
select distinct c.dcsID, c.BoxType, T.BoxNO, c.PaletteWithinShipment
FROM
(select distinct BoxNO
from CMPBoxmapping 
where shipmentno = '3') T
left join CMPBoxmapping c
on T.BoxNO = c.BoxNO
order by c.PaletteWithinShipment, T.BoxNO

---main updated
select distinct c.dcsID, c.BoxType, T.BoxNO, T.PaletteWithinShipment
FROM
(select distinct BoxNO, PaletteWithinShipment
from CMPBoxmapping 
where shipmentno = '1') T
left join CMPBoxmapping c
on T.BoxNO = c.BoxNO
order by T.PaletteWithinShipment, T.BoxNO

--count boxes by shipment#
select PaletteWithinShipment Pallet, count(distinct BoxNO) #ofBoxes
from CMPBoxmapping
where shipmentno = '1'
group by PaletteWithinShipment
order by PaletteWithinShipment




select * from CMPBoxmapping where dcsid = 'DCSID031423706267010012'

group by dcsID, BoxType, BoxNO, shipmentno, PaletteWithinShipment
order by PaletteWithinShipment, BoxNO


select * from CMPBoxmapping where shipmentno = '15' and PaletteWithinShipment = '21'


--main good for report
select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from CMPBoxmapping as a
join CMPBoxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '2'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO

---warehouse JD
select distinct b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from CMPBoxmapping as a
join CMPBoxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '4'
--and (b.PaletteWithinShipment >= '12') and (b.PaletteWithinShipment <= '12')
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO





select distinct PaletteWithinShipment, count(distinct boxno) from CMPBoxmapping where shipmentno = '6'
group by PaletteWithinShipment order by PaletteWithinShipment



select *



select * from CMPBoxmapping where shipmentno = '4'

select * from CMPBoxmapping where BoxNO = 'c2525'

update CMPBoxmapping
set palette = null, shipmentno = null, PaletteWithinShipment = null, palette_date = null
where boxno = 'C2525'


select count(distinct boxno), PaletteWithinShipment from CMPBoxmapping where shipmentno = '2' 
group by PaletteWithinShipment
order by PaletteWithinShipment




Please investigate the following boxes that will not map to a pallet in CMP check out:
Box#: 2388
Box#: 2276
