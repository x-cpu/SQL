--original
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, e.shift, e.lastname + ',' + e.firstname Name, sum(elapsed) Hours, ts.name TaskName, t.task_code
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-08-01 0:0:0'
group by convert(date, t.date_in, 101), t.init, e.shift, e.lastname + ',' + e.firstname, ts.name, t.task_code
order by convert(date, t.date_in, 101)


--modified on 2016-10-24
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID, Shift = '1', e.lastname + ',' + e.firstname Name, sum(elapsed) Hours, ts.name TaskName, t.task_code,
CASE
	When ts.name = 'Remote Key' then '002'
	Else '004/005'
	END as CLIN
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-08-01 0:0:0' 
group by convert(date, t.date_in, 101), t.init, Shift, e.lastname + ',' + e.firstname, ts.name, t.task_code
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)



--modified on 2016-11-02
select distinct convert(date, t.date_in, 101) Date, t.init EmployeeID,  e.lastname + ',' + e.firstname Name, sum(elapsed) Hours, 
CASE
	--When ts.name = 'Remote Key' then '002'
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
where t.date_in >= '2016-02-17' and t.date_in <= '2016-02-29' 
group by convert(date, t.date_in, 101), t.init, Shift, e.lastname + ',' + e.firstname, ts.name, t.job_nbr, t.task_code
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)

--modified on 2016-11-02 - NOT FOR TOM FORMAT - ORIGINAL FORMAT -- STOP GUESSING THIS IS THE ONE
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
where t.date_in >= '2016-10-01' and t.date_in <= '2016-10-31' 
group by convert(date, t.date_in, 101), t.init, Shift, e.lastname + ',' + e.firstname, ts.name, t.job_nbr, t.task_code
having  sum(elapsed) > 0
order by convert(date, t.date_in, 101)

--modified on 2016-11-02 - group by date range
select distinct t.init EmployeeID, e.firstname "FIRST Name", e.lastname "LAST Name", sum(elapsed) Hours, 
CASE
	When ts.name = 'Remote Key' then '002'
	Else '004/005'
	END as CLIN,
ts.name TaskName, t.task_code, Shift = '1'
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-02-17 0:0:0' and t.date_in <= '2016-02-29 23:59:59.999' 
group by t.init, Shift, e.firstname, e.lastname, ts.name, t.task_code
having  sum(elapsed) > 0
--order by convert(date, t.date_in, 101)


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
where t.date_in >= '2016-02-17 0:0:0' and t.date_in <= '2016-02-29 23:59:59.999' 
group by t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code
having  sum(elapsed) > 0
order by e.lastname


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
where t.date_in >= '2016-03-01' and t.date_out <= '2016-03-31' 
group by t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code
having  sum(elapsed) > 0
order by e.lastname


--modified on 2016-11-02 - group by date range NO TASK CODE and no TEAM LEADs
select distinct t.init EmployeeID, e.firstname "FIRST Name", e.lastname "LAST Name", sum(elapsed) Hours, 
CASE
	When t.job_nbr like 'DVA%' then '002'
	When t.job_nbr like 'CMP%' then '004/005'
	Else ''
	END as CLIN,
Shift = '1'
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2016-02-17' and t.date_out <= '2016-02-29'  and ts.name <> 'Team Lead'
group by t.init, e.firstname, e.lastname, t.job_nbr
having  sum(elapsed) > 0
order by t.init





select  * from transact t where t.date_in >= '2016-02-17' and t.date_in <= '2016-02-29' and init = 'nabernathy'