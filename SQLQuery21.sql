
select sum(filesize) / sum(uploadprocesstime) , convert(nvarchar,ftpstime,101)
from document where ftpstime > '1/4/2013 0:0:1' and ftpstime < '1/4/2013 23:59:59'
group by convert(nvarchar,ftpstime,101)


select sum(filesize) / sum(uploadprocesstime) , convert(nvarchar,ftpstime,101)
from document where ftpstime > '1/7/2013 0:0:1' and ftpstime < '1/7/2013 23:59:59'
group by convert(nvarchar,ftpstime,101)


select sum(filesize) / sum(uploadprocesstime) as avgbytesperPC, convert(nvarchar,ftpstime,101) as ftpdate
from document where ftpstime > '1/1/2013 0:0:1' and ftpstime < '1/11/2013 23:59:59'
group by convert(nvarchar,ftpstime,101) order by convert(nvarchar,ftpstime,101)

select * from stats

select distinct uploadtrigger from document where ftpstime  >'1/11/2013 10:00:00' and ftpstime < '1/11/2013 10:00:30'


select FileNumber ,count(*) from customerdata group by filenumber having count(*) > 1

select * from customerdata where filenumber = '004440558'

select * from document
where PBatch = '02123590000801' and docidDoctype like '%214%'