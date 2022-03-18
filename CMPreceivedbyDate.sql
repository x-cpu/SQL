use DOCID
delete from IBMLCOUNTS


select *
from DVA.dbo.cmpcheckin C join DOCID.dbo.IBMLCOUNTS I on C.pbatch = I.batchname 
where C.syskey >= '3352'
and I.dcs <> 1 order by C.insertdate desc



update C set C.env = I.dcs
from DVA.dbo.cmpcheckin C join DOCID.dbo.IBMLCOUNTS I on C.pbatch = I.batchname 
where C.syskey >= '3352'
and I.dcs <> 1


--CMP BY RECEIVED DATE
select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Baltimore' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Baltimore' or P.CRCDestination = 'Baltimore') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Cleveland' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Cleveland' or P.CRCDestination = 'Cleveland') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Louisville' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Louisville' or P.CRCDestination = 'Louisville') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'St. Petersburg' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'St. Petersburg' or P.CRCDestination = 'St. Petersburg') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Nashville' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Nashville' or P.CRCDestination = 'Nashville') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Columbia' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Columbia' or P.CRCDestination = 'Columbia') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Montgomery' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Montgomery' or P.CRCDestination = 'Montgomery') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Providence' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Providence' or P.CRCDestination = 'Providence') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)

select CONVERT(nvarchar, P.InvTime, 101) Date, SUM(c.env) as 'Newark' from PhysicalBatch P 
join cmpcheckin c on P.PBatch = c.pbatch
where (P.POBox = 'Newark' or P.CRCDestination = 'Newark') and CONVERT(nvarchar, P.InvTime, 101) > '06/09/2014'
group by CONVERT(nvarchar, P.InvTime, 101)



select * from physicalbatch



Nashville – 37203
Columbia – 29209
Montgomery - 36109


