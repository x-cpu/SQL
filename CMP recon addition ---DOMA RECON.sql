---CMP recon addition ---DOMA RECON
select * from pmrzipdownload where not exists (select * from domarecon where pmrzipdownload.batchname = SUBSTRING(XMLfilename, 1, 14))
order by batchname


--list  of DOMA imageIDs failing upload to VBMS
select distinct d.imageid, max(f.insertdate) LastUploadAttempt, substring(d.comments, 1, 20) ErrorComments from domarecon dr
left join document d
on dr.ImageID = d.ImageID
left join FTPError f
on d.ImageID = f.imageid
where d.ftpstime is null
and d.ImageID is not null
group by d.imageid, d.comments
order by max(f.insertdate)



--check to ensure all imageid from domarecon in document
select distinct dr.imageid from domarecon dr
join document d
on dr.ImageID = d.ImageID
where d.ftpstime is null

select * from domarecon


--duplicate imageid
select ImageID, count(*) DuplicateCount from document where pbatch like '11%'
group by ImageID
having count(imageID) > 1



--list  of DOMA imageIDs failing upload to VBMS -FOR X-LOOKUP
select distinct d.imageid, d.pbatch, max(f.insertdate) LastUploadAttempt, substring(d.comments, 1, 79) ErrorComments from domarecon dr
left join document d
on dr.ImageID = d.ImageID
left join FTPError f
on d.ImageID = f.imageid
where d.ftpstime is null
and d.ImageID is not null
group by d.imageid, d.comments, d.PBatch
order by max(f.insertdate)

--list  of DOMA imageIDs failing upload to VBMS
select distinct d.imageid, min(dr.insertdate) OriginalReceivedDate, max(f.insertdate) LastUploadAttempt, substring(d.comments, 1, 79) ErrorComments from domarecon dr
left join document d
on dr.ImageID = d.ImageID
left join FTPError f
on d.ImageID = f.imageid
where d.ftpstime is null  
and d.ImageID is not null
group by d.imageid, d.comments, d.PBatch
order by max(f.insertdate)


