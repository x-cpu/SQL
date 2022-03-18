
---lunnie fixese
(select distinct dcsid, rmn from Document 
where dcsID not in (select distinct dcsid from manifestDCS)
and ftpstime > '11/1/2013 0:0:1' and ftpstime < '11/30/2013 23:59:59')

--select * from customerCheckIn where rmn = '313VB0610130004K'
--select * from document where dcsid = 'HHRYQ7Y68COWLY'
--select * from manifestdcs where pbatch = '021316211001'
--select * from manifestdcs where trackingno = '1ZA3702RO394131234'
--select * from ts_audit where BatchName = '02131621100102'

(select distinct dcsid from Document 
where dcsID not in (select distinct dcsid from CustomerDATA)
and ftpstime > '11/1/2013 0:0:1' and ftpstime < '11/30/2013 23:59:59')

(select distinct rmn from Document 
where rmn not in (select distinct rmn from customercheckin)
and ftpstime > '9/1/2013 0:0:1' and ftpstime < '9/30/2013 23:59:59')


(select distinct dcsID from Document 
where dcsID not in (select distinct dcsID from CustomerDATA)
and ftpstime > '9/1/2013 0:0:1' and ftpstime < '9/30/2013 23:59:59')

select trackingno from customerCheckIn group by trackingno having count(trackingno) > 1 

/*TRY THIS ONE*/
select count(*), rmn from customercheckin group by rmn having count(*)> 1 and rmn in 
(select rmn from document where ftpstime > '9/1/2013 0:0:1' and ftpstime < '9/30/2013 23:59:59')


select count(*), dcsid from manifestDCS group by dcsID having count(*)> 1 and dcsID in 
(select dcsID from document where ftpstime > '6/1/2013 0:0:1' and ftpstime < '6/29/2013 23:59:59')

/*TRY THIS ONE*/
select count(*), rmn from customercheckin group by rmn having count(*)> 1 and rmn in 
(select rmn from document where ftpstime > '5/1/2013 0:0:1' and ftpstime < '5/31/2013 23:59:59')


select * from manifestDCS where dcsID = 'HEH03RS7WGFW4Z'
select distinct pbatch from Document where dcsID = 'HEH03RS7WGFW4Z'

select * from customercheckin
where rmn in (
'311VB0507133063F',
'307VB0423137012B',
'308VB0502132790C')

select * from manifestDCS where rmn = '355VB0520130001A'

--delete from customerCheckIn where syskey = 13879
select * from CustomerDATA where dcsID = '2HGHVCDXGOC3LK6'
select * from manifestDCS where dcsID = 'HGHVCDXGOC3LK6'
select * from CustomerDATA where dcsID = 'HGHVCDXGOC3LK6'


select imageid from document where ftpstime > '6/1/2013 0:0:1' and ftpstime < '6/30/2013 23:59:59' group by imageid having count(*) > 1

update document
set dcsid = 'HGHVCDXGOC3LK6'
where dcsid = '2HGHVCDXGOC3LK6'

update CustomerDATA
set dcsid = 'HGHVCDXGOC3LK6'
where dcsid = '2HGHVCDXGOC3LK6'


select distinct rmn, trackingno from manifestDCS
where rmn in (
'317VB0416132020C',
'320VB0325133012B',
'327VB0402130108B',
'322VB0320130002D',
'327VB0404130125B',
'320VB0325135409B',
'327VB0403130115B')

select * from document where pbatch like '021313500071%' 
and ftpstime is not null
 order by imageid 


select * from manifestDCS where rmn = '319VB0807135270D'
select * from boxmapping where dcsid = 'HK2TRBW72MZR9T'



select * from Boxmapping where dcsid = 

select * from document where pbatch like '021313500071%' 
and ftpstime is null
 order by imageid 
select * from document where pbatch = '02133230504104' order by imageid
02133230504104
select * from document where dcsID = 'HO1W116zRFVNJC' and ftpstime is null order by imageid

select * from customercheckin where trackingno in (
'1Z7RV0460397086318',
'1ZA2458X0395397269',
'1ZA3649E0390724267',
'1ZA3649E0396460648',
'1ZA410E40393377475',
'1ZA4F6960390725241',
'1ZRV0460394138759')


select * from manifestDCS where trackingno in (
'1Z7RV0460397086318',
'1ZA2458X0395397269',
'1ZA3649E0390724267',
'1ZA3649E0396460648',
'1ZA410E40393377475',
'1ZA4F6960390725241',
'1ZRV0460394138759')
order by insertdate desc

