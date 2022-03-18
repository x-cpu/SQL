--rescan batches created today
select newpbatch RescanBatchName, pbatch OriginalBatchName, dcsid DCSID,
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep = 11 and batchlocation = 0 then 'Clean'
END
AS "Turboscan Batch Location", (DATEADD(hh, -5, DATEADD(ss, ts.TimeStamp, '01/01/1970'))) TurboscanImportDateTime
 from cmpRescanMapping 
left join TurboscanNG1.dbo.batches ts
on cmpRescanMapping.newpbatch = ts.BatchName
where insertdate > '2016-03-23 0:0:0'


--split batches created today
select newpbatch RescanBatchName, pbatch OriginalBatchName, dcsid DCSID,
case 
       WHEN WFStep = 1 then 'capture'
       WHEN WFStep = 2 then 'Enhance'
       WHEN WFStep = 3 then 'Separation'
       WHEN WFStep = 4 then 'ImageQC'
       WHEN WFStep = 5 then 'AutoIndex'
       WHEN WFStep = 6 then 'DocID'
       WHEN WFStep = 7 then 'DocIDQC'
       WHEN WFStep = 8 then 'Manual Index'
       WHEN WFStep = 9 then 'Manual IndexQC'
       WHEN WFStep = 10 then 'Verification'
       WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
       WHEN WFStep = 11 and batchlocation = 0 then 'Clean'
END
AS "Turboscan Batch Location", (DATEADD(hh, -5, DATEADD(ss, ts.TimeStamp, '01/01/1970'))) TurboscanImportDateTime
 from cmpRescanMapping 
left join TurboscanNG1.dbo.batches ts
on cmpRescanMapping.newpbatch = ts.BatchName
where insertdate > '2016-08-24 0:0:0'





select count(*) from TurboscanNG1.dbo.batches
where SUBSTRING(batchname, 9, 1) = '8' and batchname  like '03%'
and BatchLocation <> '0' and (DATEADD(hh, -5, DATEADD(ss, TimeStamp, '01/01/1970'))) > '2014-11-21 0:0:0'
order by batchname

select * from Stats_IBML where kbatch = '03141790601101'


select distinct dcsid from document where pbatch = '03141790601101'

select * from cmprecon where dcsid = 'DCSID031417906011010021'


select d.ImageID, cd.FileNumber, cd.Lastname, cd.Firstname, cd.MiddleInitial MI, cd.Pbatch, cd.RMN, 
                            d.received_date, d.ftpstime UploadDateTime, d.bestcopy, d.NumPages, d.Form526Data
                            from CustomerDATA cd 
                            join document d
                            on cd.dcsID = d.dcsID
                            where cd.dcsID = 'DCSID031417906011010021'
                            order by imageid



select m.trackingno, m.RMN, max(m.insertdate), dc.CompleteDate, cmp.insertdate 
                            from manifestDCS m 
                            left join DCSidCompleted dc
                            on m.dcsID = dc.DCSID
							left join PhysicalBatch pb
							on SUBSTRING(m.pbatch, 1, 12) = pb.PBatch
							left join cmpcheckin cmp
							on pb.PBatch = cmp.pbatch
                            where m.dcsid = 'DCSID031417906011010021'
                            group by m.trackingno, m.RMN, dc.CompleteDate, cmp.insertdate 