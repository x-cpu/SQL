--main good for report
select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '124'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO


--2017
select distinct c.dcsID, c.BoxType, T.BoxNO, T.shipmentno, T.PaletteWithinShipment
FROM
(select distinct BoxNO, PaletteWithinShipment, shipmentno
from Boxmapping 
where shipmentno = '130') T
left join Boxmapping c
on T.BoxNO = c.BoxNO
order by T.PaletteWithinShipment, T.BoxNO


--2017 box count to pallet
select T.shipmentno, T.PaletteWithinShipment, count(distinct T.BoxNO) #ofBoxes
FROM
(select distinct BoxNO, PaletteWithinShipment, shipmentno
from Boxmapping 
where shipmentno = '130') T
left join Boxmapping c
on T.BoxNO = c.BoxNO
group by T.shipmentno, T.PaletteWithinShipment
order by T.shipmentno, T.PaletteWithinShipment



--2017 all box to pallet
select distinct T.shipmentno, T.PaletteWithinShipment, T.BoxNO, c.BoxType
FROM
(select distinct BoxNO, PaletteWithinShipment, shipmentno
from Boxmapping 
where shipmentno = '130') T
left join Boxmapping c
on T.BoxNO = c.BoxNO
group by T.shipmentno, T.PaletteWithinShipment, T.BoxNO, c.BoxType
order by T.PaletteWithinShipment, T.BoxNO



--2017 specific box to pallet
select distinct T.shipmentno, T.PaletteWithinShipment, T.BoxNO, c.BoxType
FROM
(select distinct BoxNO, PaletteWithinShipment, shipmentno
from Boxmapping 
where shipmentno = '130' and PaletteWithinShipment = '17') T
left join Boxmapping c
on T.BoxNO = c.BoxNO
group by T.shipmentno, T.PaletteWithinShipment, T.BoxNO, c.BoxType
order by T.PaletteWithinShipment, T.BoxNO


select distinct c.dcsID, c.BoxType, T.BoxNO, T.shipmentno, T.PaletteWithinShipment
                            FROM (select distinct BoxNO, PaletteWithinShipment, shipmentno
                            from Boxmapping where shipmentno = '98') T
                            left join Boxmapping c
                            on T.BoxNO = c.BoxNO
                            order by T.PaletteWithinShipment, T.BoxNO

--main good for report
select count(distinct BoxNO)
from Boxmapping 
where shipmentno = '130'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO



---warehouse JD
select distinct b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '86'
and (b.PaletteWithinShipment >= '2') and (b.PaletteWithinShipment <= '2')
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO


--count boxes by type
select count(T.BoxNO) BoxCount, T.BoxType
FROM
(select distinct BoxNO,
case
	WHEN BoxType = 'ADMIN' then 'ADMIN'
	WHEN BoxType = 'STR' then 'STR'
	END
	as 'BoxType'
from Boxmapping
where shipmentno >= '1' and shipmentno <= '1'
group by BoxNO, BoxType) T
group by T.BoxType


select * from Boxmapping where boxno = '171804'

