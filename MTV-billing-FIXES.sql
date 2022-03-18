select dcsid, convert(nvarchar, ftpstime, 101), sum(numpages) from document where rmn = '318VB0111130001G' group by dcsid, convert(nvarchar, ftpstime, 101)


select distinct dcsid from manifestDCS where rmn = '318VB0111130001G' and dcsID not in
(select distinct dcsID from document where rmn = '318VB0111130001G')


HBT8GVWV3OO2DW
BHT8GBWV3OO2DW

select sum(numpages) from document where rmn = '318VB0111130001G' and ftpstime is null



(select distinct dcsid from Document 
where dcsID not in (select distinct dcsid from manifestDCS)
and ftpstime > '2/1/2012 0:0:1' and ftpstime < '2/28/2012 23:59:59')

use DVA
(select distinct rmn from Document 
where rmn not in (select distinct rmn from manifestDCS)
and ftpstime > '2/1/2012 0:0:1' and ftpstime < '2/28/2012 23:59:59')


select distinct dcsid from document where ftpstime between '2013-02-01 0:0:0' and '2013-02-06 23:59:59' and dcsID not in
(select distinct dcsid from manifestDCS)

update CustomerDATA
set dcsid = 'HBT8GVWV3OO2DW'
where dcsid = 'BHT8GBWV3OO2DW'