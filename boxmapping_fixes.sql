select * from Boxmapping where BoxNO = '55238'
select * from Boxmapping where BoxNO in (57389,58305,58168,57771)

select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '25'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO


update boxmapping
set shipmentno = '21'
where boxno in (49172,48962,49743,49180,49110,48856)


update boxmapping
set shipmentno = '24', palettewithinshipment = null
where boxno  in (57389,58305,58168,57771)

select dcsid, boxtype, boxno, shipmentno, palettewithinshipment from Boxmapping where boxno in (
'58768',
'58771',
'59112',
'59188',
'59211',
'59214')



update boxmapping
set shipmentno = '24', palettewithinshipment = null
where boxno  in (57389,58305,58168,57771)


select * from Boxmapping where boxno in (
'58768',
'58771',
'59112',
'59188',
'59211',
'59214')



update boxmapping
set shipmentno = '25', palettewithinshipment = null
where boxno  in (
'58768',
'58771',
'59112',
'59188',
'59211',
'59214')


select * from boxmapping
where boxno in (
'93639',
'93982',
'16705',
'93603',
'93564',
'93636',
'93606',
'93604') and palettewithinshipment is not null


update Boxmapping 
set PaletteWithinShipment = '5' where boxno = '93948'


select * from Boxmapping where boxno = '93948'


update Boxmapping
set PaletteWithinShipment = '3', shipmentno = '59'
where boxno in (
'129731',
'129732',
'129733',
'129767',
'129768',
'129807',
'129809',
'129810',
'129811',
'129812',
'129815',
'129816',
'129817',
'129904',
'129905',
'129906',
'129907',
'129908',
'129909',
'129910',
'129911',
'129912',
'129913',
'129914',
'129915',
'129916',
'129947',
'129954',
'129955',
'129956',
'129958',
'129962',
'129966',
'129970',
'129972',
'129980',
'129981',
'129982',
'129983',
'129984',
'129985',
'129986',
'129987',
'129994',
'129997',
'129998',
'129999',
'130000')