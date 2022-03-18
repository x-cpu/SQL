select * from vvFTPDetails where vendor = 'callcenter' and downloadDate > '2017-03-02' and dcsid is not null

select * from vvFTPDetails where name = '27-0820 - Report of General Information_{05EDBABB-00FE-E611-B977-0050568D1B2D}.pdf'



select * from docid.dbo.docid where docid = '656'
--2017/03/06/11/26-25-024-CC-callCenter-27-0820 - Report of General Information_{05EDBABB-00FE-E611-B977-0050568D1B2D}.pdf


select * from vvFTPDetails where uri like '%'


select * from document where pbatch like '17%' and ImageDateTime > '2017-03-05' and docidDoctype = ''

--VA 27-0820 Report of General Information


select * from CustomerDATA where pbatch like '17%' and keydatetime > '2017-03-05'


select * from smsDCSMapping where dcsid = 'DCSCC171706500000190055'