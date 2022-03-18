--359 batches showing
select distinct PBatch from document 
where exists (select * from FTPError where document.imageid = FTPError.imageid) 
and document.PBatch not like '02%' and document.ftpstime is null and document.Comments is not null
and document.pbatch not in (select distinct batchname from FTPDetails)

select * from FTPDetails where batchname = '03142300620301'
select * from docid.dbo.FTPDetailsu where batchname = '03102100600101'



--bad records that should not retry ever or until sent to portal first
select distinct ImageID, PBatch
--into docid.dbo.img_e
from document 
where exists (select * from FTPError where document.imageid = FTPError.imageid) 
and document.PBatch not like '02%' and document.ftpstime is null and document.Comments is not null
and document.pbatch not in (select distinct batchname from FTPDetails)


--records in ftperror to delete
--delete from DVA.dbo.FTPError 
where exists (select * from docid.dbo.img_e where DVA.dbo.FTPError.imageid =  docid.dbo.img_e.ImageID)


--check if any batch has ftp time
select distinct dd.pbatch from docid.dbo.img_e dd
where pbatch  not in (select distinct pbatch from document where ftpstime is not null)

--records in document to delete
select * from document 
where exists (select * from docid.dbo.img_e where document.pbatch = docid.dbo.img_e.pbatch)

select pbatch, min(imagedatetime) ExportDate from document 
where exists (select * from docid.dbo.img_e where document.pbatch = docid.dbo.img_e.pbatch)
group by pbatch
order by ExportDate desc

set identity_insert document_preprod onset
go
insert into document_preprod(ImageID,PBatch,iDRSBatch,NumPages,FLN,FileNumber,RMN,docidDoctype,received_date,Status,OrgID,TrackingNumber,ShipmentDate,UniqueID_Livonia,CarrierType,ImageDateTime,ftpstime,PrepID,RecordNumber,SysKey,newimageid,ENFandPrint_Error,ENFandPrint_Path,MA18doctype,Comments,DCC,JulianDate,XrayBarcode,bestcopy,dcsID,FileSize,UploadProcessTime,PDFTrigger,UploadTrigger,PDFMachine,UploadMachine,CharCount,Form526Data,LOCSUpdate,OCRExportTime,isMachinePrint,isHandPrint,DCSIDComplete)
values (select * from docid.dbo.img_e3)

select * from FTPDetails where batchname = '03141430600501'

select * from document where 

--select * from docid.dbo.img_e2

select * from document where dcsID = 'DCSID031416906020010033'



SELECT [name] AS [Column Name]
FROM syscolumns
WHERE id = (SELECT id FROM sysobjects WHERE type = 'U' AND [Name] = 'document')

select distinct pbatch from docid.dbo.img_e3
where  exists (select * from document where DOCID.dbo.img_e3.pbatch = document.PBatch)

select * from document
where exists (select * from docid.dbo.img_e3 where document.PBatch = docid.dbo.img_e3.PBatch)

select d.Comments 

update document
set Comments = NULL
from document d
inner join DOCID.dbo.img_e3 img
on img.PBatch = d.PBatch 
where d.ftpstime is null and d.comments is not null
and img.ImageID = d.ImageID


select distinct dcsID, PBatch from document 
                where exists (select * from FTPError where document.imageid = FTPError.imageid) 
                and PBatch not like '02%' and ftpstime is null and Comments is not null


				select distinct dcsID, PBatch from document 
                where exists (select * from FTPError where document.imageid = FTPError.imageid) 
                and PBatch not like '02%' and ftpstime is null and Comments is not null and dcsid in (select distinct dcsid from cmprecon)


				select distinct dcsID, PBatch from document 
                where exists (select * from FTPError where document.imageid = FTPError.imageid and insertdate < '2014-10-29 0:0:0') 
                and PBatch not like '02%' and ftpstime is null and Comments is not null and dcsid in (select distinct dcsid from cmprecon)


				select distinct dcsID, PBatch from document 
                where exists (select * from FTPError where document.imageid = FTPError.imageid and insertdate < '2014-10-29 0:0:0') 
                and PBatch not like '02%' and ftpstime is null and Comments is not null and dcsid in (select distinct dcsid from cmprecon)
                order by pbatch, dcsid

				select * from document where dcsid = 'DCSID031215706002010001'