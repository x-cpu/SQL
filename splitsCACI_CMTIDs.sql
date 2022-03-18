---received SPLIT from SMS but not sent to DMHS from IC
select distinct comments VeteranID, XMLfilename from dmhsCMPxmldownload where not exists
(select * from smsDCSMapping where dmhsCMPxmldownload.comments = veteranID) and category = 'split'
order by comments


---special query for SAM
select distinct d.comments VeteranID, d.XMLfilename, c.dcsid  from dmhsCMPxmldownload d 
left join cacicmtid c
on d.comments = c.CMTID
where not exists
(select * from smsDCSMapping where d.comments = veteranID) and d.category = 'split'


select * from smsDCSMapping


---special query for SAM 2
select convert(date, s.acktime, 101) UploadDate, count(distinct s.dcsid) #ofDCSIDs, z.ROJ from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
left join ZipcodeRoj z
on c.ZipCode = z.zipcode
where SUBSTRING(s.batchname, 9, 1) = '8'
group by convert(date, s.acktime, 101), z.ROJ 
order by convert(date, s.acktime, 101), z.ROJ 

---special query for SAM 2
select convert(date, s.acktime, 101) UploadDate, count(distinct s.dcsid) #ofDCSIDs from smsDCSMapping s
left join CustomerDATA c
on s.dcsid = c.dcsID
where SUBSTRING(s.batchname, 9, 1) = '8'
group by convert(date, s.acktime, 101)
order by convert(date, s.acktime, 101)





---received SPLIT from SMS but not sent to DMHS from IC
select distinct comments VeteranID, XMLfilename from dmhsCMPxmldownload where not exists
(select * from smsDCSMapping where dmhsCMPxmldownload.comments = veteranID) and category = 'split'
order by comments



---special query for SAM
select distinct d.comments VeteranID, d.XMLfilename, c.dcsid  from dmhsCMPxmldownload d 
left join cacicmtid c
on d.comments = c.CMTID
where not exists
(select * from smsDCSMapping where d.comments = veteranID) and d.category = 'split'