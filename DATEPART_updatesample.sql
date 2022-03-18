
select dateadd("ss",01,insertdate),* from customercheckin where DATEPART(hh, insertdate) = '00' and DATEPART(mi, insertdate) = '00' and DATEPART(ss, insertdate) = '00' and DATEPART(ms, insertdate) = '0'


update customercheckin set insertdate = dateadd("ss",01,insertdate) where DATEPART(hh, insertdate) = '00' and DATEPART(mi, insertdate) = '00' and DATEPART(ss, insertdate) = '00' and DATEPART(ms, insertdate) = '0'