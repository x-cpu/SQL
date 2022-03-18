select * from batchtable where batchname = '02132280002105021'

update batchtable
set BatchDirectory = '\\atl-va-fs01\data\Scanning\02132280002105'
where BatchDirectory = '\\atl-va-fs01\data\Scanning\02132280002105021'

update batchtable
set BatchName = '02132280002105'
where BatchDirectory = '\\atl-va-fs01\data\Scanning\02132280002105'