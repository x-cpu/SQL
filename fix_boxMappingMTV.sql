update boxmapping set shipmentno = '7',  palettewithinshipment = '1 ' where palette = '146'
update boxmapping set shipmentno = '7',  palettewithinshipment = '2 ' where palette = '147'
update boxmapping set shipmentno = '7',  palettewithinshipment = '3 ' where palette = '148'
update boxmapping set shipmentno = '7',  palettewithinshipment = '4 ' where palette = '149'
update boxmapping set shipmentno = '7',  palettewithinshipment = '5 ' where palette = '150'
update boxmapping set shipmentno = '7',  palettewithinshipment = '6 ' where palette = '151'
update boxmapping set shipmentno = '7',  palettewithinshipment = '7 ' where palette = '152'
update boxmapping set shipmentno = '7',  palettewithinshipment = '8 ' where palette = '153'
update boxmapping set shipmentno = '7',  palettewithinshipment = '9 ' where palette = '154'
update boxmapping set shipmentno = '7',  palettewithinshipment = '10 ' where palette = '155'
update boxmapping set shipmentno = '7',  palettewithinshipment = '11 ' where palette = '156'
update boxmapping set shipmentno = '7',  palettewithinshipment = '12 ' where palette = '157'
update boxmapping set shipmentno = '7',  palettewithinshipment = '13 ' where palette = '158'
update boxmapping set shipmentno = '7',  palettewithinshipment = '14 ' where palette = '159'
update boxmapping set shipmentno = '7',  palettewithinshipment = '15 ' where palette = '160'
update boxmapping set shipmentno = '7',  palettewithinshipment = '16 ' where palette = '161'
update boxmapping set shipmentno = '7',  palettewithinshipment = '17 ' where palette = '162'
update boxmapping set shipmentno = '7',  palettewithinshipment = '18 ' where palette = '163'
update boxmapping set shipmentno = '7',  palettewithinshipment = '19 ' where palette = '164'
update boxmapping set shipmentno = '7',  palettewithinshipment = '20 ' where palette = '165'
update boxmapping set shipmentno = '7',  palettewithinshipment = '21 ' where palette = '166'
update boxmapping set shipmentno = '7',  palettewithinshipment = '22 ' where palette = '167'
update boxmapping set shipmentno = '7',  palettewithinshipment = '23 ' where palette = '168'
update boxmapping set shipmentno = '7',  palettewithinshipment = '24 ' where palette = '169'
update boxmapping set shipmentno = '7',  palettewithinshipment = '25 ' where palette = '170'



select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '2'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO

select * from boxmapping where shipmentno = '2'


select * from physicalbatch where PBatch = '02132181302401'