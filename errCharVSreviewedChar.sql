-- for qa_log ..other than 02 batch...we wanted to use reviewedcount

select T.QADate
--, sum(T.Docs)
, sum(T.Char) ReviewedChar
FROM
(select distinct convert(date, q.timestamp, 101) QADate,
--, count(distinct q.syskey) Docs,
CASE WHEN batchname not like '02%' then ISNULL(sum(q.reviewedChar), 0)
	 WHEN batchname like '02%' then  ISNULL(sum(q.CharCount526), 0) 
	 END as Char
from qa_log q
where q.tsmodule = 'docid qc'
and q.TimeStamp >= '2016-03-17 0:0:0'
group by convert(date, q.timestamp, 101), batchname) T
group by T.QADate


---master
select T.QADate, T.ReviewedChar, sum(T.ErrChar) ErrChar, 
sum(T.[Missing 526 Disability]) 'Missing 526 Disability', 
sum(T.[526 Miskeyed]) '526 Miskeyed', 
sum(T.[Veterans Name Incorrect]) 'Veterans Name Incorrect',
sum(T.[Veterans Claim Number Incorrect]) 'Veterans Claim Number Incorrect'
FROM
(select X.QADate, sum(X.Char) ReviewedChar, ISNULL(Y.ErrChar, 0) ErrChar, 
ISNULL(Y.[DOCID-Missing 526 Disability], 0) 'Missing 526 Disability', 
ISNULL(Y.[DOCID-526 Miskeyed], 0) '526 Miskeyed',
ISNULL(Y.[DOCID-Veteran's Name Incorrect], 0) 'Veterans Name Incorrect',
ISNULL(Y.[DOCID-Veteran's Claim Number Incorrect], 0) 'Veterans Claim Number Incorrect'
FROM
(select distinct convert(date, q.timestamp, 101) QADate, ISNULL(sum(q.CharCount526), 0) Char
from qa_log q
where q.tsmodule = 'docid qc'
and q.TimeStamp >= '2016-03-21 0:0:0'
and q.TimeStamp <= '2016-03-27 23:59:59.999'
group by convert(date, q.timestamp, 101), batchname) X
left join (select convert(date, errordatetime, 101) date, sum(errchar) errchar,
CASE WHEN errortype = 'DOCID-526 Miskeyed' then sum(errchar) end [DOCID-526 Miskeyed], 
CASE WHEN errortype like 'DOCID-Veteran%s Name Incorrect' then sum(errchar) end [DOCID-Veteran's Name Incorrect], 
CASE WHEN errortype like 'DOCID-Veteran%s Claim Number Incorrect' then sum(errchar) end [DOCID-Veteran's Claim Number Incorrect], 
CASE WHEN errortype = 'DOCID-Missing 526 Disability' then sum(errchar) end [DOCID-Missing 526 Disability] 
from TSErrorTracking
where TSModule = 'docid qc' 
--and errordatetime >= '2016-03-17 0:0:0.000'
group by convert(date, errordatetime, 101), errchar, errortype) Y on x.QADate = Y.date
group by X.QADate, Y.ErrChar, Y.[DOCID-Missing 526 Disability], Y.[DOCID-526 Miskeyed], Y.[DOCID-Veteran's Name Incorrect], Y.[DOCID-Veteran's Claim Number Incorrect]) T
group by T.QADate, T.ReviewedChar
order by T.QADate




select distinct errortype from TSErrorTracking where errortype like 'docid%'

--DOCID-526 Miskeyed
--DOCID-Veteran's Name Incorrect
--DOCID-Incorrect Date Stamp
--DOCID-Best Copy not Selected
--DOCID-Veteran's Claim Number Incorrect
--DOCID-Incorrect Document Type
--DOCID-Missing 526 Disability

select T.QADate
--, sum(T.Docs)
, sum(T.Char) ReviewedChar
FROM
(select distinct convert(date, q.timestamp, 101) QADate,
--, count(distinct q.syskey) Docs,
CASE WHEN batchname not like '02%' then ISNULL(sum(q.reviewedChar), 0)
	 WHEN batchname like '02%' then  ISNULL(sum(q.CharCount526), 0) 
	 END as Char
from qa_log q
where q.tsmodule = 'docid qc'
and q.TimeStamp >= '2016-03-17 0:0:0'
group by convert(date, q.timestamp, 101), batchname) T
group by T.QADate


select convert(date, errordatetime, 101) Date, sum (errchar) ErrChar
from TSErrorTracking where errordatetime >= '2016-03-17 0:0:0'
and TSModule = 'docid qc'
group by convert(date, errordatetime, 101)




select X.QADate, sum(X.Char) ReviewedChar, ISNULL(Y.ErrChar, 0) ErrChar
FROM
(select distinct convert(date, q.timestamp, 101) QADate,
CASE WHEN batchname not like '02%' then ISNULL(sum(q.reviewedChar), 0)
	 WHEN batchname like '02%' then  ISNULL(sum(q.CharCount526), 0) 
	 END as Char
from qa_log q
where q.tsmodule = 'docid qc'
and q.TimeStamp >= '2016-03-17 0:0:0'
group by convert(date, q.timestamp, 101), batchname) X
left join (select convert(date, errordatetime, 101) date, sum(errchar) errchar from TSErrorTracking 
where TSModule = 'docid qc' 
and errordatetime >= '2016-03-17 0:0:0.000'
group by convert(date, errordatetime, 101)) Y on x.QADate = Y.date
group by X.QADate, Y.errchar
order by X.QADate