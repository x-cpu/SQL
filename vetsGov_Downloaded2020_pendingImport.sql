select Y.DownloadDate, Y.UUID
FROM
(select X.DownloadDate, X.UUID,
CASE 
	When  (select count(*) from tmpfaxtifname 
	where datemodified >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 3, 0) 
	and SUBSTRING(tifname, 16, LEN(X.UUID)) = X.UUID) >= 1 then 1
	Else 0
	END Imported
FROM
(select distinct convert(nvarchar, v.downloadDate, 101) DownloadDate, v.uuid UUID
from vvFTPdetails v
where v.source = 'CSRA' and vendor = 'vetsgov'
and downloadDate >= DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 3, 0)
group by convert(nvarchar, v.downloadDate, 101), v.uuid) X) Y
where Y.Imported = 0
group by Y.DownloadDate, Y.UUID
order by convert(nvarchar, Y.DownloadDate, 101) 