--sum for training hrs
select 
--t.init EmployeeID, 
e.lastname + ', ' + e.firstname LOCSSName, 
'Month & Year' = 'Dec-17',
sum(elapsed) Hours     
from transact t
left join employee e
on t.init = e.init
left join task ts
on t.task_code = ts.task_code
where t.date_in >= '2017-12-01' and t.date_in <= '2017-12-02' 
and t.init in 
(
'chicks',
'DHubbard',
'KShepherdcre',
'MDrake2',
'RBarnett',
'SWheat'
)
and e.dept = '01'
group by 
t.init, e.shift, e.lastname, e.firstname
having  sum(elapsed) > 0



select LOCSSName, [Month & Year], sum(Hours) Hours from OCT2017
group by LOCSSName, [Month & Year]


select LOCSSName, [Month & Year], sum(Hours) Hours from NOV2017
group by LOCSSName, [Month & Year]


update OCT2017
set [Month & Year] = 'Oct-17'


update NOV2017
set [Month & Year] = 'Nov-17'