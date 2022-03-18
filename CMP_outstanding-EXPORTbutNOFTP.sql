--exported but NOT UPLOADED TO THE PORTAL
select kbatch, max(releasedate) as exportdate  from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
                            and kbatch not in (select distinct batchname from ftpdetails where AckTime is not null)
                            and kbatch not in (select distinct pBatch from cmprecon where stats.kbatch = cmprecon.pBatch)
                            and kbatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)
                            group by kbatch
                            order by max(releasedate)

							select * from cmprecon where batchname = '03142530600301'
							select * from cmprecon where pBatch = '03142530600301'

--exported and received from CACI PORTAL but no upload to VBMS "MASTER"
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '12/11/2014 0:0:0'
order by min(cr.insertdate)


--exported and received from CACI PORTAL but no upload to VBMS "MASTER"
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate into xS from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '12/11/2014 0:0:0'
order by min(cr.insertdate)

select * from xR where dcsid = 'DCSID041428300008010019'
select distinct pbatch from xR 
select * from xr where pbatch = '03142350628401'

select * from cmprecon where dcsid = 'DCSID031423506284010032'
select * from cmpxmldownload where XMLfilename = '03142350628401-14a302b5010'


select * from cmpxmldownload where acktime is null 
and exists (select * from xR where cmpxmldownload.batchname = xr.pBatch) order by insertdate

--exported and received from CACI PORTAL but no upload to VBMS "MASTER"
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate  from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and d.Comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '12/5/2014 15:0:0'
order by min(cr.insertdate)

--INSERT INTO TEMP TABLE VERSION -- exported and received from CACI PORTAL but no upload to VBMS "MASTER"
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate into xO from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and d.Comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '12/10/2014 0:0:0'
order by min(cr.insertdate)

drop table xO


