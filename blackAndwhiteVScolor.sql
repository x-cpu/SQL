select avg(filesize)
from Document
where docidDoctype = 'Photographs'



select avg(filesize)
from document
where docidDoctype <> 'Photographs' and filesize is not null


select *
from Document
where docidDoctype = 'photographs'


select sum(filesize)
from Document
where docidDoctype = 'Photographs'