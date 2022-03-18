
select distinct pbatch BatchName, p.RMN, BoxNO, 
CASE
	When m.batchname is null Then 'Not Scanned'
	When m.batchname is not null Then 'Scanned'
	END ScanStatus,
CASE
	When s.kbatch is null Then 'No Stats_IBML table record or \Ibml_Coupler\50 batch DIR' 
	End CouplerStatus
from PhysicalBatch p 
left join Stats_IBML s
on p.PBatch = s.kbatch
left join [MTV-VA-SQL-2\P923].IBMLTEST_data.dbo.batchtable m
on p.PBatch = m.batchname
where p.boxno in (
'36',
'39',
'40',
'41',
'42',
'44',
'45',
'46',
'48',
'49',
'50',
'51',
'52',
'54',
'55',
'56',
'61',
'62',
'63',
'65',
'68',
'69',
'70',
'71',
'72',
'73',
'74',
'76',
'77',
'79',
'80',
'81',
'83',
'86',
'89',
'91',
'92',
'96',
'99',
'100',
'101',
'102',
'103',
'104',
'105',
'106',
'107',
'108',
'109',
'110',
'111',
'112',
'113')
