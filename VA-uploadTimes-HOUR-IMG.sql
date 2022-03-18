--hourly ftp img volume , size
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images, (sum(filesize)/(1024*1024)) as FTPSizeMB from Document where ftpstime > '6/24/2013 0:0:1' 
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 




--hourly ftp img volume  
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images from Document where ftpstime > '03/06/2015 0:0:0'
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 


--hourly ftp img volume  CMP
select convert(nvarchar, ftpstime, 101) as date, datepart(hh,ftpstime) as Hour ,sum(numpages) as Images from Document where ftpstime > '12/08/2014 0:0:0'
and pbatch not like '02%'
group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 


--daily hourly upload to VBMS "DCS"
select convert(nvarchar, ftpstime, 101) as Date,
                            datepart(hh,ftpstime) as Hour,  
                            sum(numpages) as images from document 
                            where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                            and pbatch like '02%'
                            group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 
                            order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime)

select convert(nvarchar, ftpstime, 101) as Date,
                            datepart(hh,ftpstime) as Hour,  
                            sum(numpages) as images from document 
                            where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                            and pbatch like '02%'
                            group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 
                            order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime)

select convert(nvarchar, ftpstime, 101) as Date,
                            datepart(hh,ftpstime) as Hour,  
                            sum(numpages) as Images from Document 
                            where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                            and pbatch not like '02%'
                            group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 
                            order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime)

select sum(numpages) from document where pbatch not like '02%' and ftpstime > '2015-03-06 0:0:0'		

select sum(numpages) as images from document 
                            where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE())) and pbatch like '02%'


--daily hourly upload to VBMS "CMP"
select convert(nvarchar, ftpstime, 101) as Date,
                            datepart(hh,ftpstime) as Hour,  
                            sum(numpages) as images from document 
                            where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                            and pbatch not like '02%'
                            group by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime) 
                            order by convert(nvarchar, ftpstime, 101) ,datepart(hh,ftpstime)



--daily sum upload to VBMS "DCS"
select sum(numpages) as images from document where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE())) and pbatch like '02%'




--daily sum upload to VBMS "CMP"
select sum(numpages) as images from document where ftpstime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE())) and pbatch not like '02%'



--daily sum upload to Portal
select sum(d.numpages) as Pages from FTPDetails fd left join document d on fd.batchname = d.PBatch where fd.etime >= DATEADD(d,0,DATEDIFF(d,0,GETDATE())) and fd.acktime is not null
