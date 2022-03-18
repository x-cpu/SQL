--TOM Format
select distinct Date = 'Jan-2017', t.init EmployeeID, e.lastname "LAST Name", e.firstname "FIRST Name", sum(elapsed) Hours, 
CASE
	When t.job_nbr like 'DVA%' then '002'
	When t.job_nbr like 'CMP%' then '004/005'
	Else ''
	END as CLIN,
ts.name TaskName, t.task_code, Shift = '1'
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-12-01' and t.date_out <= '2016-12-31' 
group by t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code
having  sum(elapsed) > 0
order by e.lastname



---sum by person only
--TOM Format
select distinct Date = 'Jan-2017', t.init EmployeeID, e.lastname "LAST Name", e.firstname "FIRST Name", sum(elapsed) Hours 
--CASE
--	When t.job_nbr like 'DVA%' then '002'
--	When t.job_nbr like 'CMP%' then '004/005'
--	Else ''
--	END as CLIN,
--ts.name TaskName, t.task_code, Shift = '1'
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-01-01' and t.date_out <= '2017-01-31' 
group by t.init, e.firstname, e.lastname
--, t.job_nbr, ts.name, t.task_code
having  sum(elapsed) > 0
order by t.init

--TOM Format by date
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.lastname "LAST Name", e.firstname "FIRST Name", sum(elapsed) Hours, 
CASE
	When t.job_nbr like 'DVA%' then '002'
	When t.job_nbr like 'CMP%' then '004/005'
	Else ''
	END as CLIN,
ts.name TaskName, t.task_code, Shift = '1'
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-06-01' and t.date_out <= '2016-06-30' 
--and t.init in ('JWhittaker', 'klogan2')
group by convert(date, t.date_in, 101), t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code
having  sum(elapsed) > 0
order by t.init, convert(date, t.date_in, 101)


select * from transact t where t.date_in >= '2016-06-17' and t.date_out <= '2016-06-17' 
and t.init = 'kdavis2'
order by job_nbr

--modified on 2016-11-02 - group by date range
select distinct t.init EmployeeID, e.firstname "FIRST Name", e.lastname "LAST Name", sum(elapsed) Hours, 
CASE
	When t.job_nbr like 'DVA%' then '002'
	When t.job_nbr like 'CMP%' then '004/005'
	Else ''
	END as CLIN,
ts.name TaskName, t.task_code, Shift = '1'
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-11-01' and t.date_out <= '2016-11-30' 
group by t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code
having  sum(elapsed) > 0
order by e.lastname



select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.lastname LastName, e.firstname FirstName, sum(elapsed) Hours,     
CASE
	When t.job_nbr like 'DVA%' then 'RMN'
	When t.job_nbr like 'CMP%' then 'CMP'
	Else ''
	END CLIN,
ts.name TaskName, t.task_code, Shift = '1', 
CASE
	When t.init in ('asmith', 'khunter') then 'General Clerk III'
	Else 'General Clerk I'
	END Position,
CASE
	When e.dept = '04' then 'CSRA'
	Else 'SourceHOV'
	END Company,
CASE
	When e.dept = '04' then 'Oxford'
	Else 'SourceHOV'
	END SubContract,
Location = 'Forest Park, GA', Include = 'Yes', Reason = ''
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-01-01' and t.date_in <= '2017-01-03'
group by convert(date, t.date_in, 101), t.init, Shift, e.lastname, e.firstname, ts.name, t.job_nbr, t.task_code, e.dept
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)
