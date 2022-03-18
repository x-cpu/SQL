--daily report
select v.name FileName, v.DCSID, s.veteranID, d.NumPages Images, v.sendAcknowledgeProcessing CSRA_AckProcTime, s.ackTime SMS_AckTime, v.Comments  
from vvFTPDetails v 
left join smsDCSMapping s
on v.DCSID = s.dcsid
left join document d
on v.DCSID = d.dcsID
where v.vendor = 'callCenter'
and v.uploadDate > '2017-03-03' and v.dcsid is not null


--daily automated emailed report
select sum(T.Documents) Documents, sum(T.Images) Images
FROM
(select count(distinct v.DCSID) Documents, sum(d.NumPages) Images  
from vvFTPDetails v 
left join smsDCSMapping s
on v.DCSID = s.dcsid
left join document d
on v.DCSID = d.dcsID
where v.vendor = 'callCenter'
and v.uploadDate > '2017-03-03' and v.dcsid is not null
group by v.DCSID) T


--daily report
select v.name FileName, v.DCSID, s.veteranID, d.NumPages Images, v.sendAcknowledgeProcessing CSRA_AckProcTime, s.ackTime SMS_AckTime, v.Comments  
from vvFTPDetails v 
left join smsDCSMapping s
on v.DCSID = s.dcsid
left join document d
on v.DCSID = d.dcsID
where v.vendor = 'callCenter'
and v.uploadDate > '2017-03-03' and v.dcsid is not null





--by pbatch
select v.name FileName, v.DCSID, s.veteranID, d.NumPages Images, v.sendAcknowledgeProcessing CSRA_AckProcTime, s.ackTime SMS_AckTime, v.Comments  
from vvFTPDetails v 
left join smsDCSMapping s
on v.DCSID = s.dcsid
left join document d
on v.DCSID = d.dcsID
where v.vendor = 'callCenter'
and v.uploadDate > '2017-03-03' and v.dcsid is not null
and d.pbatch = '17170660000001'

--daily report with failed to upload to SMS
select v.name FileName, v.DCSID, s.veteranID, d.NumPages Images, v.sendAcknowledgeProcessing CSRA_AckProcTime, s.ackTime SMS_AckTime, s.errTime SMS_ErrTime, v.Comments  
from vvFTPDetails v 
left join smsDCSMapping s
on v.DCSID = s.dcsid
left join document d
on v.DCSID = d.dcsID
where v.vendor = 'callCenter'
and v.uploadDate > '2017-03-03' and v.dcsid is not null
and s.errTime is not null
and s.ackTime is null



select distinct v.name FileName, v.DCSID, s.veteranID, d.NumPages Images, v.sendAcknowledgeProcessing CSRA_AckProcTime, s.ackTime SMS_AckTime, s.errTime, dd.packageError, dd.documentError
from vvFTPDetails v 
left join smsDCSMapping s
on v.DCSID = s.dcsid
left join document d
on v.DCSID = d.dcsID
left join dmhsCMPxmldownload dd
on SUBSTRING(s.xmlFilename, 0, 16) = SUBSTRING(dd.XMLfilename, 0, 16)
where v.vendor = 'callCenter' and s.errTime is not null
and v.uploadDate > '2017-03-03' and v.dcsid is not null


select * from vvFTPDetails where vendor = 'callcenter' 
and uploadDate > '2017-03-03'
and downloadStatus = 'false'
order by uploadDate desc

select * from vvFTPDetails where vendor = 'callcenter' 
and uploadDate > '2017-03-03'
and downloadStatus = 'true'
order by uploadDate desc



select * from vvFTPDetails where DCSID = 'DCSCC171706600000010020'


select * from CustomerDATA where pbatch = '17170680000001'


select * from vvFTPDetails where comments = 'The underlying connection was closed: An unexpected error occurred on a receive.'


select * from smsDCSMapping where dcsid = 'DCSCC171706800000040001'


select * from smsDCSMapping where batchname = '17170680000004'

select * from dmhsFTPDetails where batchname = '17170680000004'

select * from smsDCSMapping where veteranID = '1235384'


select * from vvFTPDetails where name = '27-0820 - Report of General Information - UDO_Muschlitz.pdf'

--update vvFTPDetails
--set sendAcknowledgeProcessing = '2017-03-22 16:01:14.780'
--where name = '27-0820 - Report of General Information - UDO_Muschlitz.pdf'