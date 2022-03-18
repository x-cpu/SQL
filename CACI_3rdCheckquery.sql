
--3rd check for CACI list (excluding Roanoke)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError')
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 


select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch)
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError') 



select * from dcssheetlookup where dcsid = 'HYMWEIKYWEIFZF'
select * from dcssheetlookup_CACI where dcsid = 'HYMWEIKYWEIFZF'


select * from dcssheetlookup_cannotfix where dcsid = 'HYMWEIKYWEIFZF'

HYG4DK893FN5VX
HYG4J3OU7LOXKN
HYVHYMVFO1FYE


--3rd check for CACI list (Roanoke only)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError')
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 


----3rd check for CACI list (including Roanoke)
--select distinct d.dcsid, d.pbatch from document d
--where 
--d.ftpstime is null and d.comments is not null and exists  (
--select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch and secondcheck = 'TrueError')
--and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI) 
--and d.dcsid not in (select distinct dcsid from pbatchDCS_comments)


select * from dcssheetlookup_CACI


---NEW WAY FOR CANNOTFIX
--3rd check for CACI list (excluding Roanoke)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch)
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError') 

--3rd check for CACI list (Roanoke only)
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from dcssheetlookup where d.PBatch = dcssheetlookup.pbatch)
and d.dcsid  not in (select distinct dcsid from dcssheetlookup_CACI where secondcheck = 'TrueError') 



select * from dcssheetlookup_cannotfix where dcsid in (
'HLRYF1A9PQKAOZ',
'HYBLH5XP2NKVZQ',
'HYG4DK893FN5VX',
'HYG4J3OU7LOXKN',
'HYMWEIKYWEIFZF',
'HYVHYMVFO1FYE')


select * from pbatchDCS_comments where dcsid in (
'HIFY3ARZT975UE',
'HV04JMRK3BN148',
'HV7B7HJCJVLFZD',
'HV9JXOFDPPCGII',
'HWUV71VO4DDP5L',
'HWNJAPSQ84FUA3',
'HWLBVOGDSJSQ86',
'HWRZ2M4H53IS28',
'HWNM565ZT7KO3R',
'HWNRL07PGAZ6WD',
'HWRUIFA1A4UOOL',
'HWS198TMBMLWLH',
'HWNM4G0RXCYHXP',
'HWS56F2377KND0',
'HWS5EH3DC3OS3C',
'HWS5PWPT3O7KEQ')


--3rd check listing report
select distinct pbatch, dcsid from document where ftpstime is null and comments is not null and exists  (
select * from pbatch_comments where document.PBatch = pbatch_comments.pbatch)


--3rd check listing report EXCLUDING ROANOKE
select distinct dcsid, pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)



--3rd check listing report ONLY ROANOKE
select distinct pbatch, dcsid from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where c.location = '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)



--duplicates in dcssheetlookup - Newnan version
select * from dcssheetlookup_x2 x where exists (
select count(dcsid) from dcssheetlookup_x2  y where x.dcsid = y.dcsid  having count(*) >1 ) order by x.dcsid

--not in pbatch_comments but in dcssheetlookup - Newnan version
select distinct pbatch from dcssheetlookup_x2 x where not exists  (
select distinct pbatch from pbatch_comments p where x.pbatch = p.pbatch)



--not in dcssheetlookup but in pbatch_comments
select distinct pp.pbatch from pbatch_comments pp 
where pp.pbatch in (
select distinct pbatch from document  where ftpstime is null and comments is not null)
and pp.pbatch not in (select distinct pbatch from dcssheetlookup_x2)


--3rd check listing report EXCLUDING ROANOKE and data already reviewed in DCSSHEETLOOKUP_CACI
select distinct d.pbatch, d.dcsid from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)
and d.dcsid not in (select distinct dcsid from dcssheetlookup_CACI) 



--3rd check listing report EXCLUDING ROANOKE
select distinct dcsid, pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)


