--from CACI/VA reporting - ACTUAL ACCELION
select distinct d.dcsID, d.RMN, d.FileNumber, max(convert(date, m.insertdate, 101)) CheckIn, c.numDocs Documents, sum(numpages) Images, cc.claimtype, 'Newnan' ScanningSite, d.comments from document d
join manifestDCS m on  d.dcsID = m.dcsID
join CustomerDATA c on  d.dcsID = c.dcsID
join customerCheckIn cc on  d.RMN = cc.RMN
where d.comments like '%unable%' and ftpstime is null 
and d.pbatch  in (select pbatch from pbatch_comments) 
group by d.dcsID, d.FileNumber, d.RMN, cc.claimtype, c.numDocs, d.Comments


--or
--from CACI/VA reporting - ACTUAL ACCELION
select distinct d.dcsID, d.RMN, d.FileNumber, max(convert(date, m.insertdate, 101)) CheckIn, c.numDocs Documents, sum(numpages) Images, cc.claimtype, 'Newnan' ScanningSite, d.comments from document d
join manifestDCS m on  d.dcsID = m.dcsID
join CustomerDATA c on  d.dcsID = c.dcsID
join customerCheckIn cc on  d.RMN = cc.RMN
where d.comments like '%unable%' and ftpstime is null 
and d.pbatch  in (select pbatch from pbatch_comments) 
group by d.dcsID, d.FileNumber, d.RMN, cc.claimtype, c.numDocs, d.Comments



select distinct d.dcsID, d.RMN, d.FileNumber, max(convert(date, m.insertdate, 101)) CheckInDate, sum(numpages) Images, cc.claimtype, p.pobox RO, 'Newnan' ScanningSite, d.comments from document d
join manifestDCS m on  d.dcsID = m.dcsID
join CustomerDATA c on  d.dcsID = c.dcsID
join customerCheckIn cc on  d.RMN = cc.RMN
join pobox p on substring(d.RMN, 1, 3) = p.StationNo
where d.ftpstime is null 
and d.pbatch  in (select pbatch from pbatch_comments)
group by d.dcsID, d.FileNumber, d.RMN, cc.claimtype, p.pobox, d.Comments
