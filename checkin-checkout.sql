select a.RMN, count(distinct a.dcsID)
from manifestDCS as a
where exists 
(select b.RMN, count(distinct b.dcsid) 
	from document as b
	where a.RMN = b.RMN and b.ftpstime is not null and comments = 'success'
	group by b.RMN)
	group by RMN


	
select pbatch from PhysicalBatch
where exists (select PBatch from Stats_IBML)

select rmn, count(distinct dcsid)
from manifestdcs
where rmn = '308VB1025120002C'
group by rmn

select rmn, count(distinct dcsid)
from Document
where rmn = '308VB1025120002C'
group by rmn


select  distinct dcsid, rmn
from Document
where rmn = '316VB1025126807D'
group by rmn, dcsID


select  distinct dcsid, rmn
from manifestDCS
where rmn = '316VB1025126807D'
group by rmn, dcsID

select *
from manifestdcs
where rmn = '316VB1025126807D'



--dcs lookup
select *
from manifestDCS 
where dcsID = 'HA9NMKV8M95MA0'

select *
from Document 
where dcsID = 'HA9NMKV8M95MA0'

select *
from CustomerDATA 
where dcsID = 'HA9NMKV8M95MA0'
               
select * from manifestdcs where pbatch ='021230300019'
               
select count(*),dcsid  from manifestdcs group by dcsid having count(*)> 1

---sasha


select distinct dcsid from document where substring (pbatch,1,12) in 

(select distinct substring(pbatch,1,12)  from document where dcsid = 'H8REVX237CDRB8')

select * from manifestdcs where pbatch = '021230300012'
select * from PhysicalBatch where PBatch like '021231800094%'

select * from PhysicalBatch where PBatch like '021231800094%'
select * from PhysicalBatch where PBatch like '021231800093%'
select * from Stats_IBML where kbatch like '021231800093%'


--rmn lookup
select *
from manifestDCS 
where RMN = '316VB1108122779D'


select *
from Document 
where RMN = '316VB1108122779D'

select *
from CustomerDATA 
where RMN = '316VB1108122779D'
       


--pbatch lookup
select *
from manifestDCS 
where pbatch = '021230500057'

select *
from Document 
where PBatch = '02123050005701'

select *
from CustomerDATA 
where Pbatch = '02123050005701'


--update DCSid
update Document
set dcsID = 'H9ZO17I76J5ABK'
where dcsID = 'H9ZO17176J5ABK'



select *
from Document
where dcsID like 'H9VM%89'


select *
from customerdata
where Shovboxno = '0666'


--file number lookup
select *
from document
where filenumber = '251195576'

select *
from CustomerDATA
where filenumber = '251195576'


select *
from CustomerDATA
where firstname = 'gary'
order by lastname



select rmn, dcsID, ShipDate, ShipTrackingNumber, Shovboxno
from CustomerDATA
where RMN in ('322vb1204120001d', '322vb1207120011d')
order by RMN



select *
from document
where dcsid = 'hae594u1uydf1k'



---by dcsid lookup
select *
from customerdata
where dcsID = 'H9R52BT5M0L79O'

select *
from Document
where dcsID = 'H9R52BT5M0L79O'

select *
from manifestDCS
where dcsID = 'H9R52BT5M0L79O'


select sum(docs)
from stats
where kbatch = '02123350013901'

select count(*)
from Document
where PBatch = '02123350013901'

select *
from Document
where PBatch = '02123350013901'
order by dcsID


select *
from CustomerDATA
where Firstname = 'judith'


select sum(charcount), count(*)
from document 
where ftpstime between '2012-12-01 0:0:0' and '2012-12-31 23:59:59' and Comments = 'success' and CharCount > 1
and docidDoctype like '%526%'


select sum(charcount), count(*)
from document 
where ftpstime between '2012-11-01 0:0:0' and '2012-11-30 23:59:59' and Comments = 'success' and CharCount > 1
and docidDoctype like '%526%'


