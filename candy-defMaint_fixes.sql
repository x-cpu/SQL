use dva
select * from def_qa_log where init like '%jthomas'

use dva
select * from def_tserrortracking where init like '%jthomas'

update def_qa_log
set taskcode = '010163'
where syskey = '6572' and taskcode = '010302'


update def_tserrortracking
set taskcode = '010163'
where syskey = '7439'  and taskcode = '010302'

select * from FTPDetails


delete from def_qa_log where syskey = 12976
delete from def_TSErrorTracking where syskey = 14499


select * from pfpPayoutConfiguration 

update def_TSErrorTracking
set errors = '3'
where syskey = 14342




select * from document where ImageDateTime > '2014-07-29 0:0:0' and ftpstime is null and comments is not null