--master 623
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyTemp3 from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/23/2015'


--master 624
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyMain0624 from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/24/2015'


--master 624 TEMPONE
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate into phillyMain0702 from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '07/03/2015'

--master 624
select PBatch, BoxNO, CONVERT(varchar, InvTime, 101) CheckINDate from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by pbatch, BoxNO, CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) > '06/22/2015'


--#of batches received
select CONVERT(varchar, InvTime, 101) CheckINDate, count(distinct pbatch) from PhysicalBatch where CRCDestination = 'Philadelphia Drop Mail'
group by CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/25/2015'
order by CONVERT(varchar, InvTime, 101) 


---# of images/batches Phillydrop upload to the portal
select convert(nvarchar, AckTime, 101) as uploadPortaldate, sum(d.numpages) as Pages, count(distinct T.batchname) #ofBatches
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2014-01-01 0:0:0' and AckTime <= '2015-07-02 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
and exists (select * from phillyMain0702 where FTPDetails.batchname = phillyMain0702.PBatch)
group by batchname) T
left join document d
on batchname = d.pbatch
group by convert(nvarchar, AckTime, 101)
order by uploadPortaldate





--#of NON Philly batches received
use DVA
select CONVERT(varchar, InvTime, 101) CheckINDate, count(distinct pbatch) from PhysicalBatch where CRCDestination <> 'Philadelphia Drop Mail' and pbatch not like '02%'
group by CONVERT(varchar, InvTime, 101) 
having CONVERT(varchar, InvTime, 101) < '06/25/2015'
order by CONVERT(varchar, InvTime, 101) 


---# of images/batches NON Phillydrop upload to the portal
select convert(nvarchar, AckTime, 101) as uploadPortaldate, sum(d.numpages) as Pages, count(distinct T.batchname) #ofBatches
FROM
(select distinct batchname, max(AckTime) as AckTime
from FTPDetails 
where AckTime >= '2014-01-01 0:0:0' and AckTime <= '2015-06-30 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null
and not exists (select * from phillyMain0624x where FTPDetails.batchname = phillyMain0624x.PBatch)
group by batchname) T
left join document d
on batchname = d.pbatch
group by convert(nvarchar, AckTime, 101)
order by uploadPortaldate


--philly batches that are in Turboscan and not uploaded to portal "still in progress"
select * into philly0626 from phillyMain0701 where not exists (select * from FTPDetails where phillyMain0701.PBatch = FTPDetails.batchname)

--this is second part for BOBOB
--philly batches that are in Turboscan and not uploaded to portal "still in progress"
select * into phillyIP0630 from phillyMain0630 where not exists (select * from FTPDetails where phillyMain0630.PBatch = FTPDetails.batchname)
select * from phillyIP0630


--this is second part for BOBOB
--philly batches that are in Turboscan and not uploaded to portal "still in progress"
select * into phillyIP0702 from phillyMain0702 where not exists (select * from Stats where phillyMain0702.PBatch = Stats.kbatch)
select * from phillyIP0701 order by CheckINDate


--distinct philly boxes in progress
select distinct BoxNO from phillyIP0702

select * from phillyIP0629 order by CheckINDate

--philly batches are uploaded to portal
select * into phillyPortal0624 from phillyMain0624 where  exists (select * from FTPDetails where phillyMain0624.PBatch = FTPDetails.batchname)




---image counts for TS Philly batches
use turboscanng1 select distinct T.BatchName, pp.BoxNO, p.RMN,  T.TurboscanBatchLocation, T.BatchStatus, T.TurboscanImportDateTime, T.BatchDesc, T.TotalImages
                        into dva.dbo.phillyTSIP0702 FROM
                        (select distinct batchname, Batchdesc, TotalImages,
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
						left join dva.dbo.phillyMain0702 pp
						on T.BatchName = pp.PBatch
						where exists (select * from dva.dbo.phillyIP0702 where t.BatchName = dva.dbo.phillyIP0702.PBatch)
                        order by T.TurboscanImportDateTime



use DVA
select * from dva.dbo.phillyTSIP0702

select distinct BoxNO from phillyIP0629x where not exists (select * from phillyTSIP0629x where phillyIP0629x.PBatch = phillyTSIP0629x.BatchName)

--sum of totalimages for PHilly batches in Turboscan
select sum(totalimages) from phillyTSIP

select * from PhysicalBatch where pbatch = '03151750611601'

--PHilly batches in Turboscan
select * from dva.dbo.phillyTSIP0626


---batches checkin ONLY
use DVA
select * from phillyMain0624		
where not exists (select * from phillyIP0624 where phillymain0624.pbatch = phillyIP0624.pbatch)		
and not exists (select * from phillyPortal0624 where phillyMain0624.pbatch = phillyPortal0624.PBatch)		



---non philly batches in Turboscan
use turboscanng1 select distinct T.BatchName, p.RMN,  T.TurboscanBatchLocation, T.BatchStatus, T.TotalImages, T.TurboscanImportDateTime, T.BatchDesc, T.WFStep, T.BatchLocation
                        FROM
                        (select distinct batchname, Batchdesc,
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
                        TotalImages,
						(DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) TurboscanImportDateTime, WFStep, BatchLocation
                         from Batches
                        where jobid = 11 and
						batchname <> 'TS_CMP Template' and
						(WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						WFStep = 7 or WFStep = 8 or WFStep = 9 or 
						(WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))) T
                        left join dva.dbo.PhysicalBatch p
                        on T.BatchName = p.pbatch
                        --where T.TurboscanBatchLocation in ('DocID')  
						where not exists (select * from dva.dbo.phillyMain0624x where T.BatchName =  dva.dbo.phillyMain0624x.pbatch)
                        --order by T.TurboscanImportDateTime






select * from phillyMain0624

select * from TS_Audit where batchname = '03151260618101'

---all messed up
select distinct(batchname), sum(ImagesProcessed) #ofTSImages
from TS_Audit
where exists(select * from phillyMain0624 where TS_Audit.batchname = phillyMain0624.pbatch)
and TSModule = 'DocID'
and TimeStamp > '2015-06-23 0:0:0' and timestamp < '2015-06-23 23:59:59.999'
group by batchname
order by BatchName



select * from TS_Audit where batchname = '03151610609701'