select convert(nvarchar, ftpdetails.etime, 101) as uploadPortaldate, count(document.imageid) as docs, sum(document.numpages) as pages into portalcmptemp
from FTPDetails
inner join document
on ftpdetails.batchname = document.pbatch 
where ftpdetails.etime >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) + ' 0:0:0' AND 
ftpdetails.etime <= DATEADD(d, DATEDIFF(d, 0, GETDATE()), -1) + ' 23:59:59.999' AND
ftpdetails.acktime is not null
group by convert(nvarchar, ftpdetails.etime, 101)
order by convert(nvarchar, ftpdetails.etime, 101)



--drop table portalcmptemp
select * from portalcmptemp	

--monthly
select convert(nvarchar, ftpdetails.etime, 101) as uploadPortaldate, count(document.imageid) as docs, sum(document.numpages) as pages into portalcmptemp
from FTPDetails
inner join document
on ftpdetails.batchname = document.pbatch 
where ftpdetails.etime >= '10-01-2014 0:0:0' AND 
ftpdetails.etime <= '10-31-2014 23:59:59.999' AND
ftpdetails.acktime is not null
group by convert(nvarchar, ftpdetails.etime, 101)
order by convert(nvarchar, ftpdetails.etime, 101)
