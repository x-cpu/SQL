
select * from document where dcsid in 
(select distinct dcsid from cmprecon where documentstatus ='upload')
and ftpstime is null and comments is null 
and imagedatetime < '8/1/2014 0:0:0'
order by imagedatetime

--I look at one sample, 

--select * from cmprecon where dcsid = 'DCSID031412106012010001'
--and we received good file from Portal. 
--I see text file is also creating but it has .processing 

--Is it matter of resetting processingfile. We need to be careful because there may be good processing file (the one FTP apps is running right now.). that is why I put a imagedatetime <8/1….you can turn above query to distinct pbatch and you can just edit my batch file and do reset. Try to upload those man 
