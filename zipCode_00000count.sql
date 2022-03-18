select distinct convert(date, c.keydatetime, 101) Date, count(c.zipcode) "00000"
from CustomerDATA c 
--left join smsDCSMapping s
--on convert(date, c.keydatetime, 101) = convert(date, s.ackTime, 101)
where keydatetime >= '2016-07-01'
and zipcode = '00000'
and exists (select * from smsDCSMapping where c.dcsID = smsDCSMapping.dcsid and ackTime is not null)
group by convert(date, c.keydatetime, 101)
order by convert(date, c.keydatetime, 101)


select distinct convert(date, s.ackTime, 101) Date, count(c.zipcode) "00000"
from CustomerDATA c 
left join smsDCSMapping s
on c.dcsID = s.dcsid
where keydatetime >= '2016-07-01'
and zipcode = '00000'
and exists (select * from smsDCSMapping where c.dcsID = smsDCSMapping.dcsid and ackTime is not null)
group by convert(date, s.ackTime, 101)
order by convert(date, s.ackTime, 101)


select distinct convert(date, s.acktime, 101) Date, count(distinct s.dcsid) TotalDCSIDs
from smsDCSMapping s 
where s.ackTime >= '2016-07-01'
group by convert(date, s.acktime, 101)
order by convert(date, s.acktime, 101)


select distinct convert(date, c.calendardate, 101) Date
from Calendar c
where c.CalendarDate >= '2016-07-01' and c.CalendarDate <= '2016-08-04'


--select distinct x.Date, ISNULL(y.[00000], 0) "00000", ISNULL(z.TotalDCSIDs, 0) TotalDCSIDs
select distinct x.Date, count(y.[00000]) "00000", count(z.TotalDCSIDs) TotalDCSIDs
From
(select distinct convert(date, c.calendardate, 101) Date
from Calendar c
where c.CalendarDate >= '2016-07-01' and c.CalendarDate <= '2016-08-04') x,
(select distinct convert(date, c.keydatetime, 101) Date, c.dcsID, c.zipcode "00000"
from CustomerDATA c 
--left join smsDCSMapping s
--on convert(date, c.keydatetime, 101) = convert(date, s.ackTime, 101)
where keydatetime >= '2016-07-01'
and zipcode = '00000'
and exists (select * from smsDCSMapping where c.dcsID = smsDCSMapping.dcsid and ackTime is not null)
group by convert(date, c.keydatetime, 101), c.dcsID, c.zipcode) y,
(select distinct convert(date, s.acktime, 101) Date, s.dcsid TotalDCSIDs
from smsDCSMapping s 
where s.ackTime >= '2016-07-01'
group by convert(date, s.acktime, 101), s.dcsid) z
group by x.Date
order by x.Date




--too long
select distinct convert(date, c.calendardate, 101) Date, count(cc.zipcode) "00000", count(distinct s.dcsid) TotalDCSIDs
from Calendar c
left outer join CustomerDATA cc
on convert(date, c.calendardate, 101) = convert(date, cc.keydatetime, 101)
left outer join smsDCSMapping s
on convert(date, c.calendardate, 101) = convert(date, s.acktime, 101)
where c.CalendarDate >= '2016-07-01'
and cc.ZipCode = '00000'
and exists (select * from smsDCSMapping where cc.dcsID = smsDCSMapping.dcsid and ackTime is not null)
and s.ackTime >= '2016-07-01'
group by convert(date, c.calendardate, 101)
order by convert(date, c.calendardate, 101)