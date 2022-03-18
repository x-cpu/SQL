--ADD DD214FTU SMSFTUDateTime
--NEW AND IMPROVED TO RESOLVE IMAGE and FileCHARCOUNTS
--FOR DATE AFTER DATETIME
--USES FILENUMBER, PBATCH, and DCSID for uniqueness
select X.ImageID, x.PBatch BatchName, x.FileNumber, x.Firstname, x.Lastname, x.DOR,
ISNULL(sum((len(x.DOR) - (len(x.DOR) - len(replace(x.DOR, '/', '')))) + len(x.FileNumber) + len(X.Lastname) + len(X.Firstname) + len(X.MiddleInitial)), 0) FileCharCounts, 
ISNULL(sum(dd.numpages), 0) Images, x.VBMSResponse, x.UploadDateTime, 
--x.FTUDateTime, 
CASE
When s.ackTime is not null then null
Else x.FTUDateTime
End FTUDateTime,
s.ackTime SMSFTUDateTime
--into dd214rep_tempX
FROM
(select distinct d.imageid, d.pbatch, d.filenumber, c.firstname, c.lastname, c.MiddleInitial, d.received_date DOR,
CASE
When d.comments = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0013%' then 'CMSERR0013'
--When d.comments = 'Skipped' then 'Skipped'
When d.comments = 'Skipped' then 'CMSERR0001'
When d.comments like 'FileNumber is inval%' then 'FileNumber is invalid'
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
where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  = 'rmndd214' 
and (d.Comments is not null or d.ftpstime is not null)
group by d.ImageID, d.PBatch, d.Comments,
--substring(d.comments, 0, 20), 
d.ftpstime, d.filenumber, c.firstname, c.lastname, c.MiddleInitial, d.received_date, d.dcsID) X
left join document dd
on x.ImageID = dd.ImageID
left join DD214FTU ftu
on dd.dcsID = ftu.DCSID
left join smsDCSMapping s
on ftu.DCSID = s.dcsid
group by X.ImageID, x.PBatch, x.FileNumber, x.Firstname, x.Lastname, x.DOR, x.VBMSResponse, x.UploadDateTime, x.FTUDateTime, s.ackTime
order by x.ImageID










--old way below
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------




--NEW AND IMPROVED TO RESOLVE IMAGE and FileCHARCOUNTS
--FOR DATE AFTER DATETIME
--LATEST AND GREATEST FOR TOM REDMOND TO KATRINA WITH VA
--USES FILENUMBER, PBATCH, and DCSID for uniqueness
select X.ImageID, x.PBatch BatchName, x.FileNumber, x.Firstname, x.Lastname, x.DOR,
ISNULL(sum((len(x.DOR) - (len(x.DOR) - len(replace(x.DOR, '/', '')))) + len(x.FileNumber) + len(X.Lastname) + len(X.Firstname) + len(X.MiddleInitial)), 0) FileCharCounts, 
ISNULL(sum(dd.numpages), 0) Images, x.VBMSResponse, x.UploadDateTime, x.FTUDateTime
FROM
(select distinct d.imageid, d.pbatch, d.filenumber, c.firstname, c.lastname, c.MiddleInitial, d.received_date DOR,
--ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts,
--ISNULL(sum(d.NumPages), 0) Images, 
CASE
When d.comments = 'success' then 'success'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0001%' then 'CMSERR0001'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0027%' then 'CMSERR0027'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0028%' then 'CMSERR0028'
When substring(d.comments, 0, 20) like 'Detail: CMSERR0013%' then 'CMSERR0013'
--When d.comments = 'Skipped' then 'Skipped'
When d.comments = 'Skipped' then 'CMSERR0001'
When d.comments like 'FileNumber is inval%' then 'FileNumber is invalid'
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
where d.pbatch like '02%' and ImageDateTime >= '2016-12-01' and d.RMN  = 'rmndd214' 
and (d.Comments is not null or d.ftpstime is not null)
group by d.ImageID, d.PBatch, d.Comments,
--substring(d.comments, 0, 20), 
d.ftpstime, d.filenumber, c.firstname, c.lastname, c.MiddleInitial, d.received_date) X
left join document dd
on x.ImageID = dd.ImageID
group by X.ImageID, x.PBatch, x.FileNumber, x.Firstname, x.Lastname, x.DOR, x.VBMSResponse, x.UploadDateTime, x.FTUDateTime
order by x.ImageID
