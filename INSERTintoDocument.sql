insert into document
SELECT     ImageID, PBatch, iDRSBatch, NumPages, FLN, FileNumber, RMN, docidDoctype, received_date, Status, OrgID, TrackingNumber, ShipmentDate, 
                      UniqueID_Livonia, CarrierType, ImageDateTime, ftpstime, PrepID, RecordNumber, newimageid, ENFandPrint_Error, ENFandPrint_Path, 
                      MA18doctype, Comments, DCC, JulianDate, XrayBarcode, bestcopy, dcsID, FileSize, UploadProcessTime, PDFTrigger, UploadTrigger, PDFMachine, 
                      UploadMachine, CharCount, Form526Data, LOCSUpdate, OCRExportTime, isMachinePrint, isHandPrint, DCSIDComplete
FROM         docid.dbo.img_e3