select * from document where imageid like 'hov%'

--delete 

select * from document where MA18doctype = 'itk' and ImageID like 'HOVCACI%'

--delete from document where MA18doctype = 'itk' and ImageID like 'HOVCACI%'

select * from document where pbatch = '02140840006001' order by syskey

select max(ftpstime) from document


select 


use dva
select * from document where ftpstime > '3/30/2014 23:59:0' and ftpstime < ='4/2/2014 16:39:0' and imageid not like '%p00%' order by ftpstime 
----created table 
select  * into itk from document where ftpstime > '3/30/2014 22:0:0' and ftpstime < ='4/2/2014 16:39:0' and imageid not like '%p00%'
 order by ftpstime 


  select count(*) from itk 
  select distinct pbatch from itk

--7615
select count(*) from itk 
where exists ( select * from document where itk.imageid = document.imageid)


select distinct pbatch from itk 
where not exists  (select distinct pbatch from document where ftpstime is not null and itk.imageid = document.ImageID)


 select * from itk 
where exists ( select * from document where itk.imageid = document.imageid)

select ImageID from itk 
where exists  (select ImageID from document where ftpstime is null and itk.imageid = document.ImageID)

select * from itk 
where exists  (select * from document where ftpstime is  null and itk.imageid = document.ImageID)

select * from itk where imageid = 'CACI_140912901P451017777'


select * from document where dcsid = 'HT628FUQRZBOEX' and ftpstime > '2014-04-02 16:50:00'
select * from document where dcsid = 'HT8R8V99GSOUFD' and ftpstime > '2014-04-02 16:50:00'
select * from document where dcsid = 'HT8QDTGO9K7U22' and ftpstime > '2014-04-02 16:50:00'
select * from document where dcsid = 'HT612U0BURKG3L' and ftpstime > '2014-04-02 16:50:00'