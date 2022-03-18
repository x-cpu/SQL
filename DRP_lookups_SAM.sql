select * from document where pbatch = '02162091102502'

select * from document where imageid = 'CSRA_162303102P001326264'


select * from document where filenumber in (
'134501248',
'177408714',
'179322964',
'226354381',
'230299719',
'243156795',
'259657158',
'434493812',
'439377468',
'439757180',
'452546537',
'472066184',
'474727962',
'511940805',
'587159639',
'594738606',
'595144892')


select * from docid.dbo.drp_err where exists
(select * from document where docid.dbo.drp_err.[column 0] = pbatch and ftpstime is null)


select * from docid.dbo.drp_it where exists
(select * from document where docid.dbo.drp_it.[column 0] = pbatch and ftpstime is null)