select sum(charcount), count(*)
from document 
where ftpstime between '2012-10-01 0:0:0' and '2012-10-31 23:59:59' and Comments = 'success' and CharCount > 1
and docidDoctype like '%526%'

select *
from manifestDCS
where dcsid = 'HAJZHIWI2LDLKB'

select *
from Document
where dcsid = 'HAJZHIWI2LDLKB'

select *
from document
where CharCount > 1 and docidDoctype <> 'VA 21-526 Veterans Application for Compensation or Pension'


select sum(charcount), count(*)
from document 
where ftpstime between '2012-12-01 0:0:0' and '2012-12-31 23:59:59' and Comments = 'success'

use dva
select * from Stats_IBML where kbatch = '02123330005201'

select distinct rmn, sum (numpages)
from Document
where ftpstime > '2012-12-01 0:0:0' and comments = 'success'
group by rmn

select dcsid, rmn, pbatch, ShipTrackingNumber, ShipDate, Shovboxno from customerdata
where ShipTrackingNumber is not null and dcsid in (
'H8G4VZ6Z1K1CDP',
'H98KVTJBFBN1L0',
'H9PYHMW14DI3BY',
'H9VMHJ7R3L6G6Z',
'H9LG0NYHMJTIEJ',
'H91AICMCIRZJJT',
'H9ZU08QVLJHP49',
'H9LF1EFH63G56F',
'H9757TVQJ4RV5M',
'H9757TVQJ4RV5M',
'H976YLLWVOEY67',
'H974Y7KKREH8QT',
'H975UU6A5OMB1O',
'H9ZPL8OZ7IMTG',
'H9VHZWTKUM9GTX',
'H9VJ6CTEJXPQJX',
'H9723JBJ2T9X6N',
'H9VHLV7IBEJY4I',
'HA1EM377CWQT9R',
'H9VME6KMS4WO89',
'H9VMZ6FX852XIX',
'HA43WICNLDCJ9T',
'H9705D60O5V75X',
'H9705D60O5V75X',
'HA46O4CEB2K2UQ',
'HA1FRLM5T5C6N5',
'H98KYWQ84ARII9',
'H98HZPGWVMSRK5',
'H98IVO9GWG73MG',
'H9A9EACBMDZFRR',
'H9ZO6SK7AA9IMY',
'H9A3J8AUF3KUAD',
'HA1AK5UWI0XS7O',
'HA2SJMWS2X8D54',
'HA1DZ6NWKEIZCJ',
'HA40IZMKJKG4GK',
'HA2M0PR1AI35TV',
'HA2R5SOA2FUC4S',
'H8YE5I87XAH672',
'HA2OU3PLEW8AGG',
'HA5B2IVY8SH16O',
'H99WDQCO9NZK5A',
'HA2KEPV4FD0OEW',
'HA18C0WBKG2WI1',
'HA5Q6D0771X3FV',
'H9VHUH07WPFF5Y',
'HA1E1PKIEY3EVG',
'H9ZOHP313CLMEC',
'H9A32TR9N6J6FA',
'H9A01E2133O37I',
'H9A45YJJ5GG272',
'HA5APSIJA78XSV',
'HA5AV3D3SP3T4M',
'HA5ASTIV7CDPL1',
'HA5AX7PAL7P6P9',
'HA1AZ34QTTNQB9',
'HA1B26Y4OFEVGQ',
'H9SGYOUYT9VWBR',
'H9A91D10AL65IT',
'HA1CY6R9KOA4CO',
'H9LBNJP8UFXLI5',
'HA9KSZ2FER4DK2',
'HA9KR8T9KN7ONB',
'HA9L0POIMWATMA',
'HA9KZ8X6TO3YH1',
'HA9KVPFEJY9AFO',
'HA9KTVIH5FMHDV',
'HA9KS2UQ82NMQY',
'HA9NB580Z4A6NZ',
'HA9L3COS3NMHKX',
'HA9L4NPYBHRU1Z',
'ha9jueydujpa3x',
'HA450FJSG9S3C3',
'HA44XDDW95NCVL',
'HA44K514G3KHTZ',
'HA44U96OOHXZQ9',
'HA44GV5GGJ99GI',
'HA44P4U5E9M7J0',
'HA44R3JUBGJJNZ',
'HA452KCQBQTDAL',
'HA43FTBJFEXII7',
'HA5G41K9A5PSRU',
'HA5O4ENBCBHS37',
'HA9V2RX05BX96I',
'HA5IE47118C5D7',
'H98IMZXVI2OTVY',
'HA5BYPP56W0WQL',
'HA5T7AJ5G4N2J9',
'HA9RR8PGQ2KJFX',
'HACRVLDCSPNX2I',
'HAFIZM0VIEOI6G',
'HA9PFHHKAS3OGG',
'HA9PX1QKTDZI44',
'HAE7J1W5XCGKUO',
'HAE10HYWJ27QV6',
'HAE12QDE4RM7B4',
'HAE15489GJR3M8',
'HAE1GEWZFP27T9',
'HAE1IKAM2HUIMY',
'HAE1NIFDO7ZPW7',
'HAE1YDC34HIJAG',
'HAE20NKT9RUDM6',
'HAE746AB910778',
'HAE71238BVS0JL',
'HAE6O8RPIPHN37',
'HAE265OMP8Z2NF',
'HAFLHNSV8NPAZ8',
'HACRXQDQ7JQ14T',
'HA1B5WI8NM7O1E',
'HA4FKH9L69UCDO',
'HACNUK1XSDG5L',
'HA5JM7VAEZHX55',
'HA5JRB2RH1VPSD',
'HA486CFTJCM93U',
'HA5FBEHCPZDSFH',
'HA49H7MBKZ9BJK',
'HALBKAJ053SU3U',
'HALBJDCNGP1SYL',
'HACNE0DNH9R4K4',
'HABE19AS18IDBV',
'HABE19AS18IDBV',
'HACLZCFDD11CXC',
'HACLYIMSU0EUL1',
'HAFDTLWYREF92J',
'HADXW4BY5Z5OQI',
'HADXV7JLOES1SV',
'HA2L7OMF7CSER',
'H9A5C586I259O3',
'HACJHWSUU4E2FY',
'HAE2LABSGMEPU7',
'HAE2LABSGMEPU7',
'HAK05I5WJG0SR8',
'HAK3RIK4R5Y8FC',
'HAFJUDJKN5KP49',
'HAFJUDJKN5KP49',
'HA1AZIZYC2KW7O',
'HACPKGKJJFVSDH',
'H9A0H39ND9Y9WH',
'HAO1T1HA7RZ035',
'HAJSOPLUW7MHM4',
'HAFND8Z2P7MFES',
'HAFKKRFPCQCBFY',
'HAFEJZZ5KVDELA',
'HAFEMOKSRJD8MQ',
'HAFEIB7L7MO2IT',
'HAFEG6U2E9TFMA',
'HAFEBX8DLH23HS',
'HAFERNE76EUY5F',
'HAFK4ZX6PDVJ08',
'HAFO1568NPIIFP',
'HAK1KOYKS65SJR',
'HA1C24O92II9U',
'HA1C2ZVIR77SZB',
'HALDV851ZNM9B',
'HAFP52DVJH4BU5',
'HAK3QN9Y406XAH',
'HAMQNSXAB36E89',
'HAMUV2L16EL1WX',
'HAJZ5SOIQO1H7I',
'HAK01HFW27J4OF',
'HAMQCKDRWR7E1A',
'HAFOAAN2AMLIO',
'HADZUPM0T1NLR1',
'HAE2RRYFI7O6S4',
'HAPN64JC3ERWXP',
'HAFJI26K2ASJ88',
'HAJXFR6CD0CHYE',
'HACNOXMV1BAFQ',
'HAL5XGIPWLZIP0',
'HAO8V2XA1I9YPI',
'HAJR81J021I34Q',
'HAJSB8EWB7JN59',
'HAO235PZK2UCEZ')



