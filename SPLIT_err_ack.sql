select * from 
smsDCSMapping s
--left join cmpRescanMapping c
--on s.dcsid = c.dcsid
where Status like 'split%'
and s.insertdate >= '2019-05-01'
and not exists (select * from cmpRescanMapping where s.dcsid = dcsid)




select * from cmpRescanMapping c

---error files received
select s.* from smsDCSMapping s
left join cmpRescanMapping c
on s.batchname = c.newpbatch
where s.ackTime is null
and s.insertdate >= '2019-05-01'
and s.errTime is not null
order by s.errTime desc

---not ack received
select s.* from smsDCSMapping s
left join cmpRescanMapping c
on s.batchname = c.newpbatch
where s.ackTime is null
and s.insertdate >= '2019-05-01'
and s.errTime is null
and s.batchname like '04%'
order by s.insertdate desc