use dva
--hourly OCR img volume  
select convert(nvarchar, ocrexporttime, 101) as date, datepart(hh,ocrexporttime) as Hour ,sum(numpages) as Images from Document where ocrexporttime> '4/7/2014 0:0:1' 
group by convert(nvarchar, ocrexporttime, 101) ,datepart(hh,ocrexporttime) order by convert(nvarchar, ocrexporttime, 101) ,datepart(hh,ocrexporttime) 




--hourly OCR img volume  
use dva
select convert(nvarchar, ocrexporttime, 101) as date, datepart(hh,ocrexporttime) as Hour ,sum(numpages) as Images from Document where ocrexporttime> '4/7/2014 0:0:1' 
group by convert(nvarchar, ocrexporttime, 101) ,datepart(hh,ocrexporttime) order by convert(nvarchar, ocrexporttime, 101) ,datepart(hh,ocrexporttime) 
