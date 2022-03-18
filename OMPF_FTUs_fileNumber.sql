select d.* 
from document d
left join PhysicalBatch p
on d.PBatch = p.PBatch
left join customerCheckIn c
on p.RMN = c.RMN
where c.claimtype = 'ompf'
and d.ftpstime is null
and d.Comments like '%filenumber%'
order by d.ImageID



--update document
--set FileNumber = '574749644'
--where  FileNumber = '575749644'
--and pbatch = '02203041804201'

--update CustomerDATA
--set FileNumber = '574749644'
--where  FileNumber = '575749644'
--and pbatch = '02203041804201'