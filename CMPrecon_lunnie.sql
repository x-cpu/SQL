---sams
select * from document where dcsid in 
(select distinct dcsid from cmprecon where documentstatus ='upload' and  insertdate < '2014-08-20 0:0:0')
and ftpstime is null and comments is null 
--and imagedatetime < '8/22/2014 0:0:0'
order by imagedatetime




select * from FTPDetails order by etime desc

select * from Document where dcsid = 'DCSID031416406079010001'
select * from CustomerDATA where dcsid = 'DCSID031412706004010017'
select * from cmprecon where dcsid = 'DCSID031420006053010009'


select * from FTPDetails order by etime desc

select * from cmprecon where XMLfilename = '03141270600401-146af91a99e'

select * from document where ImageID = 'caci_141762901p001038480'

select * from FTPDetails where batchname = '03140780600601'

select * from PhysicalBatch where PBatch in (
'03140780600601',
'03102100600101',
'03142140600201',
'03142160611201',
'03142300612801',
'03142370800701',
'03142370800201',
'03142370800301',
'03142370800401',
'03142370800801',
'03142370800601',
'03142370800501')


select * from FTPDetails where batchname in (
'03140780600601',
'03102100600101',
'03142140600201',
'03142160611201',
'03142300612801',
'03142370800701',
'03142370800201',
'03142370800301',
'03142370800401',
'03142370800801',
'03142370800601',
'03142370800501'
03142300612801
03142530600301
03143050610201
03143070628001



) order by ETime, batchname


update PhysicalBatch
set POBox = '5235-Unsolicited'
where PBatch in (
'03142370800201',
'03142370800301',
'03142370800401',
'03142370800501',
'03142370800601',
'03142370800701',
'03142370800801')

update PhysicalBatch
set CRCDestination = '5235-Unsolicited'
where PBatch in (
'03142370800201',
'03142370800301',
'03142370800401',
'03142370800501',
'03142370800601',
'03142370800701',
'03142370800801')


select * from PhysicalBatch where batchclassname = 'PMR' 


select * from Stats_IBML where kbatch in (
'03143220612801',
'03143220614901',
'03143220615001',
'03143220615101',
'03143220615201',
'03143220615301',
'03143220620801',
'03143220620901',
'03143220621001',
'03143220621101',
'03143220621201',
'03143220621301',
'03143220621401')


select * from TurboscanNG1.dbo.batches where batchname = '03143220615101'


select kbatch, max(releasedate) as exportdate  from stats where (kbatch like '03%' or kbatch like '04%' or kbatch like '05%' )
                            and kbatch not in (select distinct batchname from ftpdetails where AckTime is not null)
                            and kbatch not in (select distinct batchname from cmprecon where stats.kbatch = cmprecon.pBatch)
                            and kbatch not in (select distinct batchname from FTPDetails where etime is not null and comments is null)
                            group by kbatch
                            order by max(releasedate)

select * from PhysicalBatch where pbatch in (
'03143070602201',
'03143070621101',
'03143070626601',
'03143070616201',
'03143070627001',
'03143070624201',
'03143070621701',
'03143070625401',
'04143120002201',
'04143120001401')


select * from Document where pbatch in (
'03143070602201',
'03143070621101',
'03143070626601',
'03143070616201',
'03143070627001',
'03143070624201',
'03143070621701',
'03143070625401',
'04143120002201',
'04143120001401')


select * from ftpdetails where batchname = '03141620619101'
select * from CustomerDATA where pbatch = '04143120002201'
select * from Document where pbatch = '04143120002201'
04143120001401

03142530600301
04143120002201
04143120001401

update document 
set FileNumber = '371562478'
where filenumber = '3542175' and dcsid = 'DCSID041431200022010039' and pbatch = '04143120002201'

update CustomerDATA 
set FileNumber = '371562478'
where filenumber = '3542175' and dcsid = 'DCSID041431200022010039' and pbatch = '04143120002201'


select * from document where pbatch in (
'03141620619101',
'03141620624601',
'03142000619201',
'03142040611601',
'03142090602901',
'03142100605801',
'03142110602301')


--lists of 5
select distinct batchname, max(acktime) from FTPDetails where batchname in (
'03141620619101',
'03141620624601',
'03142000619201',
'03142040611601',
'03142090602901',
'03142100605801',
'03142110602301') 
group by batchname
order by etime, batchname

select sum(numpages) from document where pbatch = '03142100605801'

select * from document where pbatch in (
'03142530600301',
'03143070602201',
'03143070621101',
'03143070626601',
'03143070616201',
'03143070627001',
'03143070624201',
'03143070621701',
'03143070625401',
'04143120002201',
'04143120001401')

--remaining batches
select * from FTPDetails where batchname in (
'03142530600301',
'03143070602201',
'03143070621101',
'03143070626601',
'03143070616201',
'03143070627001',
'03143070624201',
'03143070621701',
'03143070625401',
'04143120002201',
'04143120001401')

--no sem files
select * from ftpdetails where batchname in (
'03143070602201',
'03143070621101',
'03143070626601',
'03143070616201',
'03143070627001',
'03143070624201',
'03143070621701',
'03143070625401')

--no sem files existed
select * from document where pbatch in (
'03143070602201',
'03143070621101',
'03143070626601',
'03143070616201',
'03143070627001',
'03143070624201',
'03143070621701',
'03143070625401')


select * from TurboscanNG1.dbo.Batches where batchname in (
'03143220611301', 
'03143170611601',
'03143110621501')


select distinct p.PBatch, p.InvTime BatchCheckInTime,
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep = 11 and batchlocation = 0 then 'Clean'
END
AS "Batch Location" from PhysicalBatch p
left join TurboscanNG1.dbo.batches ts
on p.PBatch = ts.BatchName
where BatchClassName = 'PMR' 
and not exists (select * from FTPDetails where p.PBatch = FTPDetails.batchname)

select * from TurboscanNG1.dbo.batches where BatchName in (
'03143190605101',
'03143180611801')