--list  of DOMA imageIDs failing upload to VBMS
select distinct d.imageid, min(dr.insertdate) OriginalReceivedDate, max(f.insertdate) LastUploadAttempt, substring(d.comments, 1, 20) ErrorComments from domarecon dr
left join document d
on dr.ImageID = d.ImageID
left join FTPError f
on d.ImageID = f.imageid
where d.ftpstime is null and 
d.imageid in (
'PMRID_1001268',
'PMRID_1005895',
'PMRID_1010695',
'PMRID_1013750',
'PMRID_1017087_1',
'PMRID_1017087_2',
'PMRID_1017087_3',
'PMRID_1017087_4',
'PMRID_132830',
'PMRID_138654',
'PMRID_143509',
'PMRID_154900',
'PMRID_156428',
'PMRID_178399',
'PMRID_186989',
'PMRID_190523',
'PMRID_196349',
'PMRID_198576',
'PMRID_202354',
'PMRID_203311',
'PMRID_203803',
'PMRID_204193',
'PMRID_204955',
'PMRID_223608',
'PMRID_227771_1',
'PMRID_227771_2',
'PMRID_229140',
'PMRID_229366',
'PMRID_259123',
'PMRID_264596',
'PMRID_271185',
'PMRID_276446',
'PMRID_281391',
'PMRID_282149',
'PMRID_284845',
'PMRID_285720',
'PMRID_288234',
'PMRID_288680',
'PMRID_289127',
'PMRID_295483',
'PMRID_297431',
'PMRID_303720',
'PMRID_303916',
'PMRID_304557',
'PMRID_305287',
'PMRID_320699',
'PMRID_321147',
'PMRID_328945',
'PMRID_328954',
'PMRID_333291',
'PMRID_338258',
'PMRID_346326',
'PMRID_347546',
'PMRID_347822',
'PMRID_350728',
'PMRID_356040',
'PMRID_360226_1',
'PMRID_360226_2',
'PMRID_360226_3',
'PMRID_360226_4',
'PMRID_360226_5',
'PMRID_360226_6',
'PMRID_368952',
'PMRID_370385',
'PMRID_371795',
'PMRID_374338',
'PMRID_374557',
'PMRID_374788',
'PMRID_378443',
'PMRID_380805',
'PMRID_383079',
'PMRID_387938',
'PMRID_392959',
'PMRID_393807',
'PMRID_396850',
'PMRID_401044_1',
'PMRID_401044_10',
'PMRID_401044_11',
'PMRID_401044_12',
'PMRID_401044_13',
'PMRID_401044_14',
'PMRID_401044_15',
'PMRID_401044_16',
'PMRID_401044_17',
'PMRID_401044_18',
'PMRID_401044_19',
'PMRID_401044_2',
'PMRID_401044_20',
'PMRID_401044_21',
'PMRID_401044_22',
'PMRID_401044_23',
'PMRID_401044_24',
'PMRID_401044_25',
'PMRID_401044_26',
'PMRID_401044_27',
'PMRID_401044_28',
'PMRID_401044_29',
'PMRID_401044_3',
'PMRID_401044_30',
'PMRID_401044_31',
'PMRID_401044_32',
'PMRID_401044_33',
'PMRID_401044_34',
'PMRID_401044_35',
'PMRID_401044_36',
'PMRID_401044_37',
'PMRID_401044_38',
'PMRID_401044_4',
'PMRID_401044_5',
'PMRID_401044_6',
'PMRID_401044_7',
'PMRID_401044_8',
'PMRID_401044_9',
'PMRID_407145',
'PMRID_416992',
'PMRID_421176_1',
'PMRID_421176_2',
'PMRID_421176_3',
'PMRID_421480',
'PMRID_423044',
'PMRID_424537',
'PMRID_428125',
'PMRID_429133',
'PMRID_435594',
'PMRID_436903',
'PMRID_445234',
'PMRID_446136',
'PMRID_449028',
'PMRID_449122',
'PMRID_460779',
'PMRID_469778',
'PMRID_470131',
'PMRID_475007',
'PMRID_475380_1',
'PMRID_475380_2',
'PMRID_484060',
'PMRID_484759',
'PMRID_486384',
'PMRID_500399',
'PMRID_500500',
'PMRID_500504',
'PMRID_502645',
'PMRID_511024',
'PMRID_511418',
'PMRID_515451',
'PMRID_515679',
'PMRID_515967',
'PMRID_522492',
'PMRID_526001',
'PMRID_527286',
'PMRID_539898',
'PMRID_540553',
'PMRID_540969',
'PMRID_541100',
'PMRID_541435',
'PMRID_541560',
'PMRID_541568',
'PMRID_545982',
'PMRID_548780',
'PMRID_550169',
'PMRID_550871_1',
'PMRID_550871_2',
'PMRID_550871_3',
'PMRID_561998',
'PMRID_563109',
'PMRID_564045',
'PMRID_567462',
'PMRID_567649',
'PMRID_569335',
'PMRID_570118',
'PMRID_570888',
'PMRID_573281',
'PMRID_573399',
'PMRID_573490',
'PMRID_573509',
'PMRID_573541',
'PMRID_574612',
'PMRID_575771',
'PMRID_582491',
'PMRID_589122',
'PMRID_589587',
'PMRID_590167',
'PMRID_600481',
'PMRID_610533',
'PMRID_611029',
'PMRID_611112',
'PMRID_612052',
'PMRID_614611',
'PMRID_616899',
'PMRID_621243',
'PMRID_623404',
'PMRID_624771',
'PMRID_625384',
'PMRID_625631',
'PMRID_625761',
'PMRID_625875',
'PMRID_625942',
'PMRID_625958',
'PMRID_629249',
'PMRID_629583',
'PMRID_629605',
'PMRID_635450',
'PMRID_635578',
'PMRID_637308',
'PMRID_642037',
'PMRID_643478',
'PMRID_643886',
'PMRID_644234',
'PMRID_651617',
'PMRID_653905',
'PMRID_655401_1',
'PMRID_655401_2',
'PMRID_655923',
'PMRID_656209_1',
'PMRID_656209_2',
'PMRID_656209_3',
'PMRID_656209_4',
'PMRID_656209_5',
'PMRID_656209_6',
'PMRID_656209_7',
'PMRID_656209_8',
'PMRID_656209_9',
'PMRID_656612',
'PMRID_656624',
'PMRID_656628',
'PMRID_657007',
'PMRID_657105',
'PMRID_657133',
'PMRID_657195',
'PMRID_664900_1',
'PMRID_664900_2',
'PMRID_667033',
'PMRID_669447',
'PMRID_671500',
'PMRID_671602',
'PMRID_671604',
'PMRID_676496',
'PMRID_684160',
'PMRID_684882',
'PMRID_685662',
'PMRID_685978',
'PMRID_68633',
'PMRID_689074',
'PMRID_693202',
'PMRID_698567',
'PMRID_699666',
'PMRID_699742',
'PMRID_701079',
'PMRID_701267',
'PMRID_701315',
'PMRID_701392',
'PMRID_701432',
'PMRID_701459',
'PMRID_701468',
'PMRID_701470',
'PMRID_701494',
'PMRID_701495',
'PMRID_701786',
'PMRID_701825',
'PMRID_701931',
'PMRID_702007',
'PMRID_702290',
'PMRID_702386',
'PMRID_702396',
'PMRID_702401',
'PMRID_702435',
'PMRID_702450',
'PMRID_702663',
'PMRID_702844',
'PMRID_702850',
'PMRID_702855',
'PMRID_703197',
'PMRID_703205',
'PMRID_703215',
'PMRID_703224',
'PMRID_703232',
'PMRID_703240',
'PMRID_703252',
'PMRID_703510',
'PMRID_703700',
'PMRID_703813',
'PMRID_704200',
'PMRID_704271',
'PMRID_704280',
'PMRID_704886',
'PMRID_704897',
'PMRID_704903',
'PMRID_704933',
'PMRID_704936',
'PMRID_704965',
'PMRID_705818',
'PMRID_705819',
'PMRID_705821',
'PMRID_705825',
'PMRID_705830',
'PMRID_705839',
'PMRID_705840',
'PMRID_705856',
'PMRID_705866',
'PMRID_705870',
'PMRID_705872',
'PMRID_705878',
'PMRID_705879',
'PMRID_705880',
'PMRID_705881_1',
'PMRID_705881_2',
'PMRID_705883',
'PMRID_705886',
'PMRID_705888',
'PMRID_705890',
'PMRID_705892',
'PMRID_705904',
'PMRID_705906',
'PMRID_705919',
'PMRID_706581',
'PMRID_706584',
'PMRID_706695',
'PMRID_706819',
'PMRID_706843',
'PMRID_707418',
'PMRID_707431',
'PMRID_707473',
'PMRID_709011',
'PMRID_710378',
'PMRID_710400',
'PMRID_710705',
'PMRID_710706',
'PMRID_710707',
'PMRID_713520',
'PMRID_714338',
'PMRID_714868',
'PMRID_715162',
'PMRID_715744',
'PMRID_716586',
'PMRID_716756',
'PMRID_716792',
'PMRID_716809',
'PMRID_717961',
'PMRID_717988',
'PMRID_718206',
'PMRID_718571',
'PMRID_719201',
'PMRID_720544',
'PMRID_720545',
'PMRID_720758',
'PMRID_720817',
'PMRID_721553',
'PMRID_722243',
'PMRID_722266',
'PMRID_723704',
'PMRID_723934',
'PMRID_725225',
'PMRID_731162',
'PMRID_732509',
'PMRID_733558',
'PMRID_734288',
'PMRID_737545',
'PMRID_737563',
'PMRID_737635',
'PMRID_737701',
'PMRID_737797',
'PMRID_737855',
'PMRID_737870',
'PMRID_737882',
'PMRID_737984',
'PMRID_738250',
'PMRID_740262',
'PMRID_743828',
'PMRID_743834',
'PMRID_743851',
'PMRID_744047',
'PMRID_745591',
'PMRID_746883',
'PMRID_746932_1',
'PMRID_746932_2',
'PMRID_747155',
'PMRID_747771',
'PMRID_750146',
'PMRID_750369_1',
'PMRID_750369_2',
'PMRID_750378',
'PMRID_750386',
'PMRID_750574',
'PMRID_750766',
'PMRID_751022',
'PMRID_751302_1',
'PMRID_751302_2',
'PMRID_752715',
'PMRID_752783',
'PMRID_752929',
'PMRID_753847',
'PMRID_755127',
'PMRID_755426',
'PMRID_757956',
'PMRID_764811',
'PMRID_765106',
'PMRID_765229',
'PMRID_765238',
'PMRID_767261',
'PMRID_767347',
'PMRID_773599',
'PMRID_774225',
'PMRID_783893',
'PMRID_784036',
'PMRID_784113_1',
'PMRID_784113_2',
'PMRID_784113_3',
'PMRID_784130',
'PMRID_784136',
'PMRID_784142',
'PMRID_784257',
'PMRID_784383',
'PMRID_785083',
'PMRID_785092',
'PMRID_785095',
'PMRID_785105',
'PMRID_785161',
'PMRID_785569',
'PMRID_785573',
'PMRID_785577',
'PMRID_785585',
'PMRID_785591',
'PMRID_785670',
'PMRID_785675_1',
'PMRID_785675_2',
'PMRID_785684',
'PMRID_785720',
'PMRID_785847',
'PMRID_785919',
'PMRID_786098',
'PMRID_786102',
'PMRID_786126',
'PMRID_786167',
'PMRID_786170',
'PMRID_786224',
'PMRID_786313',
'PMRID_786369',
'PMRID_786547',
'PMRID_786553',
'PMRID_786556',
'PMRID_786566',
'PMRID_786567',
'PMRID_786581',
'PMRID_786594',
'PMRID_786792',
'PMRID_786858',
'PMRID_786868',
'PMRID_786885',
'PMRID_786890',
'PMRID_786909',
'PMRID_786918',
'PMRID_786931',
'PMRID_786935',
'PMRID_786957',
'PMRID_786964',
'PMRID_786989_1',
'PMRID_786989_2',
'PMRID_786989_3',
'PMRID_787029',
'PMRID_787094',
'PMRID_787139',
'PMRID_787176',
'PMRID_787251',
'PMRID_787294',
'PMRID_787326',
'PMRID_787333',
'PMRID_787371',
'PMRID_787403',
'PMRID_787432',
'PMRID_787479',
'PMRID_787492',
'PMRID_787514',
'PMRID_787538',
'PMRID_787587',
'PMRID_787664',
'PMRID_788180',
'PMRID_788184',
'PMRID_788200',
'PMRID_788211',
'PMRID_788237',
'PMRID_788263',
'PMRID_788296',
'PMRID_788311',
'PMRID_788324',
'PMRID_788332',
'PMRID_788346',
'PMRID_788368',
'PMRID_788374',
'PMRID_788388',
'PMRID_788398',
'PMRID_788649',
'PMRID_788752',
'PMRID_788772',
'PMRID_788779',
'PMRID_788789',
'PMRID_788810',
'PMRID_788853',
'PMRID_788874',
'PMRID_788879',
'PMRID_788884',
'PMRID_789316',
'PMRID_789462',
'PMRID_789519',
'PMRID_789520',
'PMRID_790161',
'PMRID_79131',
'PMRID_793937',
'PMRID_794118',
'PMRID_794133',
'PMRID_794134',
'PMRID_794136',
'PMRID_794138',
'PMRID_794148',
'PMRID_794156',
'PMRID_794162',
'PMRID_794163',
'PMRID_794164',
'PMRID_794165',
'PMRID_794179',
'PMRID_794180',
'PMRID_794198',
'PMRID_794200',
'PMRID_794203',
'PMRID_794205',
'PMRID_794207',
'PMRID_794221',
'PMRID_794222',
'PMRID_794225',
'PMRID_794239',
'PMRID_794241',
'PMRID_794244',
'PMRID_794246',
'PMRID_794247',
'PMRID_794262',
'PMRID_794264',
'PMRID_794265',
'PMRID_794267',
'PMRID_794269',
'PMRID_794271',
'PMRID_794273',
'PMRID_794275',
'PMRID_794293',
'PMRID_794295',
'PMRID_794296',
'PMRID_794307',
'PMRID_794309',
'PMRID_794324',
'PMRID_794325',
'PMRID_794327',
'PMRID_794329',
'PMRID_794354',
'PMRID_794366',
'PMRID_794380',
'PMRID_794394',
'PMRID_794395',
'PMRID_794398',
'PMRID_794410',
'PMRID_794416',
'PMRID_794417',
'PMRID_794434',
'PMRID_794453',
'PMRID_794454',
'PMRID_794469',
'PMRID_794472',
'PMRID_794474',
'PMRID_794477',
'PMRID_794479',
'PMRID_794481',
'PMRID_794483',
'PMRID_794485',
'PMRID_794487',
'PMRID_794488',
'PMRID_794490',
'PMRID_794492',
'PMRID_794504',
'PMRID_794506',
'PMRID_794507',
'PMRID_794509',
'PMRID_794524',
'PMRID_794526',
'PMRID_794527',
'PMRID_794531',
'PMRID_794533',
'PMRID_794547',
'PMRID_794549',
'PMRID_794563',
'PMRID_794565',
'PMRID_794566',
'PMRID_794580',
'PMRID_794582',
'PMRID_794584',
'PMRID_794588',
'PMRID_794589',
'PMRID_794604',
'PMRID_794607',
'PMRID_794609',
'PMRID_794624',
'PMRID_794628',
'PMRID_794629',
'PMRID_794631',
'PMRID_794634',
'PMRID_794636',
'PMRID_794637',
'PMRID_794651',
'PMRID_794653',
'PMRID_794655',
'PMRID_794660',
'PMRID_794681',
'PMRID_794683',
'PMRID_794684',
'PMRID_794698',
'PMRID_794700',
'PMRID_794702',
'PMRID_794717',
'PMRID_794718',
'PMRID_794720',
'PMRID_794722',
'PMRID_794724',
'PMRID_794726',
'PMRID_794728',
'PMRID_794742',
'PMRID_794745',
'PMRID_794746',
'PMRID_794748',
'PMRID_794762',
'PMRID_794773',
'PMRID_794774',
'PMRID_794775',
'PMRID_794776',
'PMRID_794777',
'PMRID_794778',
'PMRID_794790',
'PMRID_794793',
'PMRID_794794',
'PMRID_794795',
'PMRID_794796',
'PMRID_794797',
'PMRID_794798',
'PMRID_794799',
'PMRID_794800',
'PMRID_794801',
'PMRID_794802',
'PMRID_794804',
'PMRID_794807',
'PMRID_794810',
'PMRID_794812',
'PMRID_794816',
'PMRID_794819',
'PMRID_794821',
'PMRID_794822',
'PMRID_794823',
'PMRID_794824',
'PMRID_794825',
'PMRID_794827',
'PMRID_794830',
'PMRID_794832',
'PMRID_794833',
'PMRID_794835',
'PMRID_794836',
'PMRID_794837',
'PMRID_794838',
'PMRID_794839',
'PMRID_794840',
'PMRID_794841',
'PMRID_794842',
'PMRID_794843',
'PMRID_794844',
'PMRID_794845',
'PMRID_794846',
'PMRID_794847',
'PMRID_794848',
'PMRID_794849',
'PMRID_794850',
'PMRID_794851',
'PMRID_794852',
'PMRID_794853',
'PMRID_794854',
'PMRID_794855',
'PMRID_794856',
'PMRID_794857',
'PMRID_794858',
'PMRID_794859',
'PMRID_794860',
'PMRID_794861',
'PMRID_794862',
'PMRID_794863',
'PMRID_794864',
'PMRID_794865',
'PMRID_794866',
'PMRID_794867',
'PMRID_794880',
'PMRID_794881',
'PMRID_794882',
'PMRID_794883',
'PMRID_794884',
'PMRID_794886',
'PMRID_794887',
'PMRID_794888',
'PMRID_794889',
'PMRID_794890',
'PMRID_794891',
'PMRID_794893',
'PMRID_794894',
'PMRID_794895',
'PMRID_794896',
'PMRID_794897',
'PMRID_794898',
'PMRID_794899',
'PMRID_794900',
'PMRID_794901',
'PMRID_794902',
'PMRID_794903',
'PMRID_794904',
'PMRID_794905',
'PMRID_794906',
'PMRID_794907',
'PMRID_794908',
'PMRID_794910',
'PMRID_794912',
'PMRID_794914',
'PMRID_794918',
'PMRID_794920',
'PMRID_794924',
'PMRID_794926',
'PMRID_794928',
'PMRID_794929',
'PMRID_794930',
'PMRID_794931',
'PMRID_794932',
'PMRID_794933',
'PMRID_794934',
'PMRID_794935',
'PMRID_794936',
'PMRID_794937',
'PMRID_794938',
'PMRID_794939',
'PMRID_794940',
'PMRID_794941',
'PMRID_794943',
'PMRID_794944',
'PMRID_794948',
'PMRID_794967',
'PMRID_794968',
'PMRID_794969',
'PMRID_794970',
'PMRID_794971',
'PMRID_794972',
'PMRID_794973',
'PMRID_794974',
'PMRID_795365',
'PMRID_795477',
'PMRID_795853',
'PMRID_801270',
'PMRID_802439',
'PMRID_804369_1',
'PMRID_804369_2',
'PMRID_811245',
'PMRID_81198',
'PMRID_812708',
'PMRID_812709',
'PMRID_812710',
'PMRID_812979',
'PMRID_818123',
'PMRID_82346',
'PMRID_826485',
'PMRID_828529',
'PMRID_831324',
'PMRID_832057',
'PMRID_834643',
'PMRID_834648',
'PMRID_838692',
'PMRID_838696',
'PMRID_838698',
'PMRID_839404',
'PMRID_839792',
'PMRID_841096',
'PMRID_854530',
'PMRID_857652',
'PMRID_93818',
'PMRID_942252',
'PMRID_969252',
'PMRID_979112',
'PMRID_981392',
'PMRID_992068',
'PMRID_992072',
'PMRID_999153',
'PMRID_999155')
group by d.imageid, d.comments
order by max(f.insertdate)


