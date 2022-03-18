---#of RMN by RO
select convert(nvarchar, m.insertdate, 101) as checkInDate, p.pobox RO, count(distinct m.RMN) RMNc from manifestDCS m, customerCheckIn c, pobox p
where m.trackingno = c.trackingno
and m.RMN = c.RMN
and m.insertdate  >= '2014-03-01 0:0:0' 
and c.location = p.SysKey
group by convert(nvarchar,m.insertdate,101), P.POBOX
ORDER BY convert(nvarchar,m.insertdate,101), p.pobox


select convert(nvarchar, m.insertdate, 101) as checkInDate, p.pobox RO, m.RMN RMNc from manifestDCS m, customerCheckIn c, pobox p
where m.trackingno = c.trackingno
and m.RMN = c.RMN
and m.insertdate  >= '2015-01-02 0:0:0'  and m.insertdate  <= '2015-01-02 23:59:59.999' 
and c.location = p.SysKey
and p.pobox = 'Nashville'
--group by convert(nvarchar,m.insertdate,101), P.POBOX
ORDER BY m.RMN



select customerCheckIn.trackingno  as TrackingNumber, rtrim(customerCheckIn.RMN) as RMN, convert(varchar, customerCheckin.insertdate, 101) as VAPortalEntryDate
                from customerCheckIn
				where rmn is not null and rmn <>''
                and rmn not in (select distinct rmn from manifestdcs where rmn is not null and rmn <>'')
                order by customerCheckIn.insertdate


				select * from manifestDCS where rmn = '1ZA39E940399664698'