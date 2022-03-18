--failure
select distinct d.dcsID DCSID, f.imageid, d.PBatch Batchname, f.comments Error, f.insertdate ErrorDate 
from document d 
inner join FTPError	f
on d.ImageID = f.imageid
where d.dcsid in (
'HTK9WZSZ5DZ7M5',
'HTPWL7CSIN04OM',
'HVICZ1DRU1SBZD',
'I08L0AW7GB7ACO',
'I0FIA7Y3URQMR5',
'I0IKGBB9HVN4Y0',
'I0S962E8AMXR5U',
'I0TO7CGQ1M0VGP',
'I0TVHLS5C8LAVW',
'I0Y0RA67546JYS',
'I122QAJ9KF6FMD',
'I122YGC5YUBMKK',
'I1232HUT2NW3UP') 
and d.ftpstime is null
and f.insertdate > '2014-10-23 15:00:01'
group by dcsID


--pending
select distinct d.dcsID DCSID, d.PBatch Batchname
from document d 
where d.dcsid in (
'HTK9WZSZ5DZ7M5',
'HTPWL7CSIN04OM',
'HVICZ1DRU1SBZD',
'I08L0AW7GB7ACO',
'I0FIA7Y3URQMR5',
'I0IKGBB9HVN4Y0',
'I0S962E8AMXR5U',
'I0TO7CGQ1M0VGP',
'I0TVHLS5C8LAVW',
'I0Y0RA67546JYS',
'I122QAJ9KF6FMD',
'I122YGC5YUBMKK',
'I1232HUT2NW3UP') 
and d.ftpstime is not null


I0TO7CGQ1M0VGP
I0TVHLS5C8LAVW

select * from document where dcsid = 'I0TVHLS5C8LAVW'

select * from document where pbatch = '02142860404201'

select * from Stats_IBML where kbatch in (
'02142830401403',
'02142870206202',
'02142890000404')

select * from document where pbatch in (
'02142830401403',
'02142870206202',
'02142890000404')

select * from TurboscanNG1.dbo.batches where batchname in (
'02142830401403',
'02142870206202',
'02142890000404')