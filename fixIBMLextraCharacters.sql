select * from batchtable where batchname = '02141970206004'

update batchtable
set status = '6'
where  DateCreated < '2014-07-29 0:0:0' and status = '2' and JobName = 'SourceHOV-Keep Color Back Page'


select * from batchtable where DateCreated < '2014-07-29 0:0:0' and status = '2' and JobName = 'SourceHOV-Keep Color Back Page'

select * from batchtable where DateCreated > '2014-07-29 0:0:0' and status = '2' and JobName = 'SourceHOV-Keep Color Back Page'

select * from batchtable where status = '2' and JobName = 'SourceHOV-Keep Color Back Page'

select * from batchtable where batchname in (
'02142020002001',
'02141990003501',
'02142000000305',
'02142050401001')

select * from batchtable where batchname in (
'02142040400401',
'02142050011001',
'02142050410201')

select * from batchtable where batchname like '02142050410201%'

update batchtable
set Status = '2'
where batchname = '02142050410201'

update batchtable
set batchname = '02142050410201', BatchDirectory = '\\atl-va-fs01\data\Scanning\02142050410201'
where batchname = '0214205041020153'




--good
select * from batchtable where batchname in (
'02141970209801',
'02142000000301',
'02142060202303',
'02142060203007')

--3rd check listing report EXCLUDING ROANOKE
select distinct dcsid, pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)


select count(*) from imgtable