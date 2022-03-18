select distinct init, sum(elapsed) Hours, sum (qty) Qty from transact 
where date_in >= '2016-03-28' and date_out <= '2016-03-31 23:59:59.999'
and task_code = '010163'
and job_nbr = 'DVA1603'
group by init
order by init


select * from transact where date_in >= '2016-03-28' and date_out <= '2016-03-31 23:59:59.999'

select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.shift, e.lastname + ',' + e.firstname Name, sum(elapsed) Hours, ts.name TaskName, t.task_code
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-08-01 0:0:0'
group by convert(date, t.date_in, 101), t.init, e.shift, e.lastname + ',' + e.firstname, ts.name, t.task_code
order by convert(date, t.date_in, 101)


select * from employee