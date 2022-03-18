select * from TurboscanNG1.dbo.Batches where BatchDesc like 'already%'



select * from document where pbatch in (
'03142340604501',
'03142350616001',
'03142350622301')

select * from Stats_IBML where kbatch in (
'03142340604501',
'03142350616001',
'03142350622301')