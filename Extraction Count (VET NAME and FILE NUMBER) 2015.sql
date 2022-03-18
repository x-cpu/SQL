---Extraction Count (VET NAME and FILE NUMBER)
select sum(KS) from cmpstats 
where exists (select * from FTPDetails where AckTime >= '2015-11-01 0:0:0' and AckTime <= '2015-11-30 23:59:59.999' 
--and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null and cmpstats.pbatch = FTPDetails.batchname)
and ks > 0



---2452056
---4071444 APril 2015
---4883838 june 2015





---Extraction Count (VET NAME and FILE NUMBER
select distinct dcsid, FileNumber, LastName, FirstName, MiddleInitial, sum(ks) Keystrokes from cmpstats 
where exists (select * from FTPDetails where AckTime >= '2016-02-01 0:0:0' and AckTime <= '2016-02-16 23:59:59.999' 
--and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null and cmpstats.pbatch = FTPDetails.batchname)
and ks > 0
group by dcsid, FileNumber, LastName, FirstName, MiddleInitial





---Extraction Count (VET NAME and FILE NUMBER
select distinct dcsid into x10 from cmpstats 
where exists (select * from FTPDetails where AckTime >= '2015-02-01 0:0:0' and AckTime <= '2015-02-28 23:59:59.999' 
--and  substring(batchname,1,2) in ('03','04','05')
and acktime is not null
and comments is null and cmpstats.pbatch = FTPDetails.batchname)
and ks > 0
group by dcsid, FileNumber, LastName, FirstName, MiddleInitial


select sum(ks) from cmpstats
where exists (select * from x10 where cmpstats.dcsid = x10.dcsid)