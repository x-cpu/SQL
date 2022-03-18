select distinct s.veteranID, c.pbatch, s.ackTime, c.zipcode, d.received_date ReceivedDate,  z.PMCdestination ROSiteID from CustomerDATA c
left join ZipcodeROJPMC z
on c.ZipCode = z.ZIPcode
left join smsDCSMapping s
on c.dcsID = s.dcsid
left join document d
on c.dcsID = d.dcsID
where c.Pbatch in (
select PBatch from PhysicalBatch where cordest = 'PMC') order by c.ZipCode



select distinct s.veteranID, c.pbatch BatchName, s.ackTime SMSAckTime, c.ZipCode, z.PMCdestination ROSiteID from CustomerDATA c
left join ZipcodeROJPMC z
on c.ZipCode = z.ZIPcode
left join smsDCSMapping s
on c.dcsID = s.dcsid
where pbatch in (
select PBatch from PhysicalBatch where cordest = 'PMC') order by c.ZipCode




select sum(images) from stats where releasedate >= '2017-04-18' and releasedate <= '2017-04-18 23:59:59.999'


select sum(images) from Stats_IBML where dat >= '2017-04-18' and releasedate <= '2017-04-18 23:59:59.999'


select sum(images) from Stats_IBML

select ImageID, PBatch, s.veteranID from document d
left join smsDCSMapping s
on d.dcsID = s.dcsid
where pbatch in (
select PBatch from PhysicalBatch where cordest = 'PMC') and docidDoctype like '%4142%'


select distinct PBatch from document where pbatch in (
select PBatch from PhysicalBatch where cordest = 'PMC')


select * from docid.dbo.docid where DocType like '%correspondence%'

select * from docid.dbo.Docid_SubDoctype where syskey = 67

select * from docid.dbo.docid where docid = '607'



select distinct kbatch from stats where kbatch in (
select PBatch from PhysicalBatch where cordest = 'PMC')

select PBatch from PhysicalBatch where cordest = 'PMC'


--delete from stats where kbatch in (
select * from ZipcodeROJPMC where zipcode = '14905'

--delete from smsDCSMapping where batchname in (
'04171090006801',
'04171090006901',
'04171090007001',
'04171090007101',
'04171090007201',
'04171090007301',
'04171090007401',
'04171090007501',
'04171090007601',
'04171090007701',
'04171090007801',
'04171090007901',
'04171090008001',
'04171090008101')

select * from Document where pbatch = '04171090008001'