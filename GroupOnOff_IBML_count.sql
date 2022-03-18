select * from BarcodeTable where BarData like '%groupon%' and batchid in (
select distinct BatchID from batchtable where DateCreated > '2013-08-05 0:0:0' and DateCreated < '2013-08-09 23:59:59.999')