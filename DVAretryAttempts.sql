---DVA RETRY ATTEMPTS
select distinct d.pbatch, d.RMN, d.dcsid, 
MAX(CONVERT(date,m.insertdate,101)) as CheckinDate, 
cci.claimtype,
substring(d.comments, 1, 19) VBMSResponse, 
count(f.imageid) UploadAttempts, 
CAST(e.OriginalError as date) as OriginalErrorDate, 
CAST(e.latesterrordate as date) as LatestErrorDate, 
       ((select count(*) from Calendar where CalendarDate between min(e.OriginalError) 
       and CONVERT(Datetime, GETDATE())and BusinessDay = 1)+1) as DaysSinceInitialError
from document d
left join FTPError f
on d.ImageID = f.imageid
join manifestDCS m on d.dcsID = m.dcsID
join customerCheckIn cci on d.RMN = cci.RMN
join (select imageid,MIN(insertdate) as OriginalError,MAX(insertdate) as latesterrordate from FTPError group by imageid) e on e.imageID = d.imageID 
where d.pbatch like '02%' and d.ImageDateTime > '2013-02-20 00:00:00' and d.Comments like 'Detail: CMSERR%' and d.ftpstime is null
group by d.pbatch, d.rmn, d.dcsid, substring(d.comments, 1, 19), cci.claimtype, CAST(e.OriginalError as date), CAST(e.latesterrordate as date) 