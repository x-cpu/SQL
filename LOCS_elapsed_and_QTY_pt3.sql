select distinct task_code, task_name, count(*) Count from transact
where date_in >= '2018-12-02'
and date_in <= '2018-12-08'
group by task_code
order by Count desc


select distinct t.task_code TaskCode, tt.name TaskName, count(*) Count 
from transact t
left join task tt
on t.task_code = tt.task_code
where date_in >= '2019-02-20'
group by t.task_code, tt.name
order by Count desc



select distinct e.FirstName + ' ' + e.LastName Name, 
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
where t.date_in >= '2018-12-02'
and t.date_out <= '2018-12-08'
----and t.qty > 0
----and tt.name like 'data entry%'
--and e.init in (
--'366',
--'2084',
--'1515')
group by t.init, e.lastname, e.firstname, t.job_nbr, t.Task_Code, tt.Name
order by Name, t.job_nbr, Throughput desc


select distinct job_nbr from transact
where date_in >= '2018-12-02'
and date_in <= '2018-12-08'

--RMC1812
--RMC1811
--DVA1812
--CMP1812