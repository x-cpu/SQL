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
            where ftpstime between '2015-04-01 0:0:0' and '2015-04-30 23:59:59.999' and pbatch like '02%'
            --where pbatch in ('03141640607901', '03141640608201')
			group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 
      ) AS tab
)




--Update Statement
UPDATE Document
SET ImageID = REPLACE(ImageID, 'P', 'T'), MA18doctype = 'RP'
WHERE SysKey IN
(
      SELECT tab.SysKey FROM
      (
            select ImageID, MIN(SysKey) AS SysKey 
            from document 
            where imageid in 
            (select imageid 
            from document 
            where ftpstime between '2015-04-01 0:0:0' and '2015-04-30 23:59:59.999' and pbatch like '02%'
            group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 
      ) AS tab
)



--Update Statement
UPDATE Document
SET ImageID = REPLACE(ImageID, 'P', 'T'), MA18doctype = 'RP'
WHERE SysKey IN
(
      SELECT tab.SysKey FROM
      (
            select ImageID, MIN(SysKey) AS SysKey 
            from document 
            where imageid in 
            (select imageid 
            from document 
            where pbatch in ('03141640607901', '03141640608201')
            group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 
      ) AS tab
)



            select ImageID, MIN(SysKey) AS SysKey 
            from document 
            where imageid in 
            (select imageid 
            from document 
            where ftpstime between '2014-08-01 0:0:0' and '2014-08-31 23:59:59'
            --where pbatch in ('03141640607901', '03141640608201')
			group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 


			select * from document where imageid in (
			'CACI_CMP_142052901P001003408',
'CACI_CMP_142052901P001003449',
'CACI_CMP_142052901P001003407',
'CACI_CMP_142052901P001003447',
'CACI_CMP_142052901P001003405',
'CACI_CMP_142052901P001003406',
'CACI_CMP_142052901P001003448',
'CACI_CMP_142052901P001003450')