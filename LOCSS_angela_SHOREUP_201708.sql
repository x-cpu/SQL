--NEW FORMAT AS OF 201708
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.lastname LastName, e.firstname FirstName, sum(elapsed) Hours,     
CASE
	When t.job_nbr like 'DVA%' then 'RMN'
	When t.job_nbr like 'CMP%' then 'CMP'
	Else ''
	END as CLIN,
ts.name TaskName, t.task_code, e.shift, 
CASE
	When t.init in ('jjohnson2', 'khunter') then 'General Clerk III'
	When t.init in ('asmith', 'tparks') then 'General Clerk III'
	Else 'General Clerk I'
	END as Position,
CASE
	When e.dept = '04' then 'CSRA'
	Else 'SourceHOV'
	END as Company,
CASE
	When e.dept = '04' then 'Oxford'
	Else 'SourceHOV'
	END as SubContract,
Location = 'Newnan, GA', Include = 'Yes', Reason = ''
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-07-01' and t.date_in <= '2017-07-31' 
group by convert(date, t.date_in, 101), t.init, e.shift, e.lastname, e.firstname, ts.name, t.job_nbr, t.task_code, e.dept
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)





--special run by date and task code
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.lastname LastName, e.firstname FirstName, sum(elapsed) Hours,     
CASE
	When t.job_nbr like 'DVA%' then 'RMN'
	When t.job_nbr like 'CMP%' then 'CMP'
	Else ''
	END as CLIN,
ts.name TaskName, t.task_code, e.shift, 
CASE
	When t.init in ('jjohnson2', 'khunter') then 'General Clerk III'
	When t.init in ('asmith', 'tparks') then 'General Clerk III'
	Else 'General Clerk I'
	END as Position,
CASE
	When e.dept = '04' then 'CSRA'
	Else 'SourceHOV'
	END as Company,
CASE
	When e.dept = '04' then 'Oxford'
	Else 'SourceHOV'
	END as SubContract,
Location = 'Newnan, GA', Include = 'Yes', Reason = ''
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-07-24'
and t.task_code = '630310'
group by convert(date, t.date_in, 101), t.init, e.shift, e.lastname, e.firstname, ts.name, t.job_nbr, t.task_code, e.dept
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)