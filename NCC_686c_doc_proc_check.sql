select distinct d.FileNumber, d.dcsID, d.ImageDateTime, d.docidDoctype, c.Lastname, c.Firstname 
from document d
left join CustomerDATA c
on d.dcsID = c.dcsID
where d.PBatch like '17%'
and ImageDateTime >= '2020-08-06'
and docidDoctype = 'VA 21-686c Declaration of Status of Dependents'