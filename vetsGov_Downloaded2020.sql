select Y.DownloadDate, sum(ISNULL(Y.Images, 0)) Images_Downloaded, count(distinct Y.UUID) UUIDs_Downloaded,  
(count(distinct Y.UUID) - sum(ISNULL(Y.Imported, 0))) UUIDs_PendingImport
FROM
(select X.DownloadDate, X.UUID, X.Images,
CASE 
	When  (select count(*) from tmpfaxtifname 
	where datemodified >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 3, 0) 
	and SUBSTRING(tifname, 16, LEN(X.UUID)) = X.UUID) >= 1 then 1
	Else 0
	END Imported
FROM
(select distinct convert(date, v.downloadDate, 101) DownloadDate, v.uuid UUID, 
sum(CONVERT(int, v.numberPages)) +
sum(ISNULL(CONVERT(int, v.numberPages), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages1), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages2), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages3), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages4), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages5), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages6), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages7), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages8), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages9), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages10), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages11), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages12), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages13), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages14), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages15), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages16), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages17), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages18), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages19), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages20), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages21), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages22), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages23), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages24), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages25), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages26), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages27), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages28), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages29), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages30), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages31), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages32), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages33), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages34), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages35), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages36), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages37), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages38), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages39), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages40), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages41), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages42), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages43), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages44), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages45), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages46), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages47), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages48), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages49), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages50), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages51), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages52), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages53), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages54), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages55), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages56), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages57), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages58), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages59), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages60), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages61), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages62), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages63), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages64), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages65), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages66), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages67), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages68), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages69), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages70), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages71), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages72), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages73), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages74), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages75), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages76), 0)) +
sum(ISNULL(CONVERT(int, v.numberPages77), 0)) Images 
from vvFTPdetails v
where v.source = 'CSRA' and vendor = 'vetsgov'
and downloadDate >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 3, 0)
group by convert(date, v.downloadDate, 101), v.uuid) X) Y
group by Y.DownloadDate
order by convert(date, Y.DownloadDate, 101) desc
