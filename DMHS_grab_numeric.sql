select * from dmhsCMPxmldownload s where  exists
(select * from smsDCSMapping d where substring(s.xmlFilename, 1, (len(s.xmlFilename) - 4)) = substring(d.xmlFilename, 1, (len(d.xmlFilename) - 4))) 

--GRAB ONLY NUMERIC
select SUBSTRING(substring(xmlFilename, 1, (len(xmlFilename) - 4)), PATINDEX('%[0-9]%', XMLfilename), LEN(XMLfilename)) from dmhsCMPxmldownload




--5229
--16624

select * from smsDCSMapping where veteranID = '1698'
select * from dmhsCMPxmldownload where comments = '1698'


select * from smsDCSMapping where status like 'split%'

select * from dmhsCMPxmldownload where XMLfilename like 'split%'

select * from pmrrecon



select * from dmhsCMPxmldownload where XMLfilename like '%-495.%' and type = '.ack'

select SUBSTRING(XMLfilename, PATINDEX('%[0-9]%', XMLfilename), LEN(XMLfilename)) from dmhsCMPxmldownload 

select SUBSTRING(substring(xmlFilename, 1, (len(xmlFilename) - 4)), PATINDEX('%[0-9]%', XMLfilename), LEN(XMLfilename)) from dmhsCMPxmldownload


select substring(xmlFilename, 1, (len(xmlFilename) - 4)) from dmhsCMPxmldownload





