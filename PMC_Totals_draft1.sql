
--select distinct s.veteranID, s.batchname, T.FaxName, T.RecvDate, S.ackTime SMSAckTime
--FROM
--(select distinct left(t.tifname, 14) BatchName, right(t.tifname, 25) FaxName, p.RecvDate from PhysicalBatch p
--left join tmpfaxtifname t
--on p.PBatch = t.pbatch
--where exists (select * from physicalbatch where cordest = 'pmc' and t.pbatch = PBatch)) T
--left join smsDCSMapping S
--on T.BatchName = s.batchname







select distinct s.veteranID, s.ackTime SMSAckTime, s.errTime 
from smsDCSMapping s
where exists 
(select * from physicalbatch where cordest = 'pmc' and s.batchname = PBatch) and s.ackTime is not null