select * from document where rmn = '317VB0418135017K'

(select distinct dcsid, rmn from Document 
where dcsID not in (select distinct dcsid from manifestDCS)
and ftpstime > '6/1/2013 0:0:1' and ftpstime < '6/29/2013 23:59:59')

select * from manifestDCS where pbatch in  
(select distinct substring(PBatch, 1,12) from document where RMN = '308VB0226137192C')


update document
set dcsid = 'HDN9EG3TSITUJI'
where dcsid = 'HND9EG3TSITUJI'

update customerdata
set dcsid = 'HDN9EG3TSITUJI'
where dcsid = 'HND9EG3TSITUJI'




--select * from manifestDCS where pbatch in  
--(select distinct substring(PBatch, 1,12) from document where dcsID = '309VB1204120004C')
                                                                      
update Document set RMN ='318vb0228131001a' where RMN =  '3185VB0228131001A'
update customerdata set RMN ='318vb0228131001a' where RMN =  '3185VB0228131001A'
3185VB0228131001A

select rmn from manifestdcs where rmn = '304vb1012120031a'
select * from customerdata where dcsid = 'hafp03agd2autj'

update manifestDCS set dcsid = 'H8NAZRAU8PUPR5
'
where syskey = '649' 



select count(*), rmn from customercheckin group by rmn having count(*)> 1 and rmn in 
(select rmn from document where ftpstime > '2013-07-01 0:0:0' and ftpstime < '2013-07-31 23:59:59')



select * from manifestdcs where rmn = '308vb1023120001c'

select * from manifestdcs where dcsid = 'H8NAZRAU8PUPR5'

select * from CustomerDATA where dcsid = 'HABE19AS18IDBV'


select distinct dcsid from document where rmn = '308vb1019120001c'
h8hh56kc7wgc3h
h8hhi2m7x0g7tr
h8hhkrp7y7mbob
h8hhwhwhnv3gly
h8hi9qrg2k91wb
h8hib03i3yqvxg
h8hjgi8zbytnp4
h8hjcg5sjc71xw
h8hj5v3zbei6q8
h8hf9jzuu97vl1
h8hf9jzuu97vl1

select count(*) , dcsid from manifestdcs  group by dcsid having count(*) > 1


select * from manifestdcs where rmn in (
'325VB02251300023B',
'318VB022113003G',
'3185VB0228131001A',
'325VB02211300065b')


select * from customerCheckIn where rmn in (
'325VB02251300023B',
'318VB022113003G',
'3185VB0228131001A',
'325VB02211300065b')


select * from document where rmn in (
'325VB02251300023B',
'318VB022113003G',
'3185VB0228131001A',
'325VB02211300065b')


select * from manifestdcs where pbatch = '021305611007'
select * from manifestdcs where pbatch = '021305811016'
select * from manifestdcs where pbatch = '021305814003'
select * from manifestdcs where pbatch = '021306313005'
select * from customercheckin where rmn = '325VB0225130023B'

select distinct RMN from manifestdcs where pbatch = '021305814003'
select distinct RMN from document where pbatch like '021305814003%'

update document
set rmn = '325VB0225130023B'
where rmn = '325VB02251300023B' and pbatch like  '021305814003%'

update CustomerDATA
set rmn = '325VB0225130023B'
where rmn = '325VB02251300023B' and pbatch like  '021305814003%'



select * from document where rmn in (
'325VB02251300023B',
'318VB022113003G',
'3185VB0228131001A',
'325VB02211300065b')


02130561100701
02130581101604
02130581400305
02130631300501

select distinct trackingno from manifestdcs where trackingno  in 
(
SELECT distinct trackingno FROM CUSTOMERCHECKIN WHERE rmn in 
(select rmn from customercheckin  group by rmn having count(*)> 1)
)

 SELECT * FROM CUSTOMERCHECKIN WHERE rmn in 
(select rmn from customercheckin group by rmn having count(*)> 1)

select * from manifestdcs where rmn = '3185VB0228131001A'
select * from document where rmn = '3185VB0228131001A'

--delete from customercheckin where syskey = '2840'

select * from customercheckin where trackingno = '1ZA4205F0398451398'
select * from manifestdcs where rmn = '3185VB0228131001A'
select * from document where rmn = '3185VB0228131001A'
select * from manifestdcs where pbatch = '021306313005'
3185VB0228131001A
318vb0228131001a