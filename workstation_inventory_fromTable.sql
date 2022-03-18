select * from invy

select distinct Model, count(*) Count
from invy
where model like 'opti%'
group by model


