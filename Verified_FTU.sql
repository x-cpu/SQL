--confirmed
select distinct d.RMN,d.dcsID,d.FileNumber,d.PBatch,max(convert(date,m.insertdate,101)) as CheckinDate
,cci.claimtype,p.StationNo+'-'+p.pobox as Source
,cast(e.OriginalError as date) as OriginalErrorDate
,CAST(e.latesterrordate as date) as LatestErrorDate
,((select count(*) from Calendar where CalendarDate between min(e.OriginalError) and CONVERT(Datetime, GETDATE())and BusinessDay = 1)+1) as DaysSinceInitialError
,substring(d.comments,1,77) as comments
,'Newnan' as Facility
from document d
join manifestdcs m on d.dcsID = m.dcsID
join CustomerDATA cd on d.dcsID = cd.dcsID
join customerCheckIn cci on d.RMN = cci.RMN
join (select imageid,MIN(insertdate) as OriginalError,MAX(insertdate) as latesterrordate from FTPError group by imageid) e on e.imageID = d.imageID 
join pobox p on cci.location = p.SysKey
where
 exists(select pbatch from pbatchDCS_comments_Detailed pb where pb.pbatch = d.PBatch) --in(select distinct pbatch from pbatch_comments)
and d.ftpstime is null
and p.StationNo <> '001'
group by d.imageid,d.FileNumber,d.RMN,d.dcsID,d.PBatch,cci.claimtype,cci.claimtype,p.StationNo+'-'+p.pobox,cast(e.OriginalError as date)
,CAST(e.latesterrordate as date),d.comments--,dc.thirdcheckoper
--,substring(e.comments,1,100)
--,d.Comments
order by cast(e.OriginalError as date)




---not confirmed
select distinct d.RMN,d.dcsID,d.FileNumber,d.PBatch,max(convert(date,m.insertdate,101)) as CheckinDate
,cci.claimtype,p.StationNo+'-'+p.pobox as Source
,cast(e.OriginalError as date) as OriginalErrorDate
,CAST(e.latesterrordate as date) as LatestErrorDate
,((select count(*) from Calendar where CalendarDate between min(e.OriginalError) and CONVERT(Datetime, GETDATE())and BusinessDay = 1)+1) as DaysSinceInitialError
,substring(d.comments,1,77) as comments
,'Newnan' as Facility
from document d
join manifestdcs m on d.dcsID = m.dcsID
join CustomerDATA cd on d.dcsID = cd.dcsID
join customerCheckIn cci on d.RMN = cci.RMN
join (select imageid,MIN(insertdate) as OriginalError,MAX(insertdate) as latesterrordate from FTPError group by imageid) e on e.imageID = d.imageID 
join pobox p on cci.location = p.SysKey
where
-- exists(select pbatch from pbatchDCS_comments_Detailed pb where pb.pbatch = d.PBatch) --in(select distinct pbatch from pbatch_comments)
--and 
d.ftpstime is null
and p.StationNo <> '001'
group by d.imageid,d.FileNumber,d.RMN,d.dcsID,d.PBatch,cci.claimtype,cci.claimtype,p.StationNo+'-'+p.pobox,cast(e.OriginalError as date)
,CAST(e.latesterrordate as date),d.comments--,dc.thirdcheckoper
--,substring(e.comments,1,100)
--,d.Comments
order by cast(e.OriginalError as date)