--SUMMARY with eTimeNumber seems to be working 
select L.file_num eTimeNumber, Z.DocIDOper, sum(Z.TotalDocs) TotalDocs, sum(Z.VerifiedDocs) VerifiedDocs, sum(Z.Errors) Errors, 
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
                                where a.TimeStamp >= '2016-06-20 0:0:0' and a.TimeStamp <= '2016-06-26 23:59:59.999'
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



--SUMMARY seems to be working 
select Z.DocIDOper, sum(Z.TotalDocs) TotalDocs, sum(Z.VerifiedDocs) VerifiedDocs, sum(Z.Errors) Errors, 
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
                                where a.TimeStamp >= '2016-06-20 0:0:0' and a.TimeStamp <= '2016-06-26 23:59:59.999'
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
								--left join employee2 L on Z.DocidOper = L.userdef1
								--left join [atl-va-sql-2a\p921].[LOCSS].[dbo].[employee] L on Z.DocidOper = L.init
								--inner join openrowset('MSDASQL', 'Driver=[SQL SERVER]; Server=atl-va-sql-2a\p921;UID=ibml;PWD=ibml123;','LOCSS.dbo.employee') L on Z.DocidOper = L.init
								--inner join ('MSDASQL', 'Driver=[SQL SERVER]; Server=atl-va-sql-2a\p921;UID=ibml;PWD=ibml123;','LOCSS.dbo.employee') L on Z.DocidOper = L.init
                                group by Z.DocIDOper
								order by Z.DocIDOper



