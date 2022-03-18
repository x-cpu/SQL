select distinct c.FileNumber, c.dcsID, 
d.ETime UploadedtoDMHSdate, 
c.Firstname, c.Lastname, 
c.MiddleInitial, dd.received_date, 
c.RMN, 
m.trackingno,
dd.docidDoctype DocumentType  
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join document dd
on s.dcsid = dd.dcsID
left join [mtv-va-sql-1\p922].dva.dbo.manifestdcs m
on c.RMN = m.RMN
where s.ackTime is not null and s.batchname like '09%'
and dd.RMN not like 'RMNDIS%'



--another version below
select distinct s.veteranID, c.FileNumber, c.dcsID, 
d.ETime UploadedtoDMHSdate, 
c.Firstname, c.Lastname, 
c.MiddleInitial, 
--dd.received_date, 
c.RMN, 
m.trackingno
--,
--dd.docidDoctype DocumentType  
from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join dmhsFTPDetails d
on s.batchname = d.batchname
left join document dd
on s.dcsid = dd.dcsID
left join [mtv-va-sql-1\p922].dva.dbo.manifestdcs m
on c.RMN = m.RMN
where s.ackTime is not null and s.batchname like '09%'
and dd.RMN not like 'RMNDIS%'


--below not tested yet
select distinct X.veteranID, 
X.FileNumber,
X.dcsid,
d.ETime UploadedtoDMHSdate,
X.Firstname,
X.Lastname,
X.MiddleInitial,
X.RMN,
m.trackingno
FROM
(select distinct T.veteranID, T.batchname,
c.FileNumber,
T.dcsid,
c.Firstname,
c.Lastname,
c.MiddleInitial,
c.RMN
FROM
(select distinct s.veteranID, s.batchname, s.dcsid
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where d.RMN not like 'RMNDIS%' and s.ackTime is not null and s.batchname like '09%') T
left join CustomerDATA c
on T.dcsid = c.dcsID) X
left join dmhsFTPDetails d
on X.batchname = d.batchname
left join [mtv-va-sql-1\p922].dva.dbo.manifestdcs m
on X.RMN = m.RMN