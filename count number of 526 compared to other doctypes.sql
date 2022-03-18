---count number of 526 compared to other doctypes
select count(*) count, doctype
FROM (select 
case 
	WHEN docidDoctype = 'VA 21-526 Veterans Application for Compensation or Pension' then 'VA 21-526 Veterans Application for Compensation or Pension' 
	WHEN docidDoctype = 'VA 21-526c Pre-Discharge Compensation Claim' then 'VA 21-526c Pre-Discharge Compensation Claim'
	WHEN docidDoctype = 'VA 21-526b, Veteran Supplemental Claim' then 'VA 21-526b, Veteran Supplemental Claim'
	WHEN docidDoctype = 'VA 21-526EZ, Fully Developed Claim (Compensation)' then 'VA 21-526EZ, Fully Developed Claim (Compensation)'
	ELSE 'Other'
END
as doctype
from document 
where ImageDateTime > '2015-01-01 0:0:0' 
and ftpstime is not null
and pbatch not like '02%'
and exists (select * from FTPDetails where AckTime is not null and Document.PBatch = FTPDetails.batchname)) T
group by doctype


select count(distinct dcsid ) 
from document 
where ImageDateTime > '2015-01-01 0:0:0' 
and dociddoctype like '%526%'
and ftpstime is not null
and pbatch not like '02%'


select count(distinct dcsid ) 
from document 
where ImageDateTime > '2015-01-01 0:0:0' 
--and dociddoctype like '%526%'
and ftpstime is not null
and pbatch not like '02%'



--check query sample
select * from document 
where docidDoctype = 'VA 21-526 Veterans Application for Compensation or Pension' 
and ftpstime is not null
and pbatch not like '02%'
and exists (select * from FTPDetails where AckTime is not null and Document.PBatch = FTPDetails.batchname)





---total count check sample
select count (*) from document 
where ImageDateTime > '2014-01-01 0:0:0' 
and ftpstime is not null
and pbatch not like '02%'
and exists (select * from FTPDetails where AckTime is not null and Document.PBatch = FTPDetails.batchname)



---select * from TurboscanNG1.dbo.batches where batchname = '02143440400901'


select * from docid where doctype like '%526%'