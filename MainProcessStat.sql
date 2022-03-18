use dva
select sum(UserImagesprocessed) AS Images, sum(UserProcTime) / 60 as Minutes
from TS_Audit where TSModule = 'AutoIndex'

use dva
select distinct t.wsid, w.wsname, count(distinct batchname) #ofBatches from TS_Audit t
right join turboscanNG1.dbo.workstation w
on w.wsid = t.wsid
where TSModule = 'AutoIndex' and t.timestamp >= '2014-07-02 14:15:0' group by t.WSID, w.WSName

use dva
select * from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-06-05 20:30:0' and ImagesRejected < 1 order by timestamp, WSID


select * from document where pbatch = '02141780203501'


select dcsID as DCSID, docidDoctype as DocType, Form526Data as Contention, ImageID from document where pbatch = '02141780203501'

select filenumber, dcsID as DCSID, docidDoctype as DocType, Form526Data as Contention, ImageID, ftpstime as UploadDateTime from document where ftpstime > '2014-06-30 13:30:00' and comments = 'success'

select filenumber, dcsID as DCSID, docidDoctype as DocType, Form526Data as Contention, ImageID, ftpstime as UploadDateTime from document where ftpstime > '2014-06-30 13:30:00' and comments = 'success' and 
filenumber in (
'020585690',
'030365433',
'041641216',
'066365141',
'07251780',
'072602121',
'080720127',
'089781609',
'104506624',
'127400173',
'141581180',
'17196692',
'17672160',
'178486893',
'17936043',
'18224556',
'19029373',
'20105903',
'206301782',
'213945321')

select distinct filenumber from document where ftpstime > '2014-06-30 13:30:00' and ftpstime < '2014-06-30 00:00:00' and comments = 'success'


select * from document where filenumber in (
'020585690',
'030365433',
'041641216',
'066365141',
'07251780',
'072602121',
'080720127',
'089781609',
'104506624',
'127400173',
'141581180',
'17196692',
'17672160',
'178486893',
'17936043',
'18224556',
'19029373',
'20105903',
'206301782',
'213945321')
and comments = 'success' order by filenumber

select * from document where filenumber in (
'089781609',
'17196692',
'19029373',
'20105903',
'206301782',
'213945321',
'07251780')
and comments = 'success' order by filenumber

use dva
select sum(userimagesprocessed) from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-06-20 10:00:0' and batchname like '03%'

use dva
select sum(userimagesprocessed), batchname from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-06-20 08:00:0' and batchname like '03%' group by batchname

use dva
select sum(userimagesprocessed), batchname from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-06-20 08:00:0' and batchname like '02%' group by batchname

select * from FTPDetails
order by etime desc
use dva
select * from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-06-20 08:00:0' and jobid = '8'


select * from OCRResults_doctype

select * from ZipcodeRoj order by zipcode asc

use dva
select * from TS_Audit where timestamp >= '2014-06-20 08:00:0' and jobid = '11' order by BatchID


select * from TS_Audit where batchname in (
'03141640609501',
'03141640614301')



use dva
select sum(userimagesprocessed) from TS_Audit where TSModule = 'AutoIndex' and timestamp >= '2014-06-05 19:45:0'

--select dcsid, len(filenumber) from document where ftpstime is not null and len(filenumber) < 8 and ftpstime > '2013-01-01 0:0:0' group by dcsID, filenumber

select * from pbatch_comments

--delete from TSErrorTracking where batchname = '02140710001601'

select * from document where dcsid = 'HRJ9H7YTJECK2M'
select * from manifestDCS where rmn = '316VB0206143324D'
select * from document where pbatch = '02141130005301' order by imageid
select * from document where pbatch = '02141410202301' order by imageid
select * from boxmapping where boxno='84885'


select * from TS_Audit where BatchName = '02141550405501'

select * from FTPDetails order by etime desc

'smccain', 'asmith3', 'bparsons', 'tjohnson3', 'bhall2', 'bhuff', 'odurden', 'dhines', 'jbishop2

select * from document where imageid = 'caci_133102901p001036206'

select * from ts_audit where batchname = '02131200012901'

select distinct dcsid from manifestdcs where rmn = '397VB0918139922A'

