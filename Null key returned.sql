select distinct pbatch , max(imagedatetime) from document where comments like 'Detail: Null key returned for cache operation%'
and imagedatetime > '1/24/2014 0:0:0'  
and pbatch not in (select distinct batchname from ftpdetails )
group by pbatch
order by max(imagedatetime)



select distinct pbatch  from document where comments like 'Detail: Null key returned for cache operation%' and not exists (
select distinct batchname from FTPDetails where document.PBatch = FTPDetails.batchname)



select * from document where pbatch in (
'03142250613501',
'03142300611901',
'03142300609301',
'03142300627101',
'03142310600901',
'03142280632701')

select * from docid.dbo.nullkeyftperror where exists (select * from document where docid.dbo.nullkeyftperror.imageid = document.ImageID and ftpstime is not null)

select * from document where pbatch = '03143210618801' and FileNumber = '7545701'
03143210618801	7545701


select * from document where ftpstime is not null and ftpstime > '2014-11-20 0:0:0' and exists (select * from docid.dbo.nullkeyftperror where document.ImageID = docid.dbo.nullkeyftperror.imageid)