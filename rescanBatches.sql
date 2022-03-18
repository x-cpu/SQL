select distinct batchname, UserName from TS_Audit where username in (
'chansen',
'cmilam',
'ayarber',
'aatkinson',
'lta5',
'smills',
'syoung2')
--and UserImagesProcessed >= '1' 
and TimeStamp >= '2015-10-12 0:0:0' and TimeStamp <= '2015-10-18 23:59:59.999'
and (TSModule = 'DocID' or TSModule = 'DocID QC' or TSModule = 'ImageQC')
group by BatchName, UserName
order by UserName

select distinct tsmodule from TS_Audit



select distinct batchname from TS_Audit where username in (
'chansen',
'cmilam',
'ayarber',
'aatkinson',
'lta5',
'smills',
'syoung2')
--UserImagesProcessed >= '1' 
and TimeStamp >= '2015-10-12 0:0:0' and TimeStamp <= '2015-10-18 23:59:59.999'
and (TSModule = 'DocID' or TSModule = 'DocID QC' or TSModule = 'ImageQC')
order by BatchName



select distinct pbatch, BoxNO from PhysicalBatch where pbatch like '03%' and InvTime > '2015-05-01'
and not exists (select * from CMPBoxmapping where pbatch = PhysicalBatch.PBatch)

