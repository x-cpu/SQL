select * from pmrftu order by insertdate desc


select SUBSTRING(batchname, 0, 14), count(*) from dmhsFTPDetails
where batchname like '04181240006201%'
group by batchname
having count(SUBSTRING(batchname, 0, 14)) > 1

select count(SUBSTRING(batchname, 0, 14)) from dmhsFTPDetails
where batchname like '04181240006201%'
group by batchname
having count(SUBSTRING(batchname, 0, 14)) > 1


--try count
select count(SUBSTRING(batchname, 0, 14)) tryCount
from dmhsFTPDetails 
where batchname like '04181240006201%'
and exists (select * from smsDCSMapping 
where errTime is not null 
and batchname = '04181240006201' 
and veteranID = '3677861')


select count(SUBSTRING(batchname, 0, 14)) 
from dmhsFTPDetails 
where batchname like '04181240006201%'
and exists (select * from smsDCSMapping 
where errTime is not null 
and batchname = '04181240006201' 
and veteranID = '3677826')



select * from smsDCSMapping where batchname = '04181240006201'


select * from dmhsFTPDetails where batchname like '%.org'


--17182050000003.org


--04181240006201.org