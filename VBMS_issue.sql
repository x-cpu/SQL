--version provided to dkeller
select distinct d.dcsID, d.RMN, d.FileNumber, max(convert(date, m.insertdate, 101)) CheckInDate, sum(numpages) Images, cc.claimtype, p.pobox RO, 'Newnan' ScanningSite, d.comments 
from document d
join manifestDCS m on  d.dcsID = m.dcsID
join CustomerDATA c on  d.dcsID = c.dcsID
join customerCheckIn cc on  d.RMN = cc.RMN
join pobox p on substring(d.RMN, 1, 3) = p.StationNo
where d.ftpstime is null 
and d.pbatch  in (select pbatch from pbatch_comments)
group by d.dcsID, d.FileNumber, d.RMN, cc.claimtype, p.pobox, d.Comments


--version provided to dkeller
select distinct d.dcsID, d.RMN, d.FileNumber, max(convert(date, m.insertdate, 101)) CheckInDate, sum(numpages) Images, cc.claimtype, p.pobox RO, 'Newnan' ScanningSite
from document d
join manifestDCS m on  d.dcsID = m.dcsID
join CustomerDATA c on  d.dcsID = c.dcsID
join customerCheckIn cc on  d.RMN = cc.RMN
join pobox p on substring(d.RMN, 1, 3) = p.StationNo
where d.ftpstime is null 
and d.pbatch  in (select pbatch from pbatch_comments)
group by d.dcsID, d.FileNumber, d.RMN, cc.claimtype, p.pobox
order by Images desc


select * from dcssheetlookup where pbatch = '02141200417402'

select distinct dcsID from document where ftpstime is null and dcsid in (
select dcsid from dcssheetlookup where secondcheck = 'S')

select distinct pbatch, dcsid, filenumber from document where ftpstime is null and comments like  '%Validation Failure:%' and ftpstime is null


select distinct pbatch, dcsid from document where ftpstime is null and comments like  '%Validation Failure:%' and ftpstime is null and pbatch like '02%' 



(select * from like '%Validation Failure:%'

select * from document where pbatch = '02141200417402'