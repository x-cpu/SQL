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
not exists(select pbatch from pbatchDCS_comments_Detailed pb where pb.pbatch = d.PBatch) --in(select distinct pbatch from pbatch_comments)
and d.ftpstime is null
and p.StationNo <> '001'
group by d.imageid,d.FileNumber,d.RMN,d.dcsID,d.PBatch,cci.claimtype,cci.claimtype,p.StationNo+'-'+p.pobox,cast(e.OriginalError as date)
,CAST(e.latesterrordate as date),d.comments--,dc.thirdcheckoper
--,substring(e.comments,1,100)
--,d.Comments
order by cast(e.OriginalError as date)


select distinct pbatch from document where ftpstime is null and comments like 'Detail:  Message: gov.va.vba.vbms.ws.VbmsWSException: WssVerification Excepti%'

select * from customerCheckIn where rmn = '452vb0225157469c'
select * from document where pbatch = '02150050304604'
select * from Stats where kbatch = '02150530802501'
0215053082501
02150530802501


I293YIEVX988EN
select * from document where dcsid = 'I6M5ZWUQQQ4760' and ftpstime is null
select * from document where pbatch = '02143530204103' and ftpstime is null
02143530204103
select * from dcssheetlookup_CACI where insertdate > '2014-10-30 0:0:0'

select * from document where pbatch = '02143290210001'

I2549KQNW8JHNI

select * from dcssheetlookup where dcsid in (
'I5LEKVYW5HP39F',
'I5LEYADJU0OXBP',
'I5Z91JQW3R7KF6',
'I5ZDAPSMLTO77B',
'I623Q211GK6XGH',dcssheetlookup_cannotfix
'I63OK7NQGQ6UYR',
'I4PHD60SHHIYYT')


'I5TTVT724DIXVD',
'I5TU122PVTAZNO',
'I5ZPKX6M5SE007',
'I6M5ZWUQQQ4760',
'I6M7D92E8EKM4V',
'I6NHO82Y7OZQZY',
'I6NHRT13YULJL5',
'I6NM6R231KZTI1',
'I6RZS6IDSL2980',
'I6S4U57HUN7JQW',
'I6YWKRZ7YWB03')


