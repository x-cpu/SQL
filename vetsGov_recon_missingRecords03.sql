select * from vvFTPDetails where source = 'csra' and downloaddate >= '2018-11-01' order by downloaddate desc



select distinct d.dcsID DCSID, UUID = '', ACKtoCSRA = '0', insertdate = '', f.ETime dmhstime, s.veteranID VeteranID, count(d.ImageID) NumDocs
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join smsDCSMapping s
on d.dcsID = s.dcsid
left join dmhsFTPDetails f
on d.PBatch = f.batchname
where p.cordest = 'vtg' and d.ImageDateTime >= '2018-10-15'
and not exists (select * from DCSID_UUID_mapping where d.dcsID = dcsID)
and exists (select * from stats where d.PBatch = batchname)
and exists (select * from dmhsFTPDetails where d.PBatch = batchname)
--and d.dcsID in (
--'DCSID041829805006010074',
--'DCSID041829805006010075',
--'DCSID041829805006010076') 
group by d.dcsID, f.ETime, s.veteranID
order by dmhstime

select distinct d.dcsID DCSID, UUID = '', ACKtoCSRA = '0', insertdate = '', f.ETime dmhstime, s.veteranID VeteranID, count(d.ImageID) NumDocs
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join smsDCSMapping s
on d.dcsID = s.dcsid
left join dmhsFTPDetails f
on d.PBatch = f.batchname
where p.cordest = 'vtg' and d.ImageDateTime >= '2018-10-15'
and not exists (select * from DCSID_UUID_mapping where d.dcsID = dcsID)
and exists (select * from stats where d.PBatch = batchname)
and exists (select * from dmhsFTPDetails where d.PBatch = batchname)
group by d.dcsID, f.ETime, s.veteranID

select distinct uuid from vvFTPDetails
where sendAcknowledgeProcessing is null
and downloadDate >= '2018-10-01'
--and downloadDate <= '2018-10-31'
and source = 'csra'



select * from DCSID_UUID_mapping

select * from DCSID_UUID_mapping_temp

--04183040500901

select * from VetsUpload

select distinct dcsid, count(imageid) from document where dcsid in (
'DCSID041829805006010074',
'DCSID041829805006010075',
'DCSID041829805006010076') group by dcsid 

select * from dmhsFTPDetails where batchname = '04182980500601'

--DCSID041829805006010074	7f008921-c167-46da-882f-da051287a07c	0	2018-10-25 20:48:43.693	2018-10-25 22:51:35.600	4870662	5
--DCSID041829805006010075	7f48697a-4605-4dee-ab3b-a6b4cd0231de	0	2018-10-25 20:48:43.700	2018-10-25 22:51:35.600	4870663	2
--DCSID041829805006010076	81b9a718-a727-4d2b-b9b7-bf50914bb180	0	2018-10-25 20:48:43.707	2018-10-25 22:51:35.600	4870664	3