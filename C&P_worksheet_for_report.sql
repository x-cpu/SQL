--VERSION WITH NULLS EVERYTHING AND FILECHARCOUNTS AND DOR ADDED ALSO ALSO HAS COMMENTS COLUMN FOR THE MANUAL
--VERSION WITH NULLS EVERYTHING AND FILECHARCOUNTS AND DOR ADDED ALSO ALSO HAS COMMENTS COLUMN FOR THE MANUAL
select v.downloadDate "Date Received", vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name", d.received_date DOR,
"Document Count" = '1', sum(d.numpages) "Image Count",
ISNULL(sum((len(c.Recvdate) - (len(c.Recvdate) - len(replace(c.Recvdate, '/', '')))) + len(c.FileNumber) + len(c.Lastname) + len(c.Firstname) + len(c.MiddleInitial)), 0) FileCharCounts, 
d.ImageID "Upload Filename", d.ftpstime "Date Uploaded", 
CASE
	WHEN d.comments = 'Skipped' then 'CMSERR0027'
	ELSE substring(d.Comments, 9, 11) 
END AS "FTU Error Code",
CASE
	WHEN DATEDIFF(day, v.downloadDate, d.ftpstime) >= 7 Then 'Manual'
	WHEN d.MA18doctype = 'Manual' Then 'Manual'
	Else ''
END AS "Comments"	
into docid.dbo.MasterLHIMSLA_20170323
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
where vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
--and v.DCSID = 'DCSLH141703700000020012'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.received_date, d.ftpstime, d.Comments, d.MA18doctype
order by v.downloadDate, d.ftpstime asc



select * from docid.dbo.MasterLHIMSLA_20170321
where [Date Uploaded] is null 
and [FTU Error Code] is null order by error

select * from docid.dbo.MasterLHIMSLA_20170323
where [Date Uploaded] is null 
and [FTU Error Code] is null order by error

select * from docid.dbo.MasterLHIMSLA_20170215
where [Date Uploaded] is null 
and [FTU Error Code] is null

--update m
--set m.error = mm.error
--from docid.dbo.MasterLHIMSLA_20170323 m
--left join docid.dbo.MasterLHIMSLA_20170321 mm
--on m.[Received Filename] = mm.[Received Filename]
--where m.[Date Uploaded] is null 
--and m.[FTU Error Code] is null


select * from docid.dbo.MasterLHIMSLA_20170215 where [Received Filename] =  '5_06400012_199883_1_Waller_L_0640_ECHO_result.pdf'

select * from docid.dbo.MasterLHIMSLA_20170321 
where [Date Uploaded] is null 
and [FTU Error Code] is null 
and error is null



select * from FTPError where imageid in (
'CSRA_MSL_170672915P0010200005',
'CSRA_MSL_170672915P0010200008',
'CSRA_MSL_170672915P0010200010',
'CSRA_MSL_170672915P0010200013',
'CSRA_MSL_170672915P0010200016')