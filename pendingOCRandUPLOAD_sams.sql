use dva
select distinct pbatch, max(imagedatetime) from document where imagedatetime > '1/1/2013' and imagedatetime < '6/9/2014' and ocrexporttime is null  and ftpstime is null 
and pbatch in (select kbatch from stats) group by pbatch order by max(imagedatetime)



use dva
select sum(numpages) from document where imagedatetime > '1/1/2013' and imagedatetime < '6/9/2014' and ocrexporttime is null  and ftpstime is null 
and pbatch in (select kbatch from stats) group by pbatch order by max(imagedatetime)


select sum(numpages) from document where imagedatetime > '1/1/2013' and imagedatetime < '6/9/2014' and ocrexporttime is null and pbatch not like '03%' and ftpstime is null 
and pbatch in (select kbatch from stats) 

select * from document where pbatch = '02133120003805'

use TurboscanNG1
select * from batches where batchname = '02141530003502'

use dva
select distinct dcsid from Document where pbatch = '03123390620601' and ftpstime is null