select * from customerdata where dcsid ='DCSID031410106001010002'
select ftpstime f,* from document where dcsid ='DCSID031410106001010002'
select * from cmprecon where dcsid ='DCSID031410106001010002'



select * from document where filenumber is null and ftpstime is not null and pbatch like '03%'

select distinct dcsID from document where pbatch like '03%' and ftpstime is not null

select  dcsID, received_date from  document where pbatch like '03%' group by dcsid, received_date having count(*) > 1





select * from document where dcsid = 'DCSID031406906002010002'





update document
set filenumber = '27376478'
where filenumber = '' and dcsid = 'DCSID031410106001010002'



update CustomerDATA
set filenumber = '27376478', Lastname = 'Jones', Firstname = 'Floyd'
where filenumber = '' and dcsid = 'DCSID031410106001010002'