select * from document where imageid in (
'PMRID_1001268',
'PMRID_1005895',
'PMRID_1010695',
'PMRID_1013750',
'PMRID_1017087_1',
'PMRID_1017087_2',
'PMRID_1017087_3',
'PMRID_1017087_4',
'PMRID_132830',
'PMRID_138654',
'PMRID_143509',
'PMRID_154900',
'PMRID_156428',
'PMRID_178399',
'PMRID_186989',
'PMRID_190523',
'PMRID_196349',
'PMRID_198576',
'PMRID_202354',
'PMRID_203311',
'PMRID_203803',
'PMRID_204193',
'PMRID_204955',
'PMRID_223608',
'PMRID_227771_1',
'PMRID_227771_2',
'PMRID_229140',
'PMRID_229366',
'PMRID_259123',
'PMRID_264596',
'PMRID_271185',
'PMRID_276446',
'PMRID_281391',
'PMRID_282149',
'PMRID_284845',
'PMRID_285720',
'PMRID_288234',
'PMRID_288680',
'PMRID_289127',
'PMRID_295483',
'PMRID_297431',
'PMRID_303720',
'PMRID_303916',
'PMRID_304557',
'PMRID_305287',
'PMRID_320699',
'PMRID_321147',
'PMRID_328945',
'PMRID_328954',
'PMRID_333291',
'PMRID_338258',
'PMRID_346326',
'PMRID_347546',
'PMRID_347822',
'PMRID_350728',
'PMRID_356040',
'PMRID_360226_1',
'PMRID_360226_2',
'PMRID_360226_3',
'PMRID_360226_4',
'PMRID_360226_5',
'PMRID_360226_6',
'PMRID_368952',
'PMRID_370385',
'PMRID_371795',
'PMRID_374338',
'PMRID_374557',
'PMRID_374788',
'PMRID_378443',
'PMRID_380805',
'PMRID_383079',
'PMRID_387938',
'PMRID_392959',
'PMRID_393807',
'PMRID_396850',
'PMRID_401044_1',
'PMRID_401044_10',
'PMRID_401044_11',
'PMRID_401044_12',
'PMRID_401044_13',
'PMRID_401044_14',
'PMRID_401044_15',
'PMRID_401044_16',
'PMRID_401044_17',
'PMRID_401044_18',
'PMRID_401044_19',
'PMRID_401044_2',
'PMRID_401044_20',
'PMRID_401044_21',
'PMRID_401044_22',
'PMRID_401044_23',
'PMRID_401044_24',
'PMRID_401044_25',
'PMRID_401044_26',
'PMRID_401044_27',
'PMRID_401044_28',
'PMRID_401044_29',
'PMRID_401044_3',
'PMRID_401044_30',
'PMRID_401044_31',
'PMRID_401044_32',
'PMRID_401044_33',
'PMRID_401044_34',
'PMRID_401044_35',
'PMRID_401044_36',
'PMRID_401044_37',
'PMRID_401044_38',
'PMRID_401044_4',
'PMRID_401044_5',
'PMRID_401044_6',
'PMRID_401044_7',
'PMRID_401044_8',
'PMRID_401044_9',
'PMRID_407145',
'PMRID_416992',
'PMRID_421176_1',
'PMRID_421176_2',
'PMRID_421176_3',
'PMRID_421480',
'PMRID_423044',
'PMRID_424537',
'PMRID_428125',
'PMRID_429133',
'PMRID_435594',
'PMRID_436903',
'PMRID_445234',
'PMRID_446136',
'PMRID_449028',
'PMRID_449122',
'PMRID_460779',
'PMRID_469778',
'PMRID_470131',
'PMRID_475007',
'PMRID_475380_1',
'PMRID_475380_2',
'PMRID_484060',
'PMRID_484759',
'PMRID_486384',
'PMRID_500399',
'PMRID_500500',
'PMRID_500504',
'PMRID_502645',
'PMRID_511024',
'PMRID_511418',
'PMRID_515451',
'PMRID_515679',
'PMRID_515967',
'PMRID_522492',
'PMRID_526001',
'PMRID_527286',
'PMRID_539898',
'PMRID_540553',
'PMRID_540969',
'PMRID_541100',
'PMRID_541435',
'PMRID_541560',
'PMRID_541568',
'PMRID_545982',
'PMRID_548780',
'PMRID_550169',
'PMRID_550871_1',
'PMRID_550871_2',
'PMRID_550871_3',
'PMRID_561998',
'PMRID_563109',
'PMRID_564045',
'PMRID_567462',
'PMRID_567649',
'PMRID_569335',
'PMRID_570118',
'PMRID_570888',
'PMRID_573281',
'PMRID_573399',
'PMRID_573490',
'PMRID_573509',
'PMRID_573541',
'PMRID_574612',
'PMRID_575771',
'PMRID_582491',
'PMRID_589122',
'PMRID_589587',
'PMRID_590167',
'PMRID_600481',
'PMRID_610533',
'PMRID_611029',
'PMRID_611112',
'PMRID_612052',
'PMRID_614611',
'PMRID_616899',
'PMRID_621243',
'PMRID_623404',
'PMRID_624771',
'PMRID_625384',
'PMRID_625631',
'PMRID_625761',
'PMRID_625875',
'PMRID_625942',
'PMRID_625958',
'PMRID_629249',
'PMRID_629583',
'PMRID_629605',
'PMRID_635450',
'PMRID_635578',
'PMRID_637308',
'PMRID_642037',
'PMRID_643478',
'PMRID_643886',
'PMRID_644234',
'PMRID_651617',
'PMRID_653905',
'PMRID_655401_1',
'PMRID_655401_2',
'PMRID_655923',
'PMRID_656209_1',
'PMRID_656209_2',
'PMRID_656209_3',
'PMRID_656209_4',
'PMRID_656209_5',
'PMRID_656209_6',
'PMRID_656209_7',
'PMRID_656209_8',
'PMRID_656209_9',
'PMRID_656612',
'PMRID_656624',
'PMRID_656628',
'PMRID_657007',
'PMRID_657105',
'PMRID_657133',
'PMRID_657195',
'PMRID_664900_1',
'PMRID_664900_2',
'PMRID_667033',
'PMRID_669447',
'PMRID_671500',
'PMRID_671602',
'PMRID_671604',
'PMRID_676496',
'PMRID_684160',
'PMRID_684882',
'PMRID_685662',
'PMRID_685978',
'PMRID_68633',
'PMRID_689074',
'PMRID_693202',
'PMRID_698567',
'PMRID_699666',
'PMRID_699742',
'PMRID_701079',
'PMRID_701267',
'PMRID_701315',
'PMRID_701392',
'PMRID_701432',
'PMRID_701459',
'PMRID_701468',
'PMRID_701470',
'PMRID_701494',
'PMRID_701495',
'PMRID_701786',
'PMRID_701825',
'PMRID_701931',
'PMRID_702007',
'PMRID_702290',
'PMRID_702386',
'PMRID_702396',
'PMRID_702401',
'PMRID_702435',
'PMRID_702450',
'PMRID_702663',
'PMRID_702844',
'PMRID_702850',
'PMRID_702855',
'PMRID_703197',
'PMRID_703205',
'PMRID_703215',
'PMRID_703224',
'PMRID_703232',
'PMRID_703240',
'PMRID_703252',
'PMRID_703510',
'PMRID_703700',
'PMRID_703813',
'PMRID_704200',
'PMRID_704271',
'PMRID_704280',
'PMRID_704886',
'PMRID_704897',
'PMRID_704903',
'PMRID_704933',
'PMRID_704936',
'PMRID_704965',
'PMRID_705818',
'PMRID_705819',
'PMRID_705821',
'PMRID_705825',
'PMRID_705830',
'PMRID_705839',
'PMRID_705840',
'PMRID_705856',
'PMRID_705866',
'PMRID_705870',
'PMRID_705872',
'PMRID_705878',
'PMRID_705879',
'PMRID_705880',
'PMRID_705881_1',
'PMRID_705881_2',
'PMRID_705883',
'PMRID_705886',
'PMRID_705888',
'PMRID_705890',
'PMRID_705892',
'PMRID_705904',
'PMRID_705906',
'PMRID_705919',
'PMRID_706581',
'PMRID_706584',
'PMRID_706695',
'PMRID_706819',
'PMRID_706843',
'PMRID_707418',
'PMRID_707431',
'PMRID_707473',
'PMRID_709011',
'PMRID_710378',
'PMRID_710400',
'PMRID_710705',
'PMRID_710706',
'PMRID_710707',
'PMRID_713520',
'PMRID_714338',
'PMRID_714868',
'PMRID_715162',
'PMRID_715744',
'PMRID_716586',
'PMRID_716756',
'PMRID_716792',
'PMRID_716809',
'PMRID_717961',
'PMRID_717988',
'PMRID_718206',
'PMRID_718571',
'PMRID_719201',
'PMRID_720544',
'PMRID_720545',
'PMRID_720758',
'PMRID_720817',
'PMRID_721553',
'PMRID_722243',
'PMRID_722266',
'PMRID_723704',
'PMRID_723934',
'PMRID_725225',
'PMRID_731162',
'PMRID_732509',
'PMRID_733558',
'PMRID_734288',
'PMRID_737545',
'PMRID_737563',
'PMRID_737635',
'PMRID_737701',
'PMRID_737797',
'PMRID_737855',
'PMRID_737870',
'PMRID_737882',
'PMRID_737984',
'PMRID_738250',
'PMRID_740262',
'PMRID_743828',
'PMRID_743834',
'PMRID_743851',
'PMRID_744047',
'PMRID_745591',
'PMRID_746883',
'PMRID_746932_1',
'PMRID_746932_2',
'PMRID_747155',
'PMRID_747771',
'PMRID_750146',
'PMRID_750369_1',
'PMRID_750369_2',
'PMRID_750378',
'PMRID_750386',
'PMRID_750574',
'PMRID_750766',
'PMRID_751022',
'PMRID_751302_1',
'PMRID_751302_2',
'PMRID_752715',
'PMRID_752783',
'PMRID_752929',
'PMRID_753847',
'PMRID_755127',
'PMRID_755426',
'PMRID_757956',
'PMRID_764811',
'PMRID_765106',
'PMRID_765229',
'PMRID_765238',
'PMRID_767261',
'PMRID_767347',
'PMRID_773599',
'PMRID_774225',
'PMRID_783893',
'PMRID_784036',
'PMRID_784113_1',
'PMRID_784113_2',
'PMRID_784113_3',
'PMRID_784130',
'PMRID_784136',
'PMRID_784142',
'PMRID_784257',
'PMRID_784383',
'PMRID_785083',
'PMRID_785092',
'PMRID_785095',
'PMRID_785105',
'PMRID_785161',
'PMRID_785569',
'PMRID_785573',
'PMRID_785577',
'PMRID_785585',
'PMRID_785591',
'PMRID_785670',
'PMRID_785675_1',
'PMRID_785675_2',
'PMRID_785684',
'PMRID_785720',
'PMRID_785847',
'PMRID_785919',
'PMRID_786098',
'PMRID_786102',
'PMRID_786126',
'PMRID_786167',
'PMRID_786170',
'PMRID_786224',
'PMRID_786313',
'PMRID_786369',
'PMRID_786547',
'PMRID_786553',
'PMRID_786556',
'PMRID_786566',
'PMRID_786567',
'PMRID_786581',
'PMRID_786594',
'PMRID_786792',
'PMRID_786858',
'PMRID_786868',
'PMRID_786885',
'PMRID_786890',
'PMRID_786909',
'PMRID_786918',
'PMRID_786931',
'PMRID_786935',
'PMRID_786957',
'PMRID_786964',
'PMRID_786989_1',
'PMRID_786989_2',
'PMRID_786989_3',
'PMRID_787029',
'PMRID_787094',
'PMRID_787139',
'PMRID_787176',
'PMRID_787251',
'PMRID_787294',
'PMRID_787326',
'PMRID_787333',
'PMRID_787371',
'PMRID_787403',
'PMRID_787432',
'PMRID_787479',
'PMRID_787492',
'PMRID_787514',
'PMRID_787538',
'PMRID_787587',
'PMRID_787664',
'PMRID_788180',
'PMRID_788184',
'PMRID_788200',
'PMRID_788211',
'PMRID_788237',
'PMRID_788263',
'PMRID_788296',
'PMRID_788311',
'PMRID_788324',
'PMRID_788332',
'PMRID_788346',
'PMRID_788368',
'PMRID_788374',
'PMRID_788388',
'PMRID_788398',
'PMRID_788649',
'PMRID_788752',
'PMRID_788772',
'PMRID_788779',
'PMRID_788789',
'PMRID_788810',
'PMRID_788853',
'PMRID_788874',
'PMRID_788879',
'PMRID_788884',
'PMRID_789316',
'PMRID_789462',
'PMRID_789519',
'PMRID_789520',
'PMRID_790161',
'PMRID_79131',
'PMRID_793937',
'PMRID_794118',
'PMRID_794133',
'PMRID_794134',
'PMRID_794136',
'PMRID_794138',
'PMRID_794148',
'PMRID_794156',
'PMRID_794162',
'PMRID_794163',
'PMRID_794164',
'PMRID_794165',
'PMRID_794179',
'PMRID_794180',
'PMRID_794198',
'PMRID_794200',
'PMRID_794203',
'PMRID_794205',
'PMRID_794207',
'PMRID_794221',
'PMRID_794222',
'PMRID_794225',
'PMRID_794239',
'PMRID_794241',
'PMRID_794244',
'PMRID_794246',
'PMRID_794247',
'PMRID_794262',
'PMRID_794264',
'PMRID_794265',
'PMRID_794267',
'PMRID_794269',
'PMRID_794271',
'PMRID_794273',
'PMRID_794275',
'PMRID_794293',
'PMRID_794295',
'PMRID_794296',
'PMRID_794307',
'PMRID_794309',
'PMRID_794324',
'PMRID_794325',
'PMRID_794327',
'PMRID_794329',
'PMRID_794354',
'PMRID_794366',
'PMRID_794380',
'PMRID_794394',
'PMRID_794395',
'PMRID_794398',
'PMRID_794410',
'PMRID_794416',
'PMRID_794417',
'PMRID_794434',
'PMRID_794453',
'PMRID_794454',
'PMRID_794469',
'PMRID_794472',
'PMRID_794474',
'PMRID_794477',
'PMRID_794479',
'PMRID_794481',
'PMRID_794483',
'PMRID_794485',
'PMRID_794487',
'PMRID_794488',
'PMRID_794490',
'PMRID_794492',
'PMRID_794504',
'PMRID_794506',
'PMRID_794507',
'PMRID_794509',
'PMRID_794524',
'PMRID_794526',
'PMRID_794527',
'PMRID_794531',
'PMRID_794533',
'PMRID_794547',
'PMRID_794549',
'PMRID_794563',
'PMRID_794565',
'PMRID_794566',
'PMRID_794580',
'PMRID_794582',
'PMRID_794584',
'PMRID_794588',
'PMRID_794589',
'PMRID_794604',
'PMRID_794607',
'PMRID_794609',
'PMRID_794624',
'PMRID_794628',
'PMRID_794629',
'PMRID_794631',
'PMRID_794634',
'PMRID_794636',
'PMRID_794637',
'PMRID_794651',
'PMRID_794653',
'PMRID_794655',
'PMRID_794660',
'PMRID_794681',
'PMRID_794683',
'PMRID_794684',
'PMRID_794698',
'PMRID_794700',
'PMRID_794702',
'PMRID_794717',
'PMRID_794718',
'PMRID_794720',
'PMRID_794722',
'PMRID_794724',
'PMRID_794726',
'PMRID_794728',
'PMRID_794742',
'PMRID_794745',
'PMRID_794746',
'PMRID_794748',
'PMRID_794762',
'PMRID_794773',
'PMRID_794774',
'PMRID_794775',
'PMRID_794776',
'PMRID_794777',
'PMRID_794778',
'PMRID_794790',
'PMRID_794793',
'PMRID_794794',
'PMRID_794795',
'PMRID_794796',
'PMRID_794797',
'PMRID_794798',
'PMRID_794799',
'PMRID_794800',
'PMRID_794801',
'PMRID_794802',
'PMRID_794804',
'PMRID_794807',
'PMRID_794810',
'PMRID_794812',
'PMRID_794816',
'PMRID_794819',
'PMRID_794821',
'PMRID_794822',
'PMRID_794823',
'PMRID_794824',
'PMRID_794825',
'PMRID_794827',
'PMRID_794830',
'PMRID_794832',
'PMRID_794833',
'PMRID_794835',
'PMRID_794836',
'PMRID_794837',
'PMRID_794838',
'PMRID_794839',
'PMRID_794840',
'PMRID_794841',
'PMRID_794842',
'PMRID_794843',
'PMRID_794844',
'PMRID_794845',
'PMRID_794846',
'PMRID_794847',
'PMRID_794848',
'PMRID_794849',
'PMRID_794850',
'PMRID_794851',
'PMRID_794852',
'PMRID_794853',
'PMRID_794854',
'PMRID_794855',
'PMRID_794856',
'PMRID_794857',
'PMRID_794858',
'PMRID_794859',
'PMRID_794860',
'PMRID_794861',
'PMRID_794862',
'PMRID_794863',
'PMRID_794864',
'PMRID_794865',
'PMRID_794866',
'PMRID_794867',
'PMRID_794880',
'PMRID_794881',
'PMRID_794882',
'PMRID_794883',
'PMRID_794884',
'PMRID_794886',
'PMRID_794887',
'PMRID_794888',
'PMRID_794889',
'PMRID_794890',
'PMRID_794891',
'PMRID_794893',
'PMRID_794894',
'PMRID_794895',
'PMRID_794896',
'PMRID_794897',
'PMRID_794898',
'PMRID_794899',
'PMRID_794900',
'PMRID_794901',
'PMRID_794902',
'PMRID_794903',
'PMRID_794904',
'PMRID_794905',
'PMRID_794906',
'PMRID_794907',
'PMRID_794908',
'PMRID_794910',
'PMRID_794912',
'PMRID_794914',
'PMRID_794918',
'PMRID_794920',
'PMRID_794924',
'PMRID_794926',
'PMRID_794928',
'PMRID_794929',
'PMRID_794930',
'PMRID_794931',
'PMRID_794932',
'PMRID_794933',
'PMRID_794934',
'PMRID_794935',
'PMRID_794936',
'PMRID_794937',
'PMRID_794938',
'PMRID_794939',
'PMRID_794940',
'PMRID_794941',
'PMRID_794943',
'PMRID_794944',
'PMRID_794948',
'PMRID_794967',
'PMRID_794968',
'PMRID_794969',
'PMRID_794970',
'PMRID_794971',
'PMRID_794972',
'PMRID_794973',
'PMRID_794974',
'PMRID_795365',
'PMRID_795477',
'PMRID_795853',
'PMRID_801270',
'PMRID_802439',
'PMRID_804369_1',
'PMRID_804369_2',
'PMRID_811245',
'PMRID_81198',
'PMRID_812708',
'PMRID_812709',
'PMRID_812710',
'PMRID_812979',
'PMRID_818123',
'PMRID_82346',
'PMRID_826485',
'PMRID_828529',
'PMRID_831324',
'PMRID_832057',
'PMRID_834643',
'PMRID_834648',
'PMRID_838692',
'PMRID_838696',
'PMRID_838698',
'PMRID_839404',
'PMRID_839792',
'PMRID_841096',
'PMRID_854530',
'PMRID_857652',
'PMRID_93818',
'PMRID_942252',
'PMRID_969252',
'PMRID_979112',
'PMRID_981392',
'PMRID_992068',
'PMRID_992072',
'PMRID_999153',
'PMRID_999155') and ftpstime is null

