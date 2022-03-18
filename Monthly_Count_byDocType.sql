select distinct YEAR(s.acktime) Year, MONTH(s.acktime) Month, 
count(distinct d.imageid) Docs, 
sum(d.numpages) Images 
from document d
left join smsDCSMapping s
on d.dcsID = s.dcsid
where dociddoctype = 'VA 24-0296 Direct Deposit Enrollment'
and s.ackTime >= '2019-10-01'
and s.ackTime < '2020-10-01'
group by YEAR(s.acktime), MONTH(s.acktime)
order by YEAR(s.acktime), MONTH(s.acktime)