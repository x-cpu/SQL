select batchname, stime CSRAUploadTime, AckTime DOMAAckTime from domaFTPDetails  where batchname in (
'20170816084927320',
'20170816091903042',
'20170816091904337',
'20170816091910530',
'20170816094904146',
'20170816094911042',
'20170816100404308',
'20170816100417663',
'20170816100423934',
'20170816101904579',
'20170816101909291',
'20170816103404897')

select * from pmrFTPDetails where batchname in (
'20170816084927320.zip',
'20170816091903042.zip',
'20170816091904337.zip',
'20170816091910530.zip',
'20170816094904146.zip',
'20170816094911042.zip',
'20170816100404308.zip',
'20170816100417663.zip',
'20170816100423934.zip',
'20170816101904579.zip',
'20170816101909291.zip',
'20170816103404897.zip')


--from pmr
select * from pmrFTPDetails where batchname = '20170816230027877.zip'
