select distinct T.PBatch
FROM (
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyTemp from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/12/2015') T
inner join stats s
on T.PBatch = s.kbatch



select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyTemp from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/12/2015'


select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyTemp3 from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/23/2015'

--basic
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/26/2015'



--master 623
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyTemp3 from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/23/2015'


--master 624
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyMain0625 from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/26/2015'


--master 624 updated
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyMain0624x from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/25/2015'


select * from phillyMain0623

select * into phillyTemp4 from phillyTemp3 where not exists (select * from FTPDetails where phillyTemp3.PBatch = FTPDetails.batchname)


	   use turboscanng1 select distinct T.BatchName, pp.BoxNO, p.RMN,  T.TurboscanBatchLocation, T.BatchStatus, T.TurboscanImportDateTime, T.BatchDesc
                        FROM
                        (select distinct batchname, Batchdesc
                        case 
							   WHEN WFStep = 1 then 'Capture'
							   WHEN WFStep = 2 then 'Enhance'
							   WHEN WFStep = 3 then 'Separation'
							   WHEN WFStep = 4 then 'ImageQC'
							   WHEN WFStep = 5 then 'AutoIndex'
							   WHEN WFStep = 6 then 'DocID'
							   WHEN WFStep = 7 then 'DocIDQC'
							   WHEN WFStep = 8 then 'Manual Index'
							   WHEN WFStep = 9 then 'Manual IndexQC'
							   WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
							   WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
                        END
                        AS 'TurboscanBatchLocation', 
						case
								WHEN BatchStatus = 1 then 'Ready'
								WHEN BatchStatus = 2 then 'In Process'
								WHEN BatchStatus = 4 then 'Suspended'
								WHEN BatchStatus = 8 then 'Auto-Fail'
								END
								AS 'BatchStatus',
						(DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime
                         from Batches
                        where jobid = 11 and
						batchname <> 'TS_CMP Template' and
						(WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						WFStep = 7 or WFStep = 8 or WFStep = 9 or 
						(WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
						left join dva.dbo.phillyTemp4 pp
						on T.BatchName = pp.PBatch
						where exists (select * from dva.dbo.phillyTemp4 where t.BatchName = dva.dbo.phillyTemp4.PBatch)
                        order by T.TurboscanImportDateTime


select distinct p.PBatch, p.BoxNO, p.CheckINDate, sum(d.numpages) #ofImages
--into phillytemp2
from phillytemp p
left  join Document d
on p.PBatch = d.PBatch
where exists (
select distinct kbatch from stats where p.pbatch = stats.kbatch)
group by p.PBatch, p.BoxNO, p.CheckINDate 
order by CheckINDate


select * from phillytemp
where not exists (select * from phillyTemp2 where phillyTemp.PBatch = phillyTemp2.pbatch)

select * from phillyTemp2 order by checkindate


select distinct boxno, sum(#ofImages)
from phillyTemp2 where boxno not in (select * from phillyTemp2 where #ofImages is null)



select distinct BoxNO, CheckINDate, sum(#ofIMages) #ofImages
from phillyTemp2 
where boxno  not in  (select boxno from phillyTemp2 where #ofImages is null)
group by BoxNO, CheckINDate
order by CheckINDate



select * from phillyTemp2 where boxno = 'NCMP00001283'