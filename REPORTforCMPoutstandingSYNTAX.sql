select distinct f.comments PortalUpdateError, T.PBatch BatchName, T.POBox2, T.PortalUploadDate
FROM
(select p.PBatch, p.CRCDestination POBox2, max(f.eTime) PortalUploadDate from PhysicalBatch p 
join FTPDetails f
on p.PBatch = f.batchname
where PBatch in (
'03143560614501',
'03143560618501',
'03143570601101',
'03143600627501',
'03150020606801',
'03150020608601',
'03150020608701',
'03150020614301',
'03150020631001',
'03150050610901',
'03150050615201',
'03150060606101',
'03150080615701',
'03150090613001',
'03150090621101',
'03150090623501',
'03150120600201',
'03150120611201',
'03150160637901',
'03150160800501',
'03150200639701',
'03150220604101',
'03150220604201',
'03150230609201',
'03150230611001',
'03150230626301',
'03150240604201',
'03150240605401',
'03150260613201',
'03150260630901',
'03150280604601',
'03150290602901',
'03150300605301',
'03150300617501',
'03150300617601',
'03150300639301',
'03150300641301',
'03150310612701',
'03150310614301',
'03150330612801',
'03150330629401',
'03150330642101',
'03150360603601',
'03150360612101',
'03150370637601',
'03150400608701',
'03150400623501',
'03150410613501',
'03150410616801',
'03150410625101',
'03150440606201',
'03150440617101',
'03150440628001',
'03150440629901',
'03150440636701',
'03150480600401',
'03150480620601',
'04150090000501',
'04150140002801',
'04150150000401',
'04150210000201',
'04150210002901',
'04150280000201',
'04150360002201',
'04150430001201',
'04150440001501',
'04150480001001',
'04150510002601',
'03150480620601')
and f.AckTime is not null and f.comments is null
group by p.PBatch, p.CRCDestination) T
left join FTPDetails f
on T.PBatch = f.batchname and  f.comments is not null
left join document d
on T.PBatch = d.PBatch
order by batchname


select pbatch, count (distinct dcsid) from document where pbatch in (
'03143560614501',
'03143560618501',
'03143570601101',
'03143600627501',
'03150020606801',
'03150020608601',
'03150020608701',
'03150020614301',
'03150020631001',
'03150050610901',
'03150050615201',
'03150060606101',
'03150090613001',
'03150090621101',
'03150090623501',
'03150120600201',
'03150120611201',
'03150160637901',
'03150160800501',
'03150200639701',
'03150220604101',
'03150220604201',
'03150230611001',
'03150230626301',
'03150240604201',
'03150240605401',
'03150260613201',
'03150260630901',
'03150280604601',
'03150290602901',
'03150300605301',
'03150300617501',
'03150300617601',
'03150300639301',
'03150300641301',
'03150310612701',
'03150310614301',
'03150330612801',
'03150330629401',
'03150330642101',
'03150360603601',
'03150360612101',
'03150370637601',
'03150400608701',
'03150400623501',
'03150410613501',
'03150410625101',
'03150440606201',
'03150440617101',
'03150440628001',
'03150440629901',
'03150440636701',
'03150480600401',
'04150090000501',
'04150140002801',
'04150150000401',
'04150210000201',
'04150210002901',
'04150280000201',
'04150360002201',
'04150430001201',
'04150440001501',
'04150480001001',
'04150510002601')
group by PBatch
order by PBatch