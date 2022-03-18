select * from transact
where date_in >= '2018-12-30'
and date_in <= '2019-01-05'
and init = '1012'
and elapsed > 0


select sum(elapsed), sum(qty) from transact
where date_in >= '2018-12-30'
and date_in <= '2019-01-05'
and init = '2084'

--2084
--(No column name)	(No column name)
--33.7	19414.17

select * from employee where lastname = 'shelton'


select sum(elapsed), sum(qty) from transact
where date_in >= '2018-12-30'
and date_in <= '2019-01-05'
and init = '2084'

select sum(elapsed), sum(qty) from transact
where date_in >= '2018-12-30'
and date_in <= '2019-01-05'
and init = '977'

select sum(elapsed), sum(qty) from transact
where date_in >= '2018-12-30'
and date_in <= '2019-01-05'
and init = '1012'

--1012


select * from task where task_code in (
'630101',
'630216')