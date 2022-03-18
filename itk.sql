select  * from document where ftpstime > '3/30/2014 22:0:0' and ftpstime < ='4/2/2014 16:39:0' and imageid not like '%p00%' order by ftpstime


select * from document where syskey = 30107944
select * from document where syskey = 30107948

select * from document where imageid like 'hov%'

delete from document where MA18doctype = 'itk' and ImageID like 'HOVCACI%'

select * from document where pbatch = '02140840006001' order by syskey


select  * from document where ftpstime > '3/30/2014 22:0:0' and ftpstime < ='4/2/2014 16:39:0' and imageid not like '%p00%' order by ftpstime 
----created table 
---select  * into itk from document where ftpstime > '3/30/2014 22:0:0' and ftpstime < ='4/2/2014 16:39:0' and imageid not like '%p00%'
 order by ftpstime 

 select * from document where ftpstime > '3/30/2014 22:0:0' and ftpstime < ='4/2/2014 16:39:0' and imageid not like '%p00%'

select * from itk
where exists ( select * from document where itk.imageid = document.imageid)


select  * from document where ftpstime > '4/2/2014 16:38:0' and ftpstime < ='4/2/2014 18:46:0' and imageid not like '%p00%' and UploadMachine = 'ATL-VA-TSCN140' order by ftpstime 

select * from document where imageid = 'CACI_140892902P021223144'


delete from document where imageid in (
'HOVHOVCACI_140892902P021223144',
'HOVHOVCACI_140892902P031223144')

select * from itk 
where not exists  (select * from document where ftpstime is not null and itk.imageid = document.ImageID) order by itk.imageid


select distinct pbatch from itk 
where not exists  (select distinct pbatch from document where ftpstime is not null and itk.imageid = document.ImageID)


select * from document where imageid = 'CACI_140902901P001065983'
select * from document where imageid = 'CACI_140902901P001065983'


select * from itk where imageid = 'CACI_140902901P001065983'
CACI_140902901P001065984

select * from document where MA18doctype = 'idk'
select * from document where pbatch = '02140710508505' order by imageid


select max(ftpstime) from document

selec

select * from document where pbatch = '02140840500602' order by imageid

select * from document where pbatch in (
'02140860204705',
'02140860005005',
'02140840500602',
'02140830003301',
'02140860002702',
'02140860001713') and ftpstime is null and MA18doctype = 'itk'


select * from document where pbatch = '02140860204705' order by ImageID



-9439
select count(*) from itk 
where exists ( select * from document where itk.imageid = document.imageid)

select * from document where imageid = 'CACI_140912901P451017777'
select * from itk where imageid = 'CACI_140912901P451017777'

select max(ftpstime) from Document

select * from itk where  exists (select * from document where itk.pbatch = document.pbatch and pbatch = '02140860204705')