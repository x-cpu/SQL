select distinct T.RMN, T.DCSID, T.Batchname, T.UploadDateTime, T.ImageID into xDCSScanInComplete20200812x
FROM
(select distinct x.RMN, x.DCSID, d.PBatch Batchname, max(d.ftpstime) UploadDateTime, d.ImageID
from xDCSScanInComplete20200812 x
left join document d
on x.dcsid = d.dcsid and x.rmn = d.RMN
group by x.RMN, x.DCSID, d.PBatch, d.ImageID) T
left join document d
on T.DCSID = d.dcsID 
group by T.RMN, T.DCSID, T.Batchname, T.UploadDateTime, T.ImageID
having T.UploadDateTime = max(d.ftpstime)
order by T.Batchname, T.ImageID


select imageID, Batchname, dcsid from xDCSScanInComplete20200812x
where batchname like '02%'

select d.ImageID, d.dcsid, d.pbatch BatchName, d.ftpstime UploadDateTime 
from xDCSScanInComplete20200812x x
left join document d 
on x.ImageID = d.ImageID
and pbatch like '01%'
where d.ftpstime is not null

select * from document where imageid = 'CSRA_190363102P001047780'