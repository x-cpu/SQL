--cmp production report -- ftp vbms
select convert(nvarchar, ftpstime,101) as ftpdate, count(*) as docs, sum(numpages) as Pages from document 
where ftpstime > ='11/1/2014 0:0:0' AND ftpstime <= '11/30/2014 23:59:59.999'
and substring(pbatch,1,2) in ('03','04','05')
and acktime is not null
group by convert(nvarchar, ftpstime,101) 
order by convert(nvarchar, ftpstime,101) 



--cmp production report -- portal uploads
select convert(nvarchar, fd.etime, 101) as uploadPortaldate, count(d.imageid) as docs, sum(d.numpages) as Pages from FTPDetails fd
inner join document d
on fd.batchname = d.PBatch 
where etime >= '2014-11-01 0:0:0' and etime <= '11/30/2014 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
group by CONVERT(nvarchar, fd.etime, 101)
order by CONVERT(nvarchar, fd.etime, 101)



--cmp production report -- portal uploads by batch
select distinct fd.batchname, count(d.imageid) as docs, sum(d.numpages) as Pages from FTPDetails fd
inner join document d
on fd.batchname = d.PBatch 
where etime >= '2014-11-01 0:0:0' and etime <= '11/30/2014 23:59:59.999' 
and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
group by CONVERT(nvarchar, fd.etime, 101)
order by CONVERT(nvarchar, fd.etime, 101)



select distinct rmn, sum(numpages) as Images, count(imageid) as Docs from document
where exists (select * from RMNCompleted where Document.rmn = RMNCompleted.RMN)
and ftpstime >= '2014-07-01 0:0:0' and ftpstime is not null and substring(pbatch,1,2) not in ('03','04','05')
and rmn not in (select rmn from document where ftpstime <= '2014-06-30 23:59:59')
group by RMN
order by RMN

select sum(numpages) from document where rmn = '314VB0505141525O'

select * from RMNCompleted where rmn = '314VB0505141525O'

select * from document where rmn = '314VB0529149562O'


--cmp production report -- ftp vbms
select convert(nvarchar, ftpstime,101) as ftpdate, count(*) as docs, sum(numpages) as Pages from document 
where ftpstime > ='11/1/2014 0:0:0' AND ftpstime <= '11/30/2014 23:59:59.999'
and substring(pbatch,1,2) in ('11')
group by convert(nvarchar, ftpstime,101) 
order by convert(nvarchar, ftpstime,101) 