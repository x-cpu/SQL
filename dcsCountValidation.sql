select T.BatchName, T.#IBML_DCSIDs, T.#Exported_DCSIDs
FROM
(select distinct s.kbatch BatchName, ISNULL(count(distinct db.dcsid), 0) #IBML_DCSIDs, ISNULL(count(distinct cd.dcsid), 0) #Exported_DCSIDs from stats s
left join dcsbarcode db
on s.kbatch = db.pbatch
left join CustomerDATA cd
on s.kbatch = cd.Pbatch
where SUBSTRING(s.kbatch, 3, 5) = '15201'
and s.kbatch like '02%'
group by s.kbatch) T
order by T.BatchName

select * from stats where SUBSTRING(kbatch, 3, 5) = '15255' and kbatch like '02%'

select distinct dcsid, lastname, firstname, middleinitial, filenumber, participantid from dcsbarcode where pbatch = '02152180407704'

select distinct dcsid, lastname, firstname, middleinitial, filenumber, participantid from CustomerDATA where pbatch = '02152180407704'

select * from  CustomerDATA where ShipTrackingNumber is not null
--comparison
select distinct dcsid from dcsbarcode where pbatch = '02152180407704'
and not exists (select * from CustomerDATA where dcsbarcode.pbatch = CustomerDATA.Pbatch)

select * from CustomerDATA where dcsID = 'ICXLLCWSG7FSQ5'
--comparison
select distinct dcsid from dcsbarcode where pbatch = '02152570003902'
and dcsid not in (select distinct dcsid from CustomerDATA where dcsbarcode.pbatch = CustomerDATA.Pbatch)


select * from Stats_IBML where kbatch = '02152230406901'

select * from Stats_IBML where kbatch = '02152230301101'


select * from TurboscanNG1.dbo.batches where batchname = '02152230301101'


select * from cmpcheckin where pbatch = '03152200600201'


select * from PhysicalBatch where pbatch = '03152200600201'



select distinct dcsid, max(convert(nvarchar, ImageDateTime, 101)) TSExportDate, max(convert(nvarchar, ftpstime, 101)) UploadtoVBMSDate, comments
from Document where pbatch = '02152550803201'
group by dcsID, comments


select ISNULL(count(distinct dcsid), 0) from document where pbatch = '02152010300101' and ftpstime is not null

02152010300101
02152010300102
02152010300103
02152010300104
02152010300201
02152010300202
02152010300203
02152010300301
02152010300302

select distinct s.kbatch BatchName, ISNULL(count(distinct db.dcsid), 0) #IBML_DCSIDs, ISNULL(count(distinct cd.dcsid), 0) #Exported_DCSIDs
--(select ISNULL(count(distinct d.dcsid), 0) from document where ftpstime is not null and cd.dcsID = d.dcsID) #Uploaded_DCSIDs
from stats s
left join dcsbarcode db
on s.kbatch = db.pbatch
left join CustomerDATA cd
on s.kbatch = cd.Pbatch
--left join document d
--on cd.dcsID = d.dcsID
where SUBSTRING(s.kbatch, 3, 5) = '15201'
and s.kbatch like '02%'
group by s.kbatch
order by s.kbatch