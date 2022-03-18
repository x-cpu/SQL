select distinct kbatch Batchname, RMN, sum(images) TotalImages, min(releasedate) TSReleasedate from Stats
where exists 
(select * from document where ftpstime is null and comments is null and pbatch like '02%' and stats.kbatch = document.PBatch)
group by kbatch, RMN
order by TSReleasedate

select * from document where pbatch = '02140950003403'

select sum(images) from stats where kbatch = '02142860400503'

select sum(numpages) from Document where pbatch = '02142860400503'

select * from Document where pbatch = '02140840500902' and dcsID = 'HT1K7FF14S8GOR'
select * from CustomerDATA where pbatch = '02140840500902' and dcsid = 'HT1K7FF14S8GOR'

delete from document where syskey = '29567294' and pbatch = '02140840500902'

select * into docid.dbo.document20k from Document where pbatch = '02140840500902' and syskey = '29567294' 

select * from Stats_IBML where batchname = '02142810404901'

select * from CustomerDATA where pbatch = '02142820002201'

select * from Boxmapping where dcsID = 'HZX1RMO99HYIIA'

select * from TurboscanNG1.dbo.Batches where batchname = '02142830006105'

select * from Document where dcsID = 'HIBP21EJTD7U06'

select * from RMNCompleted where RMN = '314VB0718132591O'

select * from TurboscanNG1.dbo.batches where batchname = '03142790614601'

select * from Stats_IBML where kbatch = '02140840500902'

select * from stats where kbatch = '02140840500902'

update Stats
set kbatch = '02140840500902', batchname = '02140840500902'
where kbatch = '02140840500902_x'

select * from document where dcsid = 'I0P8JWKHNJOX1F'
select * from document where dcsid = 'HXRVM17V4O4O4D'

row 2 RMN isn't showing as CheckedIN
row 5 RMN is showing uploaded "CompletedRMN"
row 537 DCSID has uploaded to VBMS 10/15/2014
row 538 5 of the 6 batches created for the RMN are in TurboScan


select * from completedrmn

select * from manifestdcs where rmn = '314VB0718132591O'
select distinct pbatch from document where rmn = '314VB0718132591O'


select * from TurboscanNG1.dbo.batches where exists
(select * from PhysicalBatch where rmn = '314VB0718143205O' and TurboscanNG1.dbo.batches.BatchName = PhysicalBatch.PBatch)

select * from TurboscanNG1.dbo.batches where exists
(select * from PhysicalBatch where rmn = '314VB0718132591O' and TurboscanNG1.dbo.batches.BatchName = PhysicalBatch.PBatch)