select DATEPART(hh, dF.AckTime) as Hour, count(distinct p.imageid) Docs, sum(d.NumPages) Images 
                            from pmrImageIDMapping p
                            left join document d
                            on p.imageid = d.imageid
                            left join domaFTPDetails dF
                            on p.batchname = dF.batchname
                            where exists (select * from domaFTPDetails where p.batchname = batchname and acktime is not null and acktime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))) 
                            group by convert(nvarchar, dF.AckTime, 101), DATEPART(hh, dF.AckTime)
                            order by convert(nvarchar, dF.AckTime, 101), DATEPART(hh, dF.AckTime)


select T.Hour, ISNULL(sum(T.Documents), 0) Documents, ISNULL(sum(T.Images), 0) Images
                                FROM
                                (select DATEPART(hh, s.ackTime) as Hour, count(distinct v.DCSID) Documents, sum(d.NumPages) Images  
                                from vvFTPDetails v 
                                left join smsDCSMapping s
                                on v.DCSID = s.dcsid
                                left join document d
                                on v.DCSID = d.dcsID
                                where v.vendor = 'callCenter'
                                and v.uploadDate > '2017-03-03' and v.dcsid is not null
                                and s.acktime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                                group by convert(nvarchar, s.ackTime, 101), DATEPART(hh, s.ackTime), v.DCSID) T
								group by T.Hour





use TurboscanNG1
                        select BatchLocation, 
                        count(BatchID) as TotalBatches,
                        SUM(TotalImages) as TotalImages
                        FROM (
                        select
                        distinct WFStep,
                        case 
                               WHEN WFStep = 1 then 'Capture'
                               WHEN WFStep = 2 then 'Enhance'
                               WHEN WFStep = 3 and batchlocation = 4 then 'Separation'
                               WHEN WFStep = 4 then 'ImageQC'
                               WHEN WFStep = 5 then 'AutoIndex'
                               WHEN WFStep = 6 and batchlocation = 128 then 'DocID'
                               WHEN WFStep = 7 then 'DocIDQC'
                               WHEN WFStep = 8 then 'Manual Index'
                               WHEN WFStep = 9 then 'Manual IndexQC'
                               WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
                               WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
                               ELSE NULL
                        END
                        AS BatchLocation,
                        BatchID, TotalImages
                        FROM Batches
                        WHERE 
                        WFStep >= 0 
                        AND WFStep <= 12
                        AND BatchStatus < 16
                        and jobid = 11
                        Group by WFStep, BatchLocation, BatchID, TotalImages) T
                        where BatchLocation <> 'NULL'
                        Group by WFStep, BatchLocation
                        Order by WFStep, BatchLocation