select * from document
where dcsid in (


select distinct dcsID 
into xxx1
from Document
where dcsid in (
'H8G4VZ6Z1K1CDP',
'H98KVTJBFBN1L0',
'H9PYHMW14DI3BY',
'H9VMHJ7R3L6G6Z',
'H9LG0NYHMJTIEJ',
'H91AICMCIRZJJT',
'H9ZU08QVLJHP49',
'H9LF1EFH63G56F',
'H9757TVQJ4RV5M',
'H9757TVQJ4RV5M',
'H976YLLWVOEY67',
'H974Y7KKREH8QT',
'H975UU6A5OMB1O',
'H9ZPL8OZ7IMTG',
'H9VHZWTKUM9GTX',
'H9VJ6CTEJXPQJX',
'H9723JBJ2T9X6N',
'H9VHLV7IBEJY4I',
'HA1EM377CWQT9R',
'H9VME6KMS4WO89',
'H9VMZ6FX852XIX',
'HA43WICNLDCJ9T',
'H9705D60O5V75X',
'H9705D60O5V75X',
'HA46O4CEB2K2UQ',
'HA1FRLM5T5C6N5',
'H98KYWQ84ARII9',
'H98HZPGWVMSRK5',
'H98IVO9GWG73MG',
'H9A9EACBMDZFRR',
'H9ZO6SK7AA9IMY',
'H9A3J8AUF3KUAD',
'HA1AK5UWI0XS7O',
'HA2SJMWS2X8D54',
'HA1DZ6NWKEIZCJ',
'HA40IZMKJKG4GK',
'HA2M0PR1AI35TV',
'HA2R5SOA2FUC4S',
'H8YE5I87XAH672',
'HA2OU3PLEW8AGG',
'HA5B2IVY8SH16O',
'H99WDQCO9NZK5A',
'HA2KEPV4FD0OEW',
'HA18C0WBKG2WI1',
'HA5Q6D0771X3FV',
'H9VHUH07WPFF5Y',
'HA1E1PKIEY3EVG',
'H9ZOHP313CLMEC',
'H9A32TR9N6J6FA',
'H9A01E2133O37I',
'H9A45YJJ5GG272',
'HA5APSIJA78XSV',
'HA5AV3D3SP3T4M',
'HA5ASTIV7CDPL1',
'HA5AX7PAL7P6P9',
'HA1AZ34QTTNQB9',
'HA1B26Y4OFEVGQ',
'H9SGYOUYT9VWBR',
'H9A91D10AL65IT',
'HA1CY6R9KOA4CO',
'H9LBNJP8UFXLI5',
'HA9KSZ2FER4DK2',
'HA9KR8T9KN7ONB',
'HA9L0POIMWATMA',
'HA9KZ8X6TO3YH1',
'HA9KVPFEJY9AFO',
'HA9KTVIH5FMHDV',
'HA9KS2UQ82NMQY',
'HA9NB580Z4A6NZ',
'HA9L3COS3NMHKX',
'HA9L4NPYBHRU1Z',
'ha9jueydujpa3x',
'HA450FJSG9S3C3',
'HA44XDDW95NCVL',
'HA44K514G3KHTZ',
'HA44U96OOHXZQ9',
'HA44GV5GGJ99GI',
'HA44P4U5E9M7J0',
'HA44R3JUBGJJNZ',
'HA452KCQBQTDAL',
'HA43FTBJFEXII7',
'HA5G41K9A5PSRU',
'HA5O4ENBCBHS37',
'HA9V2RX05BX96I',
'HA5IE47118C5D7',
'H98IMZXVI2OTVY',
'HA5BYPP56W0WQL',
'HA5T7AJ5G4N2J9',
'HA9RR8PGQ2KJFX',
'HACRVLDCSPNX2I',
'HAFIZM0VIEOI6G',
'HA9PFHHKAS3OGG',
'HA9PX1QKTDZI44',
'HAE7J1W5XCGKUO',
'HAE10HYWJ27QV6',
'HAE12QDE4RM7B4',
'HAE15489GJR3M8',
'HAE1GEWZFP27T9',
'HAE1IKAM2HUIMY',
'HAE1NIFDO7ZPW7',
'HAE1YDC34HIJAG',
'HAE20NKT9RUDM6',
'HAE746AB910778',
'HAE71238BVS0JL',
'HAE6O8RPIPHN37',
'HAE265OMP8Z2NF',
'HAFLHNSV8NPAZ8',
'HACRXQDQ7JQ14T',
'HA1B5WI8NM7O1E',
'HA4FKH9L69UCDO',
'HACNUK1XSDG5L',
'HA5JM7VAEZHX55',
'HA5JRB2RH1VPSD',
'HA486CFTJCM93U',
'HA5FBEHCPZDSFH',
'HA49H7MBKZ9BJK',
'HALBKAJ053SU3U',
'HALBJDCNGP1SYL',
'HACNE0DNH9R4K4',
'HABE19AS18IDBV',
'HABE19AS18IDBV',
'HACLZCFDD11CXC',
'HACLYIMSU0EUL1',
'HAFDTLWYREF92J',
'HADXW4BY5Z5OQI',
'HADXV7JLOES1SV',
'HA2L7OMF7CSER',
'H9A5C586I259O3',
'HACJHWSUU4E2FY',
'HAE2LABSGMEPU7',
'HAE2LABSGMEPU7',
'HAK05I5WJG0SR8',
'HAK3RIK4R5Y8FC',
'HAFJUDJKN5KP49',
'HAFJUDJKN5KP49',
'HA1AZIZYC2KW7O',
'HACPKGKJJFVSDH',
'H9A0H39ND9Y9WH',
'HAO1T1HA7RZ035',
'HAJSOPLUW7MHM4',
'HAFND8Z2P7MFES',
'HAFKKRFPCQCBFY',
'HAFEJZZ5KVDELA',
'HAFEMOKSRJD8MQ',
'HAFEIB7L7MO2IT',
'HAFEG6U2E9TFMA',
'HAFEBX8DLH23HS',
'HAFERNE76EUY5F',
'HAFK4ZX6PDVJ08',
'HAFO1568NPIIFP',
'HAK1KOYKS65SJR',
'HA1C24O92II9U',
'HA1C2ZVIR77SZB',
'HALDV851ZNM9B',
'HAFP52DVJH4BU5',
'HAK3QN9Y406XAH',
'HAMQNSXAB36E89',
'HAMUV2L16EL1WX',
'HAJZ5SOIQO1H7I',
'HAK01HFW27J4OF',
'HAMQCKDRWR7E1A',
'HAFOAAN2AMLIO',
'HADZUPM0T1NLR1',
'HAE2RRYFI7O6S4',
'HAPN64JC3ERWXP',
'HAFJI26K2ASJ88',
'HAJXFR6CD0CHYE',
'HACNOXMV1BAFQ',
'HAL5XGIPWLZIP0',
'HAO8V2XA1I9YPI',
'HAJR81J021I34Q',
'HAJSB8EWB7JN59',
'HAO235PZK2UCEZ')


select distinct dcsid from xxx1 
where dcsid in (select distinct dcsid from document where ftpstime is not null)

select * from document where dcsid = 'H98IMZXVI2OTVY'


select * from manifestDCS where trackingno = '1ZA4205F0392060017'


select * from manifestDCS where rmn = '325VB1227120007B'


select * from CustomerDATA where rmn = '316vb1204124864d'
select * from CustomerDATA where Shovboxno like '%2368%'


update CustomerDATA 
set ShipTrackingNumber = '1Z867W320395403882'
where syskey = '138053'


