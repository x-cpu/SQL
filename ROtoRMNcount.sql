
select p.pobox, count(distinct x.rmn) #ofRMNs
FROM (
select distinct RMN from CustomerDATA where exists
(select * from Boxmapping where CustomerDATA.dcsid = dcsid and dcsid <> '')) X
left join pobox p
on SUBSTRING(RMN, 1, 3) = StationNo
group by p.pobox
order by p.pobox