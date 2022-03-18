
--25
select * from batches where wfstep<>'4' and wfstep <>'11' and batchname in (select distinct pbatch from dva.dbo.physicalbatch where cordest='1')
order by wfstep


use DVA
update physicalbatch set cordest='1' 
where rndaudit is  null
and pbatch in 
(
select distinct kbatch from stats_ibml 
where 
kbatch in 
(select distinct batchname from turboscanng1.dbo.batches 
where wfstep=4 
and batchdesc is null
and len(batchname)=14
and jobid=8)
and kbatch in (select distinct pbatch from docid.dbo.mercury)
and kbatch in (select distinct pbatch from physicalbatch where rndaudit is null )
)


---NEW WAY
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
--wfstep=4 
--and 
batchdesc is null
and len(batchname)=14
and jobid=8)
and kbatch in (select distinct pbatch from docid.dbo.mercury)
and kbatch in (select distinct pbatch from physicalbatch where rndaudit is null )
)

---NEW WAY
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





use turboscanng1
exec VA_AutoPushBatches_ImageQC_ITOnly




select * from batches where wfstep<>'4' and wfstep <>'11' and batchname in (select distinct pbatch from dva.dbo.physicalbatch where cordest='1')
order by wfstep


select received_date, * from document where dcsid = 'HU5IMMS8KTE7RD'

received_date	ImageID
03/19/2014	CACI_141202901P001025309
03/19/2014	CACI_141202901P001025310
03/19/2014	CACI_141202901P001025311

select * from document where imageid in (
'CACI_141202901P001025309',
'CACI_141202901P001025310',
'CACI_141202901P001025311')

update document
set imageid = 'CACI_141202901T001025309'
wehre imageid = 'CACI_141202901P001025309' and dcsid = 'HU5IMMS8KTE7RD'

select * from document where dcsid = 'HTFXZ4YLW47H9H'

update document
set filenumber = '315928788'
where filenumber = '315926788' and dcsid = 'HTFXZ4YLW47H9H'


update customerdata
set filenumber = '315928788'
where filenumber = '315926788' and dcsid = 'HTFXZ4YLW47H9H'






