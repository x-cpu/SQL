--delete from domarecon where pbatch <> '11142940000004'

--delete from document where pbatch like '111%' and pbatch <> '11142940000004'
--delete from CustomerDATA where pbatch like '111%' and pbatch <> '11142940000004'

select * from CustomerDATA where pbatch = '11142930000001'


select * from cmprecon where ReceiptDate like '09/%'


select * from domarecon 

select *  from document where pbatch like '11143040000015%'
select *  from domarecon where pbatch like '1114304%'

select *  from CustomerDATA where pbatch like '1114304%'

select * from FTPError where comments like 'Detail: CMSERR0027%'
select * from FTPError where comments like 'Detail: CMSERR0001%'

select ImageID, Comments, FileNumber Status  from document where pbatch = '11143020000011'


select ImageID, filenumber, Comments Status  from document where pbatch = '11143030000014' or pbatch = '11143030000013'
11143030000014
11143030000013

select * from DOCID.dbo.docid where DocType = 'VA 21-4142 Authorization for Release of Information'
select ImageID, Comments Status  from document where pbatch = '11143040000015' or pbatch = '11143030000013'

select * from document where pbatch like '03%' and ImageDateTime > '2014-10-31 0:0:0' and docidDoctype = 'VA 21-4142 Authorization for Release of Information' and pbatch = '03143000601401'

select * from PhysicalBatch where pbatch = '03143490617101'


select d.imageid, d.docidDoctype, dd.DocType 
from document  d
join docid.dbo.docid dd
on substring(d.docidDoctype, 3,4) = dd.DocID
where pbatch = '11143020000011'




select substring(docidDoctype, 3,4) from document where pbatch = '11143020000011'


select * from TurboscanNG1.dbo.batches where batchname = '03143390605501'

select * from PhysicalBatch where exists (
select * from TurboscanNG1.dbo.batches ts where WFStep = 11 and JobID = 11 and BatchStatus = 1 and BatchLocation = '256' and ts.BatchName = PhysicalBatch.pbatch)




select * from PhysicalBatch where exists (
select * from TurboscanNG1.dbo.batches ts where JobID = 11 and BatchLocation <> '0' and WFStep <> '11' and ts.BatchName = PhysicalBatch.pbatch)
and exists (select * from document where ImageDateTime > '2014-12-17 0:0:0' and docidDoctype like '%4142%' and document.PBatch = PhysicalBatch.PBatch)
and BatchClassName = 'PMR'


select * from document where ImageDateTime > '2014-12-17 0:0:0' and docidDoctype like '%4142%' and pbatch not like '02%' order by ImageDateTime

select * from Stats where kbatch = '03143490617101'

03143500605901 no 4142 no PMR stamping - "worked"
03143500609501 no 4142 no PMR stamping - "worked"
03143500610201 no 4142 no PMR stamping - "worked"
03143500611301 no 4142 no PMR stamping - "worked"
03143510800301 no 4142 no PMR stamping - "worked"
03143510800601 no 4142 no PMR stamping - "worked"

