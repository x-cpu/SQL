
select CONVERT(date, v.downloadDate, 101) DownloadDate, DATEPART(hh, v.downloadDate) Hour, ISNULL(sum(CONVERT(int, v.numberPages)),0) Images
                                from vvFTPDetails v 
								where v.vendor = 'vetsgov'
								group by CONVERT(date, v.downloadDate, 101), DATEPART(hh, v.downloadDate)
								order by CONVERT(date, v.downloadDate, 101), DATEPART(hh, v.downloadDate)