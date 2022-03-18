select batchname, UserName, TSModule, TotalImages, TimeStamp from ts_audit where batchname = '02152400003905' order by id


select errortype, errordatetime, batchname, docid, username, OldDocType, NewDocType, OldDateStamp, NewDateStamp, TSModule from TSErrorTracking where batchname = '02152400405406'


select distinct batchname, username, docid ReviewDoc, TSModule from QA_Log where batchname = '02152400405506' and TSModule = 'Manual Index'
select distinct batchname, username, docid ReviewDoc, TSModule from  QA_Log where batchname = '02152400405506' and TSModule = 'verification'



select * from TurboscanNG1.dbo.batches where batchname = '02152400405605'


use TurboscanNG1
exec TS_GetIndexes_1 768008



use dva
select * from customercheckin where rmn in (
'362VB0824156552H',
'362VB0824154234H',
'316VB0821159806G')
2219
5223

select * from TurboscanNG1.dbo.batches where batchname in (
'02152400003905',
'02152400405705',
'02152400405506',
'02152400405605',
'02152400003805',
'02152400405406',
'02152400405805')


select RMN, pbatch from PhysicalBatch where pbatch in (
'02152400003905',
'02152400405705',
'02152400405506',
'02152400405605',
'02152400003805',
'02152400405406',
'02152400405805')



select imageid, comments UATResponse from document where pbatch in 



select * from TurboscanNG1.dbo.batches where batchname in (
'03152460623701',
'03152460623801',
'03152460604901',
'03152460624001',
'03152460623901')
