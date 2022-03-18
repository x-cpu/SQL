---updated with PortalErrors
select distinct f.comments PortalUpdateError, T.PBatch BatchName, T.CheckInDate, T.POBox2, T.DocIDDate, T.ExportDate, T.PortalUploadDate
FROM
(select p.PBatch, p.InvTime CheckInDate, p.CRCDestination POBox2, max(tsa.TimeStamp) DocIDDate, max(s.releasedate) ExportDate, max(f.eTime) PortalUploadDate from PhysicalBatch p 
join TS_Audit tsa
on p.PBatch = tsa.BatchName
join stats s
on p.PBatch = s.kbatch
join FTPDetails f
on p.PBatch = f.batchname
where PBatch in (
'04142660000701')
and tsa.TSModule = 'DocID' and f.AckTime is not null and f.comments is null
group by p.PBatch, p.InvTime, p.CRCDestination) T
left join FTPDetails f
on T.PBatch = f.batchname and  f.comments is not null
order by batchname





select p.PBatch, p.InvTime CheckInDate, p.CRCDestination POBox2, max(tsa.TimeStamp) DocIDDate, max(s.releasedate) ExportDate, max(f.eTime) PortalUploadDate from PhysicalBatch p 
join TS_Audit tsa
on p.PBatch = tsa.BatchName
join stats s
on p.PBatch = s.kbatch
join FTPDetails f
on p.PBatch = f.batchname
where PBatch in (
'03143600627501',
'03150020608601',
'03150020608701',
'03150050610901',
'03150050615201',
'03150060606101',
'03150090613001',
'03150120611201',
'03150140803301',
'03150200624801',
'03150200639701',
'03150260613201',
'03150260630901',
'03150260632701',
'03150280604601',
'03150300604901',
'03150300641301',
'03150330612801',
'03150330627201',
'03150330642101',
'03150370635001',
'03150370637601',
'03150400600701',
'03150400603601',
'03150400608701',
'03150410600701',
'03150580622701',
'04150140002801',
'04150150000401',
'04150210002901',
'04150240001201',
'04150280000201',
'04150280002501',
'04150290000801',
'04150310000401',
'04150360002201')
and tsa.TSModule = 'DocID' and f.AckTime is not null and f.comments is null
group by p.PBatch, p.InvTime, p.CRCDestination 


select * from tr

select * from PhysicalBatch where pbatch = '04150560002401'


select * from TS_Audit where BatchName = '03150590600501'