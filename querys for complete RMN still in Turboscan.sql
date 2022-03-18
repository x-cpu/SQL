--based on batches in Turboscan DocID


--full RMN batches not exported from Turboscan --CMP
select distinct p.RMN, p.PBatch from PhysicalBatch p
where p.RNDAudit is NULL
and exists (select * from TurboscanNG1.dbo.batches  where jobid = 11 and wfstep = 6 and p.PBatch = batchname)
and not exists (select * from stats where p.RMN = RMN)  
order by RMN                             


            

--full RMN batches not exported from Turboscan --DCS
select distinct p.RMN, p.PBatch from PhysicalBatch p
where p.RNDAudit is NULL
and exists (select * from TurboscanNG1.dbo.batches  where jobid = 8 and wfstep = 6 and p.PBatch = batchname)
and not exists (select * from stats where p.RMN = RMN)  
order by RMN                                         



--DISTINCT RMN  not exported and not RNDAUDIT from Turboscan --DCS
select distinct p.RMN from PhysicalBatch p
where p.RNDAudit is NULL
and exists (select * from TurboscanNG1.dbo.batches  where jobid = 8 and wfstep = 6 and p.PBatch = batchname)
and not exists (select * from stats where p.RMN = RMN)  
order by RMN                                         


--DO NOT MODIFY
use dva
--full RMN in Verification
select rmn, pbatch from physicalbatch where rmn in 
(select p.rmn from physicalbatch  as p , turboscanng1.dbo.batches as tb
where p.pbatch = tb.batchname 
and tb.wfstep=10 
and p.rndaudit is not null
group by p.rmn
having count(p.pbatch)=count(tb.batchname)
)

---Lunnie modification
--full RMN in Verification
use dva
select T.RMN, T.PBATCH BatchName, min(pb.InvTime) CheckInDate, max(tsa.TimeStamp) DocIDDate
FROM
(select rmn, pbatch from physicalbatch where rmn in
(select p.rmn from physicalbatch p, turboscanng1.dbo.batches tb
where p.pbatch = tb.batchname 
and tb.wfstep=10 
and p.rndaudit is not null
group by p.rmn
having count(p.pbatch)=count(tb.batchname)))T
left join TS_Audit tsa
on T.PBatch = tsa.BatchName
left join PhysicalBatch pb
on T.PBatch = pb.PBatch
group by T.RMN, T.PBATCH
order by T.RMN, T.PBatch





select * from TS_Audit where batchname = '02150670801301'

select p.PBatch, p.InvTime CheckInDate, p.CRCDestination POBox2, max(tsa.TimeStamp) DocIDDate, max(s.releasedate) ExportDate, max(f.eTime) PortalUploadDate from PhysicalBatch p 
join TS_Audit tsa
on p.PBatch = tsa.BatchName
join stats s
on p.PBatch = s.kbatch
join FTPDetails f
on p.PBatch = f.batchname
where PBatch in (