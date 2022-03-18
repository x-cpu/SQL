--NEW FORMAT AS OF 20170208
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.lastname LastName, e.firstname FirstName, sum(elapsed) Hours,     
CASE
	When t.job_nbr like 'DVA%' then 'RMN'
	When t.job_nbr like 'CMP%' then 'CMP'
	Else ''
	END as CLIN,
ts.name TaskName, t.task_code, Shift = '1', 
CASE
	When t.init in ('asmith', 'khunter') then 'General Clerk III'
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
where t.date_in >= '2017-03-01' and t.date_in <= '2017-03-31' 
group by convert(date, t.date_in, 101), t.init, Shift, e.lastname, e.firstname, ts.name, t.job_nbr, t.task_code, e.dept
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)


--BY SUM BY EMPLOYEE
--NEW FORMAT AS OF 20170208
select distinct t.init EmployeeID, e.lastname LastName, e.firstname FirstName, sum(elapsed) Hours
from transact t
left join employee e
on t.init = e.init
where t.date_in >= '2017-02-01' and t.date_in <= '2017-02-08' 
group by t.init, e.lastname, e.firstname
having  sum(elapsed) > 0
order by t.init


--BY TASKS
select distinct ts.name TaskName, t.task_code, sum(elapsed) Hours    
from transact t
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-02-01' and t.date_in <= '2017-02-08' 
group by ts.name, t.task_code
having  sum(elapsed) > 0
order by Hours desc


---HOURS SUM
--NEW FORMAT AS OF 20170208
select ISNULL(sum(elapsed), 0) Hours from transact t
where t.date_in >= '2016-07-01' and t.date_in <= '2016-07-31' 



select * from employee



select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, Shift = '1',  e.lastname + ',' + e.firstname Name, sum(elapsed) Hours, 
ts.name TaskName, t.task_code,
CASE
	--When ts.name = 'Remote Key' then '002'
	When t.job_nbr like 'DVA%' then '002'
	When t.job_nbr like 'CMP%' then '004/005'
	Else ''
	END as CLIN
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-12-01' and t.date_in <= '2016-12-31' 
group by convert(date, t.date_in, 101), t.init, Shift, e.lastname + ',' + e.firstname, ts.name, t.job_nbr, t.task_code
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)



select * from job

---sum only by person
select distinct --convert(date, t.date_in, 101) Date, 
t.init EmployeeID, Shift = '1',  e.lastname + ',' + e.firstname Name, sum(elapsed) Hours 
--ts.name TaskName, t.task_code,
--CASE
--	--When ts.name = 'Remote Key' then '002'
--	When t.job_nbr like 'DVA%' then '002'
--	When t.job_nbr like 'CMP%' then '004/005'
--	Else ''
--	END as CLIN
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-01-01' and t.date_in <= '2017-01-31' 
group by 
--convert(date, t.date_in, 101), 
t.init, Shift, e.lastname + ',' + e.firstname 
--ts.name, t.job_nbr, t.task_code
having  sum(elapsed) > 0
order by employeeid
--, convert(date, t.date_in, 101)

---sum only by person by date
select distinct convert(date, t.date_in, 101) Date, 
t.init EmployeeID, Shift = '1',  e.lastname + ',' + e.firstname Name, sum(elapsed) Hours 
--ts.name TaskName, t.task_code,
--CASE
--	--When ts.name = 'Remote Key' then '002'
--	When t.job_nbr like 'DVA%' then '002'
--	When t.job_nbr like 'CMP%' then '004/005'
--	Else ''
--	END as CLIN
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-06-01' and t.date_in <= '2016-06-30' 
--and t.init in ('JWhittaker', 'klogan2')
group by 
convert(date, t.date_in, 101), 
t.init, Shift, e.lastname + ',' + e.firstname 
--ts.name, t.job_nbr, t.task_code
having  sum(elapsed) > 0
order by employeeid
, convert(date, t.date_in, 101)



select distinct t.task_code, ts.name from transact t 
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-02-17' and t.date_in <= '2016-12-31'

order by job_nbr