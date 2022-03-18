select DCSID + '|' + filenumber + '|' + [Correct FileNumber]  from xACCFTU
where uploaddatetime is null
and pbatch in (
'2190251903302')
and [Correct FileNumber] not in ('?', 'st', 'Wrong - VA to advise')

select * from xACCFTU where UploadDateTime < '2020-03-01'

select * from document where imageid in (
'CSRA_190353101P001032786',
'CSRA_200313102P001001555',
'CSRA_200313102P001001599',
'CSRA_200313102P001001643',
'CSRA_200313102P001001579',
'CSRA_200313102P001001636',
'CSRA_200313102P001001592',
'CSRA_200313102P001001509',
'CSRA_200313102P001001603',
'CSRA_200313102P001001618')

select * from document where dcsid in (
'DCSID021902519045030010',
'DCSID021902519045030013',
'DCSID021902519045030006',
'DCSID021902519045030006',
'DCSID021902519045030013',
'DCSID021902519045030017',
'DCSID021902519045030032',
'DCSID021902519045030006',
'DCSID021902519045030013')

select * from xACCFTU where UploadDateTime is  null

select * from xACCFTU where comments is null
select * from document where imageid = 'CSRA_190353101P001032786'
select * from document where dcsid = 'DCSID021902519018010056'
DCSID021902519018010056
DCSID021902519018010056
DCSID021902519018010056
DCSID021902519018010056
DCSID021902519018010056
--update xACCFTU
--set Comments = 'Completed'
--where UploadDateTime is not null and comments is null

--update xACCFTU
--set Comments = 'Upload Error'
--where LastErrorDate is not null and comments is null

--DCSID021902519020010072
DCSID021902519018010056	CSRA_190353101P001032786
select * from document where imageid = 'CSRA_190373102P001000280'

--update xACCFTU
--set uploaddatetime = T.uploaddatetime
--FROM 
--(select x.dcsID, max(d.ftpstime) uploaddatetime
--from xACCFTU x
--left join document d
--on x.dcsid = d.dcsid
--where d.ftpstime is not null
--and d.ftpstime >= '2020-03-01'
--and x.UploadDateTime is null
--group by x.dcsID) T
--where xACCFTU.dcsID = T.dcsID

select distinct T.ImageID, max(T.ErrorDate) ErrorDate, f.comments
--, T.syskey
--, f.comments
FROM
(select distinct x.ImageID, max(insertdate) ErrorDate, f.syskey
from xACCFTU x
left join document d
on x.dcsid = d.dcsid
left join FTPError f
on x.imageid = f.imageid
where d.ftpstime is null
and f.insertdate >= '2020-03-01'
and x.UploadDateTime is null
group by x.ImageID, f.syskey, f.comments) T
left join FTPError f
on T.ImageID = f.imageid
where exists (select top(1) * from FTPError where T.imageid = imageid and insertdate > '2018-03-18')
group by T.ImageID, f.comments



select distinct T.ImageID, T.ErrorDate, T.comments
FROM
(select distinct x.ImageID, f.insertdate ErrorDate, f.comments
from xaac_20200430 x
left join FTPError f
on x.imageid = f.imageid
left join document d
on x.imageid = d.ImageID
where d.ftpstime is null
and f.insertdate >= '2020-04-30'
group by x.ImageID, f.insertdate, f.comments) T
group by T.ImageID, T.ErrorDate, T.comments
having T.ErrorDate = (select max(insertdate) from FTPError where T.ImageID = imageid)




--update xaac_20200430
--set LastErrorDate = Z.ErrorDate, LastErrorResponse = Z.comments
--FROM
--(select distinct T.ImageID, T.ErrorDate, T.comments
--FROM
--(select distinct x.ImageID, f.insertdate ErrorDate, f.comments
--from xaac_20200430 x
--left join FTPError f
--on x.imageid = f.imageid
--left join document d
--on x.imageid = d.ImageID
--where d.ftpstime is null
--and f.insertdate >= '2020-04-30'
--group by x.ImageID, f.insertdate, f.comments) T
--group by T.ImageID, T.ErrorDate, T.comments
--having T.ErrorDate = (select max(insertdate) from FTPError where T.ImageID = imageid)) Z
--where xaac_20200430.UploadDateTime is null and xaac_20200430.LastErrorDate is null
--and xaac_20200430.ImageID = Z.ImageID





select * from document where pbatch in (
'02190231900104',
'02190251901801',
'02190251901802',
'02190251901804',
'02190251901805',
'02190251902203',
'02190251902204',
'02190251902205',
'02190251902702',
'02190251902901',
'02190251904501',
'02190251904502',
'02190251904701',
'02190251905601',
'02190251905603') order by ftpstime desc


select * from document where pbatch = '02190251902001'