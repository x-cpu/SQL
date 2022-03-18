select  SUM(d.NumPages)
FROM (
select distinct dcsID from Boxmapping where exists
(select distinct boxno from Boxmapping where shipmentno >= 1 and shipmentno <= 66)) T
join document d
on T.dcsID = d.dcsID 


select count(distinct boxno) from Boxmapping where shipmentno >= 95 and shipmentno <= 98
and BoxType = 'ADMIN'

select count(distinct boxno) from Boxmapping where shipmentno >= 95 and shipmentno <= 98
and BoxType = 'STR'


--53850
--25278


select count(distinct boxno) from CMPBoxmapping where shipmentno >= 1 and shipmentno <= 6
and BoxType = 'ADMIN'

select count(distinct boxno) from CMPBoxmapping where shipmentno >= 1 and shipmentno <= 6
and BoxType = 'STR'



select * from TurboscanNG1.dbo.batches where batchname in (
'03151870617401',
'03151870617301',
'03151870618001',
'03151870617601',
'03151870617001',
'03151870617101',
'03151870617201',
'03151870617501',
'03151870618201')
