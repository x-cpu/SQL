--November stuff

--dcsid dups
select dcs_id as dcsid, count(*) as #hits
into abc5
from webnovx12
group by dcs_id
having count(dcs_id) > 1


select * From abc5

--dcsid details for dups
select * 
--into abc6
from webnovx12
where dcs_id  in (select dcsid from abc5)
order by dcs_id


--rmn dups into web
select * from customerCheckIn
where rmn in (select rmn from abc5)


--rmn not in manifestdcs
select distinct tracking_number from abc5 where tracking_number not in (select distinct trackingno from manifestdcs)


select * 
from customerCheckIn
where trackingno in ('1ZA4205F0392636397,''1ZA4205F0392636397',
'1ZA410E40396573337',
'1ZA410E40396573337')

select *
from manifestDCS
where rmn in ('325VB1026120034B',
'308VB1107120001C') and dcsid = 'H8RHKEO3LBITSK' or dcsid = 'H98KTM0Y1WI3OB'

select * from customerdata
where dcsid in ('H8RHKEO3LBITSK','H98KTM0Y1WI3OB')

H8RHKEO3LBITSK
H98KTM0Y1WI3OB

select * from abc2 where tracking_number = '1ZA410E40396573337'
select * from manifestDCS where rmn = '308VB1107120001C'

update customerCheckIn
set rmn = '325VB1025120014Bx'
where trackingno = '1ZA4295F0399430882'


--total # affect by web checkin RMN dups
select (sum(_of_images)/2)
from abc2

select distinct dcsID from document
where ftpstime between '2012-11-01 0:0:0' and '2012-11-30 23:59:59' and dcsID not in (select distinct dcsid from manifestDCS)
order by dcsID







----DECEMBER stuff


select sum(_of_images)
from webDECx12
where processingfacility = 'newnan'
--1897588

--dcsid dups
select dcs_id as dcsid, count(*) as #hits
--into abc7
from webDECx12
group by dcs_id
having count(dcs_id) > 1

--dcsid details for dups
select * 
--into abc8
from web1212
where dcs_id  in (select dcsid from abc3)
order by dcs_id


--total # affect by web checkin RMN dups
--select (sum(_of_images)/2)
--from abc4

select sum(_of_images)
from abc7


drop table abc

--select * from manifestDCS where dcsID = 'HA447QTYXW80I'
--select * from manifestDCS where rmn = '316VB1128124387D'
--select * from customerCheckIn where rmn = '316VB1128124387D'

--rmn dups into web
select * from customerCheckIn
where rmn in (select rmn from abc8)

--rmn not in manifestdcs
select distinct tracking_number from abc8 where tracking_number not in (select distinct trackingno from customerCheckIn)

update customerCheckIn
set rmn = '325VB1026120032Bx'
where trackingno = '1ZA4205F0395129145'

select * from customerCheckIn where trackingno = '1ZA2455T0361761125'

select distinct trackingno from manifestDCS where trackingno in (
'1ZA2455T0261388700',
'1ZA2455T0361414910',
'1ZA2455T0361761125',
'1ZA2455T0362297671',
'1ZA3649E0340014387',
'1ZA3649E0341969112',
'1ZA4205F0394804488',
'1ZA4205F03949804488',
'1ZA4205F0395129145',
'1ZA4205F0395219145',
'1ZA4205F0395646595',
'1ZA4205F0399430882',
'1ZA4205F0399940885',
'1ZA4295F0399430882')

select * from customerCheckIn where RMN in (
'315VB1116120010A',
'316VB1128124387D',
'316VB1206129112D',
'325VB1025120014B',
'325VB1026120032B',
'325VB1029120041B',
'325VB1127120014B',
'325VB1129120030B')


select * from CustomerDATA
where FileNumber = '627050040'


select *
from abc8


selec