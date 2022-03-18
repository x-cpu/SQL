--LATEST AND GREATEST FOR TOM REDMOND TO KATRINA WITH VA
select distinct d.imageid, d.pbatch, d.filenumber, c.firstname, c.lastname, d.received_date DOR,
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts,
ISNULL(sum(numpages), 0) Images, 
CASE
When substring(d.comments, 0, 20) = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(d.comments, 0, 20) = 'Skipped' then 'Skipped'
When substring(d.comments, 0, 20) like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse, d.ftpstime UploadDateTime,
CASE
When d.ftpstime is null then max(f.insertdate)
Else null
END FTUDateTime
from document d 
left join ftperror f
on d.ImageID = f.imageid
left join CustomerDATA c
on d.dcsID = c.dcsID
where d.pbatch like '031629911135%'
group by d.ImageID, d.PBatch, substring(d.comments, 0, 20), d.ftpstime, d.filenumber, c.firstname, c.lastname, d.received_date
order by d.ImageID

--FOR DATE AFTER DATETIME
--LATEST AND GREATEST FOR TOM REDMOND TO KATRINA WITH VA
select distinct d.imageid, d.pbatch, d.filenumber, c.firstname, c.lastname, d.received_date DOR,
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts,
ISNULL(sum(numpages), 0) Images, 
CASE
When substring(d.comments, 0, 20) = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(d.comments, 0, 20) = 'Skipped' then 'Skipped'
When substring(d.comments, 0, 20) like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse, d.ftpstime UploadDateTime,
CASE
When d.ftpstime is null then max(f.insertdate)
Else null
END FTUDateTime
from document d 
left join ftperror f
on d.ImageID = f.imageid
left join CustomerDATA c
on d.dcsID = c.dcsID
where d.pbatch like '0216%' and ImageDateTime >= '2016-12-02' and d.RMN  = 'rmndd214' and (d.Comments is not null or d.ftpstime is not null)
group by d.ImageID, d.PBatch, substring(d.comments, 0, 20), d.ftpstime, d.filenumber, c.firstname, c.lastname, d.received_date
order by d.ImageID

select distinct kbatch from stats where kbatch like '031629911135%'

select sum(numpages) from document where PBatch like '031629911135%' and ftpstime is not null

select distinct dociddoctype, pbatch from Document where pbatch like '031629911135%'
order by pbatch

select distinct dociddoctype from Document where pbatch like '03162991113511'

select * from document where pbatch = '03162991113503' and docidDoctype = 'Third Party Correspondence'
select * from document where pbatch = '03162991113512' and docidDoctype = 'Correspondence'
select * from document where pbatch = '03162991113512' and docidDoctype = 'VA 70-7216a Request for and/or Notice of Transfer of Veterans Records / COVERS'
select * from document where pbatch = '03162991113516' and docidDoctype = 'VA Memo'
select * from document where pbatch = '03162991113502' and docidDoctype = 'VA Memo'



update document
set docidDoctype = 'Certificate of Release or Discharge From Active Duty (e.g. DD 214, NOAA 56-16, PHS 1867)'
where docidDoctype = 'VA Memo' and pbatch = '03162991113524'


--2641
select imageid, pbatch, comments VBMSResponse, ftpstime, dcsID from document where pbatch like '031629911135%' 
and comments = 'skipped'



--2641
select imageid, pbatch, comments VBMSResponse, ftpstime, dcsID from document where pbatch like '031629911135%' 
and comments = 'skipped'


select imageid, pbatch, 
CASE
When substring(comments, 0, 20) = 'success' then 'success'
When substring(comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(comments, 0, 20) = 'Skipped' then 'Skipped'
When substring(comments, 0, 20) like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse, ftpstime UploadDateTime
from document where pbatch like '031629911135%'


select distinct d.imageid, d.pbatch, 
CASE
When substring(d.comments, 0, 20) = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(d.comments, 0, 20) = 'Skipped' then 'Skipped'
When substring(d.comments, 0, 20) like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse, d.ftpstime UploadDateTime,
CASE
When d.ftpstime is null then max(f.insertdate)
Else null
END FTUDateTime
from document d 
left join ftperror f
on d.ImageID = f.imageid
where d.pbatch like '031629911135%'
group by d.ImageID, d.PBatch, substring(d.comments, 0, 20), d.ftpstime






select * from document where imageid = 'CSRA_CMP_163022902P001008885'

select T.ImageID, T.PBatch, T.FileNumber, T.VBMSResponse
FROM
(select imageid, pbatch, filenumber, 
CASE
When substring(comments, 0, 20) = 'success' then 'success'
When substring(comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(comments, 0, 20) like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse
from document where pbatch like '031629911135%')T
where T.VBMSResponse <> 'success'
order by VBMSResponse desc



select * from document where ImageID = 'CSRA_CMP_163022902P001008626'



--LATEST AND GREATEST FOR TOM REDMOND TO KATRINA WITH VA
select distinct d.imageid, d.pbatch, d.filenumber, c.firstname, c.lastname, d.received_date DOR,
CASE
When substring(d.comments, 0, 20) = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(d.comments, 0, 20) = 'Skipped' then 'Skipped'
When substring(d.comments, 0, 20) like 'FileNumber is inval' then 'FileNumber is invalid'
End VBMSResponse, d.ftpstime UploadDateTime,
CASE
When d.ftpstime is null then max(f.insertdate)
Else null
END FTUDateTime
from document d 
left join ftperror f
on d.ImageID = f.imageid
left join CustomerDATA c
on d.dcsID = c.dcsID
where d.pbatch like '031629911135%'
group by d.ImageID, d.PBatch, substring(d.comments, 0, 20), d.ftpstime, d.filenumber, c.firstname, c.lastname, d.received_date
