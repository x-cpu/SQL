select p921.BatchName, p920.dcsid  from batchtable p921
inner join openrowset('MSDASQL', 'Driver=[SQL SERVER]; Server=atl-va-sql-1a\p920;UID=webportal;PWD=Cla$$room;', 'select distinct dcsid from dva.dbo.document') as p920
on p921.BatchName = p920.pbatch

