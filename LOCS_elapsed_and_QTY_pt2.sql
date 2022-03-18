select distinct t.init, e.FirstName + ' ' + e.LastName Name, 
t.Job_Nbr, 
t.Task_Code, tt.Name,
sum(t.qty) Throughput,
sum(t.elapsed) Hours,
ROUND((sum(t.qty)/sum(t.elapsed)),2) 'QTY/HR'
from transact t 
left join employee e
on t.init = e.init
left join task tt
on t.task_code = tt.task_code
where t.date_in >= '2018-12-02'
and t.date_out <= '2018-12-08'
--and t.qty > 0
--and tt.name like 'data entry%'
and e.init in (
'366',
'2084',
'1515')
group by t.init, e.lastname, e.firstname, t.job_nbr, t.Task_Code, tt.Name
order by t.job_nbr, Throughput desc

--366
--2084

--Tela Carrick
--Sarah Carrick

select * from employee where lastname = 'sizemore' 





select sum(elapsed), sum(qty) from transact
where date_in >= '2018-12-02'
and date_in <= '2018-12-08'
and init = '1515'

select distinct task_code from transact
where date_in >= '2018-12-02'
and date_in <= '2018-12-08'
and init = '977'

select sum(elapsed), sum(qty) from transact
where date_in >= '2018-12-30'
and date_in <= '2019-01-05'
and init = '1012'
