select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchname = '03141880601801' and batchlocation = '1' and BatchStatus = '8'
and batchname in (select * from Support.dbo.dcmp)


select * from Support.dbo.dcmp where batchname <>  '03141880601801'


select * from Support.dbo.dcmp where exists (
select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchlocation = '1' and BatchStatus = '8' and Support.dbo.dcmp.batchname = [TurboscanNG_ATL-VA-0001].dbo.batches.BatchName)


select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchlocation = '1' and BatchStatus = '8'


select * from Support.dbo.dcmp where not exists (
select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchlocation = '1' and BatchStatus = '8' and Support.dbo.dcmp.batchname = [TurboscanNG_ATL-VA-0001].dbo.batches.BatchName)




select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchlocation = '1' and BatchStatus = '8'
and batchname in (select * from Support.dbo.dcmp)


select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchname in (select * from Support.dbo.dcmp)



select * into Support.dbo.tsDel from [TurboscanNG_ATL-VA-0001].dbo.batches where batchlocation = '1' and BatchStatus = '8'

select * from [TurboscanNG_ATL-VA-0001].dbo.batches where batchname in (
'03141880603901',    
'03141880602101',
'03141880604301', 
'03141860605101', 
'03141860604601')



select * from Support.dbo.dcmp where not exists (
select * from [TurboscanNG_ATL-VA-0001].dbo.batches where  Support.dbo.dcmp.batchname = [TurboscanNG_ATL-VA-0001].dbo.batches.BatchName)

select * from [TurboscanNG_ATL-VA-0001].dbo.batches where  exists (
select * from Support.dbo.dcmp where  Support.dbo.dcmp.batchname = [TurboscanNG_ATL-VA-0001].dbo.batches.BatchName) order by batchlocation desc

select * from ftpdetails where batchname in (
'03141670630101',
'03141880602401',
'03141880607701',
'03141630602901')