select distinct tb.BatchName, tb.BatchDesc, dv.RMN, (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboScanDate from TurboscanNG1.dbo.Batches tb
join dva.dbo.PhysicalBatch dv
on tb.batchname = dv.PBatch
where tb.WFStep = '6' and dv.RMN like '314%'
order by TurboScanDate

select * from boxmapping where boxno in 
(select distinct boxno from boxmapping where shipmentno = '65')
and shipdate is null and trackingno is null


select * from Boxmapping where shipmentno = '65'
select * from Boxmapping where boxno = '128087'

-- good for boxno lookup 
select distinct BoxNO, dcsID, shipmentno, PaletteWithinShipment Pallet, palette_date, insertdate DCSIDCheckout_Date, CheckoutOperID 
from Boxmapping where boxno = '128087'
order by boxno, shipmentno, PaletteWithinShipment, insertdate

-- good for dcsid lookup 
select distinct  dcsID, BoxNO, shipmentno, PaletteWithinShipment Pallet, palette_date, insertdate DCSIDCheckout_Date, CheckoutOperID 
from Boxmapping where dcsID = 'HYA4PF10MU7EDD'
order by dcsID, boxno, shipmentno, PaletteWithinShipment, insertdate





select distinct a.dcsID, a.BoxType,  a.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where a.BoxNO = '128087'
group by a.dcsID, a.BoxType, a.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, a.BoxNO




select * from PhysicalBatch where pbatch in (
'02142840400901',
'02142840401201',
'02142840401204',
'02142840401301',
'02142840401903',
'02142840402203',
'02142840001604',
'02142840402504',
'02142860200103',
'02142860000206',
'02142860200203',
'02142860400203',
'02142860400205',
'02142860000505',
'02142860200405',
'02142860001104',
'02142860001201',
'02142860200802')



select * from document where pbatch = '02142860003201'


select * from pobox








select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '60'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO





select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where b.shipmentno = '59'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO


select * from CMPBoxmapping


select distinct a.dcsID, a.BoxType,  b.BoxNO, b.shipmentno, b.PaletteWithinShipment 
from Boxmapping as a
join Boxmapping as b
on a.boxno = b.BoxNO
where a.dcsID = 'HFCOOWLIBE9RM4'
group by a.dcsID, a.BoxType, b.BoxNO, b.shipmentno, b.PaletteWithinShipment
order by b.PaletteWithinShipment, b.BoxNO

select  distinct d.ImageID,  cd.FileNumber, cd.Lastname, cd.Firstname, cd.MiddleInitial MI, cd.Pbatch, cd.RMN, 
                            d.received_date, d.ftpstime UploadDateTime, d.bestcopy, d.NumPages, d.Form526Data
                            --from CustomerDATA cd 
                            from document d
							--right join document d
                            left join CustomerDATA cd
							on d.dcsID = cd.dcsID
                            where d.dcsID = 'HFCOOWLIBE9RM4'
							group by d.ImageID, cd.FileNumber, cd.Lastname, cd.Firstname, cd.MiddleInitial, d.Pbatch, cd.RMN, 
                            d.received_date, d.ftpstime, d.bestcopy, d.NumPages, d.Form526Data
                            order by imageid


select  distinct d.ImageID, cd.FileNumber, cd.Lastname, cd.Firstname, cd.MiddleInitial MI, d.Pbatch
                            --from CustomerDATA cd 
                            from document d
							--right join document d
                            left join CustomerDATA cd
							on d.dcsID = cd.dcsID
                            where d.dcsID = 'HFCOOWLIBE9RM4'
							group by d.ImageID, cd.FileNumber, cd.Lastname, cd.Firstname, cd.MiddleInitial, d.Pbatch
                            order by imageid

select BoxType, Pbatch, RMN, dcsID, BoxNO, ShipmentNO, PaletteWithinShipment Pallet, TrackingNO, insertdate CheckOutDateTime, ShipDate, operID CheckOutOperator from Boxmapping where dcsid = 'HFCOOWLIBE9RM4'


select * from FTPDetails where batchname like '02%'

select  distinct imageid, max(numpages) from document where ftpstime > '2013-01-01 0:0:0' and numpages > 1000 group by ImageID


                                            031435606170   
select * from PhysicalBatch where pbatch = '03143560617999'
select * from cmpcheckin
select * from manifestDCS where pbatch like '03143560617%'


select * from manifestDCS where rmn = '314vb0516141328o'

select * from manifestDCS where dcsID = 'HI5YU8YNBFQCRS'
select * from Document where dcsID = '2HI5YU8YNBFQCRS'
select * from manifestDCS where dcsID = 'HI5YU8YNBFQCRS'

select * from cmprecon where DocumentStatus <> 'upload'

select * from document where pbatch like '03%' and ImageDateTime > '2014-08-08 15:00:00'

select distinct pobox from pobox
06/09/2014


select distinct BoxNO, PaletteWithinShipment, palette_date  from Boxmapping where shipmentno = '47' 
group by PaletteWithinShipment, palette_date, BoxNO  
order by palette_date 

select  distinct PaletteWithinShipment, boxno, palette_date  from Boxmapping where shipmentno = '47' 
group by PaletteWithinShipment, palette_date, BoxNO  
order by palette_date 

select * from Boxmapping where boxno = '114932'


select distinct BoxNO  from Boxmapping where shipmentno = '47' 
--group by PaletteWithinShipment, palette_date, BoxNO  
order by palette_date 



select distinct BoxNO, PaletteWithinShipment, insertdate from Boxmapping where shipmentno = '47' 
--and PaletteWithinShipment = '16'
order by insertdate



select distinct BoxNO, PaletteWithinShipment, palette_date from Boxmapping where shipmentno = '47' 
--and PaletteWithinShipment = '16'
order by palette_date

select distinct BoxNO, PaletteWithinShipment from Boxmapping where shipmentno = '47' 
--group by  BoxNO, PaletteWithinShipment, insertdate
order by PaletteWithinShipment, max(insertdate) asc

select * from Boxmapping where boxno = '114969'


select * from Boxmapping where boxno = '114006'

