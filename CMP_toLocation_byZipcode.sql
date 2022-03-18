select distinct x.DCSID, cb.boxtype, cb.BoxNO, cb.shipmentno,
case 
when cb.shipmentno = '3' THEN 'San Jose'
when cb.shipmentno in ('1', '2', '3', '4', '5', '6', '7', '8', '9', '11') THEN 'English Station'
ELSE 'Newnan'
END as Location
FROM (
select distinct dcsid from CustomerDATA where exists
(select * from ZipcodeRoj where roj = 'st. petersburg' and CustomerDATA.ZipCode = zipcode)) X
left join CMPBoxmapping cb
on x.dcsID = cb.dcsID
group by x.DCSID, cb.boxtype, cb.BoxNO, cb.shipmentno
order by Location, cb.shipmentno, x.dcsID


--using alex list
select distinct x.DCSID, cb.boxtype, cb.BoxNO, cb.shipmentno,
case 
when cb.shipmentno in ('3') THEN 'San Jose'
when cb.shipmentno in ('12', '13', '14') THEN 'San Jose (IR)'
when cb.shipmentno in ('1', '2', '3', '4', '5', '6', '7', '8', '9', '11') THEN 'English Station'
when X.dcsID like 'DCSID04%' THEN 'FAX'
ELSE 'Newnan'
END as Location, cb.insertdate
into docid.dbo.DCSID_FINALX
FROM (select distinct dcsid from docid.dbo.DCSID_AA) X
left join CMPBoxmapping cb
on x.dcsID = cb.dcsID
group by x.DCSID, cb.boxtype, cb.BoxNO, cb.shipmentno, cb.insertdate
order by Location, cb.shipmentno, x.dcsID


select 

select  f.dcsid, d.FileNumber into docid.dbo.dcsid_file2 from docid.dbo.DCSID_FINALX f
left join dva.dbo.CustomerDATA d
on f.dcsid = d.dcsID
where location = 'newnan' and boxno is  null


select distinct dcsid into docid.dbo.problem_dcsid2 from docid.dbo.dcsid_file  where  exists
(select * from docid.dbo.filenumber where docid.dbo.dcsid_file.FileNumber = FileNumber)




--not problem but delete from checkout
select distinct dcsid from docid.dbo.dcsid_file2 where exists (
select * from CMPBoxmapping_bck where docid.dbo.dcsid_file2.dcsid = dcsid)
and not exists (select * from docid.dbo.problem_dcsid2 where docid.dbo.dcsid_file2.dcsid = dcsid)

select  * from docid.dbo.dcsid_final where not exists
(select * from document where docid.dbo.dcsid_final.dcsid = dcsid)

select count (*) from docid.dbo.DCSID_FINALX where location = 'newnan' and boxno is  null


select distinct dcsid, documentstatus   from cmprecon where exists(
select * from docid.dbo.dcsid_finalX where location = 'Newnan' and boxtype is null and cmprecon.dcsid = dcsid)
and (documentstatus = 'rescan' or documentstatus = 'split') 

--8696 exists at Newnan and not checked out
	--333 SPLIT/RESCAN
	--1155 identified as problem (Trimeka list)
	--1608 not identified as problem but deleted from checkout 
	--**remainder not checked out

select count(*) from docid.dbo.dcsid_final2 where location = 'fax' and boxno is  null
select distinct dcsid, location  from docid.dbo.dcsid_final2


select count(*) dupcount, dcsid, BoxType into docid.dbo.dupMAIN from  docid.dbo.dcsid_final2
group by dcsid, BoxType
having count (*) > 1


select count(*) dupcount, dcsid, BoxType  from  docid.dbo.dcsid_finalX
group by dcsid, BoxType
having count (*) > 1


select * from docid.dbo.dcsid_finalX

select count(*) dupcount, dcsid, BoxType into docid.dbo.dupMAIN2  from  docid.dbo.dcsid_finalX
group by dcsid, BoxType
having count (*) > 1


select  *  from docid.dbo.dcsid_finalX where exists (
select * from docid.dbo.dupMAIN2 where docid.dbo.DCSID_FINALX.dcsid = dcsid and docid.dbo.dcsid_finalX.boxtype = BoxType)
having 

select distinct dcsid, boxtype, min(insertdate) insertdate  into docid.dbo.dcsid_delete from	 docid.dbo.dcsid_finalXX 	
group by dcsid, boxtype

select * from docid.dbo.dcsid_finalX where dcsid = 'DCSID031229606008010002' 	


--delete from docid.dbo.dcsid_finalX  where exists(
select * from docid.dbo.dcsid_delete where docid.dbo.dcsid_finalX.DCSID = dcsid and docid.dbo.dcsid_finalX.boxtype = boxtype and docid.dbo.dcsid_finalX.insertdate = insertdate)


select * from docid.dbo.dcsid_final2 where exists (
select * from docid.dbo.dupMAIN where docid.dbo.dcsid_final2.dcsid = dcsid and docid.dbo.dcsid_final2.boxtype = BoxType and boxtype = 'admin')
and boxtype = 'admin'
and exists (select top (1) max(insertdate), dcsid from CMPBoxmapping where docid.dbo.dcsid_final2.dcsid = dcsid and docid.dbo.dcsid_final2.boxtype = BoxType and boxtype = 'admin' group by dcsid)
order by dcsid



select top (1) max(insertdate), c.dcsid 
from CMPBoxmapping c where docid.dbo.dcsid_final2.dcsid = c.dcsid 
and docid.dbo.dcsid_final2.boxtype = c.BoxType and c.boxtype = 'admin' group by c.dcsid

select * from  cmpboxmapping where exists (
select * from docid.dbo.dupMAIN where CMPBoxmapping.dcsid = dcsid and CMPBoxmapping.BoxType = boxtype)
order by dcsid 


select * from docid.dbo.dupMAIN where boxtype = 'admin'


select * from CMPBoxmapping where boxtype = 'admin'
select * from docid.dbo.dupMAIN


select * from docid.dbo.dcsid_final2 where dcsid = 'DCSID031534106138010001'



select * from docid.dbo.dcsid_final where location = 'Newnan' and boxtype is null
--8793 exists at Newnan and not checked out
	---281 are SPLIT
	---50 are RESCAN
	---7610 are upload/download_confirmed and do not show as checked out


select distinct dcsid from docid.dbo.DCSID_nCO where exists (
select * from CMPBoxmapping where docid.dbo.DCSID_nCO.dcsid = dcsid)

select count(*) from docid.dbo.DCSID_A

--563332
--556998


select * from document where dcsid = 'DCSID030504606001010002'


select distinct PBatch from document where pbatch like '04%' 
and ImageDateTime > '2015-12-14'
group by PBatch
having sum(numpages) < '6'


04153570003901


