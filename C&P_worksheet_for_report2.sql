select v.downloadDate "Date Received", v.vendor Vendor, name "Received Filename", d.FileNumber "Veteran FileNumber", c.Lastname + ',' + c.Firstname as "Veteran Name", d.received_date DOR,
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
END AS "Comments", lm.error Error	
--into docid.dbo.MasterLHIMSLA_20170215
from vvftpdetails v
left join CustomerDATA c
on v.DCSID = c.dcsID
left join document d
on v.DCSID = d.dcsID
left join docid.dbo.lhi_msla_20170215xxx lm
on v.name = lm.fname
where v.vendor in ('msla', 'lhi') 
--and v.sendAcknowledgeProcessing is not null
--and d.comments = 'success'
--and downloadDate < '2016-11-21'
--and v.DCSID = 'DCSLH141703700000020012'
group by v.downloadDate, v.vendor, v.name, d.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.ImageID, d.received_date, d.ftpstime, d.Comments, d.MA18doctype, lm.error
order by v.downloadDate, d.ftpstime asc



select * from docid.dbo.lhi_msla_20170215xxx


select * from docid.dbo.MasterLHIMSLA_20170215 order by Error desc