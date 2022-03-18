select * from ftpdetailsu where acktime is null and comments like '%receipt date%'
and ftpdetailsu.batchname not in (select ftpdetailsu.batchname where acktime is not null)
order by etime desc 

select batchname from ftpdetailsu fu where  exists (
select * from DVA.dbo.FTPDetails fd where fu.batchname = fd.batchname)

select distinct d.dcsID, u.batchname  from ftpdetailsu u
inner join dva.dbo.Document d
on u.batchname = d.pbatch
where u.acktime is null and u.comments like '%receipt date%'
and u.batchname not in (select u.batchname where acktime is not null)



select distinct d.dcsID, u.batchname, p.cordest  from ftpdetailsu u
inner join dva.dbo.Document d
on u.batchname = d.pbatch
inner join dva.dbo.PhysicalBatch p
on u.batchname = p.PBatch
where u.acktime is null and u.comments like '%receipt date%'
and u.batchname not in (select u.batchname where acktime is not null)



select distinct d.dcsID, u.batchname, p.POBox  from ftpdetailsu u
inner join dva.dbo.Document d
on u.batchname = d.pbatch
inner join dva.dbo.PhysicalBatch p
on u.batchname = p.PBatch
where u.acktime is null and u.comments like '%receipt date%'
and u.batchname not in (select u.batchname where acktime is not null)