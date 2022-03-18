select distinct dcsid, pbatch from document where pbatch in 
(select distinct batchname  from ftpdetails where etime > '5/27/2014 0:0:0' and etime <'5/27/2014 23:59:59.999') group by pbatch, dcsID

select * from document where pbatch = '02141410202301'


select * from Stats_IBML where kbatch = '02141410002701'

select count(distinct dcsid), count(distinct pbatch) from document where pbatch in 
(select distinct batchname  from ftpdetails where etime > '5/27/2014 0:0:0' and etime <'5/27/2014 23:59:59.999')