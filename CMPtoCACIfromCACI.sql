--baltimore
select count(distinct dcsid) as dcscnt , count(*) as docs, sum(numpages) from document where pbatch in 
--(select distinct pbatch from physicalbatch where pobox ='baltimore' or crcdestination = 'baltimore'
(select distinct batchname from ftpdetails where acktime is not null )
--and ftpstime is not null 

--total cmp to portal
select count(distinct dcsid) as dcscnt , count(*) as docs, sum(numpages) images from document where pbatch in 
(select distinct batchname from ftpdetails where acktime is not null )


--total cmp to portal
select count(distinct dcsid) as dcscnt , count(*) as docs, sum(numpages) images from document where pbatch in 
(select distinct batchname from ftpdetails where acktime is not null )
and dcsid in (select distinct dcsid from cmprecon)




dcscnt	docs	(No column name)
18166	53243	310290



