--to portal by day
select convert(nvarchar, fd.etime, 101) as uploadPortaldate, count(*) as docs, sum(d.numpages) as Pages from FTPDetails fd
left join document d
on fd.batchname = d.PBatch 
where fd.etime >= '11/01/2014 0:0:0' 
and fd.etime <= '11/30/2014 23:59:59.999' 
and fd.acktime is not null
group by CONVERT(nvarchar, fd.etime, 101)
order by CONVERT(nvarchar, fd.etime, 101)



--hourly to portal
select convert(nvarchar, fd.etime, 101) as uploadPortaldate, 
RIGHT('00' + CONVERT(varchar,datepart(hour,fd.etime) % 12 ),2) + ' ' + CASE WHEN datepart(hour,fd.etime) > = 12 THEN 'PM' ELSE 'AM' END, 
count(*) as docs, sum(d.numpages) as Pages from FTPDetails fd
left join document d
on fd.batchname = d.PBatch 
where fd.etime >= DATEADD(day, -1, GETDATE())
---and fd.etime <= '8/30/2014 23:59:59.999' 
and fd.acktime is not null
group by CONVERT(nvarchar, fd.etime, 101), datepart(hh,fd.etime)
order by CONVERT(nvarchar, fd.etime, 101), datepart(hh,fd.etime)


--hourly ftp img volume  to vbms
select convert(nvarchar, ftpstime, 101) as date,
RIGHT('00' + CONVERT(varchar,datepart(hour,ftpstime) % 12 ),2) + ' ' + CASE WHEN datepart(hour,ftpstime) > = 12 THEN 'PM' ELSE 'AM' END,  
--datepart(hh,ftpstime) as Hour ,
--sum(numpages) as Images from Document where ftpstime > '12/05/2014 0:0:0'
sum(numpages) as Images from Document where ftpstime >= DATEADD(day, -1, GETDATE())
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 

--hourly ftp img volume  
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images from Document 
--where ftpstime > '12/05/2014 0:0:0'
where ftpstime >= DATEADD(day, -1, GETDATE())
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 



--test 
select RIGHT('00' + CONVERT(varchar,datepart(hour,getdate()) % 12 ),2) + ' ' + CASE WHEN datepart(hour,getdate()) > =12 THEN 'PM' ELSE 'AM' END

select RIGHT('00' + CONVERT(varchar,datepart(hour,fd.etime) % 12 ),2) + ' ' + CASE WHEN datepart(hour,fd.etime) > = 12 THEN 'PM' ELSE 'AM' END


select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images from Document where ftpstime > '12/05/2014 0:0:0'
and pbatch not like '02%'
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 
order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 


select convert(nvarchar, FTPDetails.ETime, 101), count(*) as docs, sum(document.numpages) from FTPDetails 
left join document
on FTPDetails.batchname = document.PBatch
where etime >= '2014-12-02 0:0:0'
group by CONVERT(nvarchar, FTPDetails.etime, 101)
order by CONVERT(nvarchar, FTPDetails.etime, 101)

--hourly ftp img volume  
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images from Document where ftpstime > '12/05/2014 0:0:0'
and pbatch not like '02%'
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 


select * from Document where pbatch = '03143210604501'


select convert(nvarchar, ftpdetails.etime, 101) as uploadPortaldate, count(document.imageid) as docs, sum(document.numpages) as pages from FTPDetails 
inner join document
on ftpdetails.batchname = document.pbatch
where ftpdetails.etime >= '2014-12-01 0:0:0' AND 
ftpdetails.etime < '2015-01-01 0:0:0' AND
ftpdetails.acktime is not null
group by convert(nvarchar, ftpdetails.etime, 101)
order by convert(nvarchar, ftpdetails.etime, 101)

select BatchName from TurboscanNG1.dbo.batches
where SUBSTRING(batchname, 9, 1) = '8' and batchname  like '03%'
and BatchLocation <> '0'
order by batchname

select * from TurboscanNG1.dbo.Batches where batchname like '04%' and BatchLocation <> '0'


