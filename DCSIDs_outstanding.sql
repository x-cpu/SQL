select distinct dcsid from manifestDCS 
where not exists (select * from document where ftpstime is not null 
and manifestDCS.dcsID = dcsID
and ftpstime >= '2016-02-17 0:0:0')
and not exists (select * from exceptions where manifestDCS.dcsid = dcsid)
and exists (select * from document where manifestDCS.RMN = rmn and ftpstime is null)


