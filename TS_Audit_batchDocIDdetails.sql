
select batchname, username, TSModule, totalimages, ImagesProcessed, ImagesRejected, UserImagesProcessed, TimeStamp from TS_Audit where batchname in (
'02143200402104',
'02143210400105',
'02143210400501') and TSModule not in ('Prep', '4', 'Enhance', 'AutoIndex') and userimagesprocessed <> '0' order by batchname, TimeStamp

select * from Stats_IBML where kbatch = '02142370006705'

--last used on 2014-12-08 --appears to be best one for now
select batchname, username, TSModule, totalimages, ImagesProcessed, ImagesRejected, UserImagesProcessed, TimeStamp from TS_Audit where batchname in (
'02143200402104',
'02143210400105',
'02143210400501') and username <> '998'


select batchname, username, TSModule, totalimages, ImagesProcessed, ImagesRejected, UserImagesProcessed, TimeStamp from TS_Audit where batchname in (
'03150490621001') 
and username <> '998'

select batchname, username, TSModule, totalimages, ImagesProcessed, ImagesRejected, UserImagesProcessed, TimeStamp from TS_Audit where batchname in (
'02150060003703') 
and username <> '998'
 

select batchname, username, TSModule, totalimages, ImagesProcessed, ImagesRejected, UserImagesProcessed, TimeStamp from TS_Audit where batchname in (
'02142370006705') and TSModule not in ('4') and userimagesprocessed <> '0' order by batchname, TimeStamp


select batchname, username, TSModule, totalimages, ImagesProcessed, ImagesRejected, UserImagesProcessed, TimeStamp from TS_Audit where batchname in (
'03150320605501',
'03150480626001')
 and username <> '998' order by BatchName


select * from cmprecon where pBatch = '03141540605601'

select * from FTPDetails where batchname = '03143470615001'