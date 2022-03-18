select NumberofBox = 178, 
AvgDCSIDs_PerBox = Round(CAST(count(distinct d.dcsID) as float)/178, 2), 
AvgBatches_PerBox = Round(CAST(count(distinct d.PBatch) as float)/178, 2), 
AvgDocuments_PerBox  = Round(CAST(count(distinct d.ImageID) as float)/178, 2), 
AvgImages_PerBox  = Round(CAST(sum(d.numpages) as float)/178, 2),
AvgFileCharCounts_PerBox  = Round(CAST(ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) as float)/178, 2) 
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and d.ftpstime >= '2016-01-01' and d.ftpstime <= '2017-12-31 23:59:59.999'



select NumberofBox = 178, 
AvgDCSIDs_PerBox = Round(CAST(count(distinct d.dcsID) as float)/178, 2), 
AvgBatches_PerBox = Round(CAST(count(distinct d.PBatch) as float)/178, 2), 
AvgDocuments_PerBox  = Round(CAST(count(distinct d.ImageID) as float)/178, 2), 
AvgImages_PerBox  = Round(CAST(sum(d.numpages) as float)/178, 2),
AvgFileCharCounts_PerBox  = Round(CAST(ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) as float)/178, 2) 
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and d.ftpstime >= '2018-01-01' and d.ftpstime <= '2018-12-31 23:59:59.999'