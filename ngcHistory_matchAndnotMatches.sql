
--master
select distinct n.ngcvalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.ngcvalue
order by n.ngcvalue


select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue
order by n.opervalue




select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue
order by n.opervalue

--last revision
select distinct x.DocType, x.Total Match, y.Total NotMatch
FROM
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue) x,
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue) y
where (x.DocType = y.DocType)
order by x.DocType



--last revision
select distinct x.DocType, sum(x.Total) Match, sum(y.Total) NotMatch
FROM
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue) x,
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue) y
where x.DocType = y.DocType
group by x.DocType
order by x.DocType


select distinct z.DocType, sum(x.Total) Match, sum(y.Total) NotMatch
FROM
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType = n.opervalue
group by n.opervalue) x,
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and d.DocType <> n.opervalue
group by n.opervalue) y,
(select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
left join docid.dbo.docid dd
on d.docid = dd.DocID
where n.ngcvalue <> 'STR - Medical - Photocopy'
--and d.DocType = n.opervalue
group by n.opervalue) z
group by z.DocType
order by z.DocType



select distinct n.opervalue DocType, count(*) Total from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
left join docid.dbo.docid dd
on d.docid = dd.DocID
where n.ngcvalue <> 'STR - Medical - Photocopy'
--and d.DocType = n.opervalue
group by n.opervalue




select * from ngcHistory where ngcvalue <> 'STR - Medical - Photocopy'

select * from ngcHistory where opervalue = 'VA 70-3288 Request for and Consent to Release of Information from Claimants Records' and ngcvalue <> 'STR - Medical - Photocopy'



select distinct n.ngcvalue, v.syskey, d.syskey from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on RIGHT('000'+ISNULL(v.syskey,''),3) = d.syskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
order by v.syskey


--SELECT RIGHT('000'+ISNULL(syskey,''),3) from docid.dbo.vageo


select distinct n.ngcvalue, v.syskey, d.syskey from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on RIGHT('000'+ISNULL(v.syskey,''),3) = d.syskey
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.ngcvalue not in (select distinct value from docid.dbo.vageo)
order by v.syskey


select distinct n.ngcvalue, d.syskey from ngcHistory n
left join  docid.dbo.vageo v
on n.ngcvalue = v.value
left join docid.dbo.Docid_SubDoctype d
on d.subDoctype = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
and n.ngcvalue not in (select distinct value from docid.dbo.vageo)




select distinct n.ngcvalue, v.value from docid.dbo.vageo v
left join ngcHistory n
on v.value = n.ngcvalue
where n.ngcvalue <> 'STR - Medical - Photocopy'
order by DocType


select * from ngcHistory where ngcvalue = 'VA Form 9, Appeal to Board of Appeals' order by opervalue
select * from ngcHistory where opervalue = 'VA Form 8, Certification of Appeal'



select * from ngcHistory where ngcvalue = 'VA FORM 21-8947, Compensation and Pension Award'

select * from docid.dbo.vageo where value = 'VA FORM 21-8947, Compensation and Pension Award'

select * from docid.dbo.vageo where syskey = '211'


select * from docid.dbo.Docid_SubDoctype where syskey = '211'