
select DATEPART(hour, t.datemodified), count(distinct t.tifname) 
from tmpfaxtifname t 
where t.datemodified between '2020-06-27' and '2020-06-28' 
and SUBSTRING(pbatch, 9,1) <> 5
group by DATEPART(hour, t.datemodified)



select batchname, totalimages 
from TURBOSCANNG1.dbo.batches 
where SUBSTRING(batchname, 9,1) = '8'
and BatchName like '04%'
order by BatchName