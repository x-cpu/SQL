select YEAR(imagedatetime) Year, MONTH(imagedatetime) Month, docidDoctype DocumentType, dd.docid DocID, count(*) Count 
from document 
left join docid.dbo.docid dd
on document.docidDoctype = dd.DocType
where docidDoctype in (
'VA 21-526EZ, Fully Developed Claim (Compensation)',
'VA 21-22 Appointment of Veterans Serv. Org. as Claimant Rep',
'Power of Attorney (incl. VA 21-22, VA 22a)')
and ImageDateTime >= '2018-01-01'
and pbatch like '04%'
and exists (Select * from stats where document.pbatch = kbatch)
group by YEAR(imagedatetime), MONTH(imagedatetime), docidDoctype, dd.DocID 
order by Year, Month, DocumentType desc