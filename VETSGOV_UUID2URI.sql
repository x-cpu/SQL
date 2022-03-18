--ready for ack
select * 
from vvFTPDetails v
left join DCSID_UUID_mapping u
on v.uuid = u.uuid
left join smsDCSMapping s
on u.DCSID = s.dcsid
where s.ackTime is not null
and u.DCSID <>  'DCSID041813005004010064'
and v.sendAcknowledgeProcessing is null

--select * from DCSID_UUID_mapping

select * from dmhsFTPDetails where batchname = '04181240500401'

select * from smsDCSMapping where batchname = '04181240500401'

--outstanding
select uuid, uploadDate VetsGov_Date from vvFTPDetails where source = 'csra' and sendAcknowledgeProcessing is null
order by uploadDate