--MTV PREP
--based on taskcode 510203
select distinct e.file_num EmployeeFileNo#, e.lastname + ',' + e.firstname Name, 
e.SHIFT, 
sum(t.elapsed) Hours, 
sum(t.qty) Qty
from transact t
left join employee e
on t.init = e.init
where t.date_in >= '2017-01-22' and t.date_in <= '2017-02-04' 
and t.task_code = '510203' and t.qty > 0
group by e.file_num, e.lastname, e.firstname, e.shift
order by NAME



--all tasks
select distinct t.task_code, tt.name from transact t 
left join task tt
on t.task_code = tt.task_code
where date_in >= '2017-01-22' and date_in <= '2017-02-04' and t.qty > 0


--all tasks with sum hrs
select distinct t.task_code, tt.name, sum(t.elapsed) Hours from transact t 
left join task tt
on t.task_code = tt.task_code
where date_in >= '2017-01-22' and date_in <= '2017-02-04' 
and t.qty > 0
group by t.task_code, tt.name



--MTV SCAN
--based on taskcode 010101
select distinct e.file_num EmployeeFileNo#, e.lastname + ',' + e.firstname Name, 
e.SHIFT, 
sum(t.elapsed) Hours, 
sum(t.qty) Qty
from transact t
left join employee e
on t.init = e.init
where t.date_in >= '2017-01-22' and t.date_in <= '2017-02-04' 
and t.task_code = '010101' and t.qty > 0
group by e.file_num, e.lastname, e.firstname, e.shift
order by NAME



--MTV DocID
--based on taskcode 010101
select distinct e.file_num EmployeeFileNo#, e.lastname + ',' + e.firstname Name, 
e.SHIFT, 
sum(t.elapsed) Hours, 
sum(t.qty) Qty
from transact t
left join employee e
on t.init = e.init
where t.date_in >= '2017-01-22' and t.date_in <= '2017-02-04' 
and t.task_code = '010101' and t.qty > 0
group by e.file_num, e.lastname, e.firstname, e.shift
order by NAME