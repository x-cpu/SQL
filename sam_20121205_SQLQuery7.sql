exec dbo.va_qaerrorreportsummary_types_reviewed @fromdate = '2012-11-01 00:00:00', @todate = '2012-11-30 00:00:00', @526Only = 1
exec dbo.va_qaerrorreportsummary_types_reviewed @fromdate = '2012-11-01 00:00:00', @todate = '2012-11-30 00:00:00', @526Only = 0


exec dbo.VA_UploadTATRange_Report @fromdate = '2012-11-01 00:00:00', @todate = '2012-11-30 00:00:00'





select distinct rmn  from manifestdcs where insertdate > '11/01/2012 0:0:1' and insertdate <'11/01/2012 23:59:59'

select rmn,* from manifestdcs  
order by rmn 

