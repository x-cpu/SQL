---needs to be 817 864
select sum(_of_images) from webNovx12

select dcs_id, count(*) from webNovx12 group by dcs_Id having count(*) > 1


select * from webnovx12 where dcs_id in ('H8RHKEO3LBITSK'
,'H98KTM0Y1WI3OB')

select * from customerdata where dcsid in ('H8RHKEO3LBITSK'
,'H98KTM0Y1WI3OB')

select * from document  where dcsid in ('H8RHKEO3LBITSK'
,'H98KTM0Y1WI3OB')

select * from document where pbatch ='02123060000602'


--delete  from webnovx12 where dcs_id = 'H98KTM0Y1WI3OB' and _of_documents = '1'
select * from webnovx12 where dcs_id = 'H8RHKEO3LBITSK' 

select * from manifestdcs where dcsid in 
(
select distinct dcsid from document where dcsid not in 
(select distinct dcs_id from webnovx12)
and ftpstime > '11/1/2012 0:0:0' and ftpstime <'11/30/2012 23:59:59'
)

select * from manifestdcs where rmn = '316VB1101122744D'

select * from manifestdcs where rmn in 
('325VB1101120068B',
'316VB1101122744D',
'316VB1101127439D')

1ZA3649E0342142744
1ZA3649E0340817439
1ZA4205F0398169042

H8ZYOYY39CFZM0
H8ZUOU97MITPP1
H8ZUKVY2JDW1NG
H8ZW60M8PNEGQQ







select *
from stats_ibml
where kbatch like '%355%31501'
order by kbatch


select *
from document where pbatch in (
'02123530024801',
'02123520003401')

select * from manifestdcs where rmn = '325vb1203120001b'

select * from Document where pbatch in (
'02123180007701')


select * from document where filenumber = '237963172'


update CustomerDATA
set filenumber = '417909099'
where filenumber = '41790099'


select * from document
where pbatch in (
'02123180007601',
'02123180007701',
'02123180007801')


select * from document where pbatch = '02123120002701'
select * from manifestDCS where rmn = '322VB1129120001D'

select * from document where dcsID = 'H9VOCEJPCTD5P3'

select * from customerdata where rmn = '376vb1213120232a'
update customerdata
set Shovboxno = '1441'
where Shovboxno = '1441HAO7X0LYNAAQZS'