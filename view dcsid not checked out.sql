----dcs
----view dcsid not checked out 
select distinct dcsid, RMN, max(imagedatetime) ExportDate, max(ftpstime) UploadDate_VBMS 
from document
where exists (select * from stats where document.PBatch = stats.kbatch)
and not exists (select * from Boxmapping where Boxmapping.dcsID = document.dcsID)
and pbatch like '02%' 
and SUBSTRING(pbatch, 3, 5) = '15253'
group by dcsid, RMN

--dcs
--view dcsid not checked out 
select distinct RMN, max(imagedatetime) ExportDate, max(ftpstime) UploadDate_VBMS 
from document
where exists (select * from stats where document.PBatch = stats.kbatch)
and not exists (select * from Boxmapping where Boxmapping.dcsID = document.dcsID)
and pbatch like '02%' 
and SUBSTRING(pbatch, 3, 5) = '15253'
group by dcsid, RMN

--cmp
--view dcsid not checked out 
select distinct d.dcsid, d.RMN, max(d.imagedatetime) ExportDate, max(f.AckTime) UploadDate_Portal
from document d
left join FTPDetails f
on d.PBatch = f.batchname
where exists (select * from stats where d.PBatch = stats.kbatch)
and not exists (select * from CMPBoxmapping where CMPBoxmapping.dcsID = d.dcsID)
and d.pbatch not like '02%' and d.PBatch not like '11%'
and SUBSTRING(d.pbatch, 3, 5) = '15240'
group by d.dcsID, d.RMN


---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
----dcs
----view dcsid not checked out 
select distinct d.dcsID, d.RMN, max(d.imagedatetime) ExportDate, max(d.ftpstime) UploadDate_VBMS, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial MI, d.PBatch Batchname 
from document d
left join CustomerDATA c
on d.PBatch = c.Pbatch
where exists (select * from stats where d.PBatch = stats.kbatch)
and not exists (select * from Boxmapping where Boxmapping.dcsID = d.dcsID)
and d.PBatch like '02%' 
and SUBSTRING(d.pbatch, 3, 5) = '15253'
group by d.dcsid, d.RMN, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.PBatch  

--x
--select distinct T.dcsID, T.Batchname, T.RMN, T.ExportDate, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial MI
--FROM
--(select distinct d.dcsID, d.RMN, max(d.imagedatetime) ExportDate, d.PBatch Batchname
--from document d
--where exists (select * from stats where d.PBatch = stats.kbatch)
--and not exists (select * from Boxmapping where Boxmapping.dcsID = d.dcsID)
--and d.pbatch like '02%' 
--and SUBSTRING(d.pbatch, 3, 5) = '15255'
--group by d.dcsID, d.RMN, d.PBatch) T
--left join CustomerDATA c
--on T.dcsID = c.dcsid
--where exists (select top (1) c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial
--from CustomerDATA where T.dcsID = dcsid)
--order by T.Batchname

select distinct T.dcsID, T.Batchname, T.RMN, T.ExportDate, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial MI
FROM
(select distinct d.dcsID, d.RMN, max(d.imagedatetime) ExportDate, d.PBatch Batchname
from document d
where exists (select * from stats where d.PBatch = stats.kbatch)
and not exists (select * from Boxmapping where Boxmapping.dcsID = d.dcsID)
and exists (select * from document where ftpstime is not null and d.dcsID = dcsid)
and d.pbatch like '02%' 
and SUBSTRING(d.pbatch, 3, 5) = '15267'
group by d.dcsID, d.RMN, d.PBatch) T
left join CustomerDATA c
on T.dcsID = c.dcsid
where exists (select top (1) c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial
from CustomerDATA where T.dcsID = dcsid)
order by T.Batchname


--cmp
--view dcsid not checked out 
--******add filenumber, firstname, lastname
select distinct d.dcsid, d.RMN, max(d.imagedatetime) ExportDate, max(f.AckTime) UploadDate_Portal, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial MI, d.PBatch Batchname
from document d
left join FTPDetails f
on d.PBatch = f.batchname
left join CustomerDATA c
on d.PBatch = c.Pbatch
where exists (select * from stats where d.PBatch = stats.kbatch)
and not exists (select * from CMPBoxmapping where CMPBoxmapping.dcsID = d.dcsID)
and d.pbatch not like '02%' and d.PBatch not like '11%'
and SUBSTRING(d.pbatch, 3, 5) = '15240'
group by d.dcsID, d.RMN, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial, d.PBatch
order by UploadDate_Portal, batchname


