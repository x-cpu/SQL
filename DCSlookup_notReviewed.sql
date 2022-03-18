--not reviewed


--not reviewed (Excluding Roanoke)
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null 
and d.dcsid not in (select distinct dcsid from dcssheetlookup)



--not reviewed (Roanoke only)
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null 
and d.dcsid not in (select distinct dcsid from dcssheetlookup) 





---TEST FOR CANNOTFIX inclusion ---- not reviewed (Excluding Roanoke)
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null 
and d.dcsid not in (select distinct dcsid from dcssheetlookup)
or d.dcsID in (select distinct dcsid from dcssheetlookup_cannotfix where imagepath is not null)



--TEST FOR CANNOTFIX inclusion ---- not reviewed (Roanoke only)
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null 
and d.dcsid not in (select distinct dcsid from dcssheetlookup) 
or d.dcsID in (select distinct dcsid from dcssheetlookup_cannotfix where imagepath is not null)



--not reviewed (non Roanoke) INCLUDING CANNOT FIX ITEMS
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location <> '62' and d.ftpstime is null and d.comments is not null 
and d.dcsid not in (select distinct dcsid from dcssheetlookup where secondcheck = 'TrueError') 




--not reviewed (Roanoke only) INCLUDING CANNOT FIX ITEMS
select distinct d.dcsid, d.PBatch from document d
inner join customerCheckIn c
on d.rmn = c.rmn
where 
c.location = '62' and d.ftpstime is null and d.comments is not null 
and d.dcsid not in (select distinct dcsid from dcssheetlookup where secondcheck = 'TrueError')


select * from FTPError where insertdate > '2014-10-15 0:0:0'
select * from document where pbatch = '02142840001707'


select * from cmpcheckin where pbatch like '04%' and insertdate = '2014-10-13' order by insertdate desc
select * from PhysicalBatch where pbatch like '04%' and InvTime > '2014-10-13 0:0:0' order by BackDate desc

select * from cmpcheckin where pbatch = '04142830007001' or pbatch = '04142830000101' or pbatch = '04142830007201'
select * from PhysicalBatch where pbatch = '04142830007001' or pbatch = '04142830000101' or pbatch = '04142830007201'
select * from manifestDCS where pbatch = '041428300070'  or pbatch = '041428300001' or pbatch = '041428300072'


select distinct shipmentno from Boxmapping where trackingno is null and shipmentno is not null order by shipmentno
select * from Boxmapping where trackingno is null and shipmentno is not null order by shipmentno


select * from document where dcsid = 'I08L0AW7GB7ACO'
select * from CustomerDATA where dcsid = 'I08L0AW7GB7ACO'
select * from FTPError where imageid = 'CACI_142722901P001061713'

select * from pbatchDCS_comments where dcsid = 'I08L0AW7GB7ACO'
select * from pbatchDCS_comments_Detailed where dcsid = 'I08L0AW7GB7ACO'

select * from Boxmapping where shipmentno = '43' and trackingno = '12345'

update Boxmapping
set trackingno = NULL, operID = NULL
where shipmentno = '43' and trackingno = 'test1234'

select * from document where pbatch = '04142830009101'

RMN20141010 050101
RMN20141011 9001