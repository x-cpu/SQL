select distinct s.batchname, max(d.STime) UploadDateTime, s.ackTime, s.errTime
from smsDCSMapping  s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate > '2017-02-02' and s.ackTime is null
and d.STime > '2017-02-02'
group by s.batchname, s.ackTime, s.errTime


select distinct s.batchname, max(d.STime) UploadDateTime, s.ackTime, s.errTime
from smsDCSMapping  s
left join dmhsFTPDetails d
on s.batchname = d.batchname
where s.insertdate > '2017-02-06' and s.ackTime is null
and d.STime > '2017-02-06'
group by s.batchname, s.ackTime, s.errTime



select * from dmhsCMPxmldownload where batchname in (
'04170300007401',
'04170300007601',
'04170300007701')

select * from smsDCSMapping where batchname in (
'04170300007401',
'04170300007601',
'04170300007701')

select * from docid where docid = '452'


select * from docid.dbo.Docid_CMPSubDoctype where docid = '452'

select * from smsDCSMapping where batchname		= '04170300008201'


select ISNULL(count(distinct d.imageid), 0) FaxDocs
                            from smsDCSMapping s
                            left join document d
                            on s.dcsid = d.dcsID
                            where s.ackTime is not null and s.batchname like '04%' and s.acktime >= '2017-02-01' and s.acktime <= '2017-02-03'
							and batchname = '04170300008201'


select * from document where pbatch in (
'04170300007401',
'04170300007601',
'04170300007701') and docidDoctype = 'Bank Statement'



select * from smsDCSMapping where acktime > '2017-02-05' order by acktime desc

select * from smsDCSMapping where batchname = '04170340006301'

select 