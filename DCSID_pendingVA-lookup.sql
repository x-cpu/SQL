select distinct d.filenumber, d.rmn, d.dcsid, d.pbatch, min(m.insertdate) as checkin, count(d.imageid) as documents, sum(d.numpages) as images, d.comments  
from document  as d, 
manifestdcs as m 
where d.ftpstime is null and d.ocrexporttime is not null and d.ImageDateTime < '2013-07-9 23:59:59' and d.dcsid = m.dcsid
and d.dcsid not in (select distinct dcsID from Document where ftpstime is not null)
group by d.filenumber ,  d.RMN, d.dcsid, d.pbatch, d.comments 
order by d.rmn, d.pbatch



select distinct d.filenumber, d.rmn, d.dcsid, d.pbatch, min(m.insertdate) as checkin, count(d.imageid) as documents, sum(d.numpages) as images, c.claimtype, p.pobox as 'Source', d.comments  
from document d
join manifestDCS m on d.dcsID = m.dcsID 
join customerCheckIn c on d.rmn = c.RMN
join pobox p on substring(d.RMN, 1, 3) = p.StationNo
where d.ftpstime is null and d.ocrexporttime is not null and d.ImageDateTime < '2013-07-9 23:59:59' and d.dcsid = m.dcsid
and d.dcsid not in (select distinct dcsID from Document where ftpstime is not null)
group by d.filenumber ,  d.RMN, d.dcsid, d.pbatch, c.claimtype, p.pobox, d.comments 
order by d.rmn, d.pbatch
