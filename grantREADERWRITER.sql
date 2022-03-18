use TurboscanNG1
go

exec sp_addrolemember db_datareader, 'LASON\jcarney.fsa' 
go
exec sp_addrolemember db_datawriter, 'LASON\jcarney.fsa'
go


GRANT EXECUTE TO "LASON\jcarney.fsa";