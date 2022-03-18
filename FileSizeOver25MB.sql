--Uploaded
  select ImageID, convert(nvarchar(50) ,cast([FileSize] as numeric(35,2))/1048576.0 ) +' MB' as FSize, 
 filesize, dcsID, docidDoctype, ftpstime VBMSUploadDateTime
 from document where ImageDateTime >= '2017-03-02'
 group by ImageID, dcsID, docidDoctype, filesize, ftpstime
 having sum((filesize) / 1048576.0) > 25
 order by ftpstime

   select ImageID, convert(nvarchar(50) ,cast([FileSize] as numeric(35,2))/1048576.0 ) +' MB' as FSize, 
 filesize, dcsID, docidDoctype, ftpstime VBMSUploadDateTime
 from document where ImageDateTime >= '2017-03-02' and ftpstime is null and comments is not null
 group by ImageID, dcsID, docidDoctype, filesize, ftpstime
 having sum((filesize) / 1048576.0) > 25
 order by ftpstime