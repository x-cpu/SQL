select pbatch, count(distinct dcsid), sum(numpages) from document where PBatch like '03%'
and ImageDateTime > '2015-07-01'
and exists (select * from stats where document.pbatch = stats.kbatch)
and exists (select * from PhysicalBatch where (CRCDestination like '4%' or CRCDestination like '5%') and Document.PBatch = PhysicalBatch.pbatch)
and exists (select * from TS_Audit where TSModule = 'DocID' and UserName = 'cthach' and Document.PBatch = TS_Audit.BatchName)
group by pbatch
order by count(distinct dcsid), sum(numpages) 