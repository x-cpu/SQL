---to check if batch OK to move to CLEAN - CMP 
select distinct kbatch  batchname from stats where exists
(select distinct batchname from TurboscanNG1.dbo.batches tb where batchname not like '02%' and batchdesc = 'Batch has already been exported!' and stats.kbatch = tb.batchname)
and exists (select distinct batchname from FTPDetails where AckTime is not null and stats.kbatch = FTPDetails.batchname)



---to check if batch OK to move to CLEAN - DCS 
select distinct kbatch  batchname from stats where exists
(select distinct batchname from TurboscanNG1.dbo.batches tb where batchname  like '02%' and batchdesc = 'Batch has already been exported!' and stats.kbatch = tb.batchname)
and exists (select distinct pbatch from document where OCRExportTime is not null and stats.kbatch = document.PBatch)

select * from dcmp where batchname = '02133470209101'

drop table dcmp

select * from customerCheckIn where rmn = '304VB1203143621A'

delete from DVA.dbo.dcmp where batchname in (
			'03071430600101',
			'03100670600101'
			)



select * from dcmp where batchname = '03141640600701'




select * from FTPDetails where batchname = '03071430600101'

select * from Stats where batchname = '03071430600101'


select * from TurboscanNG1.dbo.batches where batchname = '03141640600701'


03082910600101
03102140600101
03103280600101
03110120600101
03113040600101
03120110600101
03122270600101

03071430600101
03100670600101


---to check if batch OK to move to CLEAN
select distinct kbatch from stats where exists
--(select distinct batchname from TurboscanNG1.dbo.batches tb where batchname not like '02%' and batchdesc = 'Batch has already been exported!' and stats.kbatch = tb.batchname)
(select distinct batchname from FTPDetails where AckTime is null and stats.kbatch = FTPDetails.batchname)



03072960600101
03082910600101
03102140600101
03103280600101
03110120600101
03113040600101
03120110600101
03122270600101