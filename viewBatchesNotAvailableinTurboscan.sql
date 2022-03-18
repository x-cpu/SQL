--dcs
--view batches not availabe in Turboscan but CheckedIN
                                select p.PBatch BatchName, p.RMN from PhysicalBatch p 
                                where not exists (select * from stats where p.PBatch = stats.kbatch)
                                and not exists (select * from TurboscanNG1.dbo.batches where p.PBatch = BatchName)
                                and exists (select * from manifestDCS where SUBSTRING(p.pbatch, 0, 13) = pbatch)
                                and pbatch like '02%'
                                and SUBSTRING(pbatch, 3, 5) = '15263'




--dcs
--view batches not availabe in Turboscan but CheckedIN
                                select p.PBatch BatchName, p.RMN, p.InvTime InvTime, c.claimtype ClaimType from PhysicalBatch p 
								left join customerCheckIn c
								on p.RMN = c.RMN
                                where not exists (select * from stats where p.PBatch = stats.kbatch)
                                and not exists (select * from TurboscanNG1.dbo.batches where p.PBatch = BatchName)
                                and exists (select * from manifestDCS where SUBSTRING(p.pbatch, 0, 13) = pbatch)
                                and pbatch like '02%'
                                and SUBSTRING(pbatch, 3, 5) = '15263'




--cmp
--view batches not availabe in Turboscan but CheckedIN
                                select p.PBatch BatchName, p.RMN, p.InvTime InvTime from PhysicalBatch p 
                                where not exists (select * from stats where p.PBatch = stats.kbatch)
                                and not exists (select * from TurboscanNG1.dbo.batches where p.PBatch = BatchName)
                                and exists (select * from cmpcheckin where cmpcheckin.pbatch = pbatch)
                                and pbatch not like '02%'
                                and SUBSTRING(pbatch, 3, 5) = '15263'