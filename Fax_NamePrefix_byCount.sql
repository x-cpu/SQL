select distinct SUBSTRING(tifname, 16, 5) TifNamePrefix, count(*) FaxCount from tmpfaxtifname
group by SUBSTRING(tifname, 16, 5)
order by SUBSTRING(tifname, 16, 5)


