select * from expedite20170919 e
where e.Dcs is not null


--To update Upload to VBMS status
update e
set  FTPd = 'Uploaded'
from expedite20170919 e
left join dva.dbo.document d
on e.Dcs = d.dcsid
where CheckedInButNotinTS is null
and NotFound is null
and inTS is null
and inShippingPortalButNotCheckIn is null
and exists (select * from dva.dbo.document where e.Dcs = dcsid and ftpstime is not null)
and not exists (select * from dva.dbo.document where e.Dcs = dcsid and ftpstime is null)
and e.Dcs is not null


--To Update In TS
update e
set inTS = 'WIP TS'
from expedite20170919 e
left join dva.dbo.PbatchDCSMapping m
on e.dcs = m.dcsid
where CheckedInButNotinTS is null
and NotFound is null
and FTPd is null
and inShippingPortalButNotCheckIn is null
and exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


--To Update In Not In TS
update e
set CheckedInButNotinTS = 'Not in TS But CheckedIN - ' + m.Pbatch
from expedite20170919 e
left join dva.dbo.PbatchDCSMapping m
on e.Dcs = m.dcsid
where inTS is null
and NotFound is null
and FTPd is null
and inShippingPortalButNotCheckIn is null
and not exists (select * from [mtv-va-sql-4\p1].turboscanng1.dbo.batches where m.pbatch = BatchName)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


--To Update In Not In TS
update e
set CheckedInButNotinTS = 'RMN CheckedIn but DCSID not found CheckedIn'
from expedite20170919 e
left join dva.dbo.PbatchDCSMapping m
on e.Dcs = m.dcsid
where inTS is null
and NotFound is null
and FTPd is null
and CheckedInButNotinTS is null
and inShippingPortalButNotCheckIn is null
and exists (select * from dva.dbo.manifestdcs where e.Rmn = RMN)


select * from expedite20170919 e
where e.Dcs is not null
and e.FTPd is  null
and exists (select * from dva.dbo.manifestdcs where e.dcs = dcsid)



select * from dva.dbo.manifestdcs where dcsID in (
'J5CAYEMT3XDSXW',
'J52B2UJ4LTOLDD',
'J2QCL8MVFLK0HD',
'J34FDTSG-6I691C',
'J308OHAZ-OHNFA0',
'J20PREV7-F2U2FH',
'P0001238',
'J2C1S8W35TXZ9',
'J682U9APOZ1Z7T',
'J682U9APOZ1Z7T',
'J29046VC7BQILB',
'J29046VC7BQILB',
'J2IUTTVWECMSR5',
'J30F4S2E-8NH2SD',
'J2QAHV2PN1OKJZ',
'J2RM3TPBRHHPLS',
'J30F4S2E-8NH2SD',
'J2AM0C2CD7M1L6',
'J1ZAU6K0-H15B2A ',
'J4ZSPPM1-EFZW9 ',
'J2AM0C2CD7M1L6',
'J1ZAU6K0-H15B2A ',
'J4ZSPPM1-EFZW9 ',
'J5F6S6AI-3IQBW9',
'J5CTMGLOFD6G7P',
'J5E7CSI2O4BAJI',
'J56WLAEJL45Q2E',
'J5TQWIEIL4EBA5',
'J2IWPET5-GJAPGM',
'J2IWPET5-GJAPGM',
'J58504RRPXSRAN',
'J30H6EBY4UQR5Q',
'J301IF54HO3WYA',
'J2LQVV0S-NOBQXH',
'J56WLAEJL45Q2E',
'J7HJ2IJV-KPFB7',
'J5E7CSI2O4BAJI',
'J298AC9L1TX9F7',
'J34HESQRMCYS5A',
'J5DXQ7511A7P2E',
'J5F6S6AI-3IQBW9',
'J5CV8SG1BIR1JN',
'J5CTMGLOFD6G7P',
'J1RXNLFG-AEATKZ')

select * from dva.dbo.document where dcsid = 'J2C1S8W35TXZ9'

select * from expedite20170919 where Dcs = 'J2C1S8W35TXZ9'


--Shipped but not CheckIn
update e
set inShippingPortalButNotCheckIn = 'Shipped but not CheckIn '
from expedite20170919 e
--left join dva.dbo.PbatchDCSMapping m
--on e.Dcs = m.dcsid
where inTS is null
and NotFound is null
and FTPd is null
and CheckedInButNotinTS is null
--and inShippingPortalButNotCheckIn is null
and not exists (select * from dva.dbo.manifestdcs where e.rmn = RMN)
and exists (select * from dva.dbo.customerCheckIn where e.rmn = rmn)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)


select * from expedite20170919 e
where e.Rmn is not null
and FTPd is null and inShippingPortalButNotCheckIn is null



--To Update In Not In TS
update e
set inShippingPortalButNotCheckIn = 'Shipped but not CheckIn '
from expedite20170919 e
--left join dva.dbo.PbatchDCSMapping m
--on e.Dcs = m.dcsid
where inTS is null
and NotFound is null
and FTPd is null
and CheckedInButNotinTS is null
--and inShippingPortalButNotCheckIn is null
and not exists (select * from dva.dbo.manifestdcs where e.rmn = RMN)
and exists (select * from dva.dbo.customerCheckIn where e.rmn = rmn)
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)

--To Update In Not In Customer Check or NotFound
update e
set NotFound = 'Not Found or Checked Into Portal'
from expedite20170919 e
--left join dva.dbo.PbatchDCSMapping m
--on e.Dcs = m.dcsid
where inTS is null
--and NotFound is null
and FTPd is null
and CheckedInButNotinTS is null
and inShippingPortalButNotCheckIn is null
and not exists (select * from dva.dbo.manifestdcs where e.rmn = RMN)
and not exists (select * from dva.dbo.customerCheckIn where e.rmn = rmn)
and e.Rmn is not null
--and not exists (select * from dva.dbo.stats where m.pbatch = kbatch)

select * from dva.dbo.customerCheckIn where rmn = '349VB0427174598E'

select * from dva.dbo.manifestDCS where rmn = '349VB0427174598E'


select * from expedite20170919 e
where e.Rmn is not null
and FTPd is null and inShippingPortalButNotCheckIn is null


select * from expedite20170919 e
where NotFound is null
and  e.Rmn is not null

--update expedite20170919 
--set notFound = null
--where NotFound = 'Not Found in CustomerCheckIn'


select * from dva.dbo.customerCheckIn where rmn = '331VB0720171860D'
select * from dva.dbo.manifestDCS where rmn = '331VB0720171860D'


select * from expedite20170919 e
where inTS is null
and NotFound is null
and FTPd is null
and CheckedInButNotinTS is null
and inShippingPortalButNotCheckIn is null
and exists (select * from dva.dbo.manifestdcs where e.Rmn = RMN)


select * from dva.dbo.manifestDCS where dcsid in (
'J5CAYEMT3XDSXW',
'J52B2UJ4LTOLDD',
'J2QCL8MVFLK0HD')

select * from dva.dbo.manifestDCS where RMN in (
'331VB0720171860D',
'316VB0713179817D',
'362VB0515178919H') order by dcsID

--J52B2UJ4-LTOLDD