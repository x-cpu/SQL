select d.pbatch, max(ImageDateTime), sum(numpages) #ofIMGS from document d 
where d.comments like 'unable%' and d.pbatch not in (select pbatch from document_temp6) group by d.PBatch order by #ofIMGS desc


select d.pbatch, max(ImageDateTime), sum(numpages) #ofIMGS from document d 
where d.comments like 'unable%' and d.pbatch  in (select pbatch from pbatch_comments) group by d.PBatch order by #ofIMGS desc

--from CACI/VA reporting
select distinct dcsID, FileNumber, RMN, sum(numpages) #ofIMGS, convert(date, ImageDateTime, 101) from document d 
where d.comments like '%unable%' and ImageDateTime < '2014-03-31 0:0:0' 
and d.pbatch  in (select pbatch from pbatch_comments) 
group by dcsID, FileNumber, RMN, ImageDateTime  order by #ofIMGS desc

--from CACI/VA reporting
select distinct dcsID, FileNumber, RMN, sum(numpages) #ofIMGS, convert(date, ImageDateTime, 101) from document d 
where d.comments like '%unable%'
and d.pbatch  in (select pbatch from pbatch_comments) 
group by dcsID, FileNumber, RMN, ImageDateTime  order by #ofIMGS desc



--from CACI/VA reporting
select distinct dcsID, FileNumber, RMN, PBatch from document d 
where d.comments like '%unable%' and ftpstime is null and ImageDateTime < '2014-03-01 0:0:0' 
and d.pbatch  in (select pbatch from pbatch_comments) 
group by dcsID, FileNumber, RMN, PBatch

--from CACI/VA reporting - ACTUAL ACCELION
select distinct d.dcsID, d.RMN, d.FileNumber, max(convert(date, m.insertdate, 101)) CheckIn, c.numDocs Documents, sum(numpages) Images, cc.claimtype, 'Newnan' ScanningSite, d.comments from document d
join manifestDCS m on  d.dcsID = m.dcsID
join CustomerDATA c on  d.dcsID = c.dcsID
join customerCheckIn cc on  d.RMN = cc.RMN
where d.comments like '%unable%' and ftpstime is null 
and d.pbatch  in (select pbatch from pbatch_comments) 
group by d.dcsID, d.FileNumber, d.RMN, cc.claimtype, c.numDocs, d.Comments


select d.pbatch, max(ImageDateTime), sum(numpages) #ofIMGS from document d 
where d.comments like 'unable%' group by d.PBatch order by #ofIMGS desc


select d.pbatch, max(ImageDateTime), sum(numpages) #ofIMGS from document d 
where d.comments like 'valid%'  group by d.PBatch order by #ofIMGS desc


select * from pbatch_comments

select * from document where pbatch = '02131830202801' and ftpstime is null order by ImageID


select distinct dcsid from document where pbatch = '02140340500101' order by ImageID


update document 
set filenumber = '25034936'
where filenumber = '25034936 ' and pbatch = '02140350508103'

update CustomerDATA 
set filenumber = '25034936'
where filenumber = '25034936 ' and pbatch = '02140350508103'


-- need to fix this ...uploaded with wrong file# HND6G2UZX93Z3K 11/20/2013



select * from Stats_IBML where batchname like '%02140710203401%'

select * from TS_Audit where BatchName = '02140800503904'
select * from TS_Audit  where BatchName = '02140800503903'

select * from document where pbatch = '02140660201301'

delete from manifestdcs where dcsid = 'hif08mwg6x2mr7'

select * from manifestDCS where rmn = '314VB0626130763O'
select * from Document where dcsid = 'hif08mwg6x2mr7'


