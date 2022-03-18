select distinct m.dcsid ,w.* from manifestdcs as m, wip20140721pending as w where m.insertdate <'7/13/2014 23:59:59'
and m.dcsid not in (select distinct dcsid from document where ftpstime is not null )
and dcsid <> 'dcsid'
and m.rmn=w.rmn
and w.rmn is not null
and m.rmn in (select distinct rmn from customercheckin where trackingno not like 'c%')
order by w.[checkin date]




select * from wip20140721pending
where rmn is not null
and rmn in (select distinct rmn from customercheckin where trackingno not like 'c%')
and rmn in (select distinct rmn from manifestdcs where insertdate < '7/13/2014 23:59:59.999')
order by export desc