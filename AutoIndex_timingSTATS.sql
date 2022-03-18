--autoindex
select x.ProcessDate,
RIGHT('0' + CAST(x.ProcTime/3600 as varchar),2) + ':' + 
RIGHT('0' + CAST((x.ProcTime/60) % 60 as varchar),2) + ':' +
RIGHT('0' + CAST(x.ProcTime % 60 as varchar),2) as UserProcTime
FROM
(select CONVERT(date, timestamp, 101) ProcessDate, 
case
WHEN TSModule = '4' then 'Separation'
WHEN TSModule = 'AutoIndex' then 'AutoIndex'
WHEN TSModule = 'Enhance' then 'Enhance'
END
AS TSModule,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('Enhance','4','AutoIndex') 
and timestamp >= '2016-07-25' and timestamp <= '2016-07-29 23:59:59.999'
group by CONVERT(date, timestamp, 101), TSModule) x



--docidQC
select x.ProcessDate,
RIGHT('0' + CAST(x.ProcTime/3600 as varchar),2) + ':' + 
RIGHT('0' + CAST((x.ProcTime/60) % 60 as varchar),2) + ':' +
RIGHT('0' + CAST(x.ProcTime % 60 as varchar),2) as UserProcTime, x.UserProcIMG
FROM
(select CONVERT(date, timestamp, 101) ProcessDate, 
case
WHEN TSModule = 'DocID QC' then 'DocID QC'
END
AS TSModule, sum(UserImagesProcessed) UserProcIMG,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('DocID QC') 
and timestamp >= '2016-07-01' and timestamp <= '2016-07-31 23:59:59.999'
group by CONVERT(date, timestamp, 101), TSModule) x
order by x.ProcessDate


--docidQC SUMMARY
select 
RIGHT('0' + CAST(x.ProcTime/3600 as varchar),2) + ':' + 
RIGHT('0' + CAST((x.ProcTime/60) % 60 as varchar),2) + ':' +
RIGHT('0' + CAST(x.ProcTime % 60 as varchar),2) as UserProcTime, x.UserProcIMG
FROM
(select 
case
WHEN TSModule = 'DocID QC' then 'DocID QC'
END
AS TSModule, sum(UserImagesProcessed) UserProcIMG,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('DocID QC') 
and timestamp >= '2016-07-01' and timestamp <= '2016-07-31 23:59:59.999'
group by TSModule) x
order by x.ProcessDate





--Verification
select x.ProcessDate,
RIGHT('0' + CAST(x.ProcTime/3600 as varchar),2) + ':' + 
RIGHT('0' + CAST((x.ProcTime/60) % 60 as varchar),2) + ':' +
RIGHT('0' + CAST(x.ProcTime % 60 as varchar),2) as UserProcTime, x.UserProcIMG
FROM
(select CONVERT(date, timestamp, 101) ProcessDate, 
case
WHEN TSModule = 'Verification' then 'Verification'
END
AS TSModule, sum(UserImagesProcessed) UserProcIMG,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('Verification') 
and timestamp >= '2016-07-01' and timestamp <= '2016-07-31 23:59:59.999'
group by CONVERT(date, timestamp, 101), TSModule) x
order by x.ProcessDate


--Verification SUMMARY
select 
RIGHT('0' + CAST(x.ProcTime/3600 as varchar),2) + ':' + 
RIGHT('0' + CAST((x.ProcTime/60) % 60 as varchar),2) + ':' +
RIGHT('0' + CAST(x.ProcTime % 60 as varchar),2) as UserProcTime, x.UserProcIMG
FROM
(select 
case
WHEN TSModule = 'Verification' then 'Verification'
END
AS TSModule, sum(UserImagesProcessed) UserProcIMG,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('Verification') 
and timestamp >= '2016-07-01' and timestamp <= '2016-07-31 23:59:59.999'
group by TSModule) x


--Verification SUMMARY updated
select x.ProcTime
FROM
(select 
case
WHEN TSModule = 'Verification' then 'Verification'
END
AS TSModule, sum(UserImagesProcessed) UserProcIMG,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('Verification') 
and timestamp >= '2016-07-01' and timestamp <= '2016-07-31 23:59:59.999'
group by TSModule) x


--
SELECT CONVERT(varchar, DATEADD(ms, 9876182 * 1000, 0), 114)



--Verification
select x.ProcessDate,
RIGHT('0' + CAST(x.ProcTime/3600 as varchar),2) + ':' + 
RIGHT('0' + CAST((x.ProcTime/60) % 60 as varchar),2) + ':' +
RIGHT('0' + CAST(x.ProcTime % 60 as varchar),2) as UserProcTime, x.UserProcIMG
FROM
(select CONVERT(date, timestamp, 101) ProcessDate, 
case
WHEN TSModule = 'Verification' then 'Verification'
END
AS TSModule, sum(UserImagesProcessed) UserProcIMG,
sum(UserProcTime) ProcTime
from TS_Audit
where TSmodule in ('Verification') 
and timestamp >= '2016-08-04' and timestamp <= '2016-08-04 23:59:59.999'
group by CONVERT(date, timestamp, 101), TSModule) x
order by x.ProcessDate



--use dva select username, 
--                        case
--                        WHEN TSModule = '4' then 'Separation'
--                        WHEN TSModule = 'AutoIndex' then 'AutoIndex'
--                        WHEN TSModule = 'DocID' then 'DocID'
--                        WHEN TSModule = 'DocID QC' then 'DocID QC'
--                        WHEN TSModule = 'Enhance' then 'Enhance'
--                        WHEN TSModule = 'ImageQC' then 'ImageQC'
--                        WHEN TSModule = 'Manual Index' then 'Manual Index'
--                        WHEN TSModule = 'Manual Index QC' then 'Manual Index QC'
--                        WHEN TSModule = 'PREP' then 'Prep'
--                        WHEN TSModule = 'Verification' then 'Verification'
--                        END
--                        AS TSModule,
--                        totalimages TotalIMG, ImagesProcessed ProcIMG, ImagesRejected RejIMG, UserImagesProcessed UserProcIMG, 
--                        RIGHT('0' + CAST(UserProcTime/3600 as varchar),2) + ':' + 
--                        RIGHT('0' + CAST((UserProcTime/60) % 60 as varchar),2) + ':' +
--                        RIGHT('0' + CAST(UserProcTime % 60 as varchar),2) as UserProcTime, 
--                        TimeStamp, batchname BatchName
--                        from TS_Audit where batchname = @pbatch and username <> '998'