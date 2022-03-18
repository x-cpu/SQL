select * from batchtable where BatchName like '021424604032%'

update batchtable
set Priority = '1'
where BatchName = '02142460403202'



update batchtable
set Status = '6'
where BatchName = '03142450622801'

select * from batchtable where batchname in (
'03142340604501',
'03142350616001',
'03142350622301')



