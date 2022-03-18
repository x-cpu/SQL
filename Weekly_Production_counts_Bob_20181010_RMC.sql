select distinct t.Year, t.Week, count(t.batchname) Batches, sum(t.DCSID) DCSIDs, sum(t.Docs) Docs, sum(t.Images) Images
FROM
(select distinct d.pbatch BatchName, count(distinct d.dcsid) DCSID, 
count(d.ImageID) Docs, 
sum(d.NumPages) Images, YEAR(d.ImageDateTime) Year, datepart(WEEK, d.ImageDateTime) Week  
from document d 
where d.imagedatetime >= '2018-09-25' 
and d.ImageDateTime <= '2018-10-02 23:59:59.999'
and d.PBatch like '01%'
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