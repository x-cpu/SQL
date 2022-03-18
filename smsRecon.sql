--smsRecon daily only for todays date
select distinct s.dcsid, s.veteranID, s.xmlFilename, s.batchname, s.errTime, d.packageError, d.documentError
from smsDCSMapping s
left join dmhsCMPxmldownload d
on SUBSTRING(s.xmlFilename, 0, 16) = SUBSTRING(d.XMLfilename, 0, 16)
where (s.insertdate >= convert(date, getdate(), 101)  or s.errTime >= convert(date, getdate(), 101))
and (d.packageError <> '' or d.documentError <> '')
and errTime is not null


--smsRecon how many batches
select count(distinct s.batchname)
from smsDCSMapping s
--left join dmhsCMPxmldownload d
--on SUBSTRING(s.xmlFilename, 0, 16) = SUBSTRING(d.XMLfilename, 0, 16)
where (s.insertdate >= convert(date, getdate(), 101)  or s.errTime >= convert(date, getdate(), 101))
--and (d.packageError <> '' or d.documentError <> '')
and errTime is not null


select * from docid.dbo.docid where docid = '452' 


select * from document where docidDoctype = 'Bank/Financial Statement' and ImageDateTime > '2017-03-22'


select * from smsDCSMapping where dcsid = 'DCSID041707900076010060'

select * from Document where dcsid = 'DCSID041707900076010060'


--smsRecon daily only for ANY date
select distinct s.dcsid, s.veteranID, s.xmlFilename, s.batchname, s.errTime, d.packageError, d.documentError
from smsDCSMapping s
left join dmhsCMPxmldownload d
on SUBSTRING(s.xmlFilename, 0, 16) = SUBSTRING(d.XMLfilename, 0, 16)
where (s.insertdate >= '2017-03-31' or s.errTime >= '2017-03-31')
and (d.packageError <> '' or d.documentError <> '')
and errTime is not null


select min(len(filenumber)), ImageID, ftpstime, pbatch from document where ftpstime > '2017-01-01'
group by ImageID, ftpstime, pbatch
order by min(len(filenumber))



select * from CustomerDATA where dcsid = 'DCSID021634013037110010'

--update CustomerDATA
--set Lastname = 'GREGORY'
--where dcsid = 'DCSID021634013037110010'



select * from smsDCSMapping where dcsid in (
'DCSID021629911135010048',
'DCSID021629911135010063',
'DCSID021629911135010068',
'DCSID021629911135010094',
'DCSID021629911135070052')