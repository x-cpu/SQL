select distinct x.RecvDate, sum(ISNULL(X.RegularFaxes, 0)) RegularFaxes, sum(ISNULL(X.PMCFaxes, 0)) PMCFaxes, sum(ISNULL(X.BVAFaxes, 0)) BVAFaxes, sum(ISNULL(x.TotalFaxes, 0)) TotalFaxes
                                                        FROM
                                                        (
                                select convert(date, p.BackDate, 101) RecvDate, count(distinct t.tifname) Faxes,
                                                        CASE
	                                                        When (p.PBatch like '04%' and (p.PBatch like '04%' and (p.cordest = 'pmc' or p.cordest = 'bva' or p.cordest is null))) then count(distinct t.tifname) 
	                                                        END AS TotalFaxes,
                                                        CASE
	                                                        When (p.cordest = 'pmc') then count(distinct t.tifname) 
	                                                        END AS PMCFaxes,
                                                        CASE
	                                                        When (p.cordest = 'bva' and InvTime > '2017-09-01') then count(distinct t.tifname) 
	                                                        END AS BVAFaxes,						
                                                        CASE
	                                                        When (p.cordest is null) then count(distinct t.tifname) 
	                                                        END AS RegularFaxes 
                                from PhysicalBatch p
                                left join tmpfaxtifname t
                                on p.PBatch = t.pbatch
                                where p.PBatch like '04%'
                                and CAST(BackDate as datetime) >= '2019-07-01'
                                and CAST(BackDate as datetime) < '2019-08-01'
                                group by convert(date, BackDate, 101), p.PBatch, p.cordest, p.InvTime) X
                                group by x.RecvDate
                                order by x.RecvDate desc