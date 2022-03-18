--step1
delete from TEMP_BillingReport


--step2
insert into TEMP_BillingReport
EXEC WEB_SELECT_RECONCILIATION_Dev '','','','','','','','','2012-09-01','2016-04-01','','','','Western','Admin','',''




--step3 to get recon count
select sum(#_of_images) from temp_billingreport where Upload_to_VA_Date between '2016-03-01 0:0:0' and '2016-03-31 23:59:59' and ProcessingFacility = 'newnan'


--step4 to get some mismatches
      SELECT DISTINCT d.DCSID, d2.NumPages, 
      --(SELECT SUM(#_Of_Images) FROM TEMP_BillingReport WHERE DCS_ID = d.DCSID) AS Images
      tbr.#_Of_Images 
      FROM Document d
      LEFT JOIN (SELECT DCSID, SUM(NumPages) AS NumPages FROM Document 
      WHERE ((ftpstime >= '03/01/2016 0:0:0.000') 
      AND (ftpstime <= '03/31/2016 23:59:59.999'))
      GROUP BY dcsID) d2
      ON d2.dcsID = d.dcsID 
      LEFT JOIN (SELECT DCS_ID, SUM(#_Of_Images) AS #_Of_Images FROM TEMP_BillingReport 
	  where Upload_to_VA_Date between '2016-03-01 0:0:0' and '2016-03-31 23:59:59'
	  GROUP BY DCS_ID) tbr
      ON tbr.DCS_ID = d.dcsID 
      WHERE ((d.ftpstime >= '03/01/2016 0:0:0.000') 
      AND (d.ftpstime <= '03/31/2016 23:59:59.999'))
      AND d2.NumPages <> tbr.#_Of_Images
      GROUP BY d.DCSID, d2.NumPages, tbr.#_Of_Images


select distinct dcsid, sum(numpages) from document where ftpstime >= '04/01/2014 0:0:0.000' AND ftpstime <= '04/30/2014 23:59:59.999' group by dcsid order by dcsid
select distinct dcsid from document where ftpstime >= '11/01/2014 0:0:0.000' AND ftpstime <= '11/30/2014 23:59:59.999' and pbatch like '02%' order by dcsid
select sum(numpages) from document where ftpstime >= '11/01/2014 0:0:0.000' AND ftpstime <= '11/30/2014 23:59:59.999' and pbatch like '02%' 
select sum(numpages) from document where ftpstime >= '11/01/2014 0:0:0.000' AND ftpstime <= '11/30/2014 23:59:59.999' and pbatch not like '02%' 

select distinct DCS_ID, sum(#_Of_Images) from TEMP_BillingReport where Upload_to_VA_Date >= '04/01/2014 0:0:0.000' AND Upload_to_VA_Date <= '04/30/2014 23:59:59.999' group by DCS_ID order by DCS_ID	 


select sum(numpages) from document where ftpstime >= '02/17/2015 0:0:0.000' AND ftpstime <= '02/29/2015 23:59:59.999' group by dcsid order by dcsid

select sum(numpages) from document where ftpstime >= '02/17/2016 0:0:0.000' AND ftpstime <= '02/29/2016 23:59:59.999' and pbatch like '04%'
--3337742
--4511483

select * from document where ftpstime >= '07/25/2014 0:0:0.000' AND ftpstime <= '07/25/2014 23:59:59.999' group by dcsid order by dcsid

select * from document where ftpstime >= '07/25/2014 0:0:0.000' AND ftpstime <= '07/25/2014 23:59:59.999' order by ftpstime

select sum(#_Of_Images) from TEMP_BillingReport where Upload_to_VA_Date >= '04/01/2014 0:0:0.000' AND Upload_to_VA_Date <= '04/30/2014 23:59:59.999' group by DCS_ID order by DCS_ID	 


select * from manifestDCS where dcsid in (
'HJZUUHDDJ7ZCR2',
'HJZV06X6SVLM42',
'HUR8NF64FPCFAX')

select distinct rmn, dcsID, pbatch from Document where dcsid in (
'HJZUUHDDJ7ZCR2',
'HJZV06X6SVLM42',
'HUR8NF64FPCFAX') and ftpstime is not null
group by rmn, dcsID, PBatch 

select * from document where dcsid = 'HBZE2P7TDLUISY'

select * from TEMP_BillingReport where DCS_ID = 'HZ2NW8VWS8RP16'

select * from manifestDCS where rmn = '309VB0115130003C'

select * from customerCheckIn where rmn = '314VB0717132272O'

select distinct rmn, trackingno from manifestDCS where rmn in (
'314VB0718132523O',
'372VB0211141575E',
'314VB0717132272O',
'329VB0321142667A',
'310VB0409149828G')


select distinct rmn from manifestDCS where dcsid in (
'HRJK8XC26ULZT6',
'HRJKDCNROZY3R9',
'HRJKHBXKLROCLN',
'HRJKLC50AJY69A',
'HRJKPJVAY3I6HC')

select * from customerCheckIn where rmn = '372VB0211141575E'


select * from manifestDCS where rmn = '372VB0211141575E'


select sum(numpages) from document where rmn = '372VB0211141575E'

select * from customerdata where rmn = '372VB0211141575E'

select * from manifestDCS where rmn = '372VB0211141575E'

select * from customercheckin where operid = 'vsckevin' and location = '61'
select * from customercheckin where rmn like '372vb%'

select * from manifestDCS where dcsid = 'HRKT6NNRQ8EX0W'

select * from manifestDCS where trackingno = '1Z7086540396481575'


update customerCheckIn
set rmn = '372VB0211141575E'
where trackingno = '1Z7086540396481575'

update manifestdcs	
set rmn = '372VB0211141575E'
where trackingno = '1Z7086540396481575'

select * from customercheckin where 

select sum(numpages) from document where rmn = '372VB0211141575E''

select * from customerCheckIn where rmn in (
'313VB0212147006K',
'318VB0212149864G',
'318VB0212149981G',
'320VB0212148059B',
'402VB0212148606D')

select * from manifestDCS where rmn in (
'313VB0212147006K',
'318VB0212149864G',
'318VB0212149981G',
'320VB0212148059B',
'402VB0212148606D') order by dcsid

select * from manifestDCS where rmn = '313VB0212147006K' order by dcsid

select * from document where dcsID = 'HRKR3VIRM9EWAE'

select * from manifestDCS where dcsID = 'HRKR3VIRM9EWAE'

delete from manifestDCS where dcsid = 'HRKR3VIRM9EWAE' and pbatch = '021404914017'


select distinct dcsid from document where rmn = '310VB0409149828G'

update customercheckin
set destination = '2'
where rmn = '320VB0212148059B'

select * from document where rmn = '310VB0409149828G'
select * from customerCheckIn where rmn = '310%'


update document
set rmn = '318VB0409149828G'
where rmn = '310VB0409149828G'
318VB0409149828G
update customercheckin
set rmn = '318VB0409149828G'
where rmn = '310VB0409149828G'

select * from manifestdcs where dcsid = 'HTSK8DWGMQP970'


select * from manifestdcs where rmn = '318VB0409149828G'


select * from customercheckin where rmn = '318VB0409149828G'

select distinct rmn, trackingno from customercheckin where rmn in (
'314VB0718132523O',
'372VB0211141575E',
'314VB0717132272O',
'329VB0321142667A',
'310VB0409149828G')


select * from manifestDCS where rmn = '329VB0321142667A'


select * from customerCheckIn where rmn like '329%'
rmn	trackingno
314VB0717132272O	C005
314VB0718132523O	C005
329VB0321142667A	1ZA40E410393212667
372VB0211141575E	1Z7086540396481575





select * from pobox order by syskey


--sample results
DCSID	NumPages	#_Of_Images
HJ1Q6WP6OCDU8Y	316	632
HJ1Q66PJT2V1MV	483	966
HJ1Q5H6DR22PCL	1871	3742
HJ1Q4KQH57F6S4	803	1606

---worksheet space
select RMN from manifestDCS where dcsid in (
'HJ1Q6WP6OCDU8Y',
'HJ1Q66PJT2V1MV',
'HJ1Q5H6DR22PCL',
'HJ1Q4KQH57F6S4')

select * from customerCheckIn where rmn = '318VB0712135409G'
select * from manifestDCS where rmn = '318VB0712135409G'

delete from customerCheckIn where syskey = 43867


select * from manifestDCS where dcsID in (
'HMC95ZHFEVLNOS',
'HMCEDN2MP3UIXR',
'HMC916963N8N98',
'HMC7MKASXW07EI',
'HMC5O3NGGW3GTL',
'HMC9X4FRGWF3JZ',
'HMC97LGD69SAGD',
'HMCDP0UAENH1LI',
'HMCDXDCSJRB5A9',
'HMCE6FFZL5MXY9',
'HMC93IPIBEIA8U',
'HMC9PV2ZSV8VFC')


select * from customerCheckIn where rmn = '317VB1003130531R'

select distinct RMN from manifestDCS where dcsID in (
'HK2LEX69SNW78R',
'HKBGUPUCYNJZHC', 
'HKBGMDOO2CFPX6',
'HLP3ZC1AGOEDA8',
'HK5JTWOXYBFOQC',
'HLPEU65OLUXBBZ',
'HLP4TJJMOTWOQ6',
'HLP6GTVOP5RHEV',
'HL58FD5VQOVJ8F',
'HK2L77DR4NXFRZ',
'HK5JLX66PVFCR3',
'HKBGGLARGOXWWZ',
'HLP4SA9E1UABHP',
'HK5JO35UH43QF3',
'HK5JOWL7U3USPU',
'HL57A98A5ABOO8',
'HK2LH12PLCQASW',
'HK5JN80773IPYA',
'HLPHS2DQWLCH7O',
'HLP6FBSNERVQEE',
'HLPHN0BMBEWFZJ',
'HKBGPNLILR4817',
'HLP6K0ZU93TLKV',
'HK5JSVEMJ16Y0C',
'HK2LA2VC84FR03',
'HK2LQUMYL1DOMR',
'HKBGYJRQ8BBEIH',
'HL575B5N4EN5J5',
'HLPHVNOK6WKX1Y',
'HL575V0FS0I6ZH',
'HLP6IG8JYIWZ6B',
'HK2LIICPPIY49H',
'HK5JS18ER1G46W',
'HKBG5JUASL440L')


select * from customerCheckIn where rmn in (
'314VB0807130008O',
'314VB0809131404O',
'314VB0809131407O',
'317VB0813132248K',
'317VB0917131272R',
'320VB0903130258B')

select * from manifestdcs where rmn in (
'314VB0809131404O',                                                                                                                                                                                                                                               
'314VB0809131407O') order by dcsID                                                                                                                                                                                                                                               

--delete from customerCheckIn where syskey = 29508 and rmn = '317VB0813132248K'



select * from manifestDCS where dcsid in (
'HK5JN80773IPYA',
'HK5JS18ER1G46W',
'HK5JLX66PVFCR3',
'HK5JO35UH43QF3',
'HK5JOWL7U3USPU',
'HK5JTWOXYBFOQC',
'HK5JSVEMJ16Y0C') order by dcsID



select distinct RMN from Document where dcsid in (
'HK5JN80773IPYA',
'HK5JS18ER1G46W',
'HK5JLX66PVFCR3',
'HK5JO35UH43QF3',
'HK5JOWL7U3USPU',
'HK5JTWOXYBFOQC',
'HK5JSVEMJ16Y0C') 

--sample worksheet
DCSID	NumPages	#_Of_Images
HN1T7N1VN1CCIF	1159	1095
HMUTOHBHKHAJUG	1011	978
HN24R1FPLXQ5CQ	1518	1500


---worksheet space
select RMN from manifestDCS where dcsid in (
'HN1T7N1VN1CCIF',
'HMUTOHBHKHAJUG',
'HN24R1FPLXQ5CQ')

select * from Document where dcsid in (
'HN1T7N1VN1CCIF',
'HMUTOHBHKHAJUG',
'HN24R1FPLXQ5CQ') and MA18doctype is not null

select * from document where rmn = '349VB1016133462E'
301VB1021134476A
310VB1021138873H

select * from document where dcsid = 'HN24R1FPLXQ5CQ' order by ImageID
select * from manifestDCS where dcsid = 'HN24R1FPLXQ5CQ'
select sum(numpages) from document where dcsid = 'HN24R1FPLXQ5CQ'
select * from CustomerDATA where dcsid = 'HN24R1FPLXQ5CQ'


select * from customerCheckIn where rmn = '310VB1021138873H'
select * from manifestDCS where rmn = '310VB1021138873H'

select *  FROM TEMP_BillingReport 
where Upload_to_VA_Date between '2013-12-01 0:0:0' and '2013-12-31 23:59:59'
and DCS_ID = 'HMUTOHBHKHAJUG'

select *FROM Document 
WHERE ((ftpstime >= '12/01/2013 0:0:0.000') 
AND (ftpstime <= '12/31/2013 23:59:59.999'))
and dcsID = 'HMUTOHBHKHAJUG' order by ftpstime desc


select count(*), dcsID from document where dcsid in (
'HN1T7N1VN1CCIF',
'HMUTOHBHKHAJUG',
'HN24R1FPLXQ5CQ') group by dcsID

select imageid from document where dcsid = 'HN24R1FPLXQ5CQ' group by imageid  having count(imageid) > 1 order by imageid


select * from manifestDCS where dcsid in (
'HTH7T2W1QDLEM3',
'HTH76T1B1IZVCB',
'HTH7MPVJKFMGJM',
'HTH74UNYVTNTOD',
'HTH7G0R7W5NQX3',
'HTH7WGSCY7LNJ0',
'HTH7A1Q0PJCMWP',
'HTH7B5EI90KL3Y',
'HTH7XCFEC9YGB7',
'HTH8YMPBGLL33V',
'HTH72AEL6NOVX5',
'HTH7L15PGMZG2H',
'HTH7VJLH4Q3RAX',
'HTH7CCQICDX63J',
'HTH7HAPPCUIHH7',
'HTH77V8YFGREFL',
'HTH75TKDZ1SX72',
'HTH7P5KDVBCDKH',
'HTH7DGG8WCEW0F',
'HTH7O1Y5P3HHXU')

--delete from customercheckin where rmn = '329VB0401147551A' and syskey = 47996
select * from manifestdcs where rmn = '329VB0401147551A'


select * from manifestdcs where dcsid in (
'HT627S3THHUE5L',
'HTBJYFEP6BUHX8',
'HT93SN8DFDSY87',
'HT9YPPDXPH614Y',
'HT9TY14T9V2BW6',
'HT8LOTMJKXW4SC',
'HTBHYHM5FGF0T9',
'HTA44HPTTFYHHP',
'HTBKIVY3G7EE7Y',
'HTBRSDA8CF0JWG',
'HTBLYL4CRZFVBU',
'HT91R7C0CAEAWJ',
'HT5SSWRJ9LE4GL',
'HTAE1V5WMNVTEV',
'HT9ZTJK6DA6DKX',
'HT5TFMMD2QC7QZ')

select * from customercheckin where rmn = '318VB0324149989G'
select * from document where dcsid = 'HT627S3THHUE5L'
select * from CustomerDATA where dcsid = 'HT627S3THHUE5L'