--vetsGov received info
select uuid, veteranFirstName, veteranLastName, fileNumber, name, name1, name2, name3, sendAcknowledgeReceipt
from vvFTPDetails
where source = 'Vets.gov'
and downloadDate >= '2018-04-12 12:30:00.001'


--vetsGov received info
select uuid, name, name1, name2, name3, sendAcknowledgeReceipt
from vvFTPDetails
where source = 'Vets.gov'
and downloadDate >= '2018-04-12 12:30:00.001'