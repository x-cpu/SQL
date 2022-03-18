--select ISNULL(sum(d.numpages), 0) FaxImages
--                            from smsDCSMapping s
--                            left join document d
--                            on s.dcsid = d.dcsID
--							left join PhysicalBatch p
--							on s.batchname = p.PBatch
--                            where s.ackTime is not null and s.batchname like '04%' 
--                            and p.cordest = 'PMC' 
--                            and s.acktime >= @sdate and s.acktime <= @edate



select distinct MONTH(s.acktime) Month, YEAR(s.acktime) Year, ISNULL(sum(d.numpages), 0) PMCImages
                            from smsDCSMapping s
                            left join document d
                            on s.dcsid = d.dcsID
							left join PhysicalBatch p
							on s.batchname = p.PBatch
                            where s.ackTime is not null and s.batchname like '04%' 
                            and p.cordest = 'PMC' 
                            and s.acktime >= '2018-10-01' and s.acktime <= '2019-02-28'
							group by MONTH(s.acktime), YEAR(s.acktime)
							order by YEAR(s.acktime), MONTH(s.acktime)


select ISNULL(count(distinct d.imageid), 0) FaxDocs
                            from smsDCSMapping s
                            left join document d
                            on s.dcsid = d.dcsID
							left join PhysicalBatch p
							on s.batchname = p.PBatch
                            where s.ackTime is not null and s.batchname like '04%' 
                            and p.cordest = 'PMC' and s.acktime >= @sdate and s.acktime <= @edate