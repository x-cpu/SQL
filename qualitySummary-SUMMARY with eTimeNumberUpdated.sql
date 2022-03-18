--quality
USE DVA
select ISNULL(L.file_num, '') eTimeNumber, Z.DocIDOper, sum(Z.TotalDocs) TotalDocs, sum(Z.VerifiedDocs) VerifiedDocs, sum(Z.Errors) Errors, 
                                Accuracy = 100 - (100 * cast(sum(Z.Errors) as float)/ cast(sum(Z.VerifiedDocs) as float)) 
                                FROM
                                (select distinct X.Batchname BatchName, X.DocIDOper, X.QADate QADate, sum(X.TotalDocs) TotalDocs, sum(X.VerifiedDocs) VerifiedDocs, X.Errors Errors, x.Auditor Auditor
                                FROM
                                (select distinct T.Batchname, T.QADate, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
                                FROM     
                                (select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
                                a.TotalDocs, COUNT(DISTINCT a.BatchName + CONVERT(VARCHAR, a.DOCID)) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
                                from QA_Log a
                                left join TS_Audit ta
                                on a.BatchName = ta.BatchName and a.UserName = ta.UserName             
                                left outer join TSErrorTracking tt
                                on a.BatchName = tt.batchname and a.UserName = tt.username      
                                where a.TimeStamp >= '2016-07-11 0:0:0' and a.TimeStamp <= '2016-07-24 23:59:59.999'
                                and a.TSModule = 'DocID QC'
                                and (tt.tsmodule = 'DocID QC' or tt.TSModule is null)
                                and UserImagesProcessed <> 0 
                                and a.Batchname like '02%'
                                group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
                                left join TS_Audit tsa
                                on T.BatchName = tsa.BatchName
                                where tsa.TSModule = 'DocID'
                                group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
                                having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)) X
                                group by X.Batchname, X.DocIDOper, X.QADate, X.Auditor, X.Errors)Z
                                                       left join employee2 L on Z.DocidOper = L.userdef1
                                group by Z.DocIDOper, L.file_num
                                                       order by Z.DocIDOper





--USE THIS with eTimeNumber
--LOCSS db query updated to replace column value if column blank
--LOCSS productivity
select convert(date,t.date_in,101)[Date], ISNULL(e.file_num, '') eTimeNumber, COALESCE(NULLIF(e.userdef1, ''), t.init) userdef1,e.lastname+', '+e.firstname [Name],
ISNULL(e.minit, '') MI,
t.custid,t.task_code,ct.TaskDesc,SUM(t.elapsed)[Hours],SUM(t.qty)[Count]
from transact t join custtask ct on (t.task_code = ct.task_code and t.custid = ct.custid) join employee e on (e.init = t.init)
where (convert(date,t.date_in,101) >= '2016-07-25 0:0:0'  and convert(date,t.date_in,101) <= '2016-08-07 23:59:59.999')
group by convert(date,t.date_in,101), e.file_num, e.userdef1, t.init, t.custid,t.task_code,ct.TaskDesc,e.lastname,e.firstname,e.minit		







--LOCSS db query updated to replace column value if column blank
--LOCSS productivity
select convert(date,t.date_in,101)[Date], ISNULL(e.file_num, '') eTimeNumber, COALESCE(NULLIF(e.userdef1, ''), t.init) userdef1,e.lastname+', '+e.firstname [Name],
ISNULL(e.minit, '') MI,
t.custid,t.task_code,ct.TaskDesc,SUM(t.elapsed)[Hours],SUM(t.qty)[Count]
from transact t join custtask ct on (t.task_code = ct.task_code and t.custid = ct.custid) join employee e on (e.init = t.init)
where (convert(date,t.date_in,101) >= '2016-06-20 0:0:0'  and convert(date,t.date_in,101) <= '2016-06-26 23:59:59.999')
group by convert(date,t.date_in,101),e.userdef1, t.init, t.custid,t.task_code,ct.TaskDesc,e.lastname,e.firstname,e.minit													   





--LOCSS db
select convert(date,t.date_in,101)[Date],ISNULL(e.userdef1, '') userdef1,e.lastname+', '+e.firstname [Name],ISNULL(e.minit, '') MI,t.custid,t.task_code,ct.TaskDesc,SUM(t.elapsed)[Hours],SUM(t.qty)[Count]
from transact t join custtask ct on (t.task_code = ct.task_code and t.custid = ct.custid) join employee e on (e.init = t.init)
where (convert(date,t.date_in,101) >= '2016-06-20 0:0:0'  and convert(date,t.date_in,101) <= '2016-06-26 23:59:59.999')
group by convert(date,t.date_in,101),e.userdef1,t.custid,t.task_code,ct.TaskDesc,e.lastname,e.firstname,e.minit