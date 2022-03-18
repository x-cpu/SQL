
---Complete RMNs Exported
---RMN CheckIn and Completed 
select distinct pb.RMN, cc.claimtype Type, max(convert(varchar, pb.InvTime, 102)) CheckInDate, 
                                --max(s.releasedate) ExportedDate, 
                                count(distinct pb.pbatch) #CheckInBatches, count(distinct s.kbatch) #ExportedBatches from PhysicalBatch pb
                                left outer join stats s
                                --on pb.RMN = s.RMN
                                on pb.PBatch = s.kbatch
								left join customerCheckIn cc
								on pb.RMN = cc.RMN
                                --where exists (select * from stats where pb.PBatch = Stats.kbatch)
                                where pb.PBatch like '02%'
                                and SUBSTRING(pb.pbatch, 3, 5) = '15197'
                                --and pb.InvTime >= @sdate and pb.InvTime <= @edate
                                group by pb.RMN, cc.claimtype
                                --having count(distinct pb.pbatch) = count(distinct s.kbatch)
                                order by pb.RMN
                                --order by ExportedDate desc


---different julian date for RMNs
select distinct pbatch BatchName from physicalbatch where RMN = '317VB0509155900S' and SUBSTRING(pbatch, 3, 5) = '15197' 

select distinct RMN, count(distinct SUBSTRING(pbatch, 3, 5)) from PhysicalBatch
group by RMN
having count(distinct SUBSTRING(pbatch, 3, 5)) > 1

select distinct pbatch from physicalbatch where rmn = '317VB0713151766S'

---Complete RMNs Exported
---RMN CheckIn and Completed 
select distinct pb.RMN, max(pb.InvTime) CheckInDate, max(s.releasedate) ExportedDate, count(distinct pb.pbatch) #CheckInBatches, count(distinct s.kbatch) #ExportedBatches from PhysicalBatch pb
left outer join stats s
on pb.RMN = s.RMN
--where exists (select * from stats where pb.PBatch = Stats.kbatch)
where pb.PBatch like '02%'
and SUBSTRING(pb.pbatch, 3, 5) = '15195'
and pb.InvTime > '2015-05-01'
group by pb.RMN
having count(distinct pb.pbatch) = count(distinct s.kbatch)
--order by CheckInDate desc
order by ExportedDate desc


---juliandate test
select distinct pb.RMN, max(pb.InvTime) CheckInDate, max(s.releasedate) ExportedDate, count(distinct pb.pbatch) #CheckInBatches, count(distinct s.kbatch) #ExportedBatches from PhysicalBatch pb
                                left outer join stats s
                                on pb.RMN = s.RMN
                                --where exists (select * from stats where pb.PBatch = Stats.kbatch)
                                where pb.PBatch like '02%'
                                and SUBSTRING(pb.pbatch, 3, 5) = '15195'
                                --and pb.InvTime >= @sdate and pb.InvTime <= @edate
                                group by pb.RMN
                                having count(distinct pb.pbatch) = count(distinct s.kbatch)
                                order by CheckInDate desc
                                --order by ExportedDate desc



select * from CustomerDATA where filenumber = '411399091'

---RMN CheckIn and Not Completed
select distinct RMN, max(pb.InvTime) CheckInDate, count(distinct pbatch) #ofBatches from PhysicalBatch pb
where not exists (select * from stats where pb.PBatch = Stats.kbatch)
and pb.PBatch like '02%'
group by RMN
order by CheckInDate desc



---RMN CheckIn and Completed ALMOST shows mismatches too
select distinct pb.RMN, max(pb.InvTime) CheckInDate, count(distinct pb.pbatch) #CheckInBatches, count(distinct s.kbatch) #ExportedBatches from PhysicalBatch pb
left outer join stats s
on pb.RMN = s.RMN
--where exists (select * from stats where pb.PBatch = Stats.kbatch)
where pb.PBatch like '02%'
and pb.InvTime > '2015-05-01'
group by pb.RMN
--having count(distinct pb.pbatch) = count(distinct s.kbatch)
order by CheckInDate desc


---RMN CheckIn and Completed 
select distinct pb.RMN, max(pb.InvTime) CheckInDate, count(distinct pb.pbatch) #CheckInBatches, count(distinct s.kbatch) #ExportedBatches from PhysicalBatch pb
left outer join stats s
on pb.RMN = s.RMN
--where exists (select * from stats where pb.PBatch = Stats.kbatch)
where pb.PBatch like '02%'
and pb.InvTime > '2015-05-01'
group by pb.RMN
having count(distinct pb.pbatch) = count(distinct s.kbatch)
order by CheckInDate desc







select distinct substring(PBatch, 3, 5) from PhysicalBatch where rmn = '362VB0715150001H'

select distinct kbatch from Stats where rmn = '362VB0715150001H'


select * from RMNCompleted order by completedate desc



select * from Stats where kbatch in (
'02151960003701',
'02151960003702',
'02151960003703',
'02151960807501')


select * from document where ImageID = 'PMRID_2377250'
select * from domarecon where ImageID = 'PMRID_2377250'
select * from TurboscanNG1.dbo.batches where batchname = '02152020803801'

select * from domarecon where XMLfilename = '20150721151333.xml'


select * from pmrzipdownload where   exists (
select * from domarecon where pmrzipdownload.ZIPfilename = substring(domarecon.XMLfilename, 0, 15))



---different julian date for RMNs
select distinct pbatch BatchName from physicalbatch where RMN = '317VB0509155900S' and SUBSTRING(pbatch, 3, 5) = '15197' 

select distinct RMN, count(distinct SUBSTRING(pbatch, 3, 5)) from PhysicalBatch
group by RMN
having count(distinct SUBSTRING(pbatch, 3, 5)) > 1