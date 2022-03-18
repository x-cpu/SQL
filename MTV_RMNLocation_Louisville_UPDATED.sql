---step 1
select 
CASE
	WHEN T.RMN_RMNLocation = T.RMN_CustomerCheckIn then T.RMN_CustomerCheckIn
	WHEN (T.RMN_RMNLocation is null or T.RMN_RMNLocation = 'null') and T.RMN_CustomerCheckIn is not null then T.RMN_CustomerCheckIn
	WHEN T.RMN_CustomerCheckIn is null and T.RMN_RMNLocation is not null then T.RMN_RMNLocation
	END RMN,
T.TrackingNo_RMNLocation TrackingNo,
CASE
	WHEN ((T.RMN_RMNLocation is null or T.RMN_RMNLocation = 'null') and T.RMN_CustomerCheckIn is null) then 'No RMN value for Tracking Number'
	WHEN ((T.RMN_RMNLocation is not null or T.RMN_RMNLocation <> 'null') and T.RMN_CustomerCheckIn is null) then 'Not Checked Into Portal' END Comments
into docid.dbo.RMNLocation_Lookup_02
FROM
(select distinct r.RMN RMN_RMNLocation, c.rmn RMN_CustomerCheckIn, r.TrackingNO TrackingNo_RMNLocation, c.trackingno TrackingNo_CustomerCheckin, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville') T
order by RMN desc, Comments asc


---step 2
select * from 
docid.dbo.RMNLocation_Lookup_02 m
where exists (select * from RMNCompleted where rmn = m.RMN)



---step 3 update
--update m
--set m.Comments = 'RMN completed'
--from docid.dbo.RMNLocation_Lookup_02 m
--where exists (select * from RMNCompleted where rmn = m.RMN)
--and Comments is null


---step 4 select (Exela checked in - In Progress)
select * from 
docid.dbo.RMNLocation_Lookup_02 m where Comments is null
and exists (select * from manifestDCS where rmn = m.rmn and trackingno = m.trackingno)


---step 5 update
--update m
--set m.Comments = 'Exela checked in - In Progress'
--from docid.dbo.RMNLocation_Lookup_02 m
--where exists (select * from manifestDCS where rmn = m.rmn and trackingno = m.trackingno)
--and Comments is null


---step 6 select (Checked into Portal but not by Exela)
select * from 
docid.dbo.RMNLocation_Lookup_02 m where Comments is null
and not exists (select * from manifestDCS where rmn = m.rmn and trackingno = m.trackingno)


---step 6 update (Checked into Portal but not by Exela)
update m
set m.Comments = 'Checked into Portal but not by Exela'
from docid.dbo.RMNLocation_Lookup_02 m
where not exists (select * from manifestDCS where rmn = m.rmn and trackingno = m.trackingno)
and Comments is null


select * from 
docid.dbo.RMNLocation_Lookup_02 
where Comments = 'Exela checked in - In Progress'
order by Comments