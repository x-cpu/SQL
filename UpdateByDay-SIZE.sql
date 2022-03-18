select convert(nvarchar, ftpstime, 101) as date, sum(filesize) TotalSize from Document where ftpstime > '09/01/2015 0:0:0'
--and pbatch not like '02%'
and pbatch  like '02%'
group by convert(nvarchar, ftpstime, 101)