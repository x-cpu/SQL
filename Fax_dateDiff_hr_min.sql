select t.uniqueid, t.localcreationtime, f.datemodified, DATEDIFF(day, t.localcreationtime, f.datemodified) #ofDays, 
DATEDIFF(HOUR, t.localcreationtime, f.datemodified) #ofHours, 
DATEDIFF(MINUTE, t.localcreationtime, f.datemodified)%60 #ofMinutes, 
f.pbatch BatchName from docid.dbo.faxTemp20170414 t
left join tmpfaxtifname f
on t.uniqueID = substring(f.tifname, 16, 15)
where t.[transmission status] = 'OK'
order by #ofDays desc
