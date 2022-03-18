      SELECT DISTINCT d.DCSID, d2.NumPages, 
      --(SELECT SUM(#_Of_Images) FROM TEMP_BillingReport WHERE DCS_ID = d.DCSID) AS Images
      tbr.#_Of_Images 
      FROM Document d
      LEFT JOIN (SELECT DCSID, SUM(NumPages) AS NumPages FROM Document 
      WHERE ((ftpstime >= '07/01/2013 0:0:0.000') 
      AND (ftpstime <= '07/31/2013 23:59:59.999'))
      GROUP BY dcsID) d2
      ON d2.dcsID = d.dcsID 
      LEFT JOIN (SELECT DCS_ID, SUM(#_Of_Images) AS #_Of_Images FROM TEMP_BillingReport 
	  where Upload_to_VA_Date between '2013-07-01 0:0:0' and '2013-07-31 23:59:59'
	  GROUP BY DCS_ID) tbr
      ON tbr.DCS_ID = d.dcsID 
      WHERE ((d.ftpstime >= '07/01/2013 0:0:0.000') 
      AND (d.ftpstime <= '07/31/2013 23:59:59.999'))
      AND d2.NumPages <> tbr.#_Of_Images
      GROUP BY d.DCSID, d2.NumPages, tbr.#_Of_Images

	  select sum(#_of_images) from temp_billingreport where Upload_to_VA_Date between '2013-07-01 0:0:0' and '2013-07-31 23:59:59' and ProcessingFacility = 'Newnan'


	  /*TRY THIS ONE*/
select count(*), rmn from customercheckin group by rmn having count(*)> 1 and rmn in 
(select rmn from document where ftpstime > '9/1/2013 0:0:1' and ftpstime < '9/30/2013 23:59:59')


select count(*), dcsid from manifestDCS group by dcsID having count(*)> 1 and dcsID in 
(select dcsID from document where ftpstime > '9/1/2013 0:0:1' and ftpstime < '9/30/2013 23:59:59')



insert into TEMP_BillingReport
EXEC WEB_SELECT_RECONCILIATION_Dev '','','','','','','','','2012-09-01','2013-08-30','','','','Western','Admin','',''


select sum(numpages) from document where rmn = '301VB0827131234A'
select * from  document where rmn = '301VB0827131234A'
select * from manifestdcs where RMN = '301VB0917131234A'
                                       301VB0917131234A                                                                                                                                                                                                                                               

select * from manifestdcs where rmn in (
'301VB0917131234A',
'301VB0827131234A')

select * from customerCheckIn where rmn in (
'301VB0917131234A',
'301VB0827131234A')



select * from manifestDCS where dcsid = 'HKV23RCYNVPRF5'
select * from manifestdcs where pbatch = '021324010002'

select * from customerCheckIn where rmn = '301VB0827131234A'

select * from customerCheckIn where trackingno = '1za4040x0212341234'


select * from customerCheckIn where rmn in (
'313VB0708130051K',                                                                                                                                                                                                                                               
'325VB0724130021B',                                                                                                                                                                                                                                               
'314VB0611130252O',                                                                                                                                                                                                                                               
'329VB0722131385A',                                                                                                                                                                                                                                               
'329VB0715137474A') 

select  distinct trackingno, rmn from manifestdcs where rmn in (
'313VB0708130051K',                                                                                                                                                                                                                                               
'325VB0724130021B',                                                                                                                                                                                                                                               
'314VB0611130252O',                                                                                                                                                                                                                                               
'329VB0722131385A',                                                                                                                                                                                                                                               
'329VB0715137474A')     


select distinct RMN, dcsid from manifestDCS where dcsid in (
'HGQVPQ52274PER',
'HGQVX79KGHPBDI',
'HGQVU1D5HVPN05',
'HGQVR19ZMWBCDK',
'HGQVT48IXR0S90',
'HGQVWECBEN1AV0',
'HIXGUZ5NS06M88',
'HGQVO2QX3R5EQT',
'HGQVY2CYF2RSI9')

RMN	dcsid
301VB0709131096A	HIXGUZ5NS06M88
308VB0710136243C	HIXGUZ5NS06M88
310VB0515131171H	HGQVO2QX3R5EQT

select distinct rmn from document where dcsid = 'HIXGUZ5NS06M88'  

select * from manifestdcs where dcsid = 'HGQVO2QX3R5EQT' 

select * from customercheckin where rmn = '310VB0515138117H'
select * from manifestDCS where rmn = '310VB0515131171H' order by dcsID
select distinct pbatch from manifestDCS where rmn = '310VB0515138117H'       
select * from document where pbatch like '021318311003%'																				

select * from customerCheckIn where rmn = '310VB0515131171H'
select * from document where dcsid = 'HGQVU1D5HVPN05'

select * from manifestDCS where pbatch = '021318311003'
select * from manifestdcs where dcsid in (
'HGQVY2CYF2RSI9',
'HGQVU1D5HVPN05',
'HGQVT48IXR0S90',
'HGQVR19ZMWBCDK',
'HGQVO2QX3R5EQT',
'HGQVX79KGHPBDI',
'HGQVWECBEN1AV0',
'HGQVPQ52274PER')
select * from manifestdcs where rmn = '310VB0515131171H'
select * from document where rmn = '310VB0515131171H'
																			
select * from document where dcsid = 'HGQVO2QX3R5EQT'  order by imageid                                                                                                                                                  