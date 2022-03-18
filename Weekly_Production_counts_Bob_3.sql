Select 
FROM
(select distinct top (100) d.pbatch BatchName, count(distinct d.dcsid) DCSID, 
count(d.ImageID) Docs, 
sum(d.NumPages) Images, YEAR(d.ImageDateTime) Year, datepart(WEEK, d.ImageDateTime) Week  
from document d 
where d.imagedatetime >= '2018-07-18' 
and d.ImageDateTime <= '2018-07-18 23:59:59.999'
and d.PBatch like '02%'
and exists (
select * 
from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
left join [mtv-va-sql-4\p1].turboscanng1.dbo.workstation w
on t.wsid = w.wsid
where (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%')
and t.tsmodule = 'DocID' 
and batchname = d.PBatch)
group by d.PBatch, YEAR(d.ImageDateTime), datepart(WEEK, d.ImageDateTime)) T



select YEAR(imagedatetime) Year, MONTH(imagedatetime) Month, docidDoctype DocumentType, dd.docid DocID, count(*) Count 
from document 
left join docid.dbo.docid dd
on document.docidDoctype = dd.DocType
where docidDoctype in (
'VA 21-526EZ, Fully Developed Claim (Compensation)',
'VA 21-22 Appointment of Veterans Serv. Org. as Claimant Rep',
'Power of Attorney (incl. VA 21-22, VA 22a)')
and ImageDateTime >= '2018-01-01'
and pbatch like '04%'
and exists (Select * from stats where document.pbatch = kbatch)
group by YEAR(imagedatetime), MONTH(imagedatetime), docidDoctype, dd.DocID 
order by Year, Month, DocumentType desc



select distinct top (100) d.pbatch BatchName, count(distinct d.dcsid) DCSID, 
count(d.ImageID) Docs, 
sum(d.NumPages) Images, YEAR(d.ImageDateTime) Year, datepart(WEEK, d.ImageDateTime) Week  
from document d 
where d.imagedatetime >= '2018-07-01' 
and d.ImageDateTime <= '2018-07-18 23:59:59.999'
and d.PBatch like '02%'
and exists (
select * 
from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
left join [mtv-va-sql-4\p1].turboscanng1.dbo.workstation w
on t.wsid = w.wsid
where (w.WSName like 'ATL%' or w.WSName like 'MTV-VA-RK%')
and t.tsmodule = 'DocID' 
and batchname = d.PBatch)
group by d.PBatch, YEAR(d.ImageDateTime), datepart(WEEK, d.ImageDateTime)