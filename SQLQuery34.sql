select distinct dcsid from manifestDCS where rmn = '314vb0726133018o' and dcsid not in (
select distinct dcsid from document where rmn = '314vb0726133018o')


select * from CustomerDATA where rmn = '314vb0728143894o'


select * from document where pbatch = '02142460403201'

select * from Document where FileNumber = '301305995' and docidDoctype like 'str%'

select * from dcsbarcode where pbatch = '02142310410404'
select * from TS_Audit where batchname = '02142400002501'


select * from document where dcsid in (
'HJLECRSE2Y8IY',
'HJLEDNXIY2329R',
'HJLEF8XAD11ZNX',
'HJLEFY9ZUFZBUL',
'HJLEGUJ0RP6YNJ',
'HJLEICOID1ELHE',
'HJLEJ5JXRHDOYB',
'HJLEJZIQVDIHXI')


select * from FTPDetails order by etime desc