---latest in code
select T.DocID_Oper DocIDOper, count(distinct T.batchname) #ofBatches, sum(T.TotalDocs) TotalDocs, sum(T.VerifiedDocs) TotalVerifiedDocs , sum(T.Errors) TotalErrors
                        FROM
                        (select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName,
                        (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
                        (select top 1 UserName from TS_Audit where TSModule = 'docid QC' and batchname = a.batchname order by UserImagesProcessed desc) DocIDQC_Oper2,
                        a.username, a.totaldocs, count(batchname) VerifiedDocs,
                        (select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid QC') Errors
                        from QA_Log a
                        where a.TimeStamp >= '8/2/2015' and a.TimeStamp <= '8/9/2015 23:59:59.999'
                        and a.tsmodule = 'docid QC'
                        group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs) T
                        where t.DocIDQC_Oper2 = t.username
                        group by T.DocID_Oper
                        order by T.DocID_Oper



use dva
    -- Insert statements for procedure here
                SELECT a.tsmodule,convert(nvarchar,a.timestamp,101) as QADate ,a.BatchName AS "Batch Name"
                , a.UserName AS "User Name"
                , a.TotalDocs AS "Total Docs"
                , COUNT(BatchName) as "Verified Docs"
                , (SELECT COUNT(BatchName) FROM TSErrorTracking WHERE BatchName = a.BatchName and tsmodule='docid qc' ) as "Errors"
                FROM dbo.QA_Log a 
                WHERE a.TimeStamp BETWEEN '8/2/2015' AND '8/9/2015'
                and a.tsmodule = 'docid QC'
                GROUP BY convert(nvarchar,a.timestamp,101), a.tsmodule, a.BatchName, a.UserName, a.TotalDocs 
				order by a.UserName





--revised for x by Audito
select T.UserName Auditor, count(distinct T.batchname) #ofBatches, sum(T.TotalDocs) TotalDocs, sum(T.VerifiedDocs) TotalVerifiedDocs , sum(T.Errors) TotalErrors
FROM
(select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName,
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
a.username, a.totaldocs, count(batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp between '8/2/2015' and '8/9/2015'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs) T
group by T.UserName
order by T.UserName



--revised for x by DocIDOper Summarized
select T.DocID_Oper DocIDOper, count(distinct T.batchname) #ofBatches, sum(T.TotalDocs) TotalDocs, sum(T.VerifiedDocs) TotalVerifiedDocs , sum(T.Errors) TotalErrors
FROM
(select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName,
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
a.username, a.totaldocs, count(batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp between '8/2/2015' and '8/9/2015'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs) T
group by T.DocID_Oper
order by T.DocID_Oper



--revised for x by DocIDOper Detailed
select distinct T.batchname BatchName, T.QADate QADate, sum(T.TotalDocs) TotalDocs, sum(T.VerifiedDocs) TotalVerifiedDocs , sum(T.Errors) TotalErrors, T.Username Auditor
FROM
(select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName,
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
a.username, a.totaldocs, count(batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp between '8/2/2015' and '8/9/2015'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs) T
where T.DocID_Oper = 'breidelbach'
group by T.BatchName, T.QADate, T.Username
order by T.QADate, T.BatchName



--revised for x The Errors
select tt.errortype, tt.errordatetime, tt.batchname, tt.OldDocType, tt.NewDocType, tt.OldDateStamp, tt.NewDateStamp, tt.username QAAuditor
FROM
(select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName,
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
a.username, a.totaldocs, count(batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp between '8/2/2015' and '8/9/2015'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs) T
left join TSErrorTracking tt
on T.BatchName = tt.batchname
where T.DocID_Oper = 'breidelbach'
and tt.errortype is not null
group by tt.errortype, tt.errordatetime, tt.batchname, tt.OldDocType, tt.NewDocType, tt.OldDateStamp, tt.NewDateStamp, tt.username
--order by T.QADate, T.BatchName


select errortype, errordatetime, batchname, OldDocType, NewDocType, OldDateStamp, NewDateStamp, username from TSErrorTracking where batchname = '02151320402404'

select * from TS_Audit where batchname = '02151320402404'
select * from TSErrorTracking where batchname = '02152320403002'
select * from QA_Log where BatchName = '02152320403002' and docid
select * from QA_Log where BatchName = '02152110000901'

50002
50001

----revision 2 for x
--select distinct T.DocID_Oper, T.QADate, 
--FROM
--(select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName, 
--(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
--a.username DocIDQC_Oper, a.totaldocs, count(a.batchname) VerifiedDocs,
--(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
--from QA_Log a
--where a.TimeStamp between '8/2/2015' and '8/9/2015'
--and a.tsmodule = 'docid qc'
--group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs) T
--order by a.UserName



--base DONT TOUCH
select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName, 
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
a.username DocIDQC_Oper, a.totaldocs, count(a.batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp between '8/2/2015' and '8/9/2015'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs
order by a.UserName


select * from TSErrorTracking where TSModule = 'docid qc'
and errordatetime >= '2015-08-17' and errordatetime <= '2015-08-24 23:59:59.999'

---top errors
select count(*) from TSErrorTracking where TSModule = 'docid qc'
and errordatetime >= '2015-08-17' and errordatetime <= '2015-08-24 23:59:59.999'



---top errors
select errortype, count(*) errorcount from TSErrorTracking where TSModule = 'docid qc'
and errordatetime >= '2015-08-17' and errordatetime <= '2015-08-24 23:59:59.999'
group by errortype
order by errorcount desc


---top 2 error auditor
select top 2 T.username, sum(T.Total)
FROM
(select username, count(*) Total from TSErrorTracking where TSModule = 'docid qc'
and errordatetime >= '2015-08-17' and errordatetime <= '2015-08-24 23:59:59.999'
group by username) T
group by T.username
order by T.username













--try 1
select sum(T.TotalDocs), sum(t.VerifiedDocs), sum(T.Errors)
FROM
(select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName, 
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper,
a.username DocIDQC_Oper, a.totaldocs, count(a.batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp >= '2015-08-03 00:00:00' and a.TimeStamp <= '2015-08-03 23:59:59.999'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs)T
where T.DocID_Oper = 'abays'



--try 2
select a.tsmodule TSModule, convert(nvarchar, a.timestamp, 101) QADate, a.batchname BatchName, 
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname and username = 'abays' order by UserImagesProcessed desc) DocID_Oper,
a.username DocIDQC_Oper, a.totaldocs, count(a.batchname) VerifiedDocs,
(select count(batchname) from TSErrorTracking where batchname = a.batchname and TSModule = 'docid qc') Errors
from QA_Log a
where a.TimeStamp >= '2015-08-03 00:00:00' and a.TimeStamp <= '2015-08-03 23:59:59.999'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.TSModule, a.BatchName, a.UserName, a.TotalDocs







select * from TS_Audit

--simple for grid
--just names 
select distinct T.DocID_Oper
FROM
(select convert(nvarchar, a.timestamp, 101) QADate, 
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper
from QA_Log a
where a.TimeStamp between '8/2/2015' and '8/9/2015'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.BatchName) T
order by T.DocID_Oper


--simple for grid
--just dates 
select distinct T.QADate
FROM
(select convert(nvarchar, a.timestamp, 101) QADate, 
(select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = a.batchname order by UserImagesProcessed desc) DocID_Oper
from QA_Log a
where a.TimeStamp >= '8/2/2015 00:00:00' and a.TimeStamp <= '8/9/2015 23:59:59.999'
and a.tsmodule = 'docid qc'
group by convert(nvarchar, a.timestamp, 101), a.BatchName) T
order by T.QADate


--ace revision
SELECT a.tsmodule,convert(nvarchar,a.timestamp,101) as QADate ,a.BatchName AS "Batch Name"
, a.UserName AS "User Name"
, t.UserName AS "Bad Person"
, a.TotalDocs AS "Total Docs"
, COUNT(a.BatchName) as "Verified Docs"
, (SELECT COUNT(BatchName) FROM TSErrorTracking WHERE BatchName = a.BatchName and tsmodule='docid qc' ) as "Errors"
FROM dbo.QA_Log a 
LEFT JOIN (select top 1 BatchName, TSModule, UserName from ts_audit
                     order by UserImagesProcessed desc) t
ON t.BatchName = a.BatchName AND t.TSModule = a.TSModule
WHERE a.TimeStamp BETWEEN '8/2/2015' AND '8/9/2015'
and a.tsmodule = 'DocID'
GROUP BY convert(nvarchar,a.timestamp,101), a.tsmodule, a.BatchName, a.UserName, a.TotalDocs, t.UserName 
            order by a.UserName




select top 1 * from ts_audit where batchname = '02151320402404' and
tsmodule = 'docid'
order by UserImagesProcessed desc




				select * from TSErrorTracking where batchname = '02151320402404'
				select * from TurboscanNG1.dbo.Users where userid = 881

				select * from ts_audit where batchname = '03152100604701'