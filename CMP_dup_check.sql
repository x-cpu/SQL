--cmp query
select dcsid,count(distinct received_date), pbatch from document where imagedatetime > '5/17/2014' and pbatch in (
'03140870600101',
'03141130600601',
'03141200601101',
'03141220600701',
'03141250600701',
'03141260601001',
'03141270601501',
'03141320601501',
'03141330600901',
'03141360600701',
'03141360600901',
'03141390600201')
group by dcsid, PBatch
having count(distinct received_date)>1


select distinct received_date from document where pbatch like '03%'

select * from document where received_date = '01/01/1800' and pbatch like '03%'

select * from PhysicalBatch where PBatch = '03141330600101'