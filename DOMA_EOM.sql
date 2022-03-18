select sum(numpages) from document where ftpstime >= '10/01/2015 0:0:0.000' AND ftpstime <= '10/21/2015 23:59:59.999' and pbatch like '11%'


select sum(numpages) from document where ftpstime >= '05/01/2015 0:0:0.000' AND ftpstime <= '05/31/2015 23:59:59.999' and ImageID like 'pmr%'

select * from document where ftpstime >= '05/01/2015 0:0:0.000' AND ftpstime <= '05/31/2015 23:59:59.999' and pbatch like '11%'


select * from pmrzipdownload order by insertdate desc