--check for the bad rmns
select * from sheet1$ where _of_images is not null and processingfacility = 'Mt. Vernon' and tracking_number not in
(select distinct trackingno from manifestdcs)

select * from sheet1$

--check 1
select distinct dcsid from document where ftpstime between '2013-01-01 0:0:0' and '2013-01-31 23:59:59' and dcsID not in
(select distinct dcsid from manifestDCS)

--check 2
select distinct dcsid from document where ftpstime between '2013-01-01 0:0:0' and '2013-01-31 23:59:59' and dcsID not in
(select distinct dcsid from customerdata)

--check 3
select distinct filenumber, dcsid, count (*) from document
group by filenumber, dcsID
having count(FileNumber) > 1

use DVA
select * from document where dcsid = 'HBQVB0109130008G'
select * from manifestDCS where dcsid = 'HBQVB0109130008G'
select * from CustomerDATA where dcsid = 'HBQVB0109130008G'

HBQVB0109130008G
HBS2OKSJHJCWE
318VB1231120002G
VA_DCSIDControlSheet
HBI3JY7X1K81R2
HB1987GMDTSTMG
HGBLVQQX9MSTY4
HBS2MNJOWMGGZH
325VB1226120002B
318VB1231120001G

select * from customerdata where pbatch = '021234000213'
select * from manifestDCS where pbatch = '021234000213'
select * from manifestDCS where rmn = '325VB11301200548B'
select * from customerCheckIn where rmn = '325VB11301200548B'

select distinct dcsID from manifestDCS where rmn = '318VB0109130008G' and dcsID not in
(select distinct dcsID from CustomerDATA)

select * from document where dcsid = 'HBQVGOJV9WFBBZ'

update Document			
set dcsID = 'HBQVGOJV9WFBBZ'
where dcsID = 'HBQVB0109130008G'


select sum(images)
from Stats_IBML
where releasedate between '2013-02-01 0:0:0' and '2013-02-01 23:59:59'


use DVA
select sum(numpages) from document where ImageDateTime > '1/25/2013 0:0:0' and ftpstime is null


---lunnie fixese
(select distinct dcsid from Document 
where dcsID not in (select distinct dcsid from manifestDCS)
and ftpstime > '11/1/2012 0:0:1' and ftpstime < '12/31/2012 23:59:59'
)

use DVA
(select distinct rmn from Document 
where rmn not in (select distinct rmn from manifestDCS)
and ftpstime > '1/1/2013 0:0:0' and ftpstime < '1/31/2013 23:59:59'
)

select * from manifestDCS where pbatch in  
(select distinct substring(PBatch, 1,12) from document where RMN = '315VB1231120011B')

--select * from manifestDCS where pbatch in  
--(select distinct substring(PBatch, 1,12) from document where dcsID = '309VB1204120004C')
                                                                      
update Document set RMN ='315VB1231120011B' where RMN =  '315VB1231120011B'
update customerdata set RMN ='315VB1231120011B' where RMN =  '315VB1231120011B'

select SUM(filesize) / SUM(uploadprocesstime) from Document where ftpstime > '2/4/2013 16:00:00'

select SUM(filesize) / SUM(uploadprocesstime) from Document where ftpstime > '2/4/2013 15:30:00'
23k
15k


