--duplicate show
SELECT REPLACE(ImageID, 'P', 'T') AS ImageID , MA18doctype = 'RP'
FROM Document
WHERE SysKey IN
(
      SELECT tab.SysKey FROM
      (
            select ImageID, MIN(SysKey) AS SysKey 
            from document 
            where imageid in 
            (select imageid 
            from document 
            where ftpstime between '2016-08-01 0:0:0' and '2016-08-31 23:59:59' 
            group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 
      ) AS tab
)






--STEP 1
--drop table docid.dbo.ddEXP
--find all dups from document by imageid -- MASTER
select T.ImageID, d.SysKey, d.pbatch, d.ftpstime
into docid.dbo.ddEXP
FROM
(select imageid
from document 
where imagedatetime between '2016-08-01 0:0:0' and '2016-08-31 23:59:59'  and imageid like '%p00%'
group by imageid
having count(*) > 1) T
left join Document d
on T.ImageID = d.ImageID 
group by T.ImageID, d.SysKey, d.ftpstime, d.PBatch
order by T.ImageID, d.ftpstime
--152208
--151484


--STEP 2
--drop table docid.dbo.ddEXPbothF
--identify all where dup and both recs uploaded --FILTER 1
select *
into docid.dbo.ddEXPbothF
from docid.dbo.ddEXP x
where not exists (select * from docid.dbo.ddEXP  where ftpstime is null and x.ImageID = ImageID)
--130668
--136828



--STEP 3
--drop table docid.dbo.ddEXPAffected
--identify all where dup and both recs uploaded --FILTER 2 
select z.ImageID, T.SysKey, T.ftpstime, T.pbatch
into docid.dbo.ddEXPAffected
FROM
(select * from docid.dbo.ddEXPbothF) T
left join docid.dbo.ddEXP z
on T.ImageID = z.ImageID
where T.ftpstime < z.ftpstime
order by T.ImageID, T.SysKey, T.ftpstime, T.pbatch


select count(*) , ftpstime, ImageID from docid.dbo.ddEXPbothF
group by ImageID, ftpstime
having count(*) > 1

select * from docid.dbo.ddEXPbothF where imageid = 'CSRA_162293102P011167290'

select * from document where imageid = 'CSRA_162293102P001166815'

select * from docid.dbo.ddEXP where imageid = 'CSRA_162293102P001120394'

select * from document where MA18doctype like 'drp%'

select * from document where syskey in (
'92292818',
'92425518')


--update document
--set MA18doctype = null
--where syskey in (
--'92292818',
--'92425518')

select * from docid.dbo.ddEXPAffected  
select * from dva.dbo.Document where SysKey = '92195292'
select * from docid.dbo.ddEXPAffected where SysKey = '92195292'
select * from docid.dbo.ddEXPAffected  where pbatch = '02162241409006'
select * from DVA.dbo.Document  where pbatch = '02162241409006'
select * from docid.dbo.ddEXPAffected  where imageid = 'CSRA_162293102P001120394'

select distinct pbatch from docid.dbo.ddEXPAffected  

--drop table docid.dbo.ddExport
--drop table docid.dbo.ddExportOCR
--drop table docid.dbo.ddpbatchNeeded2
--drop table docid.dbo.ddpbatchExportOCR

select distinct pbatch from docid.dbo.ddEXPAffected where not exists 
(select * from docid.dbo.ddExport where docid.dbo.ddEXPAffected.pbatch = pbatch)

select distinct pbatch from docid.dbo.ddEXPAffected where not exists 
(select * from docid.dbo.ddExportOCR where docid.dbo.ddEXPAffected.pbatch = pbatch)





----identify all where dup and both recs uploaded --FILTER 2 
--select T.ImageID, T.SysKey, T.ftpstime
--FROM
--(select *
--from docid.dbo.ddEXP x
--where not exists (select * from docid.dbo.ddEXP  where ftpstime is null and x.ImageID = ImageID)) T
--left join docid.dbo.ddEXP z
--on T.ImageID = z.ImageID
--where T.ftpstime < z.ftpstime
--order by T.ImageID, T.SysKey, T.ftpstime



--153030




--select distinct imageid, syskey, ftpstime 
--from docid.dbo.ddEXP x
--group by imageid, syskey, ftpstime 
--having imageid = (select top 1 imageid from docid.dbo.ddEXP where x.imageid = imageid)




select * from 



select * from docid.dbo.ddEXP where imageid in (
'CSRA_162293102P001121312',
'CSRA_162303102P001313122',
'CSRA_162303102P001299457',
'CSRA_162293102P001150409',
'CSRA_162293102P001207577')

SELECT REPLACE(ImageID, 'P', 'T') AS ImageID , MA18doctype = 'RP'
FROM Document
WHERE SysKey IN
(
      SELECT tab.SysKey FROM
      (
            select ImageID, MIN(SysKey) AS SysKey 
            from document 
            where imageid in 
            (select imageid 
            from document 
            where ImageDateTime between '2016-08-01 0:0:0' and '2016-08-31 23:59:59' 
            group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 
      ) AS tab
)




--76515





--SELECT REPLACE(ImageID, 'P', 'T') AS ImageID , MA18doctype = 'RP'
--FROM Document
--WHERE SysKey IN
--(
--      SELECT tab.SysKey FROM
--      (
--            select ImageID, MIN(SysKey) AS SysKey 
--            from document 
--            where imageid in 
--            (select imageid 
--            from document 
--            where ftpstime between '2016-08-01 0:0:0' and '2016-08-31 23:59:59' 
--            group by imageid 
--            having count(*) > 1) 
--            GROUP BY ImageID 
--      ) AS tab
--)



select T.ImageID, d.SysKey, d.pbatch, d.ftpstime
--into docid.dbo.ddEXP
FROM
(select imageid
from document 
where imagedatetime between '2016-08-01 0:0:0' and '2016-08-31 23:59:59' 
group by imageid
having count(*) > 1) T
left join Document d
on T.ImageID = d.ImageID 
group by T.ImageID, d.SysKey, d.ftpstime, d.PBatch
order by T.ImageID, d.ftpstime


--drop table docid.dbo.ddEXP


--CSRA_162293102P001206571	92321105	NULL
--CSRA_162293102P001206571	92321014	2016-08-16 20:19:29.327


--CSRA_162293102P001185650	92288557	2016-08-16 17:04:48.683
--CSRA_162293102P001185650	92288673	2016-08-16 17:42:16.260


--select * from document where imageid = 'CSRA_162293102P001206571'

select * from docid.dbo.ddEXP where pbatch = '02162291409605'
select * from docid.dbo.ddEXP where imageid  like '%p00%'


select * from document where imageid = 'CSRA_162293102P001184043'


select distinct pbatch from document where ftpstime is not null and pbatch in (
'02162071302201',
'02162071306009',
'02162071405803',
'02162071412905',
'02162081108303',
'02162081318606',
'02162091102905',
'02162181107601',
'02162241019502',
'02162241106301',
'02162241106307',
'02162241306708',
'02162251001701',
'02162251104701',
'02162281027903',
'02162281112205',
'02162281304903',
'02162281411302',
'02162291105501')
order by PBatch

select * from document where  pbatch in (
'02162071302201',
'02162071405803',
'02162281304903',
'02162291105501')


select distinct pbatch from document where ftpstime is not null and pbatch in (
'02162071002901',
'02162071006405',
'02162071006406',
'02162071007105',
'02162071108207',
'02162071111208',
'02162071114106',
'02162071114507',
'02162071301806',
'02162071302201',
'02162071302603',
'02162071302805',
'02162071302806',
'02162071306004',
'02162071306605',
'02162071306606',
'02162071308306',
'02162071401701',
'02162071401708',
'02162071401905',
'02162071402504',
'02162071402506',
'02162071405803',
'02162071408701',
'02162071408706',
'02162071408707',
'02162071412903',
'02162071412904',
'02162071413701',
'02162081102504',
'02162081113402',
'02162081113412',
'02162081310503',
'02162091001505',
'02162091102502',
'02162091300601',
'02162091402711',
'02162171127706',
'02162211309102',
'02162251009005',
'02162251012502',
'02162251012902',
'02162251013703',
'02162251015006',
'02162251015009',
'02162251015013',
'02162251018704',
'02162251020505',
'02162251022107',
'02162251025603',
'02162251030008',
'02162251109505',
'02162251116703',
'02162251116705',
'02162251203602',
'02162251207101',
'02162251315406',
'02162251402808',
'02162281005904',
'02162281005907',
'02162281006505',
'02162281006508',
'02162281013404',
'02162281019803',
'02162281019804',
'02162281019805',
'02162281023006',
'02162281025405',
'02162281025801',
'02162281025805',
'02162281025806',
'02162281026504',
'02162281027702',
'02162281027905',
'02162281027906',
'02162281100705',
'02162281103210',
'02162281103801',
'02162281103803',
'02162281103804',
'02162281103807',
'02162281106702',
'02162281107102',
'02162281111202',
'02162281112704',
'02162281115501',
'02162281115702',
'02162281115703',
'02162281115705',
'02162281115706',
'02162281115707',
'02162281115708',
'02162281117107',
'02162281117108',
'02162281202706',
'02162281202903',
'02162281203112',
'02162281203115',
'02162281203119',
'02162281203503',
'02162281208606',
'02162281209002',
'02162281213512',
'02162281215104',
'02162281215105',
'02162281215307',
'02162281215902',
'02162281215906',
'02162281216105',
'02162281300106',
'02162281302002',
'02162281303306',
'02162281304903',
'02162281304904',
'02162281307805',
'02162281308205',
'02162281308206',
'02162281308208',
'02162281308402',
'02162281308408',
'02162281313006',
'02162281404807',
'02162281407202',
'02162281407203',
'02162281407204',
'02162281408323',
'02162281409908',
'02162281409912',
'02162281410706',
'02162281411313',
'02162281411314',
'02162281411506',
'02162291006401',
'02162291007004',
'02162291019701',
'02162291019706',
'02162291021103',
'02162291021104',
'02162291021305',
'02162291021508',
'02162291022502',
'02162291022503',
'02162291023707',
'02162291026401',
'02162291026402',
'02162291027601',
'02162291027604',
'02162291105501',
'02162291109805',
'02162291110305',
'02162291110903',
'02162291110904',
'02162291114001',
'02162291114002',
'02162291116405',
'02162291117208',
'02162291117605',
'02162291119402',
'02162291119406',
'02162291119408',
'02162291200602',
'02162291200605',
'02162291203001',
'02162291203002',
'02162291203003',
'02162291203004',
'02162291204501',
'02162291204507',
'02162291307405',
'02162291309001',
'02162291309003',
'02162291309006',
'02162291309007',
'02162291309008',
'02162291309805',
'02162291309806',
'02162291310601',
'02162291310603',
'02162291310804',
'02162291311001',
'02162291311004',
'02162291317202',
'02162291317203',
'02162291401302',
'02162291401303',
'02162291407801',
'02162291407802',
'02162291409801',
'02162291409803',
'02162291410907',
'02162291411504',
'02162291411905',
'02162291416201',
'02162291416202')

select * from document where pbatch = '02162251012903'


--59 with upload
--02162071115105
--02162071115108
--02162071301409
--02162071302809
--02162071313502
--02162071318603
--02162071412906
--02162081113406
--02162211010103
--02162251012102
--02162251012903
--02162251018705
--02162251117303
--02162251204601
--02162251315004
--02162251404001
--02162251405201
--02162281005905
--02162281007503
--02162281011006
--02162281013401
--02162281013403
--02162281025804
--02162281026502
--02162281100704
--02162281100707
--02162281103602
--02162281103812
--02162281112206
--02162281113305
--02162281115507
--02162281117106
--02162281117702
--02162281202707
--02162281215302
--02162281215304
--02162281215306
--02162281215308
--02162281215504
--02162281216102
--02162281303101
--02162281303102
--02162281303103
--02162281304905
--02162281312203
--02162281312204
--02162281403810
--02162281411105
--02162291013202
--02162291019703
--02162291021102
--02162291021502
--02162291021503
--02162291023705
--02162291110306
--02162291111303
--02162291117206
--02162291205504
--02162291210705