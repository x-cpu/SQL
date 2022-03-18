select distinct dcsid, sum(numpages) #ofIMGS, max(convert(date, imagedatetime, 101)) ExportDate, pbatch 
from document 
where comments like '%unable to upload%' 
and ImageDateTime < '2014-04-01 0:0:0' 
and ftpstime is null 
and pbatch not in (select distinct pbatch from pbatch_comments)
group by dcsID, pbatch
order by ExportDate