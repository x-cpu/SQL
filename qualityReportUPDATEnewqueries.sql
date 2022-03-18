--breakdown by batch for Quality Report code
select X.DocIDOper, count(distinct X.Batchname) #ofBatches, sum(X.TotalDocs) TotalDocs, sum(X.VerifiedDocs) VerifiedDocs, sum(X.Errors) Errors
FROM
(select T.QADate, T.Batchname, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
FROM	
(select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
a.TotalDocs, count(a.batchname) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
from QA_Log a
left join TS_Audit ta
on a.BatchName = ta.BatchName and a.UserName = ta.UserName		
left outer join TSErrorTracking tt
on a.BatchName = tt.batchname	
where a.TimeStamp >= '8/19/2015' and a.TimeStamp <= '8/19/2015 23:59:59.999'
and a.TSModule = 'docid QC'
and (tt.tsmodule = 'docid QC' or tt.TSModule is null)
and UserImagesProcessed <> 0 
group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
left join TS_Audit tsa
on T.BatchName = tsa.BatchName
where tsa.TSModule = 'DocID'
group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)) X
group by X.DocIDOper
order by X.DocIDOper


--breakdown by batch for Quality Report code DONT NOT TOUCH
select T.QADate, T.Batchname, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
FROM	
(select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
a.TotalDocs, count(a.batchname) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
from QA_Log a
left join TS_Audit ta
on a.BatchName = ta.BatchName and a.UserName = ta.UserName		
left outer join TSErrorTracking tt
on a.BatchName = tt.batchname	
where a.TimeStamp >= '8/2/2015' and a.TimeStamp <= '8/9/2015 23:59:59.999'
and a.TSModule = 'docid QC'
and (tt.tsmodule = 'docid QC' or tt.TSModule is null)
and UserImagesProcessed <> 0 
group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
left join TS_Audit tsa
on T.BatchName = tsa.BatchName
where tsa.TSModule = 'DocID'
group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)
order by DocIDOper


--stage 2 
select distinct X.Batchname BatchName, X.QADate QADate, sum(X.TotalDocs) TotalDocs, sum(X.VerifiedDocs) VerifiedDocs, sum(X.Errors) Errors, x.Auditor Auditor
FROM
(select T.QADate, T.Batchname, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
FROM	
(select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
a.TotalDocs, count(a.batchname) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
from QA_Log a
left join TS_Audit ta
on a.BatchName = ta.BatchName and a.UserName = ta.UserName		
left outer join TSErrorTracking tt
on a.BatchName = tt.batchname	
where a.TimeStamp >= '8/2/2015' and a.TimeStamp <= '8/9/2015 23:59:59.999'
and a.TSModule = 'docid QC'
and (tt.tsmodule = 'docid QC' or tt.TSModule is null)
and UserImagesProcessed <> 0 
group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
left join TS_Audit tsa
on T.BatchName = tsa.BatchName
where tsa.TSModule = 'DocID'
group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)) X
where X.DocIDOper = 'breidelbach'
group by X.Batchname, X.QADate, X.Auditor
order by X.QADate


--stage 3
select tet.errortype, tet.errordatetime, tet.batchname, tet.OldDocType, tet.NewDocType, tet.OldDateStamp, tet.NewDateStamp, tet.username Auditor
FROM
(select T.QADate, T.Batchname, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
FROM	
(select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
a.TotalDocs, count(a.batchname) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
from QA_Log a
left join TS_Audit ta
on a.BatchName = ta.BatchName and a.UserName = ta.UserName		
left outer join TSErrorTracking tt
on a.BatchName = tt.batchname	
where a.TimeStamp >= '8/2/2015' and a.TimeStamp <= '8/9/2015 23:59:59.999'
and a.TSModule = 'docid QC'
and (tt.tsmodule = 'docid QC' or tt.TSModule is null)
and UserImagesProcessed <> 0 
group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
left join TS_Audit tsa
on T.BatchName = tsa.BatchName
where tsa.TSModule = 'DocID'
group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)) X
left join TSErrorTracking tet
on X.Batchname = tet.batchname
where X.DocIDOper = 'breidelbach'
and tet.errortype is not null
group by tet.errortype, tet.errordatetime, tet.batchname, tet.OldDocType, tet.NewDocType, tet.OldDateStamp, tet.NewDateStamp, tet.username



--breakdown by batch for Quality Report XLXS tab 1
select X.DocIDOper, count(distinct X.Batchname) #ofBatches, X.QADate QADate, sum(X.TotalDocs) TotalDocs, sum(X.VerifiedDocs) VerifiedDocs, sum(X.Errors) Errors,
Accuracy = 100 - (100 * cast(sum(X.Errors) as float)/ cast(sum(X.VerifiedDocs) as float)) 
FROM
(select T.QADate, T.Batchname, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
FROM	
(select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
a.TotalDocs, count(a.batchname) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
from QA_Log a
left join TS_Audit ta
on a.BatchName = ta.BatchName and a.UserName = ta.UserName		
left outer join TSErrorTracking tt
on a.BatchName = tt.batchname	
where a.TimeStamp >= '8/2/2015' and a.TimeStamp <= '8/9/2015 23:59:59.999'
and a.TSModule = 'docid QC'
and (tt.tsmodule = 'docid QC' or tt.TSModule is null)
and UserImagesProcessed <> 0 
group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
left join TS_Audit tsa
on T.BatchName = tsa.BatchName
where tsa.TSModule = 'DocID'
group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)) X
group by X.DocIDOper, X.QADate
order by X.DocIDOper, X.QADate



