execute VA_QAErrorReportSummary_Types_Reviewed @fromdate = '2013-04-23 0:0:0' , @todate = '2013-04-28 23:59:59', @526Only = 0


select * from TSErrorTracking where errordatetime > '12/12/2012 0:0:1' and errordatetime < '12/11/2012 23:59:59'


select * from QA_Log where TimeStamp > '12/11/2012 0:0:1' and TimeStamp < '12/11/2012 23:59:59'



select * from TSErrorTracking where username = 'fbrown' and errordatetime between '2013-01-15 0:0:0' and '2013-01-15 23:59:59'
select * from TSErrorTracking where username = 'jswartz' and errordatetime between '2013-01-15 0:0:0' and '2013-01-15 23:59:59'

select * from locsemp where emp in 
(select distinct username  from tserrortracking where errordatetime > '1/7/2013 0:0:1')


select top 100 *   from customerdata   order by syskey desc
--we need to use this for delete
select * from  tserrortracking where errordatetime > '3/19/2013 0:0:1' and errordatetime  < '3/19/2013 23:59:59' and errortype = 'docid-incorrect document type' and username = 'areeves'
--delete from  tserrortracking where errordatetime > '3/15/2013 0:0:1' and errordatetime  < '3/21/2013 23:59:59' and errortype = 'docid-incorrect date stamp' and NewDateStamp is null
--delete from  tserrortracking where errordatetime > '3/15/2013 0:0:1' and errordatetime  < '3/21/2013 23:59:59' and errortype = 'docid-incorrect document type' and OldDocType = NewDocType
--delete from  tserrortracking where errordatetime > '3/15/2013 0:0:1' and errordatetime  < '3/21/2013 23:59:59' and errortype = 'docid-incorrect document type' and olddoctype = 'VA_DCSIDControlSheet'
select distinct username  from  tserrortracking where errordatetime > '3/15/2013 0:0:1' and errordatetime  < '3/21/2013 23:59:59' and errortype = 'docid-incorrect document type'

---delete step 1
delete from TSErrorTracking where errordatetime between '2013-01-22 0:0:0' and '2013-01-23 23:59:59' and username in (
select distinct emp from locsemp)
order by errordatetime desc

---delete step 2
delete from  tserrortracking where errordatetime > '3/22/2013 0:0:1' and errordatetime  < '3/29/2013 23:59:59' and errortype = 'docid-incorrect date stamp' and bestcopy =1

--delete step3
delete from  tserrortracking where errordatetime > '1/22/2013 0:0:1' and errordatetime  < '1/23/2013 23:59:59' and errortype = 'docid-incorrect document type' and OldDocType = ''

--delete step4
delete from  tserrortracking where errordatetime > '1/22/2013 0:0:1' and errordatetime  < '1/23/2013 23:59:59' and errortype = 'docid-incorrect document type' and OldDocType = '' and NewDocType = ''

--delete step5
delete from  tserrortracking where errordatetime > '1/22/2013 0:0:1' and errordatetime  < '1/23/2013 23:59:59' and errortype = 'docid-incorrect document type' and NewDocType = ''


--delete from TSErrorTracking where id = '3261'

select * from document where pbatch = '02123550020401'


select * from tserrortracking where batchname = '02130710203201'
--delete from  QA_Log where batchname = '02130710203201' and TSModule = 'Manual Index'


select distinct username from  tserrortracking where errordatetime > '4/23/2013 0:0:1' and errordatetime  < '4/28/2013 23:59:59' 
select * from  tserrortracking where errordatetime > '4/09/2013 0:0:1' and errordatetime  < '4/09/2013 23:59:59' 

delete from  tserrortracking where errordatetime > '4/23/2013 0:0:1' and errordatetime  < '4/28/2013 23:59:59' and username in (
'ASmith',
'BHall2',
'Cbenning',
'cforney',
'FBrown',
'SMccain')

select distinct rmn  
from Document where ftpstime is null 
--order by ImageDateTime 

select * from customerdata
where rmn = '304VB0912120002A'


select *  from         TSErrorTracking
WHERE     (errordatetime BETWEEN '2013-01-16 0:0:0' AND '2013-01-21 23:59:59') 
order by batchname, docid


select * from qa_log where BatchName = '02123530037501'


delete from TSErrorTracking where id in (
'3216',
'3217',
'3219',
'3220',
'3221',
'3223',
'3224')



select count(*) 
from document
where pbatch = '02123520028101'


select *
from TSErrorTracking
where batchname = '02123520028101'

select * from customerdata where rmn = '316vb1220126779d' or rmn = '376vb1217120388a'

select * from CustomerDATA where Shovboxno = '1457'


select * from TSErrorTracking where OldDateStamp is not null