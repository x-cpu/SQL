select batchname, ImagesProcessed,  from TS_Audit where BatchName in (
'02141910009201',
'02141900008804')

select * from manifestDCS where pbatch like '03%' order by rmn desc

select * from ftpdetails where batchname like '05%'

delete from manifestDCS where rmn = '314VB0603143320O'

select distinct dcsid from document where pbatch = '05142020000002'

select * from document where dcsid = 'H7N8GUEMFYJ070'

select * from exceptions where dcsid = 'H7N8GUEMFYJ070'

--RMN uploaded to VBMS from dk outlier
select * from dcslookup where exists (
select * from document where dcslookup.rmn = document.rmn and ftpstime is not null)

--DCSID upload to VBMS from dk outlier
select * from dcslookup where exists (
select * from document where dcslookup.dcsid = document.dcsID and ftpstime is not null)

--DCSID from dk outlier exists in exceptions table
select * from dcslookup where exists (
select * from exceptions where dcslookup.dcsid = exceptions.dcsid)

--RMN from dk outlier exists in exceptions table
select * from dcslookup where exists (
select * from exceptions where dcslookup.rmn = exceptions.rmn)

--RMN exists in yesterday WIP
select * from dcslookup where exists (
select * from wip20140721 where dcslookup.rmn = wip20140721.rmn)






select count(*) from dcslookup
