select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate >= '2018-05-01'
							and s.ackTime is null
                            order by d.insertdate desc




select distinct d.documentError DocumentError, count(distinct s.batchname) Batches, count (*) Errors, CONVERT(date, d.insertdate, 101) ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate >= '2018-05-01'
							and s.ackTime is null
							group by d.documentError, CONVERT(date, d.insertdate, 101)
							order by CONVERT(date, d.insertdate, 101), d.documentError

--FUNKY COOL DATE FORMAT FOR MY DIRs
select CONVERT(nvarchar, max(etime), 112) from dmhsFTPDetails where batchname = '04181170001601'


--DMHS error for past 3 days
select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate > DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()) - 3, 0)
                            order by d.insertdate desc

--master fuckin step - see what shiot we have
--DMHS error for specific date
select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate >= '2018-05-09' and d.insertdate <'2018-05-09 23:59:59.999'
							and s.ackTime is not null
							and d.batchname like '17%'
							--and d.documentError like 'Invalid DocumentDocID%'
                            order by d.insertdate, batchname desc


--master fuckin step - see what shiot we have
--DMHS error for specific date
select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate >= '2018-05-01' and d.insertdate <'2018-05-31 23:59:59.999'
							and s.ackTime is null
							and d.batchname like '17%'
							--and d.documentError like 'Invalid DocumentDocID%'
                            order by d.insertdate, batchname desc

select * from docid.dbo.Docid_CMPSubDoctype order by LEN(docid) desc

select * from docid.dbo.Docid_CMPSubDoctype where docid = '954'
select * from docid.dbo.docid where docid = '954'
select * from docid.dbo.docid where doctype like '%0820 Report of General Information%'
select * from document where pbatch like '17%' and ImageDateTime > '2018-06-12' 

select * from docid.dbo.Docid_CMPSubDoctype where subDoctype like '%CAPRI%'
select * from docid.dbo.Docid_CMPSubDoctype where DocType like '%CAPRI%'
--VA 27-0820 Report of General Information

--step 1 to get DCSID and errTime/insertdate for DIR containing batch.zip
select * from smsDCSMapping where veteranID = '3686087'

--step 2 to get all PDFs
select * from document where dcsid = 'DCSID041812300089010045'

--step 3
--update dmhsFTPDetails
--set batchname = '04181180001201', comments = null
--where batchname = '04181180001201.org'


 
select * from dmhsCMPxmldownload where batchname = '04181170003601' 
order by insertdate desc

select * from smsDCSMapping where veteranID = '3675108'

select * from dmhsFTPDetails where batchname = '04181260001301'
select * from dmhsFTPDetails where batchname = '04181260001301.org'

select * from smsDCSMapping where batchname = '04181180001201'
select * from smsDCSMapping where ackTime > '2018-06-15' order by ackTime desc

select * from dmhsFTPDetails 
where ETime > '2018-06-15 08:00:00'
and batchname like '04%' order by ETime

--replace 802 with 475
--".DocumentDocID" Value="00802"
--".DocumentDocID" Value="00475"

--replace 856 with 073
--".DocumentDocID" Value="00856"
--".DocumentDocID" Value="00073"

--replace 181 with 034
--".DocumentDocID" Value="00181"
--".DocumentDocID" Value="00034"

--replace 344 with 058
--".DocumentDocID" Value="00344"
--".DocumentDocID" Value="00058"

--replace 656 with 490
--".DocumentDocID" Value="00656"
--".DocumentDocID" Value="00490"



select distinct s.veteranID, s.dcsid, d.ImageID + '.pdf' PDF, s.xmlFilename
from smsDCSMapping s
left join document d
on s.dcsid = d.dcsID
where s.batchname = '04181180001201'
and s.ackTime is null and s.errTime is not null

--DMHS error for specific date
select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate >= '2018-06-15' and d.insertdate <'2018-06-15 23:59:59.999'
							and s.ackTime is null
							and d.batchname like '04%'
                            order by d.insertdate, batchname desc


select distinct s.veteranID, d.XMLfilename, d.batchname BatchName, d.packageError PackageError, d.documentError DocumentError, d.insertdate ErrorDate
                            from dmhsCMPxmldownload d
                            left join smsDCSMapping s
                            on left(d.xmlFilename, len(d.xmlFilename) - 4) = left(s.xmlFilename, len(s.xmlFilename) - 4)
                            where type = '.err' 
                            and d.insertdate >= '2018-05-01' and d.insertdate <'2018-05-31 23:59:59.999'
							and s.ackTime is null
							and (d.batchname like '17%' or d.batchname like '04%')
							--and d.documentError like 'Invalid DocumentDocID%'
                            order by packageError, d.insertdate, batchname desc


--4198