SELECT DISTINCT d.DCSID, d2.NumPages, 
      --(SELECT SUM(#_Of_Images) FROM TEMP_BillingReport WHERE DCS_ID = d.DCSID) AS Images
      tbr.#_Of_Images 
      FROM Document d
      LEFT JOIN (SELECT DCSID, SUM(NumPages) AS NumPages FROM Document 
      WHERE ((ftpstime >= '07/01/2013 0:0:0.000') 
      AND (ftpstime <= '07/31/2013 23:59:59.999'))
      GROUP BY dcsID) d2
      ON d2.dcsID = d.dcsID 
      LEFT JOIN (SELECT DCS_ID, SUM(_Of_Images) AS #_Of_Images FROM TEMP_BillingReport GROUP BY DCS_ID) tbr
      ON tbr.DCS_ID = d.dcsID 
      WHERE ((d.ftpstime >= '07/01/2013 0:0:0.000') 
      AND (d.ftpstime <= '07/31/2013 23:59:59.999'))
      AND d2.NumPages <> tbr.#_Of_Images
      GROUP BY d.DCSID, d2.NumPages, tbr.#_Of_Images


      SELECT DISTINCT d.DCSID, d2.NumPages, 
      --(SELECT SUM(#_Of_Images) FROM TEMP_BillingReport WHERE DCS_ID = d.DCSID) AS Images
      tbr.#_Of_Images 
      FROM Document d
      LEFT JOIN (SELECT DCSID, SUM(NumPages) AS NumPages FROM Document 
      WHERE ((ftpstime >= '01/01/2013 0:0:0.000') 
      AND (ftpstime <= '01/31/2013 23:59:59.999'))
      GROUP BY dcsID) d2
      ON d2.dcsID = d.dcsID 
      LEFT JOIN (SELECT DCS_ID, SUM(#_Of_Images) AS #_Of_Images FROM sheet GROUP BY DCS_ID) tbr
      ON tbr.DCS_ID = d.dcsID 
      WHERE ((d.ftpstime >= '01/01/2013 0:0:0.000') 
      AND (d.ftpstime <= '01/31/2013 23:59:59.999'))
      AND d2.NumPages <> tbr.#_Of_Images
      GROUP BY d.DCSID, d2.NumPages, tbr.#_Of_Images



	  select * from document where dcsID = 'HHBXKPIYA6PXQI'
	  
	  select * from manifestDCS where dcsID  = 'HHBXKPIYA6PXQI'


select distinct DCS_ID, sum(_of_images)from Sheet2$ where Upload_to_VA_Date >= '2013-06-01 0:0:0.000' and Upload_to_VA_Date <= '2013-06-30 23:59:59.999' and ProcessingFacility = 'mT. vernon'	 group by DCS_ID
select sum(numpages) from Document where ftpstime >= '2013-06-01 0:0:0.000' and ftpstime <= '2013-06-30 23:59:59.999'   


select distinct dcs_id from TEMP_BillingReport where  Upload_to_VA_Date >= '2014-06-01 0:0:0.000' and Upload_to_VA_Date <= '2013-06-30 23:59:59.999' and DCS_ID not in
(select distinct dcsid from document where ftpstime >= '2013-06-01 0:0:0.000' and ftpstime <= '2013-06-30 23:59:59.999')


select distinct dcsid from document where ftpstime >= '2014-04-01 0:0:0.000' and ftpstime <= '2014-04-30 0:0:0.000' and dcsid not in (
select distinct dcs_id from TEMP_BillingReport where  Upload_to_VA_Date >= '2014-04-01 0:0:0.000' and Upload_to_VA_Date <= '2014-04-30 0:0:0.000')




select dcsid, rmn from document where ftpstime >= '2014-04-01 0:0:0.000' and ftpstime <= '2014-04-30 23:59:59.999' and dcsID
not in (select dcsID from manifestDCS)

select distinct rmn from document where ftpstime >= '2014-04-01 0:0:0.000' and ftpstime <= '2014-04-30 23:59:59.999' and RMN
not in (select RMN from customerCheckIn)

select distinct dcsid, sum(numpages) from Document where ftpstime >= '2013-06-01 0:0:0.000' and ftpstime <= '2013-06-30 23:59:59.999' group by dcsID


select distinct dcs_id, max(upload_to_va_date) from Sheet2$ where  Upload_to_VA_Date >= '2013-06-01 0:0:0.000' and Upload_to_VA_Date <= '2013-06-30 23:59:59.999' and DCS_ID not in
(select distinct dcsid from document where ftpstime >= '2013-06-01 0:0:0.000' and ftpstime <= '2013-06-30 23:59:59.999')



select distinct dcs_id, max(upload_to_va_date) from Sheet2$ where  Upload_to_VA_Date >= '2013-06-01 0:0:0.000' and Upload_to_VA_Date <= '2013-06-30 23:59:59.999' and ProcessingFacility = 'mT. vernon' and DCS_ID not in
(select distinct dcsid from document where ftpstime >= '2013-06-01 0:0:0.000' and ftpstime <= '2013-06-30 23:59:59.999')
group by DCS_ID order by DCS_ID


select distinct dcs_id, max(upload_to_va_date) from Sheet2$ where  Upload_to_VA_Date >= '2013-06-01' and Upload_to_VA_Date <= '2013-06-30' and ProcessingFacility = 'mT. vernon' and DCS_ID not in
(select distinct dcsid from document where ftpstime >= '2013-06-01 0:0:0.000' and ftpstime <= '2013-06-30 23:59:59.999')
group by DCS_ID order by DCS_ID


select distinct RMN, max(upload_to_va_date) from temp_billingreport where  Upload_to_VA_Date >= '2014-04-01' and Upload_to_VA_Date <= '2014-04-30' and ProcessingFacility = 'mT. vernon' and RMN not in
(select distinct RMN from document where ftpstime between '2014-04-01 0:0:0.000' and  '2014-04-30 23:59:59.999')
group by RMN order by RMN



select distinct RMN, max(upload_to_va_date) from temp_billingreport where  Upload_to_VA_Date >= '2014-04-01' and Upload_to_VA_Date <= '2014-04-30' and ProcessingFacility = 'mT. vernon' and RMN not in
(select distinct RMN from document where ftpstime between '2014-04-01 0:0:0.000' and  '2014-04-30 23:59:59.999')
group by RMN order by RMN


select * from manifestdcs where dcsID in (
'2HHUSINEH2S13F4',
'2HHXHH4B1Y6MOOY',
'2hi33c3t938oomu',
'2HI378Z3KD5HGAL',
'2HI37AC67RXNWD',
'2HI5YU8YNBFQCRS',
'2HI66GWHBJ9A9HZ',
'2HIBNXD3IU6RPJ3')


select * from Document where dcsID in (
'2HHUSINEH2S13F4',
'2HHXHH4B1Y6MOOY',
'2hi33c3t938oomu',
'2HI378Z3KD5HGAL',
'2HI37AC67RXNWD',
'2HI5YU8YNBFQCRS',
'2HI66GWHBJ9A9HZ',
'2HIBNXD3IU6RPJ3')


select * from document where dcsid = 'HGJACH1JII6ETL'

'HGJACH1JII6ETL
'HH3JMU2MF9NEGC
'HH3PX65E1G73SU
'HH3PXXXB9E11TA
'HH3PYT4L8WI0ZC
'HH3Q08Q629QD46
'HH91P29A5DF783
'HH91V7D3O1873Z
'HH9201M3GJCPYW
'HH928N1E34LDLS
'HH92NUY1BE4400
'HH93P5MVB0K3MG
'HH94EHHXPWH9IL
'HH94WEE481LCZX
'HH95XZJWCVGZVB
'HH962OK7AG06HM
'HH99YRG0JV0VIO
'HH9A8YZQRMT0HU
'HH9EEXHOSPU3XR
'HHAEYLUOSSA2UZ
'HHAFB7BD9H3CJF
'HHAKBWKI2QH6ZT
'HHAKCJRQNNVBL3
'HHAKEIF3EY9W2T
'HHAKJ2NM1JAK1Y
'HHBXCVR242T68S
'HHBXMHH5XYB610
'HHBXR1UI1B4FLO
'HHBXVGYROV5RJU
'HHBYA9IMTLIVLX
'HHC1L0U0KEJJNT
'HHC1S8L8Q4LO8B
'HHC20L1DQ0W6C5
'HHC3K152663YDA
'HHC5K03VGYPEY1
'HHC6F2HO67341S
'HHC8P85VKRFAJU
'HHD9GI7FRUCWE8
'HHD9LOWQ38DU14
'HHDBVGN0EYT1F3'.
'HHDBY2NL3T88GM'.
'HHDFM6UAK0DXVG'.
'HHDFMEL5UPV0Y4'.
'HHDKHUCTBX3ZUG'.
'HHDKOEN0JXG5BW'.
'HHDMT6JUAOMDF5'.
'HHDMX5RZLGLJ75'.
'HHEZ4J81NFK02D'