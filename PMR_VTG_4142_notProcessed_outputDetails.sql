select distinct s.veteranID PacketID, pt.BatchName, d.ETime DOMA_UploadDateTime, d.AckTime DOMA_ACKTime
from smsDCSMapping s
left join pmrImageIDMapping pt
on s.dcsid = pt.dcsid
left join domaFTPDetails d
on pt.batchname = d.batchname
left join document dd
on pt.dcsid = dd.dcsID
where 
--d.ETime is null
--and 
dd.docidDoctype = 'VA 21-4142 Authorization for Release of Information'
and pt.batchname in (
'20201111041107849',
'20201111041140938',
'20201111041203044',
'20201111041229222',
'20201111041244011',
'20201111041258238',
'20201111041323137',
'20201111041339939',
'20201111041359876',
'20201111041413636',
'20201111041428409',
'20201111041447364',
'20201111041506131',
'20201111041522091',
'20201111041536662',
'20201111041553510',
'20201111041609438',
'20201111041629095',
'20201111041630093',
'20201111041630889',
'20201111041645241',
'20201111041650452',
'20201111041729469',
'20201111041812667',
'20201111041828563',
'20201111041846520',
'20201111041902994',
'20201111041925583',
'20201111041939686',
'20201111041957767',
'20201111042012322',
'20201111042030341',
'20201111042046331',
'20201111042105973',
'20201111042120434',
'20201111042139514',
'20201111042218593',
'20201111042238577',
'20201111042255223',
'20201111042314957',
'20201111042342087',
'20201111042359497',
'20201111042423646',
'20201111042441400',
'20201111042505846',
'20201111042522835',
'20201111042546953',
'20201111042614160',
'20201111042630962',
'20201111042709152',
'20201111042725533',
'20201111042735798',
'20201111042751820',
'20201111042815002',
'20201111042825797',
'20201111042842708',
'20201111042859042',
'20201111042915095',
'20201111042928355',
'20201111042943894',
'20201111043008496',
'20201111043024080',
'20201111043042146',
'20201111043105562',
'20201111043224797',
'20201111043317152',
'20201111043333190',
'20201111043348166',
'20201111043404125',
'20201111043420381',
'20201111043440381',
'20201111043453454',
'20201111043510396',
'20201111043542206',
'20201111043601800',
'20201111043612533',
'20201111043636277',
'20201111043653016',
'20201111043725918',
'20201111043730348',
'20201111043733359',
'20201111043812860',
'20201111043825545',
'20201111043908797',
'20201111043928879',
'20201111043943686',
'20201111044002067',
'20201111044033352',
'20201111044054525',
'20201111044116323',
'20201111044130241',
'20201111044147140',
'20201111044203133',
'20201111044239770',
'20201111044328341',
'20201111044348873',
'20201111044413009',
'20201111044432885',
'20201111044451123',
'20201111044508191',
'20201111044551174',
'20201111044607899',
'20201111044632019',
'20201111044652831',
'20201111044710680',
'20201111044730993',
'20201111044745034',
'20201111044806596',
'20201111044845068',
'20201111044903555',
'20201111044925895',
'20201111044945224',
'20201111045030545',
'20201111045132636',
'20201111045158752',
'20201111045216630',
'20201111045237535',
'20201111045258222',
'20201111045315445',
'20201111045339221',
'20201111045409205',
'20201111045430703',
'20201111045505227',
'20201111045532107',
'20201111045601296',
'20201111045616912',
'20201111045635243',
'20201111045700345',
'20201111045744666',
'20201111045752748',
'20201111045811172',
'20201111045827475',
'20201111045842264',
'20201111045855290',
'20201111045914994',
'20201111045930750',
'20201111045955165',
'20201111050011374',
'20201111050030578',
'20201111050048269',
'20201111050200983',
'20201111050231108',
'20201111050256568',
'20201111050330421',
'20201111050344180',
'20201111050401824',
'20201111050425147',
'20201111050441543',
'20201111050500264',
'20201111050521637',
'20201111050541668',
'20201111050600778',
'20201111050620170',
'20201111050653820',
'20201111050706534',
'20201111050721542',
'20201111050803929',
'20201111050806862',
'20201111050828733',
'20201111050846861',
'20201111050907220',
'20201111050922103',
'20201111050951588',
'20201111051010511',
'20201111051035269',
'20201111051103256',
'20201111051127858',
'20201111051148482',
'20201111051204785',
'20201111051220697',
'20201111051238575',
'20201111051257327',
'20201111051314082',
'20201111051330120',
'20201111051342974',
'20201111051355720',
'20201111051411071',
'20201111051428263',
'20201111051456063',
'20201111051523910',
'20201111051538995',
'20201111051557685',
'20201111051624798',
'20201111051640726',
'20201111051718136',
'20201111051747809',
'20201111051807808',
'20201111051830226',
'20201111051851271',
'20201111051932675',
'20201111051952363',
'20201111052017651',
'20201111052031286',
'20201111052050022',
'20201111052106902',
'20201111052127682',
'20201111052154234',
'20201111052230973',
'20201111052306386',
'20201111052330567',
'20201111052359506',
'20201111052422517',
'20201111052439163',
'20201111052455964',
'20201111052517774',
'20201111052546588',
'20201111052612360',
'20201111052630893',
'20201111052648693',
'20201111052703779',
'20201111052717632',
'20201111052742234',
'20201111052801485',
'20201111052816462',
'20201111052832437',
'20201111052850081',
'20201111052906727',
'20201111052929113',
'20201111052930673',
'20201111052947475',
'20201111053005119',
'20201111053023481',
'20201111053040985',
'20201111053111125',
'20201111053145711',
'20201111053222139',
'20201111053308815',
'20201111053326147',
'20201111053344696',
'20201111053406802',
'20201111053421670',
'20201111053440250',
'20201111053508877',
'20201111053527582',
'20201111053543978',
'20201111053607706',
'20201111053624321',
'20201111053643868',
'20201111053646489',
'20201111053703977',
'20201111053720202',
'20201111053733852',
'20201111053750654',
'20201111053805162',
'20201111053823446',
'20201111053838516',
'20201111053852541',
'20201111053915037',
'20201111053918173',
'20201111053941277',
'20201111053958906',
'20201111054020185',
'20201111054050075',
'20201111054106861',
'20201111054136190',
'20201111054156518',
'20201111054219919',
'20201111054243148',
'20201111054256065',
'20201111054309513',
'20201111054326845',
'20201111054344021',
'20201111054404052',
'20201111054427297',
'20201111054505346',
'20201111054522897',
'20201111054543926',
'20201111054556719',
'20201111054614706',
'20201111054631555',
'20201111054649184',
'20201111054706519',
'20201111054723324',
'20201111054746651',
'20201111054809790',
'20201111054828998',
'20201111054850016',
'20201111054912313',
'20201111054927713',
'20201111054942583',
'20201111055000137',
'20201111055018174',
'20201111055038942',
'20201111055105998',
'20201111055130495',
'20201111055145958',
'20201111055201716',
'20201111055215742',
'20201111055236258',
'20201111055249238',
'20201111055302546',
'20201111055318132',
'20201111055333172',
'20201111055349429',
'20201111055411006',
'20201111055429431',
'20201111055448465',
'20201111055508170',
'20201111055523085',
'20201111055550949',
'20201111055620092',
'20201111055647551',
'20201111055706522',
'20201111055725321',
'20201111055747677',
'20201111055820657',
'20201111055853747',
'20201111055914995',
'20201111055938365',
'20201111055956806',
'20201111060016307',
'20201111060034544',
'20201111060106885',
'20201111060125497',
'20201111060146792',
'20201111060216979',
'20201111060238992',
'20201111060259897',
'20201111060318399',
'20201111060336714',
'20201111060404203',
'20201111060418400',
'20201111060432269',
'20201111060440396',
'20201111060506075',
'20201111060529851',
'20201111060615186',
'20201111060630132',
'20201111060656622',
'20201111060715888',
'20201111060732269',
'20201111060754375',
'20201111060807994',
'20201111060832814',
'20201111060855466',
'20201111060918493',
'20201111060942689',
'20201111061005544',
'20201111061044202',
'20201111061100598',
'20201111061120130',
'20201111061135340',
'20201111061149739',
'20201111061210941',
'20201111061231065',
'20201111061244248',
'20201111061300550',
'20201111061316665',
'20201111061330659',
'20201111061350097',
'20201111061408288',
'20201111061421096',
'20201111061439785',
'20201111061503591',
'20201111061524106',
'20201111061534309',
'20201111061550674',
'20201111061605712',
'20201111061624792',
'20201111061643684',
'20201111061716118',
'20201111061731905',
'20201111061748723',
'20201111061806866',
'20201111061830033',
'20201111061850095',
'20201111061909892',
'20201111061934042',
'20201111062007193',
'20201111062021155',
'20201111062038066',
'20201111062104400',
'20201111062123963',
'20201111062145757',
'20201111062206318',
'20201111062219095',
'20201111062246817',
'20201111062300686',
'20201111062326614',
'20201111062343182',
'20201111062404804',
'20201111062422807',
'20201111062447612',
'20201111062503353',
'20201111062521824',
'20201111062539031',
'20201111062602166',
'20201111062618843',
'20201111062634912',
'20201111062651838',
'20201111062709186',
'20201111062727205',
'20201111062744677',
'20201111062805972',
'20201111062928202',
'20201111062944021',
'20201111063001010',
'20201111063025518',
'20201111063041556',
'20201111063106361',
'20201111063123162',
'20201111063153178',
'20201111063214878',
'20201111063230338',
'20201111063236063',
'20201111063302974',
'20201111063322647',
'20201111063339901',
'20201111063358262',
'20201111063417654',
'20201111063435064',
'20201111063454377',
'20201111063509042',
'20201111063526202',
'20201111063643222',
'20201111063649556',
'20201111063703752',
'20201111063721880',
'20201111063744610',
'20201111063810819',
'20201111063826232',
'20201111063843081',
'20201111063912784',
'20201111063927464',
'20201111063955795',
'20201111064017074',
'20201111064042347',
'20201111064109211',
'20201111064123142',
'20201111064137947',
'20201111064155700',
'20201111064211223',
'20201111064229553',
'20201111064244265',
'20201111064250115',
'20201111064305310',
'20201111064323547',
'20201111064340146',
'20201111064344186',
'20201111064346807',
'20201111064418850',
'20201111064435543',
'20201111064450894',
'20201111064503811',
'20201111064519333',
'20201111064535932',
'20201111064550207',
'20201111064552812',
'20201111064612048',
'20201111064629380',
'20201111064651813',
'20201111064709801',
'20201111064728568',
'20201111064753154',
'20201111064810767',
'20201111064833232',
'20201111064849628',
'20201111064904870',
'20201111064931578',
'20201111064957834',
'20201111065015088',
'20201111065031921',
'20201111065047724',
'20201111065117287',
'20201111065137880',
'20201111065155680',
'20201111065217848',
'20201111065235508',
'20201111065324571',
'20201111065339610',
'20201111065401030',
'20201111065425881',
'20201111065439813',
'20201111065456646',
'20201111065515524',
'20201111065538539',
'20201111065553534',
'20201111065615176',
'20201111065642825',
'20201111065700472',
'20201111065721271',
'20201111065753508',
'20201111065822499',
'20201111065854844',
'20201111065927409',
'20201111065949316',
'20201111070014061',
'20201111070033423',
'20201111070110945',
'20201111070130759',
'20201111070148622',
'20201111070208749',
'20201111070227580',
'20201111070252355',
'20201111070313043',
'20201111070329518',
'20201111070344901',
'20201111070401158',
'20201111070424342',
'20201111070445373',
'20201111070504079',
'20201111070527324',
'20201111070547886',
'20201111070624205',
'20201111070640726',
'20201111070657965',
'20201111070719229',
'20201111070724408',
'20201111070739463',
'20201111070800088',
'20201111070818013',
'20201111070833161',
'20201111070854456',
'20201111070937124',
'20201111070958778',
'20201111071022070',
'20201111071038482',
'20201111071056688',
'20201111071128638',
'20201111071148311',
'20201111071202586',
'20201111071219731',
'20201111071236252',
'20201111071307999',
'20201111071332446',
'20201111071345706',
'20201111071404287',
'20201111071418982',
'20201111071432227',
'20201111071452727',
'20201111071508359',
'20201111071522493',
'20201111071540371',
'20201111071628873')
order by pt.batchname