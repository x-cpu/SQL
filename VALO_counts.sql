select distinct CONVERT(date, d.ftpstime, 101) UploadDate, ISNULL(count(distinct d.imageid), 0) Docs, ISNULL(sum(numpages), 0) Images
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and exists (select * from dva.dbo.PhysicalBatch where d.pbatch = pbatch and BatchClassName = 'VALO/VCIP')
                            and d.ftpstime >= '2020-01-01' and d.ftpstime <= '2020-04-30 23:59:59.999'
							group by CONVERT(date, d.ftpstime, 101) 



select distinct CONVERT(date, d.ftpstime, 101) UploadDate,
                            ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
                            from document d 
                            left join CustomerDATA c
                            on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
                            where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  like 'rmndd%' 
                            and d.ftpstime is not null
                            and exists (select * from dva.dbo.PhysicalBatch where d.pbatch = pbatch and BatchClassName = 'VALO/VCIP')
                            and d.ftpstime >= '2020-01-01' and d.ftpstime <= '2020-04-30 23:59:59.999'
							group by CONVERT(date, d.ftpstime, 101) 