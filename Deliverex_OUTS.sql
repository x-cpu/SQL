select o.system, o.dcsid, o.vol, o.type, o.box, o.status, o.date, o.reason, 
CASE
	WHEN o.dcsid not like 'DCSID%' then max(m.insertdate) 
	WHEN o.dcsid like 'DCSID%' then max(c.insertdate)
	END AS FP_SHOVCheckInDate,
	max(mtv.insertdate) MTV_SHOVCheckInDate 
from outs o
left join dva.dbo.manifestDCS m
on o.dcsid = m.dcsID
left join [mtv-va-sql-1\p922].dva.dbo.manifestDCS mtv
on o.dcsid = mtv.dcsid
left join dva.dbo.cmpcheckin c
on substring(o.dcsid, 6, 14) = c.pbatch
group by o.system, o.dcsid, o.vol, o.type, o.box, o.status, o.date, o.reason




select  substring(dcsid, 6, 14) from outs where dcsid = 'DCSID031432606088010044'

select * from dva.dbo.cmpcheckin where pbatch = '03143260608801'


select * from outs_x