--3rd check listing report data reviewed excluding ROANOKE in DCSSHEETLOOKUP_CACI
select distinct d.dcsid, d.pbatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)
and d.dcsid  in (select distinct dcsid from dcssheetlookup_CACI) 



select * from manifestDCS where pbatch = '021316511003'
select * from pbatch_comments where pbatch = '02142040400802'
select * from dcssheetlookup_CACI where dcsid = 'HOIJ958H6H46NV'

select * from dcssheetlookup where pbatch = '02142040400802'

select * from dcssheetlookup_CACI where pbatch = '02142040400802'



select * from document where dcsid in (
'HU30SPQ1W61O4Y',
'HVB056FSRVV2L1',
'HWAQRFEY9SP8UE',
'HX20F1HVH5S3AJ',
'HX361G8UE7EX4W')

select ImageID from document where dcsid in (
'HU30SPQ1W61O4Y',
'HVB056FSRVV2L1',
'HWAQRFEY9SP8UE',
'HX20F1HVH5S3AJ',
'HX361G8UE7EX4W')

select * from FTPError where imageid = 'CACI_141882901P001024703'


--3rd check listing report EXCLUDING ROANOKE and data already reviewed in DCSSHEETLOOKUP_CACI
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null and not exists  (
select * from pbatch_comments where d.PBatch = pbatch_comments.pbatch)
and d.dcsid not in (select distinct dcsid from dcssheetlookup) 

select * from dcssheetlookup where dcsid = 'HXYMAGR4XS8JNC'

select * from dcssheetlookup where dcsid in (
'HXYMAGR4XS8JNC',
'HXYP8ZS3B9G7MS',
'HWJ85743KE1QO4',
'HXQ9A27LT4GQPE',
'HWHVDC2BF30HEU',
'HWAQK7G9GAYMKF',
'HXYOR4U8RIKF9G',
'HXYPVXLS5UAQEZ',
'HY08N9C97C73WW',
'HXLQ23W5W6SC95',
'HUU2N00HF4CHYY',
'HWAUM1RZLCK3WK',
'HXVXAOPHGTIZ6R',
'HXYQ1AMW7VKGPM',
'HXRHF44R2MJATZ',
'HXRHGGWHDDOYPB',
'HXT460J35B1DL',
'HY1O6143JGSUIX',
'HY1X0625LSEJDV',
'HW9AVJI85T14KX',
'HXYQAX26MZWQJZ',
'HXXHKBW55QTQJG',
'HY1NFH5B7VA932',
'HY1NU0LPETLX6G',
'HXLRUCLE7XP7C1',
'HXRLDCM9PXWKYD',
'HW9A2GD7BLZ0RU',
'HXYOR8OXHJ3NVX',
'HY01FVNHNPUNFO',
'HXRLRC95JO9M47',
'HXRL3HZGBSWFPX',
'HWHWLAMPM4NLPI',
'HTLSXQJP5SD6OM',
'HXZ3GUKILS818S',
'HXLRSR9LSB334U',
'HXVTOQ29F51XE7',
'HXW0QLWGANTRNF',
'HXW1ERXIYWXTKQ',
'HXXBTUWSLKL053',
'HXT0N8FE3TY5ZQ',
'HXYMO2JJ2U1VQE',
'HXYQAX26MZWQJZ',
'HXZ2V77XQ9CLJN',
'HXRL4VWDZCNH9B',
'HXX6CZYH6747G9',
'HXRL6KGM9AXC78',
'HXRL89GZ1G7UT3',
'HWARZXCCQU6SW2',
'HWM1SPQ6EO3QB5',
'HWEZ5DKO2SAJS3',
'HW0TM8H0VKH5HO',
'HVFB5C2UYTD7KA',
'HW0TM8H0VKH5HO',
'HY0FRZH08UXUEZ',
'HY1NEWK5SQ22BN',
'HXLPBA1LTE65DP',
'HXX6KMT08WJLEE',
'HWAUH17XUYN71Q',
'HWHWKIWV4NAJP4',
'HW0TM8H0VKH5HO',
'HW0TM8H0VKH5HO',
'HY1UYHCR6AIF59')