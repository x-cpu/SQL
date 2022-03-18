select distinct c.RMN, 
--c.trackingno TrackingNo, 
d.imageid ImageID, d.filenumber FileNumber, d.dociddoctype DocType, d.ftpstime UploadDateTime
from document d 
left join customerCheckIn c
on d.RMN = c.RMN
where c.claimtype = 'ompf'
and d.PBatch like '02%'
and c.trackingno is not null
and c.trackingno <> ''
and c.trackingno <> '1234DUMMY1234'
and d.ftpstime is not null
and d.ftpstime < '2020-10-05'
group by c.RMN, c.trackingno, d.ImageID, d.FileNumber, d.docidDoctype, d.ftpstime
order by d.ftpstime desc