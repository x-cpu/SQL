--find DOMA racc
select * from customerdata	where zipcode in (
'00001',
'00002',
'00003') and keydatetime >= '2017-03-28' 
and exists (select * from document where CustomerDATA.dcsID = dcsid and docidDoctype = 'VA 21-4142 Authorization for Release of Information')

--find DOMA racc
--select * from customerdata	where zipcode not in (
--'00001',
--'00002',
--'00003') and keydatetime >= '2017-03-28' 
--and exists (select * from document where CustomerDATA.dcsID = dcsid and docidDoctype = 'VA 21-4142 Authorization for Release of Information')

select * from CustomerDATA where filenumber = '208569178' and keydatetime > '2017-03-01'

select * from pobox

select * from ZipcodeRoj where zipcode like '000%'

select * from smsDCSMapping where dcsid in (
'DCSID041709000031010002',
'DCSID041709000064010004')

select * from pmrImageIDMapping where dcsid in (
'DCSID041709000031010002',
'DCSID041709000064010004')

select * from document where dcsid in (
'DCSID041708100077010014',
'DCSID041708100091010063',
'DCSID041708100100010008',
'DCSID041708100078010087',
'DCSID041708100101010021')


select * from docid.dbo.docid where docid = '116'