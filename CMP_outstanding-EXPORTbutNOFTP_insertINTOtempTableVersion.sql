--INSERT
--exported and received from CACI PORTAL but no upload to VBMS "MASTER"
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate into x2 from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '03/20/2015 0:0:0'
order by min(cr.insertdate)

--no insert
--exported and received from CACI PORTAL but no upload to VBMS "MASTER"
select distinct cr.DCSID, cr.pBatch, min(cr.insertdate) PortalReceiveDate  from cmprecon cr 
where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
and cr.DocumentStatus = 'UPLOAD'
group by cr.DCSID, cr.pBatch
having MIN(cr.insertdate) < '03/20/2015 0:0:0'
order by min(cr.insertdate)


--pending CMP upload to VBMS
select distinct cr.DCSID, cr.pBatch BatchName, min(cr.insertdate) PortalReceiveDate  from cmprecon cr 
                            where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
                            and cr.DocumentStatus = 'UPLOAD'
                            group by cr.DCSID, cr.pBatch
                            having MIN(cr.insertdate) < DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                            order by min(cr.insertdate)

--count DCS
select count(T.DCSID), count(distinct T.batchname)
FROM (
select distinct cr.DCSID, cr.pBatch BatchName, min(cr.insertdate) PortalReceiveDate  from cmprecon cr 
                            where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
                            and cr.DocumentStatus = 'UPLOAD'
                            group by cr.DCSID, cr.pBatch
                            having MIN(cr.insertdate) < DATEADD(d,0,DATEDIFF(d,0,GETDATE())))T
                            --order by min(cr.insertdate)

--count Batches
select count(cr.pBatch)  from cmprecon cr 
                            where exists (select distinct d.dcsid from document d where d.pbatch not like '02%' and d.ftpstime is null and comments is null and cr.DCSID = d.dcsID)
                            and cr.DocumentStatus = 'UPLOAD'
                            --group by cr.DCSID, cr.pBatch
                            having MIN(cr.insertdate) < DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                            --order by min(cr.insertdate)




drop table x2

select * from x2
