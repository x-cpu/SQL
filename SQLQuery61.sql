select trackingno, count(*) from customercheckin
group by trackingno
having count(*) > 1


select * from customercheckin where RMN = '318VB0129130008G'
select * from manifestDCS where RMN = '318VB0129130008G'


delete from customerCheckIn where syskey = '1658'


select * from customerCheckIn where rmn in
('308VB0114130803C',                                                                                                                                                                                                                                               
'309VB0115130005C',                                                                                                                                                                                                                                               
'318VB0110130002G',                                                                                                                                                                                                                                               
'325VB0204130002B')                  

select * from manifestdcs where rmn = '325VB0204130002B'
select * from customerCheckIn where rmn = '325VB0204130002B'

delete from customercheckin where syskey = 1479
1ZA410E40393425636


select * from document where dcsID not in 
(select distinct dcsID from customerdata)

select distinct dcsid from document where ftpstime between '2013-01-01 0:0:0' and '2013-01-31 23:59:59' and dcsID not in
(select distinct dcsid from manifestDCS)

(select distinct dcsid from Document 
where dcsID not in (select distinct dcsid from manifestDCS)
and ftpstime > '1/1/2013 0:0:1' and ftpstime < '1/31/2013 23:59:59'
)

(select distinct rmn from Document 
where rmn not in (select distinct rmn from manifestDCS)
and ftpstime > '1/1/2013 0:0:0' and ftpstime < '1/31/2013 23:59:59'
)

select * from manifestDCS where pbatch in  
(select distinct substring(PBatch, 1,12) from document where RMN = '315VB1231120011B')

update Document set RMN ='325VB1231120011B' where RMN =  '315VB1231120011B'
update customerdata set RMN ='325VB1231120011B' where RMN =  '315VB1231120011B'


(select distinct rmn from Document 
where rmn not in (select distinct rmn from manifestDCS)
and ftpstime > '1/1/2013 0:0:0' and ftpstime < '1/31/2013 23:59:59'
)
