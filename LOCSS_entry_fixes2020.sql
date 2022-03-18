select distinct convert(date, t.date_in,101) DateIN, e.FirstName + ' ' + e.LastName Name, 
t.init, 
t.Job_Nbr, 
t.Task_Code, tt.Name Task_Name,
sum(t.qty) Throughput,
sum(t.elapsed) Hours,
ROUND((sum(t.qty)/NULLIF(sum(t.elapsed),0)),2) 'QTY/HR'
from transact t 
left join employee e
on t.init = e.init
left join task tt
on t.task_code = tt.task_code
where t.date_in >= '2020-02-03'
--and t.date_out <= '2020-02-05'
----and t.qty > 0
----and tt.name like 'data entry%'
and e.init = 'cmcrae'
--'366',
--'2084',
--'1515')
group by convert(date, t.date_in,101), t.init, e.lastname, e.firstname, t.job_nbr, t.Task_Code, tt.Name
order by convert(date, t.date_in,101), Name, t.job_nbr, Throughput desc




select * from employee where lastname like '%crae'


select * from transact where init = 'cmcrae' and date_in >= '2020-02-03'

--update transact
--set task_code = '630311'
--where task_code = '631158'
--and init = 'cmcrae' and date_in >= '2020-02-03'