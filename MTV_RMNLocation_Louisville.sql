select r.RMN, c.rmn, r.TrackingNO, c.trackingno, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville'
and (r.rmn is null or r.RMN = 'null')
--and c.rmn is not null
order by r.TrackingNO


select r.RMN, c.rmn, r.TrackingNO, c.trackingno, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville'
and (r.rmn is null or r.RMN = 'null')
--and c.rmn is not null
order by c.RMN


select distinct T.CustomerCheckinRMN, T.CustomerCheckinTrackingNo
FROM
(select r.RMN, c.rmn CustomerCheckinRMN, r.TrackingNO, c.trackingno CustomerCheckinTrackingNo, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville'
and (r.rmn is null or r.RMN = 'null')) T
where T.CustomerCheckinRMN is not null


---base 1
select r.RMN, c.rmn, r.TrackingNO, c.trackingno, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville'
order by c.RMN desc, r.RMN desc


---base 2
select t.RMN, t.CustomerCheckInRMN, t.CustomerCheckinTrackingNo
FROM
(select r.RMN, c.rmn CustomerCheckInRMN, r.TrackingNO, c.trackingno CustomerCheckinTrackingNo, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville') T
where (t.RMN is not null or t.CustomerCheckInRMN is not null)



---base 3
select T.RMN_RMNLocation, T.RMN_CustomerCheckIn, T.TrackingNo_RMNLocation, T.TrackingNo_CustomerCheckin,
CASE
	WHEN ((T.RMN_RMNLocation is null or T.RMN_RMNLocation = 'null') and T.RMN_CustomerCheckIn is null) then 'No RMN value for Tracking Number' END Comments,
CASE
	WHEN T.RMN_RMNLocation = T.RMN_CustomerCheckIn then T.RMN_CustomerCheckIn
	WHEN T.RMN_RMNLocation = 'null' and T.RMN_CustomerCheckIn is not null then T.RMN_CustomerCheckIn
	WHEN T.RMN_CustomerCheckIn is null and T.RMN_RMNLocation is not null then T.RMN_RMNLocation
	END RMN
FROM
(select r.RMN RMN_RMNLocation, c.rmn RMN_CustomerCheckIn, r.TrackingNO TrackingNo_RMNLocation, c.trackingno TrackingNo_CustomerCheckin, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville') T
--where (t.RMN is not null or t.CustomerCheckInRMN is not null)
order by Comments asc


---base 4
select 
CASE
	WHEN T.RMN_RMNLocation = T.RMN_CustomerCheckIn then T.RMN_CustomerCheckIn
	WHEN T.RMN_RMNLocation = 'null' and T.RMN_CustomerCheckIn is not null then T.RMN_CustomerCheckIn
	WHEN T.RMN_CustomerCheckIn is null and T.RMN_RMNLocation is not null then T.RMN_RMNLocation
	END RMN,
T.TrackingNo_RMNLocation TrackingNo,
CASE
	WHEN ((T.RMN_RMNLocation is null or T.RMN_RMNLocation = 'null') and T.RMN_CustomerCheckIn is null) then 'No RMN value for Tracking Number' END Comments
FROM
(select r.RMN RMN_RMNLocation, c.rmn RMN_CustomerCheckIn, r.TrackingNO TrackingNo_RMNLocation, c.trackingno TrackingNo_CustomerCheckin, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville') T
--where (t.RMN is not null or t.CustomerCheckInRMN is not null)
order by Comments asc


---base 5
select 
CASE
	WHEN T.RMN_RMNLocation = T.RMN_CustomerCheckIn then T.RMN_CustomerCheckIn
	WHEN T.RMN_RMNLocation = 'null' and T.RMN_CustomerCheckIn is not null then T.RMN_CustomerCheckIn
	WHEN T.RMN_CustomerCheckIn is null and T.RMN_RMNLocation is not null then T.RMN_RMNLocation
	END RMN,
T.TrackingNo_RMNLocation TrackingNo,
CASE
	WHEN ((T.RMN_RMNLocation is null or T.RMN_RMNLocation = 'null') and T.RMN_CustomerCheckIn is null) then 'No RMN value for Tracking Number'
	WHEN ((T.RMN_RMNLocation is not null or T.RMN_RMNLocation <> 'null') and T.RMN_CustomerCheckIn is null) then 'Not Checked In' END Comments
--into docid.dbo.RMNLocation_Lookup
FROM
(select r.RMN RMN_RMNLocation, c.rmn RMN_CustomerCheckIn, r.TrackingNO TrackingNo_RMNLocation, c.trackingno TrackingNo_CustomerCheckin, r.BuildingLocation 
from rmnlocation r
left join customerCheckIn c
on r.trackingno = c.trackingno
where r.BuildingLocation = 'Louisville') T
--where (t.RMN is not null or t.CustomerCheckInRMN is not null)
order by RMN desc, Comments asc


---base 6
select * from 
docid.dbo.RMNLocation_Lookup m
where exists (select * from RMNCompleted where rmn = m.RMN)



--update
--update m
--set m.Comments = 'RMN completed - all batches exported'
--from docid.dbo.RMNLocation_Lookup m
--where exists (select * from RMNCompleted where rmn = m.RMN)
--and Comments is null


select distinct pb.RMN, cc.claimtype Type, max(convert(varchar, pb.InvTime, 102)) CheckInDate, 
                                count(distinct pb.pbatch) #CheckInBatch, count(distinct s.kbatch) #ExportedBatch from PhysicalBatch pb
                                left outer join stats s
                                on pb.PBatch = s.kbatch
								left join customerCheckIn cc
								on pb.RMN = cc.RMN
                                where exists (select * from docid.dbo.RMNLocation_Lookup where rmn = cc.RMN)
                                group by pb.RMN, cc.claimtype
                                order by pb.RMN

select distinct pb.RMN, cc.claimtype Type, max(convert(varchar, pb.InvTime, 102)) CheckInDate, 
                                count(distinct pb.pbatch) #CheckInBatch, count(distinct s.kbatch) #ExportedBatch from PhysicalBatch pb
                                left outer join stats s
                                on pb.PBatch = s.kbatch
								left join customerCheckIn cc
								on pb.RMN = cc.RMN
                                where exists (select * from docid.dbo.RMNLocation_Lookup where rmn = cc.RMN)
                                group by pb.RMN, cc.claimtype
                                order by pb.RMN



use turboscanng1 select top 1 T.BatchName, 
                                        T.TurboscanBatchLocation, 
                                        T.BatchStatus
                                        FROM
                                        (select distinct batchname, 
                                        case 
							                   WHEN WFStep = 1 then 'Capture'
							                   WHEN WFStep = 2 then 'Enhance'
							                   WHEN WFStep = 3 then 'Separation'
							                   WHEN WFStep = 4 then 'ImageQC'
							                   WHEN WFStep = 5 then 'AutoIndex'
							                   WHEN WFStep = 6 then 'DocID'
							                   WHEN WFStep = 7 then 'DocIDQC'
							                   WHEN WFStep = 8 then 'Manual Index'
							                   WHEN WFStep = 9 then 'Manual IndexQC'
							                   WHEN WFStep = 10 and batchlocation = 64 then 'Verification'
							                   WHEN WFStep = 11 and batchlocation <> 0 then 'Export' 
                                        END
                                        AS 'TurboscanBatchLocation', 
						                case
								                WHEN BatchStatus = 1 then 'Ready'
								                WHEN BatchStatus = 2 then 'In Process'
								                WHEN BatchStatus = 4 then 'Suspended'
								                WHEN BatchStatus = 8 then 'Auto-Fail'
								                END
								                AS 'BatchStatus'
                                         from Batches
                                        where (jobid = 8 or jobid = 11) and
						                (WFStep = 1 or WFStep = 2 or WFStep = 3 or 
						                WFStep = 4 or WFStep = 5 or WFStep = 6 or 
						                WFStep = 7 or WFStep = 8 or WFStep = 9 or 
						                (WFStep = 10 and batchlocation = 64) or (WFStep = 11 and batchlocation <> 0))) T
						                where t.BatchName = @batchname






select * from RMNCompleted

select * from customerCheckIn where rmn = '316VB0715173068D'

--5996
--325 values where r.RMN is null and c.rmn is null but r.trackingno is not null


--31408 where either RMN value existed 
--31082 where either RMN value existed 