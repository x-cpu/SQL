use DVA
select * from document where dcsid = 'HAJZ5SOIQO1H7'
select * from manifestDCS where dcsid = 'HAJZ5SOIQO1H7'
select * from CustomerDATA where dcsid = 'HAJZ5SOIQO1H7'

HAJMTTRKSS3Q03
HA452KCQBQTDAL
HA9KR8T9KN7ONB
HADWXUS5LQ0P5Y
HATS5UEPS50I5P

select * from customerdata where pbatch = '021234000213'
select * from manifestDCS where pbatch = '021234000213'
select * from manifestDCS where rmn = '325VB11301200548B'
select * from customerCheckIn where rmn = '325VB11301200548B'

select distinct dcsID from manifestDCS where rmn = '376VB1210120084A' and dcsID not in
(select distinct dcsID from CustomerDATA)

select * from document where dcsid = 'HAPKOIYZF0PUH0'

update Document
set dcsID = 'HAJZ5SOIQO1H7I'
where dcsID = 'HAJZ5SOIQO1H7'

update CustomerDATA
set rmn = '325VB1130120054B'
where RMN = '325VB11301200548B'

select * from stats_ibml where kbatch = '02123420012901'

update CustomerDATA
set dcsID = 'HA49H7MBKZ9BJK'
where rmn = '318VB1129120007G' and syskey = '129727' and Firstname = 'joshua'

select * from CustomerDATA where filenumber = '262497969'
select * from Document where dcsID = 'HA1EM377CWQT9R'

258714645
262497969

select * from customerCheckIn where rmn = '316VB1206129112D'
select * from customerCheckIn where trackingno = '1ZA3649E0341969112'


select * from manifestdcs where rmn = '316VB0115134709D'