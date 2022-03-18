
select p.pbatch BatchhName, p.RMN,
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
                        AS BatchLocation 
from PhysicalBatch p
left join TurboscanNG1.dbo.batches b
on p.PBatch = b.BatchName
where p.RNDAudit = 'Y' and exists (
select * from TurboscanNG1.dbo.batches where batchname = p.pbatch)