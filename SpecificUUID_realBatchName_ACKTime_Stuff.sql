select distinct T.UUID, T.PacketID, T.BatchName, T.seq, d.ETime, T.ackTime,
FROM
(select distinct u.uuid, u.veteranID PacketID, s.acktime,
CASE
	WHEN a.mailPacketID is not null then s.BatchName + RIGHT('00000000'+CAST(u.veteranID as varchar(8)),8)
	WHEN a.mailPacketID is null then s.BatchName
	END BatchName, x.seq
from DCSID_UUID_mapping u
left join AutoCestRecon a
on u.VeteranID = a.mailPacketID
left join smsDCSMapping s
on u.DCSID = s.dcsid
left join xuuid3 x
on u.UUID = x.uuid
where exists (select * from xuuid3 where u.UUID = uuid))T
left join dmhsFTPDetails d
on T.BatchName = d.batchname
order by T.seq



--mini version of above
select distinct u.uuid, u.veteranID PacketID, s.acktime,
CASE
	WHEN a.mailPacketID is not null then s.BatchName + RIGHT('00000000'+CAST(u.veteranID as varchar(8)),8)
	WHEN a.mailPacketID is null then s.BatchName
	END BatchName, x.seq
from DCSID_UUID_mapping u
left join AutoCestRecon a
on u.VeteranID = a.mailPacketID
left join smsDCSMapping s
on u.DCSID = s.dcsid
left join xuuid3 x
on u.UUID = x.uuid
where exists (select * from xuuid3 where u.UUID = uuid)