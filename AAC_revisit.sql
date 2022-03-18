select * from PhysicalBatch where BatchClassName  like 'adaptive%'


select * from document where pbatch = '02191221230513'


select distinct CONVERT(date, d.ftpstime, 101) UploadDate, 
--count(distinct d.dcsid) DCSIDs, 
count(distinct d.imageID) Docs,
sum(d.numpages) Images,
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts
from document d
left join CustomerDATA c
on d.dcsID = c.dcsID
where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
and d.ftpstime >= '2020-02-01'
group by CONVERT(date, d.ftpstime, 101)
order by CONVERT(date, d.ftpstime, 101)



select distinct CONVERT(date, d.ftpstime, 101) UploadDate, 
--count(distinct d.dcsid) DCSIDs, 
count(distinct d.imageID) Docs,
ISNULL(sum(d.numpages),0) Images,
ISNULL(sum(len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + 8 + 3), 0) FileCharCounts
from document d
left join CustomerDATA c
on d.dcsID = c.dcsID
where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
and d.ftpstime >= '2020-02-01'
group by CONVERT(date, d.ftpstime, 101)
order by CONVERT(date, d.ftpstime, 101)

--uses sam's fuckup calc
select distinct CONVERT(date, d.ftpstime, 101) UploadDate, ISNULL(count(distinct d.imageid), 0) Docs,
                            ISNULL(sum(d.numpages),0) Images,
                            ISNULL(sum(len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + 8 + 3), 0) FileCharCounts
                            from document d
                            left join CustomerDATA c
                            on d.dcsID = c.dcsID
                            where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
                            and d.ftpstime >= '2020-02-01'
                            --and d.ftpstime <= @edate
                            group by CONVERT(date, d.ftpstime, 101)
                            order by CONVERT(date, d.ftpstime, 101)

select distinct CONVERT(date, d.ftpstime, 101) UploadDate, ISNULL(count(distinct d.imageid), 0) Docs,
                            ISNULL(sum(d.numpages),0) Images,
                            ISNULL(sum(len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + 8 + 3), 0) FileCharCounts
                            from document d
                            left join CustomerDATA c
                            on d.dcsID = c.dcsID
                            where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
                            and d.ftpstime >= '2020-02-01'
                            --and d.ftpstime <= @edate
                            group by CONVERT(date, d.ftpstime, 101)
                            order by CONVERT(date, d.ftpstime, 101)



select ISNULL(count(distinct d.imageid), 0) Docs,
                            ISNULL(sum(d.numpages),0) Images,
                            ISNULL(sum(len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + 8 + 3), 0) FileCharCounts
                            from document d
                            left join CustomerDATA c
                            on d.dcsID = c.dcsID
                            where exists (select * from PhysicalBatch where d.PBatch = pbatch and BatchClassName = 'Adaptive Auto Card')
                            and d.ftpstime >= '2020-02-01'
                            and d.ftpstime <= '2020-02-04'
                            group by CONVERT(date, d.ftpstime, 101)
                            order by CONVERT(date, d.ftpstime, 101)