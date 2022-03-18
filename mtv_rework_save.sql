use turboscanng1
select * from batches where batchname = '02140581032804'

exec ts_getindexes_1 242118



use dva
select * from document where pbatch = '02140581032804'

select * from TS_Audit where batchname = '02140551400104'

use dva
select * from manifestdcs where rmn = '316vb1202133460d'


use dva
select * from manifestdcs where pbatch = '021333704026'

select * from document where dcsid = 'HN4J2C8EFXARS9'

02140561304505


02140581032804

use dva
--delete from def_QA_log where insertdate < '2014-03-15'

--delete from def_tserrortracking where insertdatetime < '2014-03-20'

select * from document where dcsid = 'HMXYIRWJWZA6AL'
update document
set ftpstime = NULL
where dcsid = 'HMXZJG90O95CGM' and pbatch = '02132971101106'

update document
set ftpstime = '2013-12-04 00:00:01'
where dcsid = 'HMXZJG90O95CGM' and pbatch = '02132971101106'


2013-12-04 00:52:39.587
2013-12-04 00:52:51.803

select * from document where dcsid = 'HN4J2C8EFXARS9'

2013-12-04 18:00:23.700
2013-12-04 18:00:28.550
2013-12-04 18:00:34.183

HMXZJG90O95CGM        02132971101106               12/04/2013
HN2DVYCSHCKDHE         02132981303704   401

select * from document where dcsid = 'HMXZJG90O95CGM'

select * from document where dcsid = 'HMXZJG90O95CGM' and ftpstime is null

select * from document where dcsid = 'HN2DVYCSHCKDHE' order by imageid
select * from document where ma18doctype = 'D' order by imageid

select sum(numpages) from document where dcsid = 'HN2DVYCSHCKDHE' order by imageid
2013-12-04 09:38:27.933
2013-12-04 09:38:33.410
2013-12-04 09:38:39.900
2013-12-04 09:38:46.250
2013-12-04 09:38:53.893
2013-12-04 09:38:59.883
2013-12-04 09:39:08.760
2013-12-04 09:39:16.467
2013-12-04 09:39:22.863
2013-12-04 09:39:28.480
2013-12-04 09:39:33.817
2013-12-04 09:39:40.227
2013-12-04 09:39:46.623
2013-12-04 09:39:52.333
2013-12-04 09:39:59.150
2013-12-04 09:40:05.983
2013-12-04 09:40:13.253
2013-12-04 09:40:19.667
2013-12-04 09:40:26.093
2013-12-04 09:40:31.600
2013-12-04 09:40:37.093
2013-12-04 09:40:42.397
2013-12-04 09:40:51.023
2013-12-04 09:40:57.827
2013-12-04 09:41:07.920
2013-12-04 09:41:13.957
2013-12-04 09:41:19.590
2013-12-04 09:41:26.687
2013-12-04 09:41:32.570
2013-12-04 09:41:40.603
2013-12-04 09:41:47.873
2013-12-04 09:41:57.403
2013-12-04 09:42:03.083
2013-12-04 09:42:08.340
2013-12-04 09:42:13.630
2013-12-04 09:42:19.527
2013-12-04 09:42:26.250
2013-12-04 09:42:32.380
2013-12-04 09:42:37.560
2013-12-04 09:42:43.053
2013-12-04 09:42:49.683
2013-12-04 09:42:55.503
2013-12-04 09:43:01.087
2013-12-04 09:43:07.843
2013-12-04 09:43:14.427
2013-12-04 09:43:20.557
2013-12-04 09:43:26.157
2013-12-04 09:43:32.397
2013-12-04 09:43:39.090
2013-12-04 09:43:45.097
2013-12-04 09:43:51.557
2013-12-04 09:43:57.763
2013-12-04 09:44:03.677
2013-12-04 09:44:09.777
2013-12-04 09:44:15.657
2013-12-04 09:44:21.820
2013-12-04 09:44:27.513
2013-12-04 09:44:33.957
2013-12-04 09:44:40.917
2013-12-04 09:44:47.437
2013-12-04 09:44:54.177
2013-12-04 09:45:05.503
2013-12-04 09:45:19.933
2013-12-04 09:45:26.533
2013-12-04 09:45:32.523
2013-12-04 09:45:38.437
2013-12-04 09:45:44.253
2013-12-04 09:45:50.307
2013-12-04 09:45:56.157
2013-12-04 09:46:01.727
2013-12-04 09:46:07.967
2013-12-04 09:46:14.223
2013-12-04 09:46:21.400
2013-12-04 09:46:28.077
2013-12-04 09:46:35.080
2013-12-04 09:46:41.603
2013-12-04 09:46:47.593
select * from document where imageid = 'CACI_133373101P001040784'

update document
set imageid = replace(imageid, 'CACI_133383101P', 'CACI_133383101R')
where dcsid = 'HN2DVYCSHCKDHE' and pbatch = '02132981303704'

select * from document where dcsid = 'HN2DVYCSHCKDHE'

CACI_133383101P001002614

select * from document where substring(imageid, 17, 1) <> 0 and ftpstime > '2014-03-13 15:0:0'


select * from document where dcsid = 'HSDASA146UUGMZ'