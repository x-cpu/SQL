SELECT   cleardate,tblaccounts.actProgramGroup, count(*) as "Number of Images"
FROM         zCOFFiles
inner join tblAccounts on zCOFFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (cleardate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by  cleardate,tblaccounts.actProgramGroup
order by cleardate,tblaccounts.actProgramGroup



SELECT   tblaccounts.actProgramGroup, count(*) as "Number of Images"
FROM         zCOFFiles
inner join tblAccounts on zCOFFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (cleardate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by tblaccounts.actProgramGroup
order by tblaccounts.actProgramGroup




select top 1 * from zcoffiles
select top 1 * from tblaccounts

SELECT   tblaccounts.actProgramGroup, bankfilename, count(*) as "Number of Images"
FROM         zBankFiles
inner join tblAccounts on zBankFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (ClearDate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by bankfilename, tblaccounts.actProgramGroup
order by bankfilename, tblaccounts.actProgramGroup


SELECT   tblaccounts.actProgramGroup,  count(*) as "Number of Images"
FROM         zBankFiles
inner join tblAccounts on zBankFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (ClearDate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by  tblaccounts.actProgramGroup
order by  tblaccounts.actProgramGroup




select * from zbankfiles where cleardate between '2012-06-01 00:00:00' AND '2012-06-30 00:00:00'
and bank = '048'



select account, amount, count(*)  from zcoffiles where cleardate between '2012-06-01 00:00:00' AND '2012-06-30 00:00:00'
and bank = '048' and account = '2535510914'
group by account,  amount
order by count(*) desc


SELECT   *
FROM         zbankfiles where 
where zCOFFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (cleardate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by  tblaccounts.actProgramGroup
order by tblaccounts.actProgramGroup






SELECT   tblaccounts.actProgramGroup, doctype, count(*) as "Number of Images"
FROM         zCOFFiles
inner join tblAccounts on zCOFFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (ClearDate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by tblaccounts.actProgramGroup, doctype
order by tblaccounts.actProgramGroup, doctype


SELECT    count(distinct imagename)
FROM         zCOFFiles
WHERE     (Bank = '048') AND (ClearDate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')


SELECT   tblaccounts.actProgramGroup, cleardate, count(*) as "Number of Images"
FROM         zCOFFiles
inner join tblAccounts on zCOFFiles.account = tblAccounts.actAccountNumber
WHERE     (Bank = '048') AND (ClearDate BETWEEN '2012-06-01 00:00:00' AND '2012-06-30 00:00:00')
group by tblaccounts.actProgramGroup, cleardate
order by tblaccounts.actProgramGroup, coffilename





SELECT ProgramGroup,Bank,RoutingNumber,CompanyName,Account,COUNT(Account) AS Items,COUNT(ImageName)
 AS Images FROM marsha.vwExport175338 GROUP BY CompanyName,Bank,Account,RoutingNumber,ProgramGroup HAVING (Not (ProgramGroup Is Null)) ORDER BY CompanyName,Bank,Account


 select * from marsha.vwExport175338



 SELECT cleardate,ProgramGroup,Bank,RoutingNumber,CompanyName,Account,COUNT(Account) AS Items,COUNT(ImageName) AS Images 
 FROM pam.vwExport173318 where bank = '048'
 GROUP BY cleardate,CompanyName,Bank,Account,RoutingNumber,ProgramGroup HAVING (Not (ProgramGroup Is Null)) 
 ORDER BY cleardate,CompanyName,Bank,Account


 select * from pam.vwExport173318  where imagename is null





 select * from pam.vwExport173318 where bankfilename = 'bank48_rev_june__stmt_201207121434.txt'

  select * from pam.vwExport173318 where bankfilename = 'bank48_20120701_stmt.txt'

 
 select bankfilename, count(*) from pam.vwExport173318 group by bankfilename

 
 select * from pam.vwExport173318 where accountnumber = '2520092032' and checknumber = '0000322174'

 select * from 

 select * from zcoffiles where bank = '048' and cleardate between '06/01/2012' and '07/01/2012'  and imagename not in (select imagename from zbankfiles  where bank = '048' and cleardate between '06/01/2012' and '07/01/2012') order by cleardate

 select sequence, count( *) from pam.vwExport173318
 group by sequence order by count(*)


  SELECT cleardate,ProgramGroup,Bank,RoutingNumber,CompanyName,Account,COUNT(Account) AS Items,COUNT(ImageName) AS Images FROM pam.vwExport175849 where bank = '048'  GROUP BY cleardate,CompanyName,Bank,Account,RoutingNumber,ProgramGroup HAVING (Not (ProgramGroup Is Null)) ORDER BY cleardate,CompanyName,Bank,Account