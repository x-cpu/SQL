create table #IOWarningResults(LogDate datetime, ProcessInfo sysname, LogText nvarchar(1000))

insert into #IOWarningResults 
exec xp_readerrorlog 0, 1, N'taking longer than 15 seconds'

insert into #IOWarningResults 
exec xp_readerrorlog 1, 1, N'taking longer than 15 seconds'

insert into #IOWarningResults 
exec xp_readerrorlog 2, 1, N'taking longer than 15 seconds'

insert into #IOWarningResults 
exec xp_readerrorlog 3, 1, N'taking longer than 15 seconds'

insert into #IOWarningResults 
exec xp_readerrorlog 4, 1, N'taking longer than 15 seconds'

select LogDate, ProcessInfo, LogText from #IOWarningResults ORDER BY LogDate DESC

drop table #IOWarningResults



SQL Server has encountered 1 occurrence(s) of I/O requests taking longer than 15 seconds to 
complete on file [F:\MSSQL$P920\Data\\DVA.MDF] in database [DVA] (6).  
The OS file handle is 0x0000000000000B00.  The offset of the latest long I/O is: 0x0000050b0f0000


(@BatchName nvarchar(14),@RMN nvarchar(16),@DCSID nvarchar(14))SELECT RMN, DCSID FROM DVA.dbo.ManifestDCS WHERE PBatch = SUBSTRING(@BatchName, 1, 12) AND RMN = @RMN AND DCSID = @DCSID


(@UpdateValue int,@Audit_ID int)UPDATE dbo.TS_Audit SET LOCSUpdate = @UpdateValue WHERE ID = @Audit_ID

---big one
EXEC WEB_SELECT_RECONCILIATION_Dev '','317VB0423157867S','','','','','','','','','','','','National','Admin','',''
