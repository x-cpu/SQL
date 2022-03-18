select * from document where pbatch = '02131000007902' order by ImageID

update document
set filenumber = '29627604'
where filenumber = '298527604'


update customerdata
set filenumber = '29627604'
where filenumber = '298527604'


update document
set received_date = '08/02/1971'
where received_date = '08/02/0971' and pbatch = '02130980204902'

select * from document order by FileSize desc

select * from customerCheckIn where trackingno = '1ZA4F6960395834481'
select * from customerCheckIn where RMN = '314VB0327130012'
select * from manifestDCS where RMN = '314VB0327130012'

update customerCheckIn
set trackingno = '1ZA39E750392980993'
where trackingno = '1ZA39E750392980992'

update customerCheckIn
set rmn = '314VB0327130012D'
where rmn = '314VB0327130012' and trackingno = '1ZA4F6960395834481'

select * from document where pbatch = '02130920005403'

select distinct dcsID from document where pbatch = '02130430202803'

select distinct docidDoctype from document where docidDoctype like '%str%'


314VB0329131403O
314VB0329131403O
314VB0329131403O
314VB0329131403O
314VB0329131403O
314VB0329131403O
314VB0401131408O
314VB0401131408O
314VB0401131408O
314VB0401131408O
314VB0401131408O
314VB0401131408O
314VB0401131408O
397VB0401133693A
397VB0401133693A


select * from document where docidDoctype like '%rating%' and pbatch = '02130930002603'


select * from document where pbatch in (
'02130950010302',
'02130950004501',
'02130950002102',
'02130950004803')

select distinct docidDoctype from document where docidDoctype like '%DD%215%'

select * from manifestDCS where rmn = '317vb0405133019h'

select * from document where dociddoctype like '%Photographs%' order by filesize desc\
\\


 SELECT DISTINCT PBatch, MAX(ImageDateTime) as 'Export Date' FROM Document WHERE PDFTrigger = '.sem4' 
AND ocrexporttime is null and ftpstime is null
AND PBatch NOT IN (SELECT BatchName FROM [TurboscanNG_ATL-VA-0004].dbo.batches  where batchlocation > 0)
GROUP BY PBatch
ORDER BY pbatch



select sum(numpages) as imgs,convert(nvarchar,ocrexporttime,101) as date, datepart(hh,ocrexporttime) as hh from document where ocrexporttime > '4/15/2013' group by convert(nvarchar,ocrexporttime,101) ,datepart(hh,ocrexporttime)  order by sum(numpages) desc
