select distinct substring(documentError, 23, 6) from dmhsCMPxmldownload where type = '.err'
and documentError like 'Invalid DocumentDocID: %' and substring(documentError, 23, 6) = '00385'

select distinct substring(documentError, 23, 6) from dmhsCMPxmldownload where type = '.err'
and documentError like 'Invalid DocumentDocID: %'


select * from docid.dbo.Docid_StopFTP where docid in (
 '00128',
 '00385',
 '00426',
 '00452',
 '00457')


 select * from docid where docid = '385'