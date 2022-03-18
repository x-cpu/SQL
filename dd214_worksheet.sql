--daily docid stats
select distinct BatchName, TSModule, sum(userproctime) Seconds  
from ts_audit 
where exists
(select * from TurboscanNG1.dbo.batches where batchname like '02%' and wfstep = 7 and batchdesc = 'QA2 - DocID' and ts_audit.batchname = batchname)
and tsmodule ='docid'
group by batchname, tsmodule
order by batchname


--daily docid stats
select distinct t.BatchName, t.TSModule, sum(d.numpages) Pages, sum(t.userproctime) Seconds  
from ts_audit t
left join Document d
on t.BatchName = d.pbatch
where exists
(select * from stats where t.BatchName = kbatch and releasedate > '2016-11-01' and kbatch like '02%')
--(select * from document where TS_Audit.BatchName = pbatch and rmn = 'rmndd214' and imagedatetime > '2016-11-01')
and t.tsmodule ='docid' and d.rmn = 'rmndd214' and d.imagedatetime > '2016-11-01'
group by t.batchname, t.tsmodule
order by t.batchname

select distinct d.pbatch, sum(d.numpages) 
from document d




select distinct kbatch from stats where releasedate >= '2016-12-14' and kbatch like '02%'


use dva select username, 
                        case
                        WHEN TSModule = '4' then 'Separation'
                        WHEN TSModule = 'AutoIndex' then 'AutoIndex'
                        WHEN TSModule = 'DocID' then 'DocID'
                        WHEN TSModule = 'DocID QC' then 'DocID QC'
                        WHEN TSModule = 'Enhance' then 'Enhance'
                        WHEN TSModule = 'ImageQC' then 'ImageQC'
                        WHEN TSModule = 'Manual Index' then 'Manual Index'
                        WHEN TSModule = 'Manual Index QC' then 'Manual Index QC'
                        WHEN TSModule = 'PREP' then 'Prep'
                        WHEN TSModule = 'Verification' then 'Verification'
                        END
                        AS TSModule,
                        totalimages TotalIMG, ImagesProcessed ProcIMG, ImagesRejected RejIMG, UserImagesProcessed UserProcIMG, 
                        RIGHT('0' + CAST(UserProcTime/3600 as varchar),2) + ':' + 
                        RIGHT('0' + CAST((UserProcTime/60) % 60 as varchar),2) + ':' +
                        RIGHT('0' + CAST(UserProcTime % 60 as varchar),2) as UserProcTime, 
                        TimeStamp, batchname BatchName
                        from TS_Audit where username <> '998'"