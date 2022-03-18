select distinct ImageID, d.filenumber, d.pbatch BatchName, 
--d.rmn RMN, 
c.Firstname, c.Lastname, d.docidDoctype DocType, Comments ErrorMessage
from document d
left join customerdata c
on d.pbatch = c.pbatch and d.FileNumber = c.FileNumber
where ftpstime is null
and (comments like '%Filenumber%' or comments like '%invalid format for veteran identifier%')
and ImageDateTime >= '2018-01-01'
and d.pbatch like '02%'
and exists (select * from stats where d.pbatch = kbatch)
order by d.PBatch, ImageID