
select x.PBatch
FROM
(select distinct PBatch, count(ImageID) ImageID, 
case
When docidDoctype = 'Correspondence' then 1
When docidDoctype <> 'Correspondence' then 0
END as totDocTYPE
from document where ImageDateTime > '2016-07-01'
group by PBatch, ImageID, docidDoctype) x
group by x.PBatch
having count(x.ImageID) = sum(x.totDocTYPE)

