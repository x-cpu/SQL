select distinct c.RMN, d.dcsid DCSID, d.filenumber FileNumber, cd.LastName, cd.FirstName,
--c.trackingno TrackingNo, 
--d.imageid ImageID, d.filenumber FileNumber, d.dociddoctype DocType, 
max(d.ftpstime) UploadDateTime
from document d 
left join customerCheckIn c
on d.RMN = c.RMN
left join customerdata	cd
on d.dcsID = cd.dcsID
where c.claimtype = 'ompf'
and d.PBatch like '02%'
and c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
--and d.ftpstime is not null
--and d.ftpstime < '2020-10-17'
and exists (select * from stats where d.pbatch = kbatch)
group by c.RMN, d.dcsID, d.FileNumber, cd.Lastname, cd.Firstname
order by max(d.ftpstime) 