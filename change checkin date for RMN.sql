--change checkin date for RMN
--manifestDCS table
update manifestDCS
set insertdate = '2015-09-25 0:0:01'
where RMN in (
'318VB0923159930G',
'316VB0923158316D',
'316VB0923159380D',
'317VB0923158901S',
'316VB0923150579D',
'316VB0923150366D',
'316VB0923151336D',
'316VB0923151746D',
'316VB0923155691D',
'316VB0923158281D',
'318VB0923159933G',
'317VB0923158871S',
'318VB0923159931G',
'316VB0923153708D',
'316VB0923152758D')


--physicalbatch table
update PhysicalBatch
set RecvDate = '09/25/2015', BackDate = '09/25/2015', InvTime = '2015-09-25 0:0:01'
where rmn in (
'318VB0923159930G',
'316VB0923158316D',
'316VB0923159380D',
'317VB0923158901S',
'316VB0923150579D',
'316VB0923150366D',
'316VB0923151336D',
'316VB0923151746D',
'316VB0923155691D',
'316VB0923158281D',
'318VB0923159933G',
'317VB0923158871S',
'318VB0923159931G',
'316VB0923153708D',
'316VB0923152758D')



select * from x2

select * from manifestDCS where RMN = '316VB0810153734D'
select * from PhysicalBatch where rmn = '316VB0810153734D'
315VB0825151506A
316VB0810153734D




select * from docid.dbo.Docid_SubDoctype where subDoctype = 'Disabled American Veterans (DAV) Statement of Representative in Appeals CaseThe Statement of Representative in Appeals Case may be submitted by any service organization / attorney acting on behalf of a claimant who has issues pending before the Board of Veterans Appeals'