--breakdown by batch for Quality Report XLXS tab 2
select T.QADate, T.Batchname, tsa.UserName DocIDOper, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
FROM	
(select CONVERT(nvarchar, a.timestamp, 101) QADate, a.BatchName Batchname, a.UserName Auditor, 
a.TotalDocs, count(a.batchname) VerifiedDocs, ISNULL(count(distinct tt.id), 0) Errors
from QA_Log a
left join TS_Audit ta
on a.BatchName = ta.BatchName and a.UserName = ta.UserName		
left outer join TSErrorTracking tt
on a.BatchName = tt.batchname	
where a.TimeStamp >= '8/2/2015' and a.TimeStamp <= '8/9/2015 23:59:59.999'
and a.TSModule = 'docid QC'
and (tt.tsmodule = 'docid QC' or tt.TSModule is null)
and UserImagesProcessed <> 0 
group by CONVERT(nvarchar, a.timestamp, 101), a.BatchName, ta.username, a.UserName, a.TotalDocs) T
left join TS_Audit tsa
on T.BatchName = tsa.BatchName
where tsa.TSModule = 'DocID'
group by T.QADate, T.Batchname, tsa.UserName, T.Auditor, T.TotalDocs, T.VerifiedDocs, T.Errors
having tsa.username = (select top 1 UserName from TS_Audit where TSModule = 'DocID' and batchname = T.Batchname order by UserImagesProcessed desc)
order by DocIDOper




select errortype ErrorType, errordatetime, batchname, username, OldDocType, NewDocType, OldDateStamp, NewDateStamp
from TSErrorTracking where TSModule = 'docid qc'
and errordatetime >= '8/2/2015' and errordatetime <= '8/18/2015 23:59:59.999'
group by errortype, errordatetime, batchname, username, OldDocType, NewDocType, OldDateStamp, NewDateStamp



select tt.errortype ErrorType, tt.errordatetime, 
case
	WHEN errortype = 'DOCID-Incorrect Document Type' then (tt.OldDocType)
	WHEN errortype = 'DOCID-Incorrect Date Stamp' then (tt.OldDateStamp)
	WHEN errortype = 'DOCID-526 Miskeyed' then (tsc.OriginalValue)
END
as 'OldValue',
case
	WHEN errortype = 'DOCID-Incorrect Document Type' then (NewDocType)
	WHEN errortype = 'DOCID-Incorrect Date Stamp' then (NewDateStamp)
	WHEN errortype = 'DOCID-526 Miskeyed' then (tsc.NewValue)
END
as 'NewValue',
tt.batchname, tt.username Auditor
from TSErrorTracking tt
left join TSChangedDisabilities tsc
on tt.batchname = tsc.BatchName and tt.docid = tsc.DocID
where TSModule = 'docid qc'
and tt.errordatetime >= '1/2/2015' and tt.errordatetime <= '8/25/2015 23:59:59.999'
group by tt.errortype, tt.errordatetime, tt.batchname, tt.username, tt.OldDocType, tt.OldDateStamp, tt.NewDocType, tt.NewDateStamp, tsc.OriginalValue, tsc.NewValue
order by tt.errortype



select tt.errortype ErrorType, tt.errordatetime, 
case
	WHEN errortype = 'DOCID-Incorrect Document Type' then (tt.OldDocType)
	WHEN errortype = 'DOCID-Incorrect Date Stamp' then (tt.OldDateStamp)
	--WHEN errortype = 'DOCID-526 Miskeyed' then (tsc.OriginalValue)
END
as 'OldValue',
case
	WHEN errortype = 'DOCID-Incorrect Document Type' then (NewDocType)
	WHEN errortype = 'DOCID-Incorrect Date Stamp' then (NewDateStamp)
	--WHEN errortype = 'DOCID-526 Miskeyed' then (tsc.NewValue)
END
as 'NewValue',
tt.batchname, tt.username Auditor
from TSErrorTracking tt
--left join TSChangedDisabilities tsc
--on tt.batchname = tsc.BatchName and tt.docid = tsc.DocID
where TSModule = 'manual index'
and tt.errordatetime >= '8/2/2015' and tt.errordatetime <= '8/9/2015 23:59:59.999'
group by tt.errortype, tt.errordatetime, tt.batchname, tt.username, tt.OldDocType, tt.OldDateStamp, tt.NewDocType, tt.NewDateStamp
--, tsc.OriginalValue, tsc.NewValue

order by count(tt.errortype) desc






select * from TSChangedDisabilities where BatchName in (
'02143490310001',
'02151960001404',
'02152320001603',
'02150080405601',
'02150620302504',
'02150820403102',
'02151060301301',
'02143500301303',
'02150410301803',
'02151620402507',
'02151240303504',
'02152010401002',
'02152320001507',
'02152360401101',
'02143640402403',
'02150680405604',
'02151140404303',
'02151390000403',
'02151600301604',
'02151890400601',
'02150030202602',
'02150240401001',
'02150830401604',
'02150910403201',
'02152190400801',
'02143490302502',
'02150120000303',
'02150680405602',
'02150900001903',
'02151460001801',
'02151970000501',
'02143490305801',
'02150030200301',
'02150620304901',
'02150930407405',
'02152260302501',
'02152320001502',
'02150630003403',
'02151480406601',
'02151900003504',
'02152150000202',
'02143640402403',
'02151250403405',
'02151460002903',
'02151610000412',
'02152010403003',
'02151340407402',
'02143450205003',
'02150970410502',
'02151420005001',
'02152100000402',
'02152250001604',
'02152330002002',
'02150030202605',
'02151000002203',
'02152120300704',
'02150150008905',
'02151110303503',
'02151320301101',
'02152310003203')







select * from TSErrorTracking where batchname = '02152320403201'

select * from TSErrorTracking_modify where batchname = '02152320403201'