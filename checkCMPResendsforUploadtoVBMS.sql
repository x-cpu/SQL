--check what customer has sent previously
select * from cmprecon where insertdate > '2014-12-12 0:0:0'
and DocumentStatus = 'upload'
and exists (select* from document where ftpstime is null and comments is not null and cmprecon.DCSID = document.dcsID)
and exists (select * from FTPError where insertdate > '2014-12-12 0:0:0' and cmprecon.imageid = ftperror.imageid)
order by insertdate, DCSID