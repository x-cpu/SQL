select * from document where pbatch = '03151530625401' 
--select * from CustomerDATA where pbatch = '03151530606801'

select * from document where imageid = 'CACI_CMP_151332902P001004535'

--select * from cmprecon where imageid = 'CACI_CMP_151532902P001000390'


update document
set ftpstime = '2015-05-26 18:29:57.637'
where ImageID = 'CACI_CMP_151332902P001004535'



2015-06-13 15:31:00.530
2015-06-16 13:29:42.290
2015-06-09 08:20:53.033
2015-06-13 15:05:53.393
2014-12-10 21:03:41.867
2015-02-18 17:25:53.343
2015-02-14 09:33:41.497
2015-04-11 10:16:33.317
2015-06-10 11:23:29.640
2015-06-16 13:24:27.627
2015-06-12 08:48:52.243
2015-06-03 18:43:59.677
2015-06-11 14:52:11.067
2015-06-11 11:45:49.663
2015-06-08 20:00:54.933
2015-06-09 08:21:01.303
2015-06-12 09:19:18.843


select * from document where imageid in (
'CACI_CMP_151522902P001011516',
'CACI_CMP_151602902P001005421',
'CACI_CMP_151612902P001014938',
'CACI_CMP_151632901P001002397',
'CACI_CMP_150912902P001004213',
'CACI_CMP_151192902P001033425')
