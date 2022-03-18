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
	  where Upload_to_VA_Date between '2013-07-01' and '2013-07-31'
	  GROUP BY DCS_ID) tbr
      ON tbr.DCS_ID = d.dcsID 
      WHERE ((d.ftpstime >= '07/01/2013 0:0:0.000') 
      AND (d.ftpstime <= '07/31/2013 23:59:59.999'))
      AND d2.NumPages <> tbr.#_Of_Images
      GROUP BY d.DCSID, d2.NumPages, tbr.#_Of_Images

	  select * from TEMP_BillingReport where DCS_ID = 'HIBWRL0RBXTKG9'

	  select * from manifestDCS where dcsID = 'HFXZIFPMP2NRBR'




--dup RMNs from portal
 SELECT * FROM CUSTOMERCHECKIN WHERE rmn in 
(select rmn from customercheckin group by rmn having count(*)> 1)