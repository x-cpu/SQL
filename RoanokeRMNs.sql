select * from pobox 

select * from manifestDCS where rmn like '314%'


select distinct X.RMN
FROM
(select distinct m.RMN from manifestDCS m
left join customerCheckIn c
on m.RMN = c.RMN
left join pobox p
on c.location = p.SysKey
where m.rmn like '314%' and p.SysKey = '62') X


---MAIN
select distinct m.RMN, SUBSTRING(m.RMN, 10, 2) Year from manifestDCS m
left join customerCheckIn c
on m.RMN = c.RMN
left join pobox p
on c.location = p.SysKey
where m.rmn like '314%' and p.SysKey = '62' 
and exists (select * from document where m.RMN = rmn)

---MAIN with DCSIDs
select distinct m.RMN, count(distinct m.dcsid) #ofFiles, SUBSTRING(m.RMN, 10, 2) Year from manifestDCS m
left join customerCheckIn c
on m.RMN = c.RMN
left join pobox p
on c.location = p.SysKey
where m.rmn like '314%' and p.SysKey = '62' 
and exists (select * from document where m.RMN = rmn)
group by m.RMN


---MAIN with DCSIDs
select count(X.RMN) RMNs, sum(X.#ofFiles) Files,
CASE
	WHEN X.XYear = '13' Then '2013'
	WHEN X.XYear = '14' Then '2014'
END as Year
FROM
(select distinct m.RMN, count(distinct m.dcsid) #ofFiles, SUBSTRING(m.RMN, 10, 2) XYear from manifestDCS m
left join customerCheckIn c
on m.RMN = c.RMN
left join pobox p
on c.location = p.SysKey
where m.rmn like '314%' and p.SysKey = '62' 
and exists (select * from document where m.RMN = rmn)
group by m.RMN) X
group by x.XYear



select SUBSTRING(RMN, 10, 2) from manifestDCS
where rmn in (
'314VB0502144273O',
'314VB0129148029O',
'314VB0113147928O',
'314VB0520145507O',
'314VB0621130212O',
'314VB0723149938O')


--314VB0502144273O