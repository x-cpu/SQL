select * from turboscanng1.dbo.batches where wfstep = 6
and batchname like '02%'
and batchname in (select distinct batchname from ts_audit where tsmodule = 'docid' and imagesrejected >0)
order by totalimages desc
