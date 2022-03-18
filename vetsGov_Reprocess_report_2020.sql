select distinct UUID, newpacketid PacktID, AckDateTime from vetrepDetails where ackdatetime is not null

select * from vetrepDetails where exportdatetime is not null

select * from vetrepDetails where ackdatetime is not null
order by ackdatetime desc

select * from vetrepDetails where reimported = 0


----MASTER update
--update u
--set u.NewPacketID = X.PacktID, u.AckDateTime = X.AckDateTime, u.UploadDateTime = X.UploadDateTime, u.ExportDateTime = X.ExportDateTime, u.NewVCIPID = X.VCIPID
--FROM vetrepDetails u
--INNER JOIN
--(select distinct v.UUID, s.veteranID PacktID, f.ETime UploadDateTime, s.acktime AckDateTime, max(st.releasedate) ExportDateTime,  P.VCIPID
--from vetrep v
--left join DCSID_UUID_mapping d
--on v.uuid = d.UUID
--left join smsDCSMapping s
--on d.VeteranID = s.veteranID
--left join dmhsFTPDetails f
--on s.batchname = f.batchname
--left join stats st
--on SUBSTRING(d.dcsid, 6, 14) = st.kbatch
--left join pmrImageIDMapping p
--on d.DCSID = p.dcsid
--where exists (select * from DCSID_UUID_mapping where insertdate >= '2019-1-16' and v.uuid = uuid)
--and (s.ackTime is not null 
--or s.ackTime is null)
--group by v.uuid, s.veteranID, f.ETime, s.ackTime, p.VCIPID) X
--on X.UUID = u.uuid


----import check and update
--update u
--set u.ReImported = X.Imported
--from vetrepdetails u
--INNER JOIN
--(select v.uuid, LEN(v.uuid) lengther,
--CASE 
--	When  (select count(*) from tmpfaxtifname where datemodified >= '2020-01-16' and SUBSTRING(tifname, 16, LEN(v.uuid)) = v.uuid) >= 1 then 1
--	Else 0
--	END Imported
--from vetrep v) X
--on X.uuid = u.uuid



---DONOTUSE
----1st update
--update v
--set v.NewPacketID = s.VeteranID, v.AckDateTime = s.acktime, v.UploadDateTime = f.ETime
--from vetrepDetails v
--left join DCSID_UUID_mapping d
--on v.uuid = d.UUID
--left join smsDCSMapping s
--on d.VeteranID = s.veteranID
--left join dmhsFTPDetails f
--on s.batchname = f.batchname
--where 
--exists (select * from DCSID_UUID_mapping where insertdate >= '2019-1-16' and v.uuid = uuid)
--and (s.ackTime is not null 
--or s.ackTime is null)


--DONOTUSE OLD VERSION
--MASTER update
--update u
--set u.NewPacketID = X.PacktID, u.AckDateTime = X.AckDateTime, u.UploadDateTime = X.UploadDateTime, u.ExportDateTime = X.ExportDateTime
--FROM vetrepDetails u
--INNER JOIN
--(Select distinct v.UUID, s.veteranID PacktID, f.ETime UploadDateTime, s.acktime AckDateTime, max(st.releasedate) ExportDateTime
--from vetrep v
--left join DCSID_UUID_mapping d
--on v.uuid = d.UUID
--left join smsDCSMapping s
--on d.VeteranID = s.veteranID
--left join dmhsFTPDetails f
--on s.batchname = f.batchname
--left join stats st
--on SUBSTRING(d.dcsid, 6, 14) = st.kbatch
--where 
----exists (select * from smsDCSMapping where ackTime >= '2019-1-16' and d.VeteranID = veteranID)
----and 
--exists (select * from DCSID_UUID_mapping where insertdate >= '2019-1-16' and v.uuid = uuid)
--and (s.ackTime is not null 
--or s.ackTime is null)
--group by v.uuid, s.veteranID, f.ETime, s.ackTime) X
--on X.UUID = u.uuid



select * from vetrepDetails where ackdatetime is not null



Select distinct v.UUID, s.veteranID PacktID, f.ETime UploadDateTime, s.acktime AckDateTime, max(st.releasedate) ExportDateTime,  P.VCIPID
from vetrep v
left join DCSID_UUID_mapping d
on v.uuid = d.UUID
left join smsDCSMapping s
on d.VeteranID = s.veteranID
left join dmhsFTPDetails f
on s.batchname = f.batchname
left join stats st
on SUBSTRING(d.dcsid, 6, 14) = st.kbatch
left join pmrImageIDMapping p
on d.DCSID = p.dcsid
where exists (select * from DCSID_UUID_mapping where insertdate >= '2019-1-16' and v.uuid = uuid)
and (s.ackTime is not null 
or s.ackTime is null)
group by v.uuid, s.veteranID, f.ETime, s.ackTime, p.VCIPID

