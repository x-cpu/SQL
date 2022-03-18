---recon query
SELECT RMN,
                        Tracking_Number,
                        VA_Ship_Date,
                        Max(CheckIn_Date) as CheckIn_Date,
                        First_Name,
                        MI,
                        Last_Name,
                        Participant_ID,
                        DCS_ID,
                        File_Number,
                        #_of_Documents, 
                        SUM(#_of_Images) as #_of_Images,
                        Max(Upload_to_VA_Date) as Upload_to_VA_Date,
                        Return_to_VA_Date,
                        Return_Tracking_#,
                        Location,
                        'Newnan'  AS ProcessingFacility,
                        claimtype
						into xxxDecRecon
                  FROM (
                  SELECT LTRIM(RTRIM(cci.RMN)) AS RMN, 
                        cci.trackingno AS Tracking_Number, 
                        cci.insertdate as VA_Ship_Date, 
                        max(mDCS.insertdate) as CheckIn_Date,
                        cd.Firstname as First_Name,
                        cd.MiddleInitial as MI,
                        cd.Lastname as Last_Name, 
                        cd.participantID as Participant_ID,
                        mDCS.dcsID as DCS_ID,
                        d.FileNumber as File_Number,
                        cd.numdocs as #_of_Documents,
                        d.numpages as #_of_Images,
                        d.ftpstime as Upload_to_VA_Date,
                        cd.ShipDate as Return_to_VA_Date,
                        cd.shiptrackingnumber as Return_Tracking_#,
                        p.pobox as Location,
                        cci.claimtype
                  FROM customerCheckIn as cci
                        LEFT JOIN pobox as p on p.sysKey = cci.Location
                        LEFT JOIN manifestDCS as mDCS on cci.RMN = mDCS.RMN
                        LEFT JOIN CustomerDATA  as cd on mDCS.dcsID = cd.dcsID
                        LEFT JOIN Document as d on mDCS.dcsID = d.dcsID
                  WHERE       cci.insertdate between cast('12/01/2012' AS datetime) and cast('12/31/2012 23:59:59.999' as datetime) 
                  group by LTRIM(RTRIM(cci.RMN)), cci.trackingno, cci.insertdate,
                        cd.Firstname, cd.MiddleInitial, cd.Lastname,
                        cd.participantID, mDCS.dcsID, d.FileNumber,
                        cd.numdocs,cd.shiptrackingnumber,
                        cd.ShipDate, p.pobox, d.numpages, d.ftpstime,cci.claimtype        
                  ) AS TAB
                  GROUP BY RMN, 
                        Tracking_Number,
                        VA_Ship_Date,
                        First_Name,
                        MI,
                        Last_Name,
                        Participant_ID ,
                        DCS_ID,
                        File_Number ,
                        #_of_Documents,
                        Return_to_VA_Date,
                        Return_Tracking_#,
                        Location,
                        claimtype 

---billing query
                  SELECT RMN,
                        Tracking_Number,
                        VA_Ship_Date,
                        Max(CheckIn_Date) as CheckIn_Date,
                        First_Name,
                        MI,
                        Last_Name,
                        Participant_ID,
                        DCS_ID,
                        File_Number,
                        #_of_Documents, 
                        SUM(#_of_Images) as #_of_Images,
                        Max(Upload_to_VA_Date) as Upload_to_VA_Date,
                        Return_to_VA_Date,
                        Return_Tracking_#,
                        Location,
                        'Newnan'  AS ProcessingFacility,
                        claimtype
									into xxxDecbill
                  FROM (
                  SELECT LTRIM(RTRIM(cci.RMN)) AS RMN, 
                        cci.trackingno AS Tracking_Number, 
                        cci.insertdate as VA_Ship_Date, 
                        max(mDCS.insertdate) as CheckIn_Date,
                        cd.Firstname as First_Name,
                        cd.MiddleInitial as MI,
                        cd.Lastname as Last_Name, 
                        cd.participantID as Participant_ID,
                        mDCS.dcsID as DCS_ID,
                        d.FileNumber as File_Number,
                        cd.numdocs as #_of_Documents,
                        d.numpages as #_of_Images,
                        d.ftpstime as Upload_to_VA_Date,
                        cd.ShipDate as Return_to_VA_Date,
                        cd.shiptrackingnumber as Return_Tracking_#,
                        p.pobox as Location,
                        cci.claimtype
                  FROM customerCheckIn as cci
                        LEFT JOIN pobox as p on p.sysKey = cci.Location
                        LEFT JOIN manifestDCS as mDCS on cci.RMN = mDCS.RMN
                        LEFT JOIN CustomerDATA  as cd on mDCS.dcsID = cd.dcsID
                        LEFT JOIN Document as d on mDCS.dcsID = d.dcsID
                  WHERE       d.ftpstime between cast('12/01/2012' AS datetime) and cast('12/31/2012 23:59:59.999' as datetime) 
                  group by LTRIM(RTRIM(cci.RMN)), cci.trackingno, cci.insertdate,
                        cd.Firstname, cd.MiddleInitial, cd.Lastname,
                        cd.participantID, mDCS.dcsID, d.FileNumber,
                        cd.numdocs,cd.shiptrackingnumber,
                        cd.ShipDate, p.pobox, d.numpages, d.ftpstime,cci.claimtype        
                  ) AS TAB
                  GROUP BY RMN, 
                        Tracking_Number,
                        VA_Ship_Date,
                        First_Name,
                        MI,
                        Last_Name,
                        Participant_ID ,
                        DCS_ID,
                        File_Number ,
                        #_of_Documents,
                        Return_to_VA_Date,
                        Return_Tracking_#,
                        Location,
                        claimtype


select sum(#_of_images) from xxxA
select * from xxxA

select dcs_id, count(*)
from xxxA
group by dcs_id
having count(*) > 1

select * 
into xxxDECn
from xxxA
where Upload_to_VA_Date between '2012-12-01 0:0:0' and '2013-01-01 0:0:0'

select sum(#_of_images) from xxxDecn

select * from xxxDecn

select distinct DCS_ID from xxxDecn where DCS_ID not in 
(select distinct dcsID from document where ftpstime between '2012-12-01 0:0:0' and '2013-01-01 0:0:0')

select *
from document
where ftpstime between '2012-12-01 0:0:0' and '2013-01-01 0:0:0'
and comments <> 'success'

select distinct dcsid from manifestDCS where insertdate between '2012-12-01 0:0:0' and '2013-01-01 0:0:0' and dcsID not in 
(select distinct dcsID from document where ftpstime between '2012-12-01 0:0:0' and '2013-01-01 0:0:0')

select * from xxxA where DCS_ID = 'HA4G2YXU64MDVS'


select * from xxxDecn order by DCS_ID asc

select distinct dcs_id
from xxxDecn
group by dcs_id
having count(Tracking_Number) > 1

select * from xxxDecn order by rmn


select dcsid, count(*) from customerdata
group by dcsid
having count(*) > 1

select * from customerdata order by dcsid desc
select * from document order by rmn asc

select * from document 
where rmn not like '3%'
and ftpstime between '2012-12-01 0:0:0' and '2013-01-01 0:0:0'