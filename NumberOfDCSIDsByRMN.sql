select d.rmn RMN, count(distinct d.dcsid) totalDCSIDs, max(m.insertdate) CheckinDate, max(d.ftpstime) VBMSUploadDate from document d
left join manifestDCS m
on d.rmn = m.RMN
where d.RMN like '313%' and ftpstime is not null and d.pbatch like '02%'
group by d.RMN