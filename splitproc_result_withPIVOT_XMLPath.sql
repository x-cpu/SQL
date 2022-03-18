select T.Queue, T.Vendor, T.[CM Packet #],
T.[Packet Status], T.[VA DOR], T.[Portal Entry Date],
T.[Queue Entry Date], T.[Doc Type], T.EMERG,
T.[Confirmation #], T.[Assigned User], T.[Assigned User Name],
(select CONVERT(nvarchar, xx.newPacketID) + '; '
	from xSPLITS_20201231 xx
	where T.[CM Packet #] = xx.[CM Packet #]
	FOR XML PATH('')) [NewPacketID(s)]
FROM
(select distinct x.Queue, x.Vendor, x.[CM Packet #],
x.[Packet Status], x.[VA DOR], x.[Portal Entry Date],
x.[Queue Entry Date], x.[Doc Type], x.EMERG,
x.[Confirmation #], x.[Assigned User], x.[Assigned User Name]
from xSPLITS_20201231 x) T