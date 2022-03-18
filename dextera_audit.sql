select distinct d.imageid, d.pbatch BatchName, max(f.insertdate) LastUploadAttempt, min(dr.insertdate) OriginalReceivedDate, substring(d.comments, 1, 20) ErrorComments 
                        from domarecon dr
                        left join document d
                        on dr.ImageID = d.ImageID
                        left join FTPError f
                        on d.ImageID = f.imageid
                        where d.ftpstime is null
                        and d.ImageID is not null
                        group by d.imageid, d.pbatch, d.comments
                        order by max(f.insertdate)




select distinct d.imageid, d.pbatch BatchName, max(f.insertdate) LastUploadAttempt, min(f.insertdate) OriginalUploadErrorDate, substring(d.comments, 1, 20) ErrorComments 
                        --from domarecon dr
                        from document d
                        --on dr.ImageID = d.ImageID
                        left join FTPError f
                        on d.ImageID = f.imageid
                        where d.ftpstime is null
                        and d.ImageID is not null
                        group by d.imageid, d.pbatch, d.comments
                        order by max(f.insertdate)




select distinct d.ImageID, d.dcsID, MAX(f.insertdate) LastUploadAttempt, min(f.insertdate) OriginalUploadErrorDate, count(f.ImageID) #ofAttempts, substring(d.comments, 1, 20) ErrorComments  
from document d
left join FTPError f
on d.ImageID = f.imageid
where d.Comments is not null and d.ftpstime is null
and pbatch not like '11%' and f.insertdate is not null
group by d.ImageID, d.dcsID, d.Comments
order by d.dcsID, d.ImageID


select distinct d.dcsID, MAX(f.insertdate) LastUploadAttempt, min(f.insertdate) OriginalUploadErrorDate, count(f.ImageID) #ofAttempts, substring(d.comments, 1, 20) ErrorComments  
from document d
left join FTPError f
on d.ImageID = f.imageid
where d.Comments is not null and d.ftpstime is null
and pbatch not like '11%' and f.insertdate is not null 
group by d.dcsID, d.Comments
order by d.dcsID, ErrorComments




select distinct d.dcsID, MAX(f.insertdate) LastUploadAttempt, min(f.insertdate) OriginalUploadErrorDate, count(f.ImageID) #ofAttempts 
from document d
left join FTPError f
on d.ImageID = f.imageid
where d.Comments is not null and d.ftpstime is null
and pbatch not like '11%' and f.insertdate is not null 
group by d.dcsID, d.Comments
order by d.dcsID


select distinct d.dcsID, MAX(f.insertdate) LastUploadAttempt, min(f.insertdate) OriginalUploadErrorDate, count(f.ImageID) #ofAttempts 
from document d
left join FTPError f
on d.ImageID = f.imageid
left join cmprecon c
on d.dcsID = c.DCSID
where d.Comments is not null and d.ftpstime is null
and d.PBatch not like '11%' and f.insertdate is not null 
and d.PBatch not like '02%'
and c.DocumentStatus = 'Upload'
group by d.dcsID
order by d.dcsID



select * from cmprecon where DocumentStatus = 'upload'


select * from document where dcsid = 'IDLX0DPZ-5GHFJY' and ftpstime is null