
CREATE TABLE #MyTempTable3
(
RMN varchar(50),
Tracking_Number varchar(50),
VA_Ship_Date varchar(10),
CheckIn_Date varchar(10),
First_Name varchar(50),
MI varchar(5),
Last_Name varchar(50),
Participant_ID varchar(25),
DCS_ID varchar(25),
File_Number varchar(25),
#_of_Document varchar(25),
#_of_Images varchar(25),
Upload_to_VA_Date varchar(10),
Return_to_VA_Date varchar(10),
Return_Tracking_# varchar(25),
Location varchar(25),
ProcessingFacility varchar(25),
claimtype varchar(25)
)

select * from #MyTempTable3

select * into #MyTempTable from OPENROWSET('ATL-VA-SQL-1A\P920', 'server=ATL-VA-SQL-1A\P920;trusted_connection=yes;', EXEC WEB_SELECT_RECONCILIATION_Dev '','','','','','','','','2013-01-01','2013-08-07','','','','Western','Admin','','')

insert into TEMP_BillingReport
EXEC WEB_SELECT_RECONCILIATION_Dev '','','','','','','','','2012-09-01','2013-08-07','','','','Western','Admin','',''



	  /*TRY THIS ONE*/
select count(*), rmn from customercheckin group by rmn having count(*)> 1 and rmn in 
(select rmn from document where ftpstime > '7/1/2013 0:0:1' and ftpstime < '7/31/2013 23:59:59')


select count(*), dcsid from manifestDCS group by dcsID having count(*)> 1 and dcsID in 
(select dcsID from document where ftpstime > '7/1/2013 0:0:1' and ftpstime < '7/31/2013 23:59:59')

select sum(#_of_images) from temp_billingreport where Upload_to_VA_Date between '2013-07-01 0:0:0' and '2013-07-31 23:59:59'



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



	  select distinct dcsid, sum(numpages) from document where ftpstime >= '07/01/2013 0:0:0.000' AND ftpstime <= '07/31/2013 23:59:59.999' group by dcsID

	  select distinct dcs_id, sum(#_of_images) from TEMP_BillingReport where  Upload_to_VA_Date between '2013-07-01 0:0:0' and '2013-07-31 23:59:59' group by DCS_ID

	  select distinct dcsid, count(*) from document where ftpstime >= '07/01/2013 0:0:0.000' AND ftpstime <= '07/31/2013 23:59:59.999' group by dcsID

	  select distinct dcs_id, count(*) from TEMP_BillingReport where  Upload_to_VA_Date between '2013-07-01 0:0:0' and '2013-07-31 23:59:59' group by DCS_ID


select distinct dcsID, PBatch, RMN from document where dcsid in (
'H8YE5I87XAH672',
'H9LAR0GOTGJ377',
'HA1FRLM5T5C6N5',
'HAE71238BVS0JL',
'HAE746AB910778',
'HALBIEK483T3F7',
'HAMP6WEEKYYTXQ',
'HAO1A5R8UB3AQ1',
'HATTGUKPEFWUQC') order by dcsID, pbatch

select * from manifestDCS where dcsid in (
'H8YE5I87XAH672',
'H9LAR0GOTGJ377',
'HA1FRLM5T5C6N5',
'HAE71238BVS0JL',
'HAE746AB910778',
'HALBIEK483T3F7',
'HAMP6WEEKYYTXQ',
'HAO1A5R8UB3AQ1',
'HATTGUKPEFWUQC') order by dcsID, pbatch

select * from document where dcsid = 'H8YE5I87XAH672'

select * from CustomerDATA where dcsid = 'H8YE5I87XAH672'

select * from TEMP_BillingReport where DCS_ID = 'H8YE5I87XAH672'

select * from customerCheckIn where trackingno = '1ZA4205F0394707879'

325VB1031120051B