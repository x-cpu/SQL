select x.vendorpacketid OrigPacketID, x.dcsid OrigDCSID, x.newpbatch NewBatchname, s.veteranID PacketID
FROM
(select distinct p.vendorpacketid, s.dcsid, c.newpbatch
from splitpackets p
left join smsDCSMapping s
on p.vendorpacketid = s.veteranID
left join CMPRescan c
on s.dcsid = c.dcsid) x
left join smsDCSMapping s
on x.newpbatch = s.batchname
order by x.vendorpacketid

select x.vendorpacketid OrigPacketID, x.dcsid OrigDCSID, x.newpbatch NewBatchname,
--, s.veteranID PacketID,
   (SELECT '; ' + CONVERT(nvarchar, s.veteranID)
    FROM smsdcsmapping s
    WHERE s.batchname = x.newpbatch
    FOR XML PATH('')) [SPLIT_VeteranIDs]
FROM
(select distinct p.vendorpacketid, s.dcsid, c.newpbatch
from splitpackets p
left join smsDCSMapping s
on p.vendorpacketid = s.veteranID
left join CMPRescan c
on s.dcsid = c.dcsid) x
--left join smsDCSMapping s
--on x.newpbatch = s.batchname
order by x.vendorpacketid

select T.SPLIT_VeteranIDs, T.OrigPacketID
FROM
(select x.vendorpacketid OrigPacketID, x.dcsid OrigDCSID, x.newpbatch NewBatchname,
--, s.veteranID PacketID,
   (SELECT '; ' + CONVERT(nvarchar, s.veteranID)
    FROM smsdcsmapping s
    WHERE s.batchname = x.newpbatch
    FOR XML PATH('')) [SPLIT_VeteranIDs]
FROM
(select distinct p.vendorpacketid, s.dcsid, c.newpbatch
from splitpackets p
left join smsDCSMapping s
on p.vendorpacketid = s.veteranID
left join CMPRescan c
on s.dcsid = c.dcsid) x)T
--left join smsDCSMapping s
--on x.newpbatch = s.batchname
--order by x.vendorpacketid) T
order by T.SPLIT_VeteranIDs



--update splitpackets
--set NewBatchName = Y.NewBatchname
--FROM 
--(select T.SPLIT_VeteranIDs, T.OrigPacketID, T.NewBatchname
--FROM
--(select x.vendorpacketid OrigPacketID, x.dcsid OrigDCSID, x.newpbatch NewBatchname,
----, s.veteranID PacketID,
--   (SELECT '; ' + CONVERT(nvarchar, s.veteranID)
--    FROM smsdcsmapping s
--    WHERE s.batchname = x.newpbatch
--    FOR XML PATH('')) [SPLIT_VeteranIDs]
--FROM
--(select distinct p.vendorpacketid, s.dcsid, c.newpbatch
--from splitpackets p
--left join smsDCSMapping s
--on p.vendorpacketid = s.veteranID
--left join CMPRescan c
--on s.dcsid = c.dcsid) x)T)Y
--where Y.OrigPacketID = splitpackets.vendorpacketid


select * from splitpackets

select * from CMPRescan
select * from smsDCSMapping where batchname = '04200360800401'
select * from smsDCSMapping where batchname = '04200370500901'
--SELECT 
--   SS.SEC_NAME, 
--   (SELECT '; ' + US.USR_NAME 
--    FROM USRS US
--    WHERE US.SEC_ID = SS.SEC_ID
--    FOR XML PATH('')) [SECTORS/USERS]
--FROM SALES_SECTORS SS
--GROUP BY SS.SEC_ID, SS.SEC_NAME
--ORDER BY 1



select * from stats where kbatch in (
'04200360800101',
'04200360800201',
'04200360800301',
'04200360800401',
'04200360800501',
'04200360800601',
'04200360800701',
'04200360800801',
'04200360800901',
'04200360801001',
'04200360801101',
'04200360801201',
'04200360801301',
'04200360801401',
'04200360801501',
'04200360801601',
'04200360801701',
'04200360801801',
'04200360801901',
'04200100800701',
'04200110801701')




select * from PhysicalBatch where PBatch in (
'04200360800101',
'04200360800201',
'04200360800301',
'04200360800401',
'04200360800501',
'04200360800601',
'04200360800701',
'04200360800801',
'04200360800901',
'04200360801001',
'04200360801101',
'04200360801201',
'04200360801301',
'04200360801401',
'04200360801501',
'04200360801601',
'04200360801701',
'04200360801801',
'04200360801901',
'04200100800701',
'04200110801701')
