--cmp recon report to VBMS
select distinct cmprecon.DCSID, cmprecon.pBatch, min(cmprecon.insertdate) PortalReceiveDate from cmprecon  
where exists (select distinct dcsid from x9 where cmprecon.DCSID = x9.dcsID)
and documentstatus = 'UPLOAD'
group by cmprecon.DCSID, cmprecon.pBatch
having MIN(cmprecon.insertdate) < '2014-11-01 0:0:0'
order by MIN(cmprecon.insertdate)



--without x9
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and d.Comments is null  and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '2014-12-01 0:0:0'
order by min(cr.insertdate)






select * from FTPError where exists (select * from document where dcsid in (
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD')
and FTPError.imageid = document.ImageID)






--cmp recon report to VBMS with no FTPERROR
select distinct cmprecon.DCSID, cmprecon.pBatch, min(cmprecon.insertdate) PortalReceiveDate from cmprecon  
left join document 
on cmprecon.DCSID = document.dcsID
left join FTPError
on document.imageid = ftperror.imageid
where exists (select distinct dcsid from x9 where cmprecon.DCSID = x9.dcsID)
and cmprecon.DocumentStatus = 'UPLOAD'
and not exists (select * from ftperror where document.ImageID = FTPError.imageid)
group by cmprecon.DCSID, cmprecon.pBatch
having MIN(cmprecon.insertdate) < '2014-11-14 0:0:0'
order by MIN(cmprecon.insertdate)


--cmp recon report to VBMS with  FTPERROR
select distinct cmprecon.DCSID, cmprecon.pBatch, min(cmprecon.insertdate) PortalReceiveDate from cmprecon  
left join document 
on cmprecon.DCSID = document.dcsID
left join FTPError
on document.imageid = ftperror.imageid
where exists (select distinct dcsid from x9 where cmprecon.DCSID = x9.dcsID)
and cmprecon.DocumentStatus = 'UPLOAD'
and  exists (select * from ftperror where document.ImageID = FTPError.imageid and comments like 'Detail: Null key returned for cache operation (maybe you are using named params on classes without debug info?)%')
group by cmprecon.DCSID, cmprecon.pBatch
having MIN(cmprecon.insertdate) < '2014-11-10 0:0:0'
order by MIN(cmprecon.insertdate)


Detail: Null key returned for cache operation (maybe you are using named params on classes without debug info?) CacheableOperation[public boolean gov.va.vba.vbms.dal.impl.orchestration.ClaimDataServiceImpl.checkForClaims(java.lang.String)] caches=[claimsExistByFileNumberCache] | key='#fileNumber' | condition='' | unless='!#result' Message: Unable to upload form document UID: 5be8ff27-ffe7-48bb-9956-91e499805b4c

select * from document where dcsid = 'DCSID031421606347010021'
select * from FTPError where imageid = 'CACI_CMP_142192901P001046684'

select * from cmprecon where dcsid = 'DCSID031421606347010021'


select * from FTPError where exists (select * from document where dcsid = 'DCSID031421406199010045' and FTPError.imageid = document.ImageID)


--delete from FTPError where comments like 'Detail: Null key returned for cache operation (maybe you are using named params on classes without debug info?)%'


--TEMP TABLE INSERT
--cmp recon report to VBMS with no FTPERROR
select distinct cmprecon.DCSID, cmprecon.pBatch, min(cmprecon.insertdate) PortalReceiveDate into xB from cmprecon  
left join document 
on cmprecon.DCSID = document.dcsID
left join FTPError
on document.imageid = ftperror.imageid
where exists (select distinct dcsid from x9 where cmprecon.DCSID = x9.dcsID)
and cmprecon.DocumentStatus = 'UPLOAD'
and not exists (select * from ftperror where document.ImageID = FTPError.imageid)
group by cmprecon.DCSID, cmprecon.pBatch
having MIN(cmprecon.insertdate) < '2014-11-14 0:0:0'
order by MIN(cmprecon.insertdate)

select * from document where imageid = 'caci_141762901p001038532'
select * from document where dcsid = 'DCSID041423800059010013'
select * from xB where pBatch = '03141560606401' order by DCSID

select * from document where dcsid = 'DCSID031416106053010001'
select * from cmprecon where dcsid = 'DCSID031416106053010001'


drop table xB
select distinct pbatch from xB where pbatch 


drop table xB