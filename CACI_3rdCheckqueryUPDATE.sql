--3rd check for CACI list (Roanoke only)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError')
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 


--3rd check for CACI list (nonRoanoke only)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError')
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 





select * from dcssheetlookup_CACI where insertdate > '2014-10-23 10:14:00'


select * from dcssheetlookup_CACI where dcsid = 'I181CRJOY6M5K9'







--old stuff below















--NEW WAY
--3rd check for CACI list (excluding Roanoke)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch)
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError') 
'I6YWKRZ7YWB03',
'I6NKUNKEQMQPBH',
'I6S4U57HUN7JQW',
'I73D7GQY8ODZ39',
'I6S4U57HUN7JQW',
'I73AU2XRQNRTRQ',
'I6THB9IT9WEZFI')
select distinct d.dcsid, d.pbatch from document d 
                        inner join customerCheckIn c on d.rmn = c.rmn where c.location <> '62' 
                        and d.ftpstime is null and d.comments is not null 
                        and exists (select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError') 
                        and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 

--3rd check for CACI list (Roanoke only)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError')
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError') 


select distinct d.dcsid, d.pbatch from document d 
                        inner join customerCheckIn c on d.rmn = c.rmn where c.location <> '62' 
                        and d.ftpstime is null and d.comments is not null 
                        and exists (select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError') 
                        and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError')



						select distinct d.dcsid, d.pbatch from document d 
                        inner join customerCheckIn c on d.rmn = c.rmn where c.location = '62' 
                        and d.ftpstime is null and d.comments is not null 
                        and exists (select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError') 
                        and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 




select distinct d.dcsid, d.pbatch from document d 
                        inner join customerCheckIn c on d.rmn = c.rmn where c.location <> '62' 
                        and d.ftpstime is null and d.comments is not null 
                        and exists (select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError') 
                        and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError')


						select distinct d.dcsid, d.pbatch from document d 
                        inner join customerCheckIn c on d.rmn = c.rmn where c.location = '62' 
                        and d.ftpstime is null and d.comments is not null 
                        and exists (select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError') 
                        and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError')


						select distinct d.dcsid, d.pbatch from document d 
                        inner join customerCheckIn c on d.rmn = c.rmn where c.location = '62' 
                        and d.ftpstime is null and d.comments is not null 
                        and exists (select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError') 
                        and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI)


						select * from dcssheetlookup where dcsid in (
						'I62D6CVB96XZMO',
'I6TG2MDZLM8H51',
'I7G3XLPPQPZ5UA',
'I7LY9FM3DQBAYD')