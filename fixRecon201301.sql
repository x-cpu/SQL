drop table sheet1$

select SUM(filesize) / SUM(uploadprocesstime) from Document where ftpstime > '2/1/2013 0:0:1'


select SUM(filesize) / SUM(uploadprocesstime) from Document where ftpstime between '1/31/2013 14:15:00' and '1/31/2013 14:20:59' 


select * from Stats_IBML where kbatch = '02130250003204'

select * from sheet1$

select dcs_id, count(*) from sheet1$
group by dcs_id
having count(*) > 1


--check for the bad rmns
select * from sheet1$ where _of_images is not null and processingfacility = 'newnan' and tracking_number not in
(select distinct trackingno from manifestdcs)

select sum(_of_images) from sheet1$ where  processingfacility = 'newnan' and upload_to_va_date between '2013-01-01 0:0:0' and '2013-01-31 23:59:59'
order by rmn

select distinct dcsid from document where ftpstime between '2013-01-01 0:0:0' and '2013-01-31 23:59:59' and dcsID not in
(select distinct dcsid from manifestDCS)

delete from customerCheckIn where trackingno in (
'1ZA3642V0395383227',
'1ZA3649E0395423948',
'1ZA3649E0396570',
'1ZA3649E97788623',
'1ZA3649EO399145788',
'1ZA5V621034005964')

select * from customerCheckIn where RMN in (
'322VB0116130001D',
'316VB0118130020B',
'316VB0118130021B',
'316VB0118130024B',
'316VB0118130022B',
'319VB0123130004D')


 --check for the bad dcsids
select * from sheet1$ where _of_images is not null and processingfacility = 'newnan' and dcs_id not in
(select distinct dcsID from manifestdcs)

select * from sheet1$ where _of_images is not null and processingfacility = 'newnan' and dcs_id not in
(select distinct dcsID from Document)

select * from document where db_accessadmin


select * from document where dcsID not in 
(select distinct dcsID from customerdata)

select distinct dcsID from Document where ftpstime between '2013-01-01 0:0:0' and '2013-01-31 23:59:59' and dcsID not in
( select distinct dcsID from CustomerDATA)

select * from sheet1$ where dcs_id in (
'HA452KCQBQTDAL',
'HA9KR8T9KN7ONB',
'HADWXUS5LQ0P5Y',
'HAJMTTRKSS3Q03',
'HATS5UEPS50I5P')

--newn
--3419699billing  ....64776

select * from document where ftpstime > '1/1/2013 0:0:0' and ftpstime < '1/31/2013 23:59:59.999' and dcsid not in 
(select distinct dcs_id from sheet1$ where  processingfacility = 'mt. vernon' and upload_to_va_date > '1/1/2013 0:0:0' and upload_to_va_date < '1/31/2013 23:59:59.999')

select 


select sum(_of_documents), sum(_of_images) from sheet1$ where processingfacility = 'newnan' and upload_to_va_date > '1/1/2013 0:0:0' and upload_to_va_date < '1/31/2013 23:59:59.999'

 and dcs_id not in
(select distinct dcsID from manifestdcs)

select * from customerCheckIn where rmn = '316VB0115130001B'
select * from manifestdcs where rmn = '316VB0115130001B'

update customerCheckIn
set RMN = '316VB0115130001Bdup'
where syskey = 2679