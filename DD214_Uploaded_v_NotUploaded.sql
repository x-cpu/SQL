
select T.PBatch Batchname, sum(T.Uploaded) "Uploaded (Docs)", sum(T.NotUploaded) "NotUploaded (Docs)"
FROM
(select distinct pbatch,
count(CASE WHEN ftpstime is not null then 1 END) as "Uploaded",
count(CASE WHEN ftpstime is null then 1 END) as "NotUploaded"
from document
where pbatch like '021713213059%'
group by PBatch) T
group by T.PBatch
order by Batchname


select * from document where pbatch like '021713213059%'





select * from document where pbatch = '02171321305908' 


select count(distinct imageid) from document where pbatch = '02171321305902' and ftpstime is not null

select count(distinct imageid) from document where pbatch = '02171321305902' and ftpstime is  null