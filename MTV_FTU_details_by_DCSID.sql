--with lastuploadattempt
select T.PBatch, T.dcsID, T.VBMS_Error_Description, T.VBMS_Error_Code, T.Upload_Error
, MAX(f.insertdate) LastUploadAttempt
--, count(f.syskey) #ofAttempts
FROM
(select distinct PBatch, dcsID, 
CASE
	When (d.comments is not null and d.comments <> 'FileNumber is invalid!' and d.Comments like 'Detail: One or more parameters%') Then SUBSTRING(d.Comments, LEN(LEFT(d.Comments, CHARINDEX ('Detail:', d.Comments))), LEN(LEFT(d.Comments, CHARINDEX ('GUID', d.Comments))) - 3) 
	When (d.comments is not null and d.comments <> 'FileNumber is invalid!' and d.Comments not like 'Detail: One or more parameters%') Then SUBSTRING(d.Comments, LEN(LEFT(d.Comments, CHARINDEX ('Detail:', d.Comments))), LEN(LEFT(d.Comments, CHARINDEX ('Code', d.Comments))) - 3) 
	Else ''
	END AS VBMS_Error_Description,
CASE
	WHEN (d.comments is not null and d.comments <> 'FileNumber is invalid!') Then SUBSTRING(d.Comments, LEN(LEFT(d.Comments, CHARINDEX ('Code:', d.Comments))), 17) 
	Else ''
	END AS VBMS_Error_Code,
CASE
	WHEN d.Comments = 'FileNumber is invalid!' Then 'FileNumber is invalid!'
	Else ''
	END AS Upload_Error
from document d
where ftpstime is null
and d.Comments is not null
and d.Comments <> 'skipped') T
left join FTPError f
on T.dcsID = SUBSTRING(f.fielddata, 0, CHARINDEX ('|', f.fielddata))
where f.comments <> 'skipped'
group by T.PBatch, T.dcsID, T.VBMS_Error_Description, T.VBMS_Error_Code, T.Upload_Error


--with #ofAttempts
select T.PBatch, T.dcsID, T.VBMS_Error_Description, T.VBMS_Error_Code, T.Upload_Error
, MAX(f.insertdate) LastUploadAttempt
, count(f.syskey) #ofAttempts
FROM
(select distinct PBatch, dcsID, 
CASE
	When (d.comments is not null and d.comments <> 'FileNumber is invalid!' and d.Comments like 'Detail: One or more parameters%') Then SUBSTRING(d.Comments, LEN(LEFT(d.Comments, CHARINDEX ('Detail:', d.Comments))), LEN(LEFT(d.Comments, CHARINDEX ('GUID', d.Comments))) - 3) 
	When (d.comments is not null and d.comments <> 'FileNumber is invalid!' and d.Comments not like 'Detail: One or more parameters%') Then SUBSTRING(d.Comments, LEN(LEFT(d.Comments, CHARINDEX ('Detail:', d.Comments))), LEN(LEFT(d.Comments, CHARINDEX ('Code', d.Comments))) - 3) 
	Else ''
	END AS VBMS_Error_Description,
CASE
	WHEN (d.comments is not null and d.comments <> 'FileNumber is invalid!') Then SUBSTRING(d.Comments, LEN(LEFT(d.Comments, CHARINDEX ('Code:', d.Comments))), 17) 
	Else ''
	END AS VBMS_Error_Code,
CASE
	WHEN d.Comments = 'FileNumber is invalid!' Then 'FileNumber is invalid!'
	Else ''
	END AS Upload_Error
from document d
where ftpstime is null
and d.Comments is not null
and d.Comments <> 'skipped') T
left join FTPError f
on T.dcsID = SUBSTRING(f.fielddata, 0, CHARINDEX ('|', f.fielddata))
where f.comments <> 'skipped'
group by T.PBatch, T.dcsID, T.VBMS_Error_Description, T.VBMS_Error_Code, T.Upload_Error
