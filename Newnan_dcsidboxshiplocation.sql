
select distinct c.dcsID, c.BoxType, T.BoxNO, T.shipmentno, T.Location
FROM
(select distinct BoxNO, shipmentno,
case
when shipmentno in ('1','2','3','4','5','6','7','8','9','10','11','12','13',
'14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29',
'30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47',
'48','49','50','51','52','53','54','55','56','57','58','59',
'60','61','62','63','64','65','66','95','96','97') THEN 'San Jose'
when shipmentno in ('67','68','69','70','71','72','73','74','75','76','77','78','79','80',
'81','82','83','84','85','86','87','88','89','90','91','92','93','94','98','99','100','101','102','103') THEN 'English Station'
ELSE 'Newnan'
END as Location
from Boxmapping 
where shipmentno <= '103') T
left join Boxmapping c
on T.BoxNO = c.BoxNO
order by T. shipmentno, T.BoxNO

--20160310 creation date
select distinct T.BoxNO, T.shipmentno, c.PaletteWithinShipment Pallet, T.Location
--into docid.dbo.shipmentDCSreport20160310
FROM 
(select distinct BoxNO, shipmentno,
case
when shipmentno in ('1','2','3','4','5','6','7','8','9','10','11','12','13',
'14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29',
'30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47',
'48','49','50','51','52','53','54','55','56','57','58','59',
'60','61','62','63','64','65','66','95','96','97', '104', '105', '106', '107', '108') THEN 'San Jose'
when shipmentno in ('67','68','69','70','71','72','73','74','75','76','77','78','79','80',
'81','82','83','84','85','86','87','88','89','90','91','92','93','94','98','99','100','101','102','103') THEN 'English Station'
ELSE 'Newnan'
END as Location
from Boxmapping 
where shipmentno <= '108') T
left join Boxmapping c
on T.BoxNO = c.BoxNO and c.PaletteWithinShipment is not null
order by T. shipmentno, c.PaletteWithinShipment, T.BoxNO

select count(*), boxno from docid.dbo.shipmentDCSreport20160310
group by boxno
having count(*) > 1 

--2547530
select distinct c.dcsID, c.BoxType, T.BoxNO, T.shipmentno, T.Location, c.syskey
--into docid_dcsid2Location_cmp3
FROM
(select distinct BoxNO, shipmentno,
case
when shipmentno in ('1','2','3','4','5','6','7','8','9','10','11') THEN 'Louisville'
when shipmentno in ('12', '13', '14') THEN 'San Jose'
ELSE 'Newnan'
END as Location
from CMPBoxmapping 
where shipmentno <= '14') T
left join CMPBoxmapping c
on T.BoxNO = c.BoxNO
order by T. shipmentno, T.BoxNO



select distinct T.BoxNO, T.shipmentno, c.PaletteWithinShipment Pallet, T.Location
--into docid_dcsid2Location_cmp3
FROM
(select distinct BoxNO, shipmentno,
case
when shipmentno in ('1','2','3','4','5','6','7','8','9','10','11') THEN 'Louisville'
when shipmentno in ('12', '13', '14') THEN 'San Jose'
ELSE 'Newnan'
END as Location
from CMPBoxmapping 
where shipmentno <= '14') T
left join CMPBoxmapping c
on T.BoxNO = c.BoxNO and c.PaletteWithinShipment is not null
order by T. shipmentno, c.PaletteWithinShipment, T.BoxNO




--cmp3 2548314



--list no 2
select * from docid_dcsid2Location_cmp3 where DCSid  in (select distinct DCSid from docid.dbo.cmpdupe3)
--3141

--list no 2 revised part 2
select *  into from docid_dcsid2Location_cmp3 a where exists (select * from docid.dbo.cmpdupe3 b where a.dcsid = b.dcsid and a.boxtype = b.boxtype)
order by dcsid

--list no 2 revised part 3
select *  from docid_dcsid2Location_cmp3 a where exists (select * from docid.dbo.cmpdupesyskey  b where a.dcsid = b.dcsid and a.boxtype = b.boxtype and b.syskey < a.syskey)
order by dcsid

select * from docid.dbo.cmpdupesyskey 


select count(*) as cnt, DCSid, boxtype into docid.dbo.cmpdupe3  from docid_dcsid2Location_cmp3
group by DCSid, boxtype
having count(*) > 1


















---garbage


select * from docid_dcsid2Location_cmp2 where DCSid  in (select distinct DCSid from docid.dbo.cmpdupe)
and exists(select top(1) * from CMPBoxmapping cb where cb.dcsid = docid_dcsid2Location_cmp2.dcsid and cb.BoxType = docid_dcsid2Location_cmp2.BoxType and cb.boxno = docid_dcsid2Location_cmp2.boxno order by syskey desc)



select top(1) * from CMPBoxmapping cb where cb.dcsid = docid_dcsid2Location_cmp2.dcsid and cb.BoxType = docid_dcsid2Location_cmp2.BoxType order by syskey desc)

select * from docid_dcsid2Location_cmp2 where DCSid  in (select distinct DCSid from docid.dbo.cmpdupe) order by DCSid




select * from docid_dcsid2Location_cmp2 cmp2 where exists(select * from docid.dbo.cmpdupe where dcsid = cmp2.dcsid and boxtype = cmp2.boxtype)



select top(1) * from CMPBoxmapping cb where exists (select * from docid.dbo.cmpdupe cd where cb.dcsID = cd.dcsid)
order by syskey desc


select distinct dcsid, BoxType into docid.dbo.cmpdupe2 from docid.dbo.cmpdupe cd where exists (select top(1) * from CMPBoxmapping cb where cb.dcsid = cd.dcsid and cb.boxtype = cd.boxtype order by syskey desc)


select * from docid_dcsid2Location_cmp2 where DCSid  in (select distinct DCSid from docid.dbo.cmpdupe)


select * from docid_dcsid2Location_cmp2 cmp2
left join docid.dbo.cmpdupe2 c2
on cmp2.dcsid = c2.dcsid
where  cmp2.boxtype = c2.boxtype and cmp2.dcsid = c2.dcsid
order by cmp2.dcsID