select * from domarecon where XMLfilename = '20141209000538.xml'

select * from domarecon where imageid = 'PMRID_200202'
select * from cmprecon where imageid = 'PMRID_195546'
select * from Document where ImageID = 'PMRID_195546'

select * from domarecon where pBatch = '11143170000018'

select * from Document where pbatch = '11143440000177' and FileNumber = '25793468'

select * from domarecon where FileNumber = '25793468'



select * from pmrzipdownload where acktime > '2014-12-10 0:0:0' and AckTime < '2014-12-10 23:59:59.999'
and not exists (select * from domarecon where pmrzipdownload.batchname = SUBSTRING(XMLfilename, 0, 13))

select * from domarecon where XMLfilename = '20141202233126'

select * from pmrzipdownload where batchname = '20141202233126'

select * from cmprecon where pbatch = '03150580622701'
select * from FTPDetails where batchname = '03150410616801'

20141112230652.xml


select * from document where pbatch = '02150640001001'


select distinct pbatch from document where imageid in (
'PMRID_287200',
'PMRID_287201',
'PMRID_287202',
'PMRID_287215',
'PMRID_287218',
'PMRID_287221',
'PMRID_287223',
'PMRID_287240',
'PMRID_374289',
'PMRID_374313',
'PMRID_374366',
'PMRID_374370',
'PMRID_374380',
'PMRID_374412',
'PMRID_626345',
'PMRID_790297',
'PMRID_790303',
'PMRID_722401',
'PMRID_722407',
'PMRID_722408',
'PMRID_722453',
'PMRID_722493',
'PMRID_789003',
'PMRID_789026',
'PMRID_789043',
'PMRID_789048',
'PMRID_789049',
'PMRID_789232')



