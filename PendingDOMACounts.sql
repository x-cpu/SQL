select distinct d.pbatch, d.docidDoctype
from document d
where d.ImageDateTime >= '2019-01-01'
and exists (select * from stats where d.pbatch = kbatch)
and not exists (select * from dmhsFTPDetails where d.PBatch = batchname)
and d.pbatch like '04%'
and d.docidDoctype in (
'VA 21-4142 Authorization for Release of Information')
order by d.docidDoctype


select count(distinct d.pbatch) Batches, count (distinct d.imageid) Documents, sum(d.NumPages) Images
from document d
where d.ImageDateTime >= '2019-01-08'
and exists (select * from stats where d.pbatch = kbatch)
and not exists (select * from dmhsFTPDetails where d.PBatch = batchname)
and d.pbatch like '04%'
and d.docidDoctype in ('VA 21-4142 Authorization for Release of Information')

