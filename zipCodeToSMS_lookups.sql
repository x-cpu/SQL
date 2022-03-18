select s.dcsid, veteranID, xmlFilename, batchname, insertdate, c.ZipCode, p.StationNo ROSiteID
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join ZipcodeRoj z
on c.ZipCode = z.zipcode
left join pobox p
on z.ROJ = p.pobox
where veteranID in (
'730083',
'729838',
'732480',
'732633',
'733146',
'733558')



select s.dcsid, veteranID, p.StationNo ROSiteID
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join ZipcodeRoj z
on c.ZipCode = z.zipcode
left join pobox p
on z.ROJ = p.pobox
where veteranID in (
'736028',
'736151',
'736472',
'737551',
'736120',
'736908',
'737981')

select s.dcsid, veteranID, p.StationNo ROSiteID
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join ZipcodeRoj z
on c.ZipCode = z.zipcode
left join pobox p
on z.ROJ = p.pobox
where veteranID in (
'730083',
'729838',
'732480',
'732633',
'733146',
'733558')



select * from smsDCSMapping where dcsid = 'DCSID031631206001010001'


select * from pobox where StationNo = '327'

select * from ZipcodeRoj where zipcode = '42211'



