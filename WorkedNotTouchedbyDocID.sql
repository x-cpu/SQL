select distinct T.BatchName
FROM
(select * from TS_Audit where BatchName in (
'02150920004101',
'02151590301310',
'02151600301307',
'02151660801701',
'02151660802601',
'02151660802701',
'02151670806501',
'02151670806601',
'02151660800401',
'02151660800701',
'02151660800501',
'02151660801301',
'02151700804101',
'02151730802301',
'02151550806701',
'02151410809701',
'02151400001702',
'02151400001703',
'02152040403802',
'02152120403803',
'02152150300804',
'02152150301401',
'02152150301403',
'02152150301404',
'02152150301405',
'02152150001702',
'02152150401303',
'02152150401302',
'02152150401305',
'02152150401304',
'02152150301002',
'02152150301003',
'02152150301004',
'02152150301005',
'02152150400704',
'02152150001801',
'02152150001802',
'02152150001803',
'02152150400802',
'02152150400803',
'02152150001804',
'02152150400801',
'02152150301201',
'02152150400904',
'02152150400804',
'02152150301202',
'02152150400902',
'02152150400805',
'02152150301204',
'02152150400903',
'02152150400901',
'02152150301102',
'02152150001902',
'02152150400905',
'02152150001903',
'02152150001904',
'02152150301104',
'02152150001905',
'02152150001906',
'02152150301105',
'02152150401404',
'02152150401403',
'02152150401402',
'02152150302304',
'02152150302301',
'02152150302302',
'02152150302303',
'02152150301904',
'02152150401503',
'02152150301902',
'02152150401501',
'02152150401504',
'02152150301303',
'02152150401505',
'02152150402101',
'02152150402202',
'02152150301301',
'02152150402102',
'02152150402201',
'02152150301304',
'02152150402103',
'02152160803701',
'02152150301606',
'02152150402203',
'02152150300503',
'02152150301602',
'02152150001504',
'02152150402204',
'02152150301603',
'02152150300501',
'02152150301605',
'02152150301604',
'02152150001501',
'02152150300504',
'02152150001503',
'02152150001502',
'02152150300502',
'02152150301601',
'02152150001505',
'02152150402404',
'02152150402401',
'02152150402403',
'02152150402402',
'02152150401801',
'02152150401805',
'02152150401702',
'02152150302205',
'02152150401804',
'02152150401704',
'02152150302203',
'02152150402501',
'02152150300205',
'02152150401803',
'02152150302202',
'02152150401705',
'02152150401701',
'02152150402504',
'02152150401703',
'02152160001001',
'02152150402505',
'02152150401903',
'02152150302206',
'02152150401904',
'02152160000902',
'02152160000901',
'02152160001103',
'02152150402503',
'02152160000702',
'02152160000704',
'02152160000701',
'02152150402002',
'02152150402001',
'02152150402005',
'02152150402003',
'02152160002302',
'02152150302204',
'02152160001801',
'02152160001802',
'02152160001803',
'02152160002604',
'02152160400404',
'02152160001904',
'02152160401901',
'02152160401902',
'02152160401904',
'02152160401903',
'02152160401103',
'02152160001304',
'02152160001305',
'02152160001303',
'02152160001302',
'02152160001401',
'02152160001402',
'02152160001403',
'02152160001201',
'02152160001203',
'02152160001705',
'02152160001702',
'02152160003101',
'02152160401501',
'02152160401603',
'02152160003203',
'02152160401502',
'02152160003102',
'02152160401602',
'02152160003202',
'02152160401503',
'02152160003201',
'02152160003103',
'02152160401504',
'02152160401601',
'02152160003603',
'02152160401801',
'02152160003604',
'02152160003605',
'02152160300401',
'02152160401802',
'02152160300402',
'02152160402101',
'02152160401803',
'02152160300403',
'02152160402102',
'02152160401804',
'02152160300404',
'02152160402103',
'02152160401701',
'02152160401703',
'02152160401702',
'02152160403003',
'02152160403002',
'02152160403001',
'02152160402404',
'02152160402403',
'02152160402401',
'02152160402004',
'02152160402001',
'02152160402002',
'02152160301001',
'02152160402202',
'02152160301003',
'02152160301005',
'02152160402203',
'02152160402204',
'02152160301202',
'02152160301203',
'02152160402104',
'02152160301501',
'02152160301502',
'02152160401402',
'02152160301503',
'02152160401403',
'02152160301504',
'02152160301505',
'02152160401404',
'02152160300104',
'02152160300103',
'02152160402605',
'02152160301603',
'02152160402604',
'02152160301601',
'02152160300102',
'02152160301602',
'02152160402603',
'02152160402602',
'02152160402601',
'02152160300301',
'02152160301604',
'02152160300302',
'02152160402801',
'02152160003401',
'02152160300303',
'02152160402804',
'02152160003405',
'02152160003301',
'02152160300304',
'02152160004002',
'02152160004001',
'02152160003302',
'02152160003403',
'02152160003303',
'02152160402803',
'02152160003404',
'02152160003304',
'02152160300703',
'02152160301402',
'02152160003503',
'02152160402901',
'02152160300704',
'02152160402904',
'02152160301404',
'02152160003501',
'02152160300802',
'02152160301403',
'02152160300701',
'02152160300801',
'02152160003502',
'02152160300702',
'02152160300804',
'02152160402903',
'02152160402702',
'02152160300803',
'02152160300204',
'02152160300805',
'02152160402503',
'02152160402704',
'02152160402501',
'02152160300201',
'02152160300501',
'02152160300205',
'02152160402502',
'02152160301104',
'02152160300503',
'02152160300202',
'02152160301102',
'02152160300502',
'02152160402304',
'02152160300203',
'02152160300504',
'02152160402303',
'02152160301304',
'02152160301103',
'02152160300904',
'02152160402301',
'02152160300903',
'02152160301303',
'02152160301301',
'02152160300902',
'02152160301101',
'02152160301302',
'02152160402302',
'02152160300901',
'02152150301103',
'02152160300602',
'02152160300601',
'02152160300604',
'02152160300603',
'02152160300605',
'02152170001902',
'02152170000605',
'02152170003004',
'02152170000604',
'02152170003001',
'02152170000601',
'02152170400804',
'02152170003003',
'02152170001401',
'02152170000602',
'02152170002501',
'02152170400304',
'02152170002502',
'02152170400302',
'02152170400303',
'02152170002503',
'02152170400301',
'02152170002504',
'02152170400305',
'02152170001001',
'02152170001003',
'02152170001004',
'02152170400901',
'02152170003104',
'02152170001301',
'02152170400902',
'02152170003103',
'02152170002403',
'02152170400903',
'02152170002401',
'02152170400904',
'02152170003101',
'02152170002402',
'02152170000901',
'02152170003201',
'02152170000902',
'02152170002405',
'02152170002701',
'02152170003202',
'02152170000903',
'02152170002404',
'02152170003203',
'02152170002703',
'02152170400701',
'02152170000904',
'02152170002704',
'02152170400501',
'02152170400704',
'02152170400503',
'02152170003205',
'02152170401204',
'02152170401201',
'02152170400603',
'02152170400604',
'02152170401004',
'02152170001502',
'02152170001503',
'02152170401101',
'02152170401102',
'02152170001101',
'02152170401103',
'02152170401105',
'02152170001103',
'02152170001104',
'02152170003805',
'02152170003804',
'02152170402702',
'02152170402701',
'02152170402703',
'02152170402704',
'02152170403101',
'02152170400402',
'02152170403102',
'02152170400403',
'02152170403103',
'02152170402101',
'02152170002901',
'02152170004002',
'02152170402102',
'02152170002902',
'02152170003901',
'02152170004701',
'02152170002905',
'02152170003902',
'02152170402105',
'02152170004702',
'02152170402901',
'02152170003903',
'02152170402903',
'02152170004204',
'02152170001201',
'02152170004004',
'02152170402904',
'02152170004202',
'02152170001202',
'02152170004101',
'02152170004203',
'02152170001203',
'02152170003904',
'02152170004102',
'02152170004601',
'02152170004602',
'02152170004104',
'02152170003401',
'02152170401602',
'02152170002601',
'02152170003403',
'02152170003404',
'02152170004604',
'02152170003405',
'02152170002602',
'02152170401604',
'02152170401901',
'02152170003402',
'02152170402801',
'02152170002603',
'02152170003501',
'02152170401902',
'02152170402802',
'02152170002604',
'02152170002605',
'02152170402803',
'02152170401903',
'02152170403001',
'02152170402804',
'02152170401904',
'02152170403002',
'02152170402301',
'02152170401905',
'02152170403003',
'02152170003503',
'02152170004901',
'02152170402302',
'02152170004902',
'02152170402303',
'02152170403005',
'02152170402304',
'02152170401801',
'02152170004903',
'02152170401802',
'02152170807801',
'02152170401803',
'02152170004904',
'02152170004503',
'02152170401804',
'02152170004504',
'02152170401805',
'02152170002801',
'02152170004403',
'02152170004502',
'02152170002802',
'02152170403201',
'02152170004404',
'02152170003701',
'02152170002805',
'02152170003702',
'02152170004501',
'02152170003703',
'02152170402201',
'02152170402602',
'02152170002804',
'02152170003704',
'02152170402202',
'02152170402603',
'02152170004302',
'02152170402601',
'02152170402204',
'02152170402401',
'02152170004303',
'02152170004304',
'02152170402205',
'02152170402605',
'02152170004301',
'02152170004801',
'02152170402604',
'02152170402403',
'02152170004804',
'02152170402004',
'02152170004802',
'02152170402404',
'02152170402003',
'02152170004803',
'02152170401403',
'02152170402002',
'02152170401401',
'02152170402001',
'02152170401404',
'02152170401301',
'02152170401302',
'02152170401303',
'02152170401705',
'02152170401304',
'02152170402506',
'02152170403202',
'02152170401703',
'02152170402502',
'02152170403203',
'02152170401701',
'02152170402501',
'02152170403205',
'02152170003601',
'02152170402503',
'02152170403204',
'02152170402505',
'02152170003303',
'02152170003301',
'02152170003302',
'02152170003305',
'02152170003304',
'02152180003002',
'02152180003501',
'02152180004501',
'02152180005002',
'02152180005801',
'02152180005001',
'02152180005803',
'02152180005804',
'02152180005202',
'02152180005805',
'02152180005802',
'02152180403001',
'02152180804801',
'02152180804701',
'02152180804601',
'02152180804401',
'02152180804301',
'02152180804101',
'02152180803901',
'02152180005502',
'02152180403003',
'02152180005503',
'02152180005501',
'02152180005105',
'02152180005104',
'02152180005103',
'02152180005401',
'02152180005405',
'02152180005102',
'02152180005404',
'02152180403302',
'02152180005403',
'02152180005101',
'02152180005402',
'02152180004701',
'02152180403301',
'02152180402402',
'02152180403304',
'02152180403303',
'02152180402403',
'02152180005903',
'02152180402404',
'02152180402801')) T
where  not exists (select * from TS_Audit where T.BatchName = TS_Audit.batchname and TSModule = 'DocID')

