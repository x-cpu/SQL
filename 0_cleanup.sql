
--delete "0"
select * from TSErrorTracking where OldDocType = '0' and errortype = 'DOCID-Incorrect Document Type' and errordatetime > '2013-08-12 0:0:0'
select * from TSErrorTracking where OldDocType = '0' and errortype = 'DOCID-Incorrect Date Stamp' and errordatetime > '2013-08-12 0:0:0'

-delete from TSErrorTracking where OldDocType = '0' and errortype = 'DOCID-Incorrect Document Type' and errordatetime > '2013-08-12 0:0:0'
-delete from TSErrorTracking where OldDocType = '0' and errortype = 'DOCID-Incorrect Date Stamp' and errordatetime > '2013-08-12 0:0:0'

select * from TSErrorTracking where OldDocType = '' and errortype = 'DOCID-Incorrect Document Type' and errordatetime > '2013-08-12 0:0:0'
select * from TSErrorTracking where OldDocType = '' and errortype = 'DOCID-Incorrect Date Stamp' and errordatetime > '2013-08-12 0:0:0'




--delete _missing document types
select * from tserrortracking where NewDocType = '' and errortype = 'DOCID-Incorrect Date Stamp' and errordatetime > '2013-08-12 0:0:0'

--delete from tserrortracking where NewDocType = '' and errortype = 'DOCID-Incorrect Date Stamp' and errordatetime > '2013-08-12 0:0:0'


select * from tserrortracking where errordatetime > '2013-08-15 0:0:0' order by errordatetime

select * from qa_log where timestamp > '2013-08-15 0:0:0' order by timestamp desc