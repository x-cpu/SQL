select * from document where filenumber = '348668962'

select * from customerdata where pbatch = '02141681405903' and filenumber = '348668962'

select * from customerdata where filenumber = '348668962'


update customerdata
set filenumber = '26292402'
where filenumber = '026292402' and pbatch = '02141581304303' 



update CustomerDATA
set filenumber = '025526756'
where pbatch = '02141601303802' and filenumber = '25526756'



select * from document where filenumber = '025526756'

select * from pbatch_comments where pbatch = '02141681405903'

select * from document where filenumber = '26292402'

select * from pbatch_comments where pbatch = '02141581304303'




select * from document where filenumber = '29085333'
select * from document where filenumber = '26292402'
select * from document where filenumber = '025526756'
select * from document where filenumber = '24859333'



select distinct pbatch from document where filenumber = '29085333' and ftpstime >= '2014-07-01 0:0:0.000'
--select distinct pbatch  from document where filenumber = '26292402' and ftpstime >= '2014-07-01 0:0:0.000'
select distinct pbatch  from document where filenumber = '025526756' and ftpstime >= '2014-07-01 0:0:0.000'
select distinct pbatch  from document where filenumber = '24859333' and ftpstime >= '2014-07-01 0:0:0.000'
select distinct pbatch  from document where filenumber = '26292402' and ftpstime >= '2014-07-01 0:0:0.000'




select *  from pbatch_comments where pbatch in (
'02141601402003',
'02141581304303',
'02141601303802',
'02141701002602')