select dr.ImageID, dr.DCSID, SUBSTRING(dr.XMLfilename, 1, 14) ZIPFile, max(d.ftpstime) VBMSUpdateDate, max(f.insertdate) LastUploadAttemptDate from domarecon dr
left join document d
on dr.ImageID = d.ImageID
left join FTPError f
on dr.ImageID = f.imageid
 where SUBSTRING(dr.XMLfilename, 1, 14) in (
'20141206235745',
'20141210001037',
'20141210001159',
'20141212091344',
'20141216230947',
'20141216231052',
'20141216231311',
'20141217232341',
'20141217233702',
'20141217235326',
'20141225000420',
'20141228004358',
'20141230233714',
'20150116004341',
'20150125012558',
'20150127015039',
'20141203235239',
'20150208000045')
group by dr.ImageID, dr.DCSID, SUBSTRING(dr.XMLfilename, 1, 14)




select dr.ImageID, dr.DCSID, SUBSTRING(dr.XMLfilename, 1, 14) ZIPFile, max(d.ftpstime) VBMSUpdateDate, max(f.insertdate) LastUploadAttemptDate, substring(f.comments, 1, 20) from domarecon dr
left join document d
on dr.ImageID = d.ImageID
left join FTPError f
on dr.ImageID = f.imageid
 where SUBSTRING(dr.XMLfilename, 1, 14) in (
'20141206235745',
'20141210001037',
'20141210001159',
'20141212091344',
'20141216230947',
'20141216231052',
'20141216231311',
'20141217232341',
'20141217233702',
'20141217235326',
'20141225000420',
'20141228004358',
'20141230233714',
'20150116004341',
'20150125012558',
'20150127015039',
'20141203235239',
'20150208000045')
and f.comments <> 'skipped'
group by dr.ImageID, dr.DCSID, SUBSTRING(dr.XMLfilename, 1, 14), substring(f.comments, 1, 20)
