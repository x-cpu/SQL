
select convert(nvarchar, downloaddate, 101) DownloadDate, count(distinct uuid) UUIDs from vvFTPDetails where source = 'csra' 
                            and vendor = 'vetsgov'
                            and sendAcknowledgeProcessing is null
                            and downloadDate <= DATEADD(day, -2, GETDATE())
							group by convert(nvarchar, downloaddate, 101)