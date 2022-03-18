select x.BatchName, x.Documents, x.Images, SUM(t.UserProcTime) DocID_Seconds
FROM
(select distinct d.pbatch BatchName, count(distinct imageid) Documents, sum(d.numpages) Images
from document d
where d.rmn = 'rmndd214'
and exists (select * from stats where d.pbatch = kbatch)
group by d.pbatch) x
left join TS_Audit t
on x.BatchName = t.BatchName
where t.TSModule = 'docid' 
group by x.BatchName, x.Documents, x.Images
order by x.BatchName


select x.BatchName, x.Documents, x.Images, SUM(t.UserProcTime) ImageQC_Seconds
FROM
(select distinct d.pbatch BatchName, count(distinct imageid) Documents, sum(d.numpages) Images
from document d
where d.rmn = 'rmndd214'
and exists (select * from stats where d.pbatch = kbatch)
group by d.pbatch) x
left join TS_Audit t
on x.BatchName = t.BatchName
where t.TSModule = 'ImageQC' 
group by x.BatchName, x.Documents, x.Images
order by x.BatchName




--on d.pbatch = t.BatchName and t.TSModule = 'docid' and t.UserImagesProcessed > 0


--daily docid stats
select distinct t.BatchName, sum(d.numpages) Pages, sum(t.userproctime) Seconds  
from ts_audit t
left join Document d
on t.BatchName = d.pbatch
where exists
(select * from stats where t.BatchName = kbatch and releasedate > '2016-11-01' and kbatch like '02%')
--(select * from document where TS_Audit.BatchName = pbatch and rmn = 'rmndd214' and imagedatetime > '2016-11-01')
and t.tsmodule ='docid' and d.rmn = 'rmndd214' and d.imagedatetime > '2016-11-01'
group by t.batchname, t.tsmodule
order by t.batchname



select sum(UserProcTime) from TS_Audit where batchname = '02162991113501' and TSModule = 'DocID'

select * from TS_Audit where batchname = '02162991113501' and TSModule = 'docid' and ImagesProcessed > 0