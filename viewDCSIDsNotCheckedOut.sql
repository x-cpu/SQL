--dcsid checkin and not checkout 
select distinct dcsID from manifestDCS where SUBSTRING(pbatch, 3, 5) = '15257' and pbatch like '02%'
and not exists (select * from Boxmapping where manifestDCS.dcsID = Boxmapping.dcsID)