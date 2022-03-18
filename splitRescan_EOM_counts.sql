select count(distinct imageid) DOCS , sum(numpages) IMAGES from document where imageid in 
(select distinct imageid from cmprecon where documentstatus in ('rescan','split')
and insertdate >= '2016-02-01 0:0:0' and insertdate <= '2016-02-16 23:59:59.999' )



select * from CustomerDATA where dcsid = 'DCSID031434506183010002'


select * from Boxmapping where shipmentno = '95'


select * from docid.dbo.rescan201508 where
not exists (select * from cmprecon where documentstatus in ('rescan','split')
and insertdate >= '2015-08-01 0:0:0' and insertdate <= '2015-08-31 23:59:59.999' and docid.dbo.rescan201508.imageid = cmprecon.ImageID)


select imageid, pbatch, dcsid, numpages, documentstatus, xmlfilename, insertdate from docid.dbo.rescan201508 where
not exists (select * from cmprecon where documentstatus in ('rescan','split')
and insertdate >= '2015-08-01 0:0:0' and insertdate <= '2015-08-31 23:59:59.999' and docid.dbo.rescan201508.imageid = cmprecon.ImageID)
and imageid = 'CACI_CMP_151962902P001062295'



select imageid, pbatch, dcsid, numpages, documentstatus, xmlfilename, insertdate from cmprecon where ImageID = 'CACI_CMP_151962902P001062295'

alter table [dbo].[shovlocations]      enable change_tracking with (track_columns_updated = on)
grant select on [dbo].[shovlocations] to [csradva_reader]