select * from boxmapping where dcsid in (
'HLQMQVRQQYOMEX',
'HLQMRMOMYF55UV',
'HLQMSLX9UJDZ6I',
'HLQMTKI592TFQM',
'HLQMUOSTSCTJZ6',
'HLQMVMOXL2L65H',
'HLQMWFZAXJABR6',
'HLQMXG8AUTIHE',
'HLQMYDWCKT2DGR',
'HLQMZ5VKMCA49Z',
'HLQMZWCLFVI3Z',
'HLQN0UADYYG27U',
'HLQN1Q45WOAFU8',
'HLQN2PWTQLHUIL',
'HLQN3HLXLIZKRJ',
'HLQN4BKDD8YYDL',
'HLQN51UB12IGL4')

select * from document where dcsid = 'HIISJ9EEE642UC'
select * from document where dcsid = 'HOZQEC2XIVTTQP'

select * from customerdata where dcsid = 'HNBYUFMZOIGB8B'

select * from ts_audit where batchname = '02140690202905'

select * from def_qa_log
delete from def_qa_log where syskey = 2262
select * from def_tserrortracking
delete from def_tserrortracking where syskey = 2647


256944973
256944973

use turboscanng1
select * from batches where batchname = '03123210600101'

select * from batches where jobid = '8' and wfstep = '6' and batchlocation = '8' and batchstatus = '0'

select * from batches where jobid = '8' and wfstep = '5' and batchlocation = '8' and batchstatus = '0'

update batches
set batchstatus  = '1'
where jobid = '8' and wfstep = '5' and batchlocation = '8' and batchstatus = '0'


update batches
set batchstatus  = '1'
where jobid = '8' and wfstep = '11' and batchstatus = '0'


update batches
set batchstatus  = '1'
where jobid = '8' and wfstep = '3' and batchlocation = '8' and batchstatus = '0'


update batches
set batchstatus  = '1'
where jobid = '8' and wfstep = '3' and batchstatus = '0'

update batches
set batchstatus  = '1'
where jobid = '11' and wfstep = '5' and batchlocation = '8' and batchstatus = '0'


update batches
set batchstatus  = '1'
where jobid = '11' and wfstep = '11' and batchstatus = '0'



use turboscanng1
select * from batches where wfstep = 6 and appstep = 1



select distinct pbatch, sum(numpages) from document where imagedatetime > '2014-03-20 0:0:0' and ftpstime is null group by pbatch

select imageid, dcsid from document where pbatch = '02140780204801'
select * from document where pbatch = '02140780204801'

exec va_getlastdocumentofdcs HRC7QF4HAC0CDN
select * from manifestdcs where pbatch = '021407802048'

select * from customercheckin where trackingno = '1TESTINGUAT140307'
select * from manifestdcs where trackingno = '1TESTINGUAT140307'
452VB0312140312C

update customercheckin
set rmn = '452VB0312140312C'
where trackingno = '1TESTINGUAT140319'

HRC7QF4HAC0CDN
HRC5QX8HA9M6WF

02140410005101.sem99

use turboscanng1
select * from batches where batchname = '02140990309902'


exec ts_getindexes_1 267260



select * from physicalbatch where rmn like '%1TESTINGUAT140319%'
select * from customercheckin where rmn like '1TESTINGUAT140307%'
update customercheckin
set claimtype = 'P'
where rmn like '1TESTINGUAT140319%'


select * from physicalbatch where rmn like '%1TESTINGUAT140307%'

select * from stats_ibml where kbatch  = '02140660200201'

select * from manifestdcs where pbatch = '021407802048'

update manifestdcs 
set rmn = '452VB0207140004C'
where rmn = '322vb0312143955d' and trackingno = '1TESTINGUAT140307'

update customercheckin 
set rmn = '322vb0312143955d'

select * from customercheckin where rmn = '322vb0312143955d'

select * from manifestdcs where rmn = '322vb0312143955d'
update customercheckin 
set claimtype = 'P'
where syskey = 62007


select * from batches where batchname = '02140660200201'
select * from batches where batchname = '02140780204801'

select * from manifestdcs where pbatch = '021406602002'

select * from manifestdcs where rmn = '452vb0207140004c'