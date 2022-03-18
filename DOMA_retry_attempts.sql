---DOMA RETRY ATTEMPTS
select distinct d.pbatch, d.dcsid, substring(d.comments, 1, 19) VBMSResponse, count(f.imageid) UploadAttempts, max(f.insertdate) LastUploadAttempt from document d
left join pmrrecon p
on d.imageid = p.imageid
left join FTPError f
on d.ImageID = f.imageid
where d.pbatch like '11%' and d.ImageDateTime > '2016-02-20 00:00:00' and d.Comments like 'Detail: CMSERR%' and d.ftpstime is null
group by d.pbatch, d.dcsid, substring(d.comments, 1, 19) 


select * from pmrFTu


select * from dmhsCMPxmldownload where XMLfilename like 'FTU%'



select * from document where dcsid = 'DCSDM111610400106340005'

select * from PhysicalBatch where pbatch like '04%' and RNDAudit = 'y'

exec ExtractionQuality '2016-03-21', '2016-03-27 23:59:59.999'

select * from pmrFTPDetails where batchname = '20160407232021181.zip'

select * from pmrFTPDetails where batchname = '20160407232021181'

select * from document where imageid = 'PMRID_4202239'