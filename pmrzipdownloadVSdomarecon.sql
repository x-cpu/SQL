--doma
select * from pmrzipdownload where   not exists (
select * from domarecon where pmrzipdownload.ZIPfilename = substring(domarecon.XMLfilename, 0, 15))

--cmp
select * from cmpxmldownload where   not exists (
select * from cmprecon where cmpxmldownload.XMLfilename = substring(cmprecon.XMLfilename, 0, 27)) 
and comments is NULL 
and insertdate < '2015-08-07'
and acktime is null
and batchname in (
'03141740606901',
'03141900606301',
'03142380600901',
'03142510616601')
order by insertdate desc






select * from cmprecon where dcsid = 'DCSID031504006174010065'

DCSID031417406069010079
DCSID031419006051010038 split
DCSID031419006063010055
DCSID031420006140010007 split
DCSID031420006140010008 split
DCSID031422506057010036 split
DCSID031423806009010008
DCSID031425106166010074
DCSID031504006174010065