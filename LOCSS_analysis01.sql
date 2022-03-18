select distinct t.init, e.LastName, e.FirstName, 
t.Job_Nbr, 
t.Task_Code, tt.Name,
sum(t.elapsed) Hours,
sum(t.qty ) Quantity
from transact t 
left join employee e
on t.init = e.init
left join task tt
on t.task_code = tt.task_code
where t.date_in >= '2018-11-04'
and t.date_out <= '2018-11-10'
and t.qty > 0
and tt.name like 'data entry%'
group by t.init, e.lastname, e.firstname, t.job_nbr, t.Task_Code, tt.Name
order by t.job_nbr, Quantity desc





select distinct t.init, e.LastName, e.FirstName, 
t.Job_Nbr, 
t.Task_Code, tt.Name,
sum(t.qty ) Quantity
from transact t 
left join employee e
on t.init = e.init
left join task tt
on t.task_code = tt.task_code
where t.date_in >= '2018-11-04'
and t.date_out <= '2018-11-10'
and t.qty > 0
group by t.init, e.lastname, e.firstname, t.job_nbr, t.Task_Code, tt.Name
order by t.job_nbr, Quantity desc




select * from transact t
where init = '470'
and  t.date_in >= '2018-11-04'
and t.date_out <= '2018-11-10'