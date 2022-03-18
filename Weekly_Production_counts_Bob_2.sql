select distinct t.Year, t.Week, count(t.batchname) Batches, sum(t.DCSID) DCSIDs, sum(t.Docs) Docs, sum(t.Images) Images
FROM
(select distinct top (100) d.pbatch BatchName, count(distinct d.dcsid) DCSID, 
count(d.ImageID) Docs, 
sum(d.NumPages) Images, YEAR(d.ImageDateTime) Year, datepart(WEEK, d.ImageDateTime) Week  
from document d 
where d.imagedatetime >= '2018-01-01' 
and d.ImageDateTime <= '2018-09-13 23:59:59.999'
and d.PBatch like '02%'
and exists (
select * 
from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
left join [mtv-va-sql-4\p1].turboscanng1.dbo.workstation w
on t.wsid = w.wsid
where (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%')
and t.tsmodule = 'DocID' 
and batchname = d.PBatch)
and exists (select * from Calendar where CONVERT(varchar, d.ImageDateTime, 23) = CalendarDate and BusinessDay = '1')
group by d.PBatch, YEAR(d.ImageDateTime), datepart(WEEK, d.ImageDateTime)) T
group by t.Year, t.Week



select distinct CONVERT(date, d.ImageDateTime, 101) Date, d.pbatch BatchName, count(distinct d.dcsid) DCSID, 
count(d.ImageID) Docs, 
sum(d.NumPages) Images, YEAR(d.ImageDateTime) Year, datepart(WEEK, d.ImageDateTime) Week
from document d 
where d.imagedatetime >= '2018-09-01' 
and d.ImageDateTime <= '2018-09-13 23:59:59.999'
and d.PBatch like '02%'
and exists (
select * 
from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
left join [mtv-va-sql-4\p1].turboscanng1.dbo.workstation w
on t.wsid = w.wsid
where (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%')
and t.tsmodule = 'DocID' 
and batchname = d.PBatch)
and exists (select * from Calendar where CONVERT(varchar, d.ImageDateTime, 23) = CalendarDate and BusinessDay = '1')
group by CONVERT(date, d.ImageDateTime, 101), top (100) d.PBatch, YEAR(d.ImageDateTime), datepart(WEEK, d.ImageDateTime)




select distinct datepart(WEEK, CalendarDate) Week, FirstDateOfWeek, LastDateOfWeek from calendar
where CalendarDate >= '2018-05-01' 
and CalendarDate <= '2018-09-13'
and BusinessDay = '1'


select distinct t.Year, t.Week, count(t.batchname) Batches, sum(t.DCSID) DCSIDs, sum(t.Docs) Docs, sum(t.Images) Images
FROM
(select distinct top (100) d.pbatch BatchName, count(distinct d.dcsid) DCSID, 
count(d.ImageID) Docs, 
sum(d.NumPages) Images, YEAR(d.ImageDateTime) Year, datepart(WEEK, d.ImageDateTime) Week  
from document d 
where d.imagedatetime >= '2018-09-09' 
and d.ImageDateTime <= '2018-09-15 23:59:59.999'
and d.PBatch like '02%'
and exists (
select * 
from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
left join [mtv-va-sql-4\p1].turboscanng1.dbo.workstation w
on t.wsid = w.wsid
where (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%')
and t.tsmodule = 'DocID' 
and batchname = d.PBatch)
and exists (select * from Calendar where CONVERT(varchar, d.ImageDateTime, 23) = CalendarDate and BusinessDay = '1')
group by d.PBatch, YEAR(d.ImageDateTime), datepart(WEEK, d.ImageDateTime)) T
group by t.Year, t.Week




--Week	FirstDateOfWeek	LastDateOfWeek
--18	2018-04-29	2018-05-05
--19	2018-05-06	2018-05-12
--20	2018-05-13	2018-05-19
--21	2018-05-20	2018-05-26
--22	2018-05-27	2018-06-02
--23	2018-06-03	2018-06-09
--24	2018-06-10	2018-06-16
--25	2018-06-17	2018-06-23
--26	2018-06-24	2018-06-30
--27	2018-07-01	2018-07-07
--28	2018-07-08	2018-07-14
--29	2018-07-15	2018-07-21
--30	2018-07-22	2018-07-28
--31	2018-07-29	2018-08-04
--32	2018-08-05	2018-08-11
--33	2018-08-12	2018-08-18
--34	2018-08-19	2018-08-25
--35	2018-08-26	2018-09-01
--36	2018-09-02	2018-09-08
--37	2018-09-09	2018-09-15