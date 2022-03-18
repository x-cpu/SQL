--MASTER BLASTER --NGCVALUE vs OPERVALUE
select distinct x.DocType, ISNULL(sum(y.Match), 0) Match, ISNULL(sum(z.NotMatch), 0) NotMatch, ISNULL(sum(x.Total), 0) Total
FROM
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
where n.ngcvalue <> 'STR - Medical - Photocopy'
group by n.opervalue) x
left join (select distinct n.opervalue DocType, count(*) Match from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue) y
on x.DocType = y.DocType
left join (select distinct n.opervalue DocType, count(*) NotMatch from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue) z
on x.DocType = z.DocType
group by x.DocType



--match
select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue
order by n.opervalue


--NOT match
select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue
order by n.opervalue



--match
FROM
(select distinct n.opervalue DocType, count(*) Match from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue) x,
(select distinct n.opervalue DocType, count(*) NotMatch from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue) y



--SUBDOCTYPE SUMMARY
--MASTER BLASTER --NGCVALUE vs OPERVALUE
select distinct x.SubDocType, ISNULL(sum(y.Match), 0) Match, ISNULL(sum(z.NotMatch), 0) NotMatch, ISNULL(sum(x.Total), 0) Total
FROM
(select distinct n.OperSubDoctype SubDocType, count(*) Total from ngcHistory n
where n.ngcvalue <> 'STR - Medical - Photocopy' and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null
group by n.OperSubDoctype) x
left join (select distinct n.OperSubDoctype SubDocType, count(*) Match from ngcHistory n
left join docid.dbo.Docid_SubDoctype d
on d.syskey = n.NGCSubDoctypeSyskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.OperSubDoctype = d.subDoctype and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null
group by n.OperSubDoctype) y
on x.SubDocType = y.SubDocType
left join (select distinct n.OperSubDoctype SubDocType, count(*) NotMatch from ngcHistory n
left join docid.dbo.Docid_SubDoctype d
on d.syskey = n.NGCSubDoctypeSyskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.OperSubDoctype <> d.subDoctype and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null
group by n.OperSubDoctype) z
on x.SubDocType = z.SubDocType
group by x.SubDocType




--SUBDOCTYPE
--MASTER BLASTER --NGCVALUE vs OPERVALUE
select distinct x.SubDocType, x.ngcformconf, x.Operid,  ISNULL(sum(y.Match), 0) Match, ISNULL(sum(z.NotMatch), 0) NotMatch, ISNULL(sum(x.Total), 0) Total
FROM
(select distinct n.OperSubDoctype SubDocType, n.ngcformconf, n.Operid, count(*) Total from ngcHistory n
where n.ngcvalue <> 'STR - Medical - Photocopy' and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null and n.ngcformconf is not null 
group by n.OperSubDoctype, n.ngcformconf, n.Operid) x
left join (select distinct n.OperSubDoctype SubDocType, count(*) Match from ngcHistory n
left join docid.dbo.Docid_SubDoctype d
on d.syskey = n.NGCSubDoctypeSyskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.OperSubDoctype = d.subDoctype and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null and n.ngcformconf is not null 
group by n.OperSubDoctype, n.ngcformconf, n.Operid) y
on x.SubDocType = y.SubDocType
left join (select distinct n.OperSubDoctype SubDocType, n.ngcformconf, n.Operid, count(*) NotMatch from ngcHistory n
left join docid.dbo.Docid_SubDoctype d
on d.syskey = n.NGCSubDoctypeSyskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.OperSubDoctype <> d.subDoctype and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null and n.ngcformconf is not null 
group by n.OperSubDoctype, n.ngcformconf, n.Operid) z
on x.SubDocType = z.SubDocType
group by x.SubDocType, x.ngcformconf, x.Operid





--SUBDOCTYPE SUMMARY
--MASTER BLASTER --NGCVALUE vs OPERVALUE
select distinct x.SubDocType, nn.ngcformconf, nn.Operid, ISNULL(sum(y.Match), 0) Match, ISNULL(sum(z.NotMatch), 0) NotMatch, ISNULL(sum(x.Total), 0) Total
FROM
(select distinct n.OperSubDoctype SubDocType, count(*) Total from ngcHistory n
where n.ngcvalue <> 'STR - Medical - Photocopy' and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null
group by n.OperSubDoctype) x
left join (select distinct n.OperSubDoctype SubDocType, count(*) Match from ngcHistory n
left join docid.dbo.Docid_SubDoctype d
on d.syskey = n.NGCSubDoctypeSyskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.OperSubDoctype = d.subDoctype and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null
group by n.OperSubDoctype) y
on x.SubDocType = y.SubDocType
left join (select distinct n.OperSubDoctype SubDocType, count(*) NotMatch from ngcHistory n
left join docid.dbo.Docid_SubDoctype d
on d.syskey = n.NGCSubDoctypeSyskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.OperSubDoctype <> d.subDoctype and OperSubDoctype <> '' and OperSubDoctype is not null and Operid is not null and NGCSubDoctypeSyskey is not null
group by n.OperSubDoctype) z
on x.SubDocType = z.SubDocType
left join ngcHistory nn
on x.SubDocType = nn.OperSubDoctype
where nn.OperSubDoctype <> '' and nn.OperSubDoctype is not null and nn.Operid is not null and nn.NGCSubDoctypeSyskey is not null
group by x.SubDocType, nn.ngcformconf, nn.Operid
