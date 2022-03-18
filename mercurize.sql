delete from mercury

use DVA
update physicalbatch set cordest='1' 
where rndaudit is  null
and pbatch in 
(
select distinct kbatch from stats_ibml 
where 
kbatch in 
(select distinct batchname from turboscanng1.dbo.batches 
where 
--batchdesc is null
len(batchname)=14
and jobid=8)
and kbatch in (select distinct pbatch from docid.dbo.mercury)
and kbatch in (select distinct pbatch from physicalbatch where rndaudit is null )
)




select distinct pbatch, cordest from physicalbatch where cordest = '1' and rndaudit is null and pbatch in (
select distinct pbatch from docid.dbo.mercury)


use dva
select sum(numpages) from document where  ftpstime is null and ocrexporttime is null and pbatch like '02%'