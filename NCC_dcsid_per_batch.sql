
select pbatch, count(distinct dcsid) DCSIDs from document 
where pbatch like '17%'
and ImageDateTime >= '2019-02-18'
group by pbatch