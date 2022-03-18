--this is it
select distinct XMLfilename, insertdate  from cmpxmldownload where insertdate > '2015-06-10 11:00:00' 
and not exists (select * from cmprecon where  insertdate > '2015-06-10 11:00:00'  and cmpxmldownload.XMLfilename = substring(cmprecon.XMLfilename, 1, 26))
group by xmlfilename, insertdate



select * from cmprecon where insertdate > '2015-06-10 11:00:00' and DocumentStatus <> 'UPLOAD'

select * from cmprecon where XMLfilename = '04151350003601-14dddfc3023.xml'

select distinct substring(XMLfilename, 1, 26) from cmprecon where insertdate > '2015-06-08 16:00:00' 

select distinct XMLfilename  from cmpxmldownload where insertdate > '2015-06-08 16:00:00' 
and not exists (select * from cmprecon where  insertdate > '2015-06-08 16:00:00'  and cmpxmldownload.XMLfilename = substring(cmprecon.XMLfilename, 1, 26))


select * from cmpxmldownload where XMLfilename = '03151520622001-14dd943e172'


select * from cmprecon where XMLfilename = '03151520622001-14dd943e172.xml'
select * from cmprecon where dcsid = '03151520622001-14dd943e172.xml'


select * from PhysicalBatch_bck


select * from stats where kbatch = '02151530401704'
02151530401704


