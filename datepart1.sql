select * from customercheckin where DATEPART(hh, insertdate) = '00' and DATEPART(mi, insertdate) = '00' and DATEPART(ss, insertdate) = '00' and DATEPART(ms, insertdate) = '0'