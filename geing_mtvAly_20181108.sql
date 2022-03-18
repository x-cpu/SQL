select T.RMN, T.TypeOfClaim, T.DateCheckedIn,
DATEDIFF(day, t.DateCheckedIn, GETDATE()) - (select count(*) from Calendar where calendardate between T.DateCheckedIn and GETDATE() and (DayOfWeekName in ('Saturday', 'Sunday') or CalendarDateDescription is not null)) DaysSinceCheckIn,
T.DCSID, T.BatchName
FROM
(select distinct m.RMN, c.claimtype TypeOfClaim, max(convert(date, m.insertdate, 101)) DateCheckedIn, p.pbatch BatchName, p.dcsid DCSID
from manifestDCS m
left join PbatchDCSMapping p
on m.rmn = p.rmn
left join customerCheckIn c
on m.rmn = c.rmn
where not exists (
select * from document where p.dcsid = dcsid and p.pbatch = pbatch and ftpstime is not null)
--and m.insertdate >= '2018-11-01'
group by m.RMN, c.claimtype, p.pbatch, p.dcsid) T



select T.RMN, T.TypeOfClaim, T.DateCheckedIn,
DATEDIFF(day, t.DateCheckedIn, GETDATE()) - (select count(*) from Calendar where calendardate between T.DateCheckedIn and GETDATE() and (DayOfWeekName in ('Saturday', 'Sunday') or CalendarDateDescription is not null)) DaysSinceCheckIn,
T.DCSID, T.BatchName
FROM
(select distinct m.RMN, c.claimtype TypeOfClaim, max(convert(date, m.insertdate, 101)) DateCheckedIn, p.pbatch BatchName, p.dcsid DCSID
from manifestDCS m
left join PbatchDCSMapping p
on m.rmn = p.rmn
left join customerCheckIn c
on m.rmn = c.rmn
where not exists (
select * from document where p.dcsid = dcsid and p.pbatch = pbatch and ftpstime is not null)
and m.insertdate >= '2018-10-01'
and p.Pbatch like '02%'
group by m.RMN, c.claimtype, p.pbatch, p.dcsid) T


select T.RMN, T.TypeOfClaim, T.DateCheckedIn,
DATEDIFF(day, t.DateCheckedIn, GETDATE()) - (select count(*) from Calendar where calendardate between T.DateCheckedIn and GETDATE() and (DayOfWeekName in ('Saturday', 'Sunday') or CalendarDateDescription is not null)) DaysSinceCheckIn,
T.DCSID, T.BatchName
FROM
(select distinct m.RMN, c.claimtype TypeOfClaim, max(convert(date, m.insertdate, 101)) DateCheckedIn, p.pbatch BatchName, p.dcsid DCSID
from manifestDCS m
left join PbatchDCSMapping p
on m.rmn = p.rmn
left join customerCheckIn c
on m.rmn = c.rmn
where not exists (
select * from document where p.dcsid = dcsid and p.pbatch = pbatch and ftpstime is not null)
and m.insertdate >= '2018-10-25'
and p.Pbatch like '01%'
group by m.RMN, c.claimtype, p.pbatch, p.dcsid) T
order by DaysSinceCheckIn desc


select * from document where dcsid = 'JFT3J67U-XVRSFI'

select * from PbatchDCSMapping where dcsid = 'JNLMIKFL-6JVSIJ'