--split images BY DATE FOR EOM updated 2016-05-12
select convert(date, c.insertdate, 101), sum(d.numpages) from cmpRescanMapping c
left join document d
on c.dcsid = d.dcsID
where c.insertdate > '2016-03-01 00:00.00' and c.insertdate <= '2016-03-31 23:59:59.999'
group by convert(date, c.insertdate, 101)
order by convert(date, c.insertdate, 101)