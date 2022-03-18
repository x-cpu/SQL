---by rmn lookup
SELECT DISTINCT dcsID, PBatch, max(ftpstime)
FROM         [Document]
WHERE     (RMN = '304VB1114120099A') and ftpstime is not null
group by dcsID, PBatch
order by PBatch

SELECT DISTINCT dcsID, PBatch
FROM         CustomerDATA
WHERE     (RMN = '316vb1126128707d')
order by PBatch


---by dcsid lookup
select *
from customerdata
where dcsID = 'H9ABGLUKHRYD59'

select *
from Document
where dcsID = 'H9ABGLUKHRYD59'

select *
from manifestDCS
where dcsID = 'H9ABGLUKHRYD59'


select sum(numpages), count(docidDoctype)
from document
where ftpstime between '2012-11-13 00:00:00' and '2012-11-14 09:00:00'


select count(*) as #ofDocs, docidDoctype
from Document
where ftpstime is not null and Comments = 'success'
group by docidDoctype
order by count(docidDoctype) DESC



select *
from manifestDCS
where pbatch like '021233400108%'


select * 
from Document
where Pbatch = '02123390011601'


update Document
set dcsID = 'H9VGYDGONOWH98'
where dcsID = 'H9VGYDGOWH98'


select distinct dcsID
from document
where pbatch like '021229600004%'

select distinct dcsID
from CustomerDATA
where pbatch = '02123050006203'

select *
from Document
where RMN = '316vb1108123878d'

select *
from document
where ImageID = 'caci_123202901p001002743'


select *
from document
where rmn = '308vb1026120001c'
order by ftpstime desc

select *
from document
where dcsid like  'H91K9A%'

select *
from CustomerDATA
where participantID = '29838220'


select distinct PBatch
from Document
where rmn = '308vb1026120001c' and ftpstime is not null

select *
from CustomerDATA
where shovboxno in ('1419', ' 1420')

update customerdata
set shovboxno = '1420'
where shovboxno = ' 1420'



select *
from manifestDCS
where RMN = '316vb1108123878d'

select *
from document
where pbatch = '02123340025201'

select *
from CustomerDATA
where dcsID = 'H9186NBJ2O52ZS'

select *
from CustomerDATA
where rmn = '308VB1023120002C' or rmn = '308VB1023120001C'
order by rmn

select *
from customerdata
where Lastname = 'mcmanus'

select *
from customerdata
where boxno = '0058'



SELECT DISTINCT dcsID, PBatch, max(ftpstime)
FROM         [Document]
WHERE     (RMN = '308VB1023120001C') and ftpstime is not null
group by dcsID, PBatch
order by PBatch



SELECT *
FROM         CustomerDATA
WHERE     (RMN = '308vb1107120001c') 
order by PBatch


select *
from customerdata
where filenumber = '021709200'

select *
from customerdata
where lastname = 'degrace'

select *
from document 
where pbatch = '02123240021801'

select *
from document
where dcsid = 'H9IEY95DYYMI2B'

SELECT DISTINCT dcsID, PBatch, max(ftpstime)
FROM         [Document]
WHERE     (RMN = '308vb1107120001c') and ftpstime is not null
group by dcsID, PBatch
order by PBatch


SELECT     syskey, trackingno, RMN, pbatch, dcsID, insertdate, operID, location, jobID, BSplitNo
FROM         manifestDCS
WHERE     (RMN = '325vb1115120021b')


SELECT   *
FROM         manifestDCS	
WHERE     (RMN = '308VB1031120003c')


select *
from exceptions
where RMN = '325vb1115120021b'


select *
from manifestdcs
where DCSID = 'ha2sjmws2x8d54'

select *
from document
where DCSID = 'ha2sjmws2x8d54'


select *
from manifestdcs
where RMN = '316VB1101121175D'

select *  
from customerdata
where checkout is not null
order by RMN


select *
from CustomerDATA
where RMN = '308vb1026120001c'


select *
from customerCheckIn
where RMN = '304VB0912120002a'

select customerCheckIn.trackingno, rtrim(customerCheckIn.RMN) as RMN, convert(varchar, customerCheckin.insertdate, 101)  as VAPortalEntryDate
from customerCheckIn
where RMN not in (select RMN from manifestDCS)
order by customerCheckIn.insertdate


select *
from manifestDCS
where RMN = '304VB0912120002a'

select *
from exceptions
where RMN = '309VB1128120009C'

