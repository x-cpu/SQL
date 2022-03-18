select count(distinct d.PBatch) Batches, count(distinct d.ImageID) Documents, sum(d.numpages) Images,
                            ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and d.ftpstime >= '2017-01-01' and d.ftpstime <= '2017-12-31 23:59:59.999'




select count(distinct substring(d.PBatch, 0, 9)) Boxes, count(distinct d.PBatch) Batches, count(distinct d.ImageID) Documents, sum(d.numpages) Images,
                            ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and d.ftpstime >= '2017-01-01' and d.ftpstime <= '2017-12-31 23:59:59.999'


select distinct substring(d.PBatch, 0, 10) Box, count(distinct d.PBatch) Batches, count(distinct d.ImageID) Documents, sum(d.numpages) Images,
                            ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and d.ftpstime >= '2017-01-01' and d.ftpstime <= '2017-12-31 23:59:59.999'
							group by substring(d.PBatch, 0, 10) 