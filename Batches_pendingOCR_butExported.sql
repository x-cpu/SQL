select distinct pbatch from document where imagedatetime > '1/1/2013' and imagedatetime < '4/1/2014' and ocrexporttime is null  and ftpstime is null and comments is null



select * from document where imagedatetime > '1/1/2013' and imagedatetime < '4/1/2014' and ocrexporttime is null  and ftpstime is null


select * from document where dcsID = 'HKWWDDEHQSCMTE' and ftpstime is not null


select distinct pbatch, sum(numpages) #ofIMG, max(convert(date, ImageDateTime, 101)) ExportDate from document where ftpstime is not null and dcsID in (
select distinct dcsid from document where imagedatetime > '1/1/2013' and imagedatetime < '4/1/2014' and ocrexporttime is null  and ftpstime is null)
group by pbatch 
order by ExportDate, #ofIMG 



select distinct dcsid from document where imagedatetime > '1/1/2013' and imagedatetime < '4/1/2014' and ocrexporttime is null  and ftpstime is null
in from TSErrorTracking where TSModule = 'DocID QC'

use turboscanng1
select 


select * from manifestdcs where rmn in (
'314VB0830138268O',
'314VB0802135229O',
'314VB0809136008O')




