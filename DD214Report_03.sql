--FOR DATE AFTER DATETIME
--LATEST AND GREATEST FOR TOM REDMOND TO KATRINA WITH VA
--USES FILENUMBER, PBATCH, and DCSID for uniqueness
select distinct d.imageid, d.pbatch, d.filenumber, c.firstname, c.lastname, d.received_date DOR,
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts,
ISNULL(sum(numpages), 0) Images, 
CASE
When d.comments = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When d.comments = 'Skipped' then 'Skipped'
When d.comments like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse, d.ftpstime UploadDateTime,
CASE
When d.ftpstime is null then max(f.insertdate)
Else null
END FTUDateTime
from document d 
left join ftperror f
on d.ImageID = f.imageid
left join CustomerDATA c
--on d.dcsID = c.dcsID
on d.FileNumber = c.FileNumber and d.PBatch = c.Pbatch	and d.dcsID = c.dcsID
where d.pbatch like '031629911135%' and d.RMN  like 'rmn2016%' 
and (d.Comments is not null or d.ftpstime is not null)
group by d.ImageID, d.PBatch, d.Comments,
--substring(d.comments, 0, 20), 
d.ftpstime, d.filenumber, c.firstname, c.lastname, d.received_date
order by d.ImageID


select distinct pbatch from document where pbatch like '031629911135%'

select * from docid.dbo.ftperror_dd214


select * from document where imageid = 'CSRA_CMP_163022902P001007221'