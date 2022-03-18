SELECT  DISTINCT top (5) d.DCSID, d.PBatch, Comments 
							FROM Document d
                            LEFT JOIN DD214FTU p
                            ON d.DCSID = p.DCSID
                            WHERE d.ImageDateTime > '12/01/2016' AND LEFT(d.PBatch, 2) = '02' 
                                AND d.ftpstime IS NULL 
                                AND d.RMN = 'RMNDD214'
                                --and d.pbatch = '02162991113507'
                                -- (comments like '%Detail: CMSERR0027%' OR comments like '%Detail: CMSERR0028%' )
                                AND p.DCSID IS NULL
								AND not exists (select * from DD214FTU where d.dcsID = dcsID)




select * from document where pbatch = '02162991113504'

select * from DD214FTU 


select * from document where rmn = 'rmndd214' order by ImageDateTime asc


select * from DD214FTU where insertdate > '2017-03-21'

select * from smsDCSMapping where batchname like '16%' and insertdate > '2017-03-21'

--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate > '2017-03-21' and insertdate < '2017-03-22'


--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate > '2017-03-22' and insertdate < '2017-03-24'

--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate >= '2017-03-27'

--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate >= '2017-03-28'

--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate >= '2017-03-31'

--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate >= '2017-03-31'


--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate >= '2017-04-07'



--details for TOM
select DCSID, veteranID, ackTime SMSAckTime from smsDCSMapping 
where batchname like '16%' and insertdate >= '2017-04-14'


select * from smsDCSMapping where dcsid = 'DCSID021634013037110010'

select * from CustomerDATA where dcsid = 'DCSID021634013037110010'


select * from dmhsFTPDetails where batchname = '16170860000020'

--update dmhsFTPDetails
--set batchname = '16170810000476x'
--where batchname = '16170810000476'



--details for daily automated email report
select ISNULL(sum(T.documents), 0), ISNULL(sum(T.Images), 0)
FROM
(select count(distinct d.ImageID) Documents, sum(d.NumPages) Images
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.batchname like '16%' 
and s.ackTime >= '2017-03-01') T



and d.dcsID in (
'DCSID021635810040280291',
'DCSID021635810040280292',
'DCSID021635810040280295')



select * from document where dcsid in (
'DCSID021635810040280291',
'DCSID021635810040280292',
'DCSID021635810040280295')