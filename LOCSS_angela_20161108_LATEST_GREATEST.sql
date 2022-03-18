--modified on 2016-11-02 - group by date range

select T.EmployeeID, T.[FIRST Name], T.[LAST Name], sum(T.Hours) Hours, T.CLIN, T.TaskName, T.task_code, T.Shift
FROM
(select distinct t.init EmployeeID, e.firstname "FIRST Name", e.lastname "LAST Name", sum(elapsed) Hours,
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
group by t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code) T
--group by t.init, e.firstname, e.lastname, t.job_nbr, ts.name, t.task_code
group by T.EmployeeID, T.[FIRST Name], T.[LAST Name], T.CLIN, T.TaskName, T.task_code, T.Shift
having  sum(T.Hours) > 0
order by T.EmployeeID 