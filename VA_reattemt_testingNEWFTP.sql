select * from pbatchDCS_comments_Detailed order by thirdcheckDate desc

select * from pbatchDCS_comments_Detailed where dcsid = 'HJIOVPRXS7QDO1'
select * from document where dcsid = 'DCSID031426306026010012'

select * from FTPError where exists (select * from document where pbatch not like '02%' and FTPError.imageid = document.ImageID)
and insertdate > '2014-10-29 16:0:0'



select * from FTPError where exists (select * from document where dcsid = 'DCSID031421406199010045' and FTPError.imageid = document.ImageID)
and insertdate > '2014-10-29 16:0:0'


I1NICEX4250GYI

select * from document where pbatch = '03140870600301' and ftpstime is null
--dcsid document count outstanding and reviewed
select distinct dcsid, pbatch, count(*) #ofDocs from document where exists
(select * from pbatchDCS_comments_Detailed where Document.dcsID = pbatchDCS_comments_Detailed.dcsid)
and ftpstime is null and Comments like 'Detail: CMSERR%'
and ImageDateTime > '2014-10-01 0:0:0'
group by dcsID, pbatch
order by #ofDocs

--dcsid document count outstanding and reviewed
select distinct dcsid, pbatch, count(*) from document where exists
(select * from pbatchDCS_comments_Detailed where Document.dcsID = pbatchDCS_comments_Detailed.dcsid)
and ftpstime is null 
and ImageDateTime > '2014-10-01 0:0:0'
group by dcsID, pbatch

---cmp raw document data
select * from document where exists
(select * from FTPError where document.imageid = FTPError.imageid)
and pbatch like '03%'
and ftpstime is null 
and ImageDateTime > '2014-10-01 0:0:0'

---cmp dcsid
select  distinct dcsid, pbatch, count(*) from document where exists
(select * from FTPError where document.imageid = FTPError.imageid)
and pbatch like '03%'
and ftpstime is null and Comments like 'Detail: CMSERR%'
and ImageDateTime > '2014-10-01 0:0:0'
group by dcsID, pbatch


select * from document where pbatch = '02142970401904'

--dcs
--HJIOVPRXS7QDO1	02142660000505  20docs
--I0ZGS5C24M8EFO	02142820006604  28docs

--cmp
--DCSID031426206109010013	03142620610901	10docs
--DCSID031426306026010012	03142630602601	13docs

select * from ftperror 
where insertdate > '10/29/2014 13:0:0'
and comments like '%cmserr%'
and imageid in ( select distinct imageid from ftperror where insertdate < '10/29/2014 0:0:0')