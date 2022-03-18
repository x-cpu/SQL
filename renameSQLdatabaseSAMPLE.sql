use master;
Go

alter database SourceHOV_Data set single_user with rollback immediate;
GO

alter database SourceHOV_Data modify name = SourceHOV_Data_OLD ;
GO

alter database SourceHOV_Data_OLD set multi_user;
Go