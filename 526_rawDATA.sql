
--good test sample MAIN "SPECIAL"
SELECT  distinct DCSID, RMN, datepart(year, ftpstime) Year, datepart(month, ftpstime) Month,
sum((len(Form526Data) - (len(Form526Data) - LEN(replace(form526data, ' ', '')))) - (len(Form526Data) - LEN(replace(form526data, ';', ''))))  Total526Char,
Form526Data
FROM Document
WHERE ftpstime >= '05/01/2014 0:0:0.000' AND ftpstime <= '09/30/2014 23:59:59.999' and len(Form526Data) >= 1
group by datepart(year, ftpstime), datepart(month, ftpstime), dcsid, RMN
order by year, month