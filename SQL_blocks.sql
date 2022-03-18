Select cmd, *from sys.sysprocesses
Where blocked > 0 and spid <> blocked
