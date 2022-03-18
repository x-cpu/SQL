select * from document where ImageDateTime > '2016-11-23'

select * from document where ImageDateTime > '2016-11-01'

select * from docid.dbo.docid where DocType like '%4142%'

select * from docid.dbo.docid where DocType like '%0161%'

select * from docid.dbo.docid where DocType like '%verification%'

--update Document
--set docidDoctype = 'VA 21-4142a General Release for Medical Provider Information'
--where docidDoctype = 'VA 21-4142 Authorization for Release of Information' and ImageDateTime > '2016-11-22'







--update Document
--set docidDoctype = 'VA 21-0161a Income from Payer Form to Report Wages'
--where docidDoctype = 'Eligibility Verification Report' and ImageDateTime > '2016-11-22'




--update Document
--set docidDoctype = 'VA 21-0161a Income from Payer Form to Report Wages'
--where docidDoctype = 'Eligibility Verification Report' and ImageDateTime > '2016-11-23'


select ImageID, docidDoctype, sum(numpages) Images, ftpstime UploadDateTime, Comments UATVBMSResponse from document where ImageDateTime > '2016-11-21'
group by ImageID, docidDoctype, ftpstime, Comments  
order by ImageID



select ImageID, docidDoctype, sum(numpages) Images, ftpstime UploadDateTime, Comments PreProdVBMSResponse from document where ImageDateTime > '2016-11-22'
group by ImageID, docidDoctype, ftpstime, Comments  
order by ImageID



select ImageID, docidDoctype, sum(numpages) Images, ftpstime UploadDateTime, Comments PreProdVBMSResponse from document where pbatch = '02163270400101'
group by ImageID, docidDoctype, ftpstime, Comments  
order by ImageID


updated 2018-09-28
select ImageID, docidDoctype DocType, DCSID, sum(numpages) Images, ftpstime UploadDateTime, Comments PreProdVBMSResponse from document where pbatch = '02182270099901'
group by ImageID, docidDoctype, DCSID, ftpstime, Comments  
order by ImageID