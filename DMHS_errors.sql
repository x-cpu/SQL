--DMHS error for past 3 days
select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate > DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 3, 0)
                            order by d.insertdate desc