select distinct pbatch from pbatch_comments where pbatch in (
'02130840013301',
'02131750206505',
'02131830005401',
'02131830202801',
'02131930001707',
'02131930202504',
'02131980003401',
'02132010002702',
'02132080006405',
'02132130005904',
'02132130005905',
'02132290203205',
'02132290204204',
'02132290701101',
'02132300001003',
'02132300001004',
'02132300001104',
'02132300004103',
'02132300005603',
'02132300006106',
'02132300006603',
'02132300006605',
'02132300008104',
'02132300009903',
'02132300201003',
'02132310207003',
'02132320005704',
'02132330200904',
'02132330208204',
'02132350401006',
'02132350401007',
'02132410504701',
'02132480000501',
'02132480000502',
'02132660501905',
'02132670504404',
'02132690403205',
'02132730200102',
'02133170504401',
'02133240200401',
'02133400001801',
'02133400002102',
'02133400003406',
'02133400200301',
'02133400201601',
'02133400202105',
'02133400501102',
'02133440001101',
'02133450201702',
'02133580000501',
'02133580001505',
'02133580002606',
'02133580002705',
'02133580003202',
'02133580003204',
'02133580003206',
'02133580003304',
'02133580400501',
'02133580400801',
'02133580500605',
'02133580500701',
'02133580500902',
'02133580502603',
'02133580502604',
'02133580503004',
'02133580503502',
'02133610503406',
'02140060404404',
'02140070502204',
'02140160403305',
'02140170502403',
'02140210408801',
'02140220001403',
'02140230503805',
'02140240000805',
'02140310202804',
'02140310404203',
'02140340500101',
'02140350508103')



select distinct pbatch into document_temp6 from document where dcsid in (
'HH98GEZBPAA3TB',
'HNHBGKU1JBAKTR',
'HNJ0LDC33I1ETO',
'HNQDFNCRUE42IY',
'HNZYL8BHXGHEFG',
'HNZYVVOJDZODJL',
'HNZYWMA3WTRRGY',
'HNZYZTI5NMGXCF',
'HOBG4DLS2V4U48',
'HOG0V7IQI9U49Q',
'HOG1Y3KW4KVCDV',
'HOIV7N27L6IGUZ',
'HOMU2WEHRUKO7N',
'HON0TPH4LHCDPZ',
'HOR3GXLFH6C4XV',
'HOR3Z319LSZ9BE',
'HOR41STWPON1OT',
'HOR444OT3V1HR1',
'HOR45V9FDOGPH',
'HOU6O71TI2RAFB',
'HP2Z6067PZ6KLO',
'HP2Z6JJY35URKF',
'HP2Z94T9CUNY71',
'HP5O3AATHGPE7P',
'HP70OK7DBD5BBK',
'HPE8AMT7X7JIXG',
'HQE5V9C352H7XN',
'HQJT30HKYRQ68O',
'HQS44MGJFMLBFM',
'HQV1ZFMIK23BO3',
'HQV4HVHYXPXY5V',
'HQV4QFBYSS9AA7',
'HR0OSNUP9UHV9M',
'HRC6CC5M4Q4VM5',
'HRCC9N9YGWHARN',
'HRI3E4DA69011H',
'HRW83UUYAD70BA',
'HRZ5FJ1X9110BC',
'HS65WKI9MJTQOW',
'HS66B6MQ37YE07',
'HS6HJUNJL4K3X7',
'HS6IAV70V738J9',
'HSEYNP0WHDLX8O',
'HSLSKSR51MQ8UW',
'HSOGK8H5GER4UB',
'HSOPFWJP6PUPXT',
'HSQ7H3IAIKIH23',
'HSQF73HM7YC717')

select * from document where dcsid = 'HO5UGHRZV3K9BB'

select * from document where pbatch = '02133240400202'


select BatchName, TSModule, UserName, TotalImages, ImagesProcessed, TimeStamp from TS_Audit where BatchName = '02133240400202'


select * from TS_Audit where BatchName = '02133240400202'



select * from manifestDCS where rmn = '397VB0415148339A'

select boxtype, BoxNO from boxmapping where dcsID = 'HO5UGHRZV3K9BB'

BoxType	pbatch	RMN	dcsID	BoxNO
ADMIN	NULL	NULL	HO5UGHRZV3K9BB	44915
STR	NULL	NULL	HO5UGHRZV3K9BB	44916
shipmentno	PaletteWithinShipment
21	19

select * from Boxmapping where BoxNO = '44916'