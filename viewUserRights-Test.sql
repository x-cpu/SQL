SELECT dp.class_desc, dp.permission_name, dp.state_desc,
ObjectName = OBJECT_NAME(major_id), GranteeName = grantee.name, GrantorName = grantor.name
FROM sys.database_permissions dp
JOIN sys.database_principals grantee on dp.grantee_principal_id = grantee.principal_id
JOIN sys.database_principals grantor on dp.grantor_principal_id = grantor.principal_id
where grantee.name like 'test%'
and permission_name like 'view change%'
order by grantee.name



GRANT UPDATE,INSERT,DELETE ON dbo.customerCheckIn TO test_csradva_rw;
GRANT UPDATE,INSERT,DELETE ON dbo.exceptions TO test_csradva_rw;
GRANT UPDATE,INSERT,DELETE ON dbo.users TO test_csradva_rw;
GRANT UPDATE,INSERT,DELETE ON dbo.LogAdminActions TO test_csradva_rw;


--customerCheckIn
--exceptions
--users
--LogAdminActions


grant view change tracking on [dbo].[LogAdminActions] to [test_csradva_rw]
grant view change tracking on [dbo].[ErrorLog] to [test_csradva_rw]
grant view change tracking on [dbo].[PasswordLogByUser] to [test_csradva_rw]


--WRITER
grant select on [dbo].[rptCSRAFaxChannel] to [csradva_rw]
GRANT UPDATE,INSERT,DELETE ON dbo.[rptCSRAFaxChannel] TO [csradva_rw];
grant view change tracking on [dbo].[rptCSRAFaxChannel] to [csradva_rw]

grant select on [dbo].[rptCSRAFaxReport] to [csradva_rw]
GRANT UPDATE,INSERT,DELETE ON dbo.[rptCSRAFaxReport] TO [csradva_rw];
grant view change tracking on [dbo].[rptCSRAFaxReport] to [csradva_rw]


--READER
grant select on [dbo].rptCSRAFaxChannel to [csradva_reader]
grant view change tracking on [dbo].[rptCSRAFaxChannel] to [csradva_reader]


grant select on [dbo].[rptCSRAFaxReport] to [csradva_reader]
grant view change tracking on [dbo].[rptCSRAFaxReport] to [csradva_reader]