select * from stats_ibml where kbatch like '0212324%'
select distinct pbatch  from document where pbatch like '0212324%'
select distinct pbatch from document where pbatch in 
(select distinct pbatch  from manifestdcs where insertdate > '11/19/2012 0:0:1' and insertdate <'11/19/2012 23:59:59')

--end to end details
    SELECT (CONVERT(varchar(10), p.InvTime, 101)) AS "Checkin Date",
    COUNT(DISTINCT p.RMN) AS "RMNCI",
    COUNT(DISTINCT p.pbatch) as "BatchesCI",     
    COUNT(DISTINCT d.PBatch) as "BatchesExp", 
    SUM(d.NumPages) AS "ImagesExp", 
    SUM(CASE WHEN t.BatchLocation >= 1  AND t.BatchLocation <= 256 THEN 1 ELSE 0 END) AS "WIP Batches",
    SUM(CASE WHEN t.BatchLocation >= 1  AND t.BatchLocation <= 256 THEN t.TotalImages ELSE 0 END) AS "WIP Images"
    FROM PhysicalBatch p
    LEFT JOIN TurboscanNG1.dbo.Batches t
    ON t.BatchName = p.PBatch
    LEFT JOIN Document d
    ON d.PBatch = p.PBatch
	WHERE p.InvTime IS NOT NULL
	AND ((CONVERT(varchar(10), p.InvTime, 101) >= '11/19/2012') 
	AND (CONVERT(varchar(10), p.InvTime, 101) <= '11/30/2012'))
	GROUP BY (CONVERT(varchar(10), p.InvTime, 101))

--end to end summary
 -- Insert statements for procedure here
    SELECT COUNT(DISTINCT p.RMN) AS "RMNCI",
    COUNT(DISTINCT p.pbatch) as "BatchesCI",     
    COUNT(DISTINCT d.PBatch) as "BatchesExp", 
    SUM(d.NumPages) AS "ImagesExp", 
    SUM(CASE WHEN t.BatchLocation = 1 THEN 1 ELSE 0 END) AS "Capture",
    SUM(CASE WHEN t.BatchLocation = 2 THEN 1 ELSE 0 END) AS "Enhance",
    SUM(CASE WHEN t.BatchLocation = 4 THEN 1 ELSE 0 END) AS "Separate",
    SUM(CASE WHEN t.BatchLocation = 128 AND t.WFStatus = 0 THEN 1 ELSE 0 END) AS "ImageQC",
    SUM(CASE WHEN t.BatchLocation = 8 THEN 1 ELSE 0 END) AS "AutoIndex",
    SUM(CASE WHEN t.BatchLocation = 128 AND t.WFStatus = 256 THEN 1 ELSE 0 END) AS "DocID",
    SUM(CASE WHEN t.BatchLocation = 64 THEN 1 ELSE 0 END) AS "Verify",
    SUM(CASE WHEN t.BatchLocation = 32 THEN 1 ELSE 0 END) AS "ManualIndex",
    SUM(CASE WHEN t.BatchLocation = 256 THEN 1 ELSE 0 END) AS "Export"
    FROM PhysicalBatch p
    LEFT JOIN TurboscanNG1.dbo.Batches t
    ON t.BatchName = p.PBatch
    LEFT JOIN Document d
    ON d.PBatch = p.PBatch
	WHERE p.InvTime IS NOT NULL
	AND ((CONVERT(varchar(10), p.InvTime, 101) >= '11/19/2012') 
	AND (CONVERT(varchar(10), p.InvTime, 101) <= '11/19/2012'))




select *
from Document
where pbatch = '02123350002101'

select *
from document
where FileNumber = '149648725'

select *
from CustomerDATA
where FileNumber = '149648725'



update CustomerDATA
set FileNumber = '255949643'
where FileNumber = '316VB1127123048D'


select *
from document
where rmn = '376vb1217120441A'


select *
from Stats_IBML
where kbatch  like '02123550%'
order by kbatch desc


select *
from manifestdcs
where pbatch = '021301400059'



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
                  --WHERE     cci.insertdate between cast('01/01/2013' AS datetime) and cast('01/01/2013 23:59:59.999' as datetime) 
                  WHERE       d.ftpstime between cast('01/01/2013' AS datetime) and cast('01/01/2013 23:59:59.999' as datetime) 
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


use dva
select * from customerdata where shovboxno like '%223%'

update CustomerDATA
set Shovboxno = '2235'
where Shovboxno = ' 2235'

select * from TSErrorTracking where batchname = '02123260026301'
