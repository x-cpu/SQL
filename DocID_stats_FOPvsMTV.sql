--Today
select ISNULL(sum(T.Total), 0) Total, ISNULL(sum(T.[ForestPark]), 0) ForestParkTotal, ISNULL(sum(T.[Mt.Vernon]), 0) MtVernonTotal
FROM
(select isnull(sum(t.UserImagesProcessed),0) Total, 
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') and t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) Then isnull(sum(t.UserImagesProcessed),0) 
	END 'ForestPark',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') and t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) Then isnull(sum(t.UserImagesProcessed),0) 
	END 'Mt.Vernon'
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) and t.TSModule = 'docid' and t.UserImagesProcessed > 0
group by w.WSName, t.TimeStamp) T



--Today with numOpers
select ISNULL(sum(T.Total), 0) Total, ISNULL(sum(T.[ForestPark]), 0) ForestParkTotal, ISNULL(sum(T.[Mt.Vernon]), 0) MtVernonTotal, sum(T.ForestParkOper), sum(T.[Mt.VernonOper])
FROM
(select isnull(sum(t.UserImagesProcessed),0) Total, 
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed),0) 
	END 'ForestPark',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed),0) 
	END 'Mt.Vernon',
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') Then count(distinct(t.UserName))
	END 'ForestParkOper',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') Then count(distinct(t.UserName)) 
	END 'Mt.VernonOper'
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) and t.TSModule = 'docid'
group by w.WSName) T





--by date (last 14 days)
select T.Date, ISNULL(sum(T.Total), 0) Total, ISNULL(sum(T.[ForestPark]), 0) ForestParkTotal, ISNULL(sum(T.[Mt.Vernon]), 0) MtVernonTotal
FROM
(select distinct CONVERT(nvarchar, t.timestamp, 101) Date, ISNULL(sum(t.UserImagesProcessed), 0) Total, 
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') Then ISNULL(sum(t.UserImagesProcessed), 0) 
	END 'ForestPark',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed), 0) 
	END 'Mt.Vernon'
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 14, 0) and t.timestamp < DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) and t.TSModule = 'docid'
group by CONVERT(nvarchar, t.timestamp, 101), w.WSName) T
group by T.Date
order by T.Date desc


--Today by username
select ISNULL(sum(T.Total), 0) Total, ISNULL(sum(T.[ForestPark]), 0) ForestParkTotal, ISNULL(sum(T.[Mt.Vernon]), 0) MtVernonTotal, t.UserName
FROM
(select isnull(sum(t.UserImagesProcessed),0) Total, t.username,
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed),0) 
	END 'ForestPark',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed),0) 
	END 'Mt.Vernon'
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= '2017-09-22 0:0:0' and t.timestamp <= GETDATE() and t.TSModule = 'docid'
group by w.WSName, t.UserName) T
group by T.username
order by Total desc






select isnull(sum(UserImagesProcessed),0) from ts_audit WITH (NOLOCK) where TimeStamp >= '" + xDateTime + " 0:0:0' and timestamp <= '" + now + "' and TSModule = 'docid'






select isnull(sum(t.UserImagesProcessed),0) Total
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= '2017-09-21 0:0:0' and t.timestamp < '2017-09-22 0:0:0' and t.TSModule = 'docid' and (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%')



--2136251
--901098


select ISNULL(sum(T.Total), 0) Total, ISNULL(sum(T.[ForestPark]), 0) ForestParkTotal, ISNULL(sum(T.[Mt.Vernon]), 0) MtVernonTotal
FROM
(select isnull(sum(t.UserImagesProcessed),0) Total, 
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed),0) 
	END 'ForestPark',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') Then isnull(sum(t.UserImagesProcessed),0) 
	END 'Mt.Vernon'
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= '2017-09-19 0:0:0' and t.timestamp <= '2017-09-19 23:59:59.999' and t.TSModule = 'docid'
group by w.WSName) T




--select x.Date, sum(ISNULL(X.RegularFaxes, 0)) RegularFaxes, sum(ISNULL(X.PMCFaxes, 0)) PMCFaxes, sum(ISNULL(X.BVAFaxes, 0)) BVAFaxes, sum(ISNULL(x.TotalFaxes, 0)) TotalFaxes
--                        FROM
--                        (select distinct CONVERT(nvarchar, t.datemodified, 101) Date, 
--                        CASE
--	                        When (p.cordest is null or p.cordest = 'pmc' or p.cordest = 'bva') then count(distinct t.tifname) 
--	                        END AS TotalFaxes,
--                        CASE
--	                        When (p.cordest = 'pmc') then count(distinct t.tifname) 
--	                        END AS PMCFaxes,
--                        CASE
--	                        When (p.cordest = 'bva') and InvTime > '2017-09-01' then count(distinct t.tifname) 
--	                        END AS BVAFaxes,						
--                        CASE
--	                        When (p.cordest is null) then count(distinct t.tifname) 
--	                        END AS RegularFaxes,
--	                        t.pbatch
--                        from tmpfaxtifname t
--                        left join PhysicalBatch p
--                        on (t.pbatch = p.PBatch and convert(date, t.datemodified, 101) >= convert(date, p.BackDate, 101))
--                        where t.datemodified >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 30, 0)
--                        and t.datemodified < DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)
--                        group by CONVERT(nvarchar, t.datemodified, 101), t.pbatch, p.cordest, p.InvTime) X
--                        group by x.Date
--                        order by x.Date desc




--Today
select ISNULL(sum(T.Total), 0) Total, ISNULL(sum(T.[ForestPark]), 0) ForestParkTotal, ISNULL(sum(T.[Mt.Vernon]), 0) MtVernonTotal
FROM
(select isnull(sum(t.UserImagesProcessed),0) Total, 
CASE
	When (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%') and t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) Then isnull(sum(t.UserImagesProcessed),0) 
	END 'ForestPark',
CASE
	When (w.WSName not like 'ATL%' and w.WSName not like 'MTV-VA-RK%') and t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) Then isnull(sum(t.UserImagesProcessed),0) 
	END 'Mt.Vernon'
from ts_audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) and t.TSModule = 'docid' and t.UserImagesProcessed > 0
group by w.WSName, t.TimeStamp) T


select * from TS_Audit t where t.TimeStamp >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) and t.TSModule = 'docid' and t.UserImagesProcessed > 0