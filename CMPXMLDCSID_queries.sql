select top (100) * from cmpxmldownload where XMLfilename = '03153290619001-1515ee8036c'

select * from cmpxmldcsid where xmlfilename = '03153290619001-1515ee8036c'
select * from cmpxmldcsid order by insertdate desc

select dcsid, count(*) from cmpxmldcsid
group by dcsid
having count(*) > 1

select * from cmpxmldcsid where dcsid = 'DCSID031532406440010007'

select * from Document where dcsid = 'DCSID031532406440010007'

select * from cmprecon where dcsid = 'DCSID031533206190010011'


select * from document where Comments = 'FileNumber is invalid!;FirstName is blank!;LastName is blank!'

select * from FTPError where imageid = 'CACI_CMP_153332902P001009602'

select * from cmpxmldownload where XMLfilename in (
'03153240644001-151638ccb80',
'03153240644001-15169084c72',
'03153240644001-1516982e352',
'03153240644001-1516e6a622d')

select * from document where ftpstime is not null and exists (
select distinct DCSID from cmprecon where DocumentStatus = '' and insertdate > '2015-12-13' and document.dcsid = cmprecon.dcsid)
and ftpstime > '2015-12-13 19:00:00'



select * from document where ftpstime is not null and exists (
select distinct DCSID from cmprecon where DocumentStatus = 'UM_DOwnload' and insertdate > '2015-12-13' and document.dcsid = cmprecon.dcsid)
and ftpstime > '2015-12-13 19:00:00'

select distinct xmlfilename from docid.dbo.cmpreconBlankDS

select distinct DCSID from cmprecon where DocumentStatus = '' and insertdate > '2015-12-13' and document.dcsid = cmprecon.dcsid



select * from cmprecon where dcsid = 'DCSID031416506014010005'


order by insertdate desc
 
 select * from cmpxmldcsid where dcsid in (
'DCSID031532406426010082',
'DCSID031532906125010005',
'DCSID031532906199010040')
order by dcsid


select * from cmpxmldownload where XMLfilename in (
'03153240642601-1515f168d75',
'03153240642601-151622275d6')


select * from cmpxmldownload where XMLfilename in (
'03153290612501-151629f2799',
'03153290612501-1515f75eb7e')

select * from cmprecon where dcsid = 'DCSID031523706096010057'


---get the list of all XML file names for DCSID
select distinct xmlfilename from cmpxmldcsid where dcsid in 
(select dcsid from cmpxmldcsid where xmlfilename = '03153290612501-1515f75eb7e')


select count(*) from cmpxmldownload where AckTime is null and XMLfilename in (
'03153290612501-1515f75eb7e',
'03153290612501-151629f2799')

--get XML file name that doesn't have ACKTIME
select distinct xmlfilename from cmpxmldcsid where dcsid in 
(select dcsid from cmpxmldcsid where xmlfilename = '03153290612501-1515f75eb7e')
and exists (select 


select * from cmpxmldownload where AckTime is null and exists(
select dcsid, count(*) from cmpxmldcsid
group by dcsid
having count(*) > 1)


---and exists (select * from cmpxmldownload where acktime is null) 

select * from cmpxmldownload where XMLfilename = '03141290600801-14df6e82d7f'
select * from cmpxmldcsid where xmlfilename = '03141290600801-14df6e82d7f'


select XMLfilename, count(*) from cmpxmldownload
group by XMLfilename
having count(*) > 1


select * from cmpxmldownload where XMLfilename = '03140800600101-1460556e362'

select distinct xmlfilename from cmpxmldcsid where dcsid in 
                                (select dcsid from cmpxmldcsid where xmlfilename = '03153240644001-151638ccb80')


								select * from cmpxmldownload where AckTime is null and comments is not null order by insertdate desc

								select * from cmpxmldownload_bck



select *
FROM            cmpxmldcsid
WHERE       batchname = '03141270999999'


select * FROM cmpxmldownload where acktime is null and comments is not null order by insertdate desc


select distinct BoxNO from CMPBoxmapping where PaletteWithinShipment is null
order by BoxNO

select * from CMPBoxmapping where boxno in (
'C10952',
'C11113',
'C11268',
'C11461',
'C11481',
'C11581',
'C11585',
'C11745',
'C11893',
'c11894',
'C11902',
'C12106',
'C12129',
'C1228',
'C12628',
'C12644')


select * from cmprecon where dcsid = 'DCSID041531800034010030'