--x
--select distinct T.dcsID, T.Batchname, T.RMN, T.ExportDate, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial MI
--FROM
--(select distinct d.dcsID, d.RMN, max(d.imagedatetime) ExportDate, d.PBatch Batchname
--from document d
--where exists (select * from stats where d.PBatch = stats.kbatch)
--and not exists (select * from CMPBoxmapping where CMPBoxmapping.dcsID = d.dcsID)
--and d.pbatch not like '02%' and d.PBatch not like '11%'
--and SUBSTRING(d.pbatch, 3, 5) = '15240'
--group by d.dcsID, d.RMN, d.PBatch) T
--left join CustomerDATA c
--on T.dcsID = c.dcsid
--where exists (select top (1) c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial
--from CustomerDATA where T.dcsID = dcsid)
--order by T.Batchname

select distinct T.dcsID, T.Batchname, T.RMN, T.ExportDate, c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial MI
FROM
(select distinct d.dcsID, d.RMN, max(d.imagedatetime) ExportDate, d.PBatch Batchname
from document d
where exists (select * from stats where d.PBatch = stats.kbatch)
and not exists (select * from CMPBoxmapping where CMPBoxmapping.dcsID = d.dcsID)
and not exists (select * from FTPDetails where d.PBatch = batchname and AckTime is null)
and d.pbatch not like '02%' and d.PBatch not like '11%'
and SUBSTRING(d.pbatch, 3, 5) = '15240'
group by d.dcsID, d.RMN, d.PBatch) T
left join CustomerDATA c
on T.dcsID = c.dcsid
where exists (select top (1) c.FileNumber, c.Lastname, c.Firstname, c.MiddleInitial
from CustomerDATA where T.dcsID = dcsid)
order by T.Batchname

--cmp
--view dcsid not checked out 
--******add filenumber, firstname, lastname
select distinct d.dcsid
from document d
left join CustomerDATA c
on d.PBatch = c.Pbatch
where 
d.RMN = 'RMN20150828154600' 
and SUBSTRING(d.pbatch, 3, 5) = '15240'
group by d.dcsID




--RMN20150828154600

select * from FTPDetails where batchname = '03152400608501'

--select * from cmprecon where pbatch = '03152400608501'
IE4LD589-41R77P	317VB0903153404S	9/15/2015 12:37 PM	9/15/2015 1:59 PM	True	True

select * from dcscheckoutX1 where dcsid = 'IE4LD589-41R77P'
select * from Boxmapping where dcsid = 'IE4LD589-41R77P'
select * from Document where dcsid = 'IE4LD589-41R77P'


--admin docs
select top (1) docidDoctype from document where dcsid = 'IDK6VTQY-BIGWTX' and docidDoctype like 'STR%' 
select top (1) docidDoctype from document where dcsid = 'IDK6VTQY-BIGWTX' and docidDoctype not like 'STR%' 

--count admin docs
select count(*) from document where dcsid = 'IDK6VTQY-BIGWTX' and docidDoctype like 'STR%' 
select count(*) from document where dcsid = 'IDK6VTQY-BIGWTX' and docidDoctype not like 'STR%' 




select * from document where dcsid = 'IE4LD589-41R77P'
select * from Boxmapping where dcsid = 'IE4LD589-41R77P'

--cmp
--view batches not availabe in Turboscan but CheckedIN
                                select p.PBatch BatchName, p.RMN, p.InvTime InvTime from PhysicalBatch p 
                                where not exists (select * from stats where p.PBatch = stats.kbatch)
                                and not exists (select * from TurboscanNG1.dbo.batches where p.PBatch = BatchName)
                                and exists (select * from cmpcheckin where cmpcheckin.pbatch = pbatch)
                                and pbatch not like '02%'
                                and SUBSTRING(pbatch, 3, 5) = '15263'