--exported and received from CACI PORTAL but no upload to VBMS "MASTER" REVISION
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate from cmprecon cr 
--where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and d.Comments is null and cr.DCSID = d.dcsID)
where exists (select distinct dcsid from x9  where cr.DCSID = x9.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '12/2/2014 0:0:0'
order by MIN(cr.insertdate)

--temp table
select distinct dcsid into x9 from document where pbatch not like '02%' and ftpstime is null and Comments is null
select * from x9
exec msdb.dbo.sp_start_job N'x9'
select * from document where imageid = 'CACI_CMP_142192901P001046667'

delete from x9
--check ftperror to ensure no failures exists
select * from FTPError where exists (select * from document where dcsid in (
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD')
and FTPError.imageid = document.ImageID)


--exported and received from CACI PORTAL but not UPLOAD TO VBMS "NEVER ATTEMPTED"
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and d.comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
and cr.DCSID not in (select 

--exported and received from CACI PORTAL but not UPLOAD TO VBMS "ATTEMPTED"
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and d.comments is not null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'



--exported and received from CACI PORTAL but not UPLOAD TO VBMS "NEVER ATTEMPTED"
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and d.comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
  
  
  
  
--exported and received from CACI PORTAL but not UPLOAD TO VBMS "ATTEMPTED"
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and d.comments is not null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'  



select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null  and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'


select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and d.Comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '11/15/2014 0:0:0'
order by min(cr.insertdate)


select * from FTPError where exists (select * from document where dcsid in (
select distinct cr.DCSID from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD')
and FTPError.imageid = document.ImageID)

select * from FTPError where exists (select * from document where dcsid = 'I1NICEX4250GYI' and FTPError.imageid = document.ImageID)

select * from document where dcsid = 'DCSID031413309001010002'
select * from cmprecon where dcsid = 'DCSID031411506011010002'


select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.ftpstime is null  and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
order by min(cr.insertdate)


select * from document where dcsid = 'DCSID031423906033010026'
select * from FTPError where imageid = 'CACI_CMP_142312901P001001231'

select * from document where dcsid in (
'DCSID031414306089010013',
'DCSID031414906058010016',
'DCSID031415006048010005',
'DCSID031415006067010007',
'DCSID031415306083010015',
'DCSID031415506106010042',
'DCSID031415506108010002')









select kbatch, max(releasedate) as exportdate  from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
and kbatch not in (select distinct batchname from ftpdetails where AckTime is not null)
and kbatch not in (select distinct batchname from cmprecon where stats.kbatch = cmprecon.pBatch)
--and kbatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)
group by kbatch
order by max(releasedate) 


select kbatch, max(releasedate) as exportdate from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
and kbatch not in (select distinct batchname from ftpdetails where AckTime is not null)
and kbatch not in (select distinct batchname from cmprecon where stats.kbatch = cmprecon.pBatch)
and kbatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)
--and kbatch not in (select distinct pbatch from document where stats.kbatch = document.PBatch and ftpstime is not null)
and kbatch not in (
'03142370800701',
'03142370800201',
'03142370800301',
'03142370800801',
'03142370800401',
'03142370800501',
'03142370800601',
'03142300612801',
'03142160611201',
'03142140600201',
'03142530600301',
'03102100600101',
'03142300612801',
'03143050610201',
'03143070628001',
'03142530600301',
'04143120001401',
'04143120002201',
'04143150000401')
and releasedate < '2014-10-31 0:0:0'
group by kbatch
order by max(releasedate) 


select *  from m_ftpdetails
where kbatch in (
'03142270610801',
'03142300601101',
'03142320612701')



delete
from stats
where kbatch in (
'03141420600401',
'03141430600701',
'03141430601601',
'03141430601301',
'03141470600901',
'03141490600301',
'03141350601401',
'03141480602301',
'03131890600101',
'03133290600101',
'03141470602601',
'03141480602601',
'03141470606101',
'03141490602001',
'03141430603501',
'03141550601201',
'03141490606801',
'03141200602601',
'03141550601501',
'03141360602701',
'03141330603201',
'03141430604701',
'03141360603501',
'03141340603001',
'03141470603301',
'03141490602201',
'03141490605801',
'03141430603401',
'03141430603301',
'03141540601901',
'03141410603501',
'03141400604201',
'03141470611001',
'03141320603601',
'03141490609901',
'03141550607601',
'03141340603901',
'03141550607501',
'03140650600501',
'03141270603601',
'03141220602301',
'03141530608401',
'03141580601701',
'03123410635601',
'03141550608401',
'03141540604701',
'03141500605601',
'03141470607501',
'03141490605901',
'03141490606001',
'03141500604201',
'03141580602001',
'03141420605901',
'03141580600801',
'03113060600101',
'03141540602901',
'03141570600301',
'03141560601301',
'03133580600101',
'03141110600801',
'03141580600201',
'03141540603801',
'03141560604201',
'03141610600301',
'03141610601101',
'03141620624601',
'03141610601701',
'03141610600401',
'03141620623801',
'03141630600501',
'03141610600601',
'03141550614101',
'03141630633301',
'03141630633201',
'03141620614501',
'03141620615301',
'03141620616501',
'03141620616601',
'03141620618701',
'03141620617201',
'03141630614901',
'03141630614601',
'03141620614601',
'03141630618801',
'03141630616001',
'03141630615801',
'03141630616501',
'03141630619201',
'03141630617101',
'03141630616601',
'03141560603301',
'03141620619101',
'03141620617001',
'03141630619301',
'03141560604301',
'03141630619401',
'03141640614001',
'03141630620301',
'03141640617001',
'03141640613601',
'03141640613001',
'03141640616801',
'03141640616601',
'03141640617801',
'03141620616101',
'03141640617601',
'03141630622001',
'03141650609601',
'03141650609801',
'03141640617901',
'03141650609501',
'03141640614601',
'03141660600101',
'03141640617201',
'03141650610101',
'03141650610401',
'03141670623101',
'03141690602001',
'03141710605401',
'03141770601101',
'03141770601701',
'03141760607001',
'03141810601401',
'03141840604301',
'03141840603801',
'03141860604801',
'03141890600801',
'03141950624101',
'03141980602801',
'03141980607101',
'03142000619201',
'03142010611601',
'03142000611301',
'03142020617301',
'03142040608301',
'03142030600501',
'03142030600701',
'03142040611601',
'03142040611701',
'03142040603301',
'03142060610101',
'03142060608601',
'03142070619101',
'03142090602901',
'03142090615501',
'03142090616001',
'03142090610201',
'03142090631201',
'03142100603101',
'03142100607701',
'03142100605801',
'03142110632001',
'03142110632101',
'03142100605401',
'03142110636201',
'03142120604501',
'03142110602301',
'03142110619201',
'03142110616201',
'03142120610301',
'03142120624201',
'03142120624901',
'03142130615401',
'03142120619901',
'03142150603801',
'03142160650701',
'03142160618801',
'03142160600701',
'03142160636401',
'03142160653101',
'03142170604001',
'03142160652601',
'03142190611701',
'03142180612201',
'03142180617401',
'03142180601801',
'03142180622501',
'03142190607601',
'03142180625601',
'03142190601101',
'03142200633901',
'03142210605301',
'03142200615001',
'03142210629101',
'03142200603201',
'03142210618501',
'03142230612401',
'03142230610401',
'03142230621001',
'03142230601601',
'03142230601701',
'03142230622401',
'03142260608101',
'04142240002701',
'03142250600801',
'03142260609001',
'03142270605501',
'03142260611501',
'03142260611701',
'03142270605001',
'03142270610801',
'03142320613401',
'03142300601101',
'03142260600901',
'03142320612701',
'03142280630301',
'03142310601501',
'03142320606501',
'03142330616101',
'03142330607401',
'03142350609501',
'04142380000501',
'03142350624901',
'03142350630701',
'03142350602001',
'03142370615401',
'03142370618701',
'03142410631201',
'03142480627801',
'03142480627401')






select kbatch, max(releasedate) as exportdate into m_ftpdetails from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
and kbatch not in (select distinct batchname from ftpdetails where AckTime is not null)
and kbatch not in (select distinct batchname from cmprecon where stats.kbatch = cmprecon.pBatch)
and kbatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)
group by kbatch
order by max(releasedate) 





select kbatch, max(releasedate) as exportdate  from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
and kbatch not in (select distinct kbatch from m_CMP_statsibml)
and kbatch not in (select distinct batchname from ftpdetails where AckTime is not null)
group by kbatch
order by max(releasedate)


select * from document where pbatch = '04143120001401'

select * from ftpdetails where exists (select distinct kbatch from  m_ftpdetails where FTPDetails.batchname = m_ftpdetails.kbatch)
and comments like '%PmrError%'


select * from PhysicalBatch where pbatch in (
'03142160611201',
'03142140600201',
'03102100600101',
'03123410635601',
'03140780600601')



03142370800701
03142370800201
03142370800301
03142370800801
03142370800401
03142370800501
03142370800601
03142300612801
03142160611201
03142140600201
03142530600301
03102100600101

select kbatch, max(releasedate) as exportdate  from stats where (kbatch not like '02%')
and kbatch not in (select distinct batchname from ftpdetails )
group by kbatch
order by max(releasedate)

select kbatch, max(releasedate) as exportdate  from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
and kbatch not in (select distinct batchname from ftpdetails)
group by kbatch
order by max(releasedate)


select * from FTPDetails where batchname = '03142530600301'
select * from document where pbatch = '03142630608701'
select * from cmprecon where pbatch = '03141320603401'


select distinct pbatch into m_ftpdetails from cmprecon where pbatch in (select distinct batchname  from ftpdetails where acktime is null )

select  * from m_ftpdetails 
select * from FTPDetails where exists (select * from m_ftpdetails where FTPDetails.batchname = m_ftpdetails.pBatch)

select kbatch, batchname from Stats_IBML where exists (
select * from m_CMP_statsibml where Stats_IBML.syskey = m_CMP_statsibml.syskey) order by kbatch

select * from m_cmp_statsibml where exists(select * from m_ftpdetails where m_cmp_statsibml.kbatch = m_ftpdetails.pBatch)