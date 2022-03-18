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
            where ftpstime between '2014-06-01 0:0:0' and '2014-06-30 23:59:59' 
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
            where ftpstime between '2014-05-02 0:0:0' and '2014-05-30 23:59:59' 
            group by imageid 
            having count(*) > 1) 
            GROUP BY ImageID 
      ) AS tab
)



select imageid 
            from document 
            where pbatch like '03%'
            group by imageid 
            having count(*) > 1

			select * from FTPDetails where ETime > '2014-07-10 0:0:0'

			select * from document where pbatch in (
			'03141830602801',
'03141830606501') order by ImageID

select sum(numpages) from document where pbatch in (
			'03141830602801',
'03141830606501') order by ImageID
+++


select * from FTPDetails where batchname = '03141670630101'