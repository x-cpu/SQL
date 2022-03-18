select imageid, dcsID, ftpstime 
from document where dcsid in (
select dcsid from stpetedcsid) and ftpstime > '2014-09-30 0:0:0'





