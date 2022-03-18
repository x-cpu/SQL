
---ANOTHER WAY


DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(x.Workstation) 
		  FROM (select distinct w.WSName Workstation from dva.dbo.ts_audit  t
		  left join Workstation w
		  on t.WSID = w.WSID
		  where tsmodule in ('Enhance', 'FOCR', 'Enhance2', 'AutoIndex')
		  and t.TimeStamp > '2017-02-10 0:0:0') x
          FOR XML PATH(''), TYPE
          ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

set @query = 'SELECT tsmodule, xDate, xHour,  ' + @cols + ' from 
            (
			select distinct tsmodule, convert(date, t.timestamp, 101) as xDate, datepart(hh,t.timestamp) as xHour , 
			ISNULL(sum(t.userimagesprocessed), 0) as Images, w.WSName Workstation
			from dva.dbo.ts_audit t
			left join Workstation w
			on t.WSID = w.WSID
			where t.timestamp > ''2017-02-10 0:0:0''
			and tsmodule in (''Enhance'', ''FOCR'', ''Enhance2'', ''AutoIndex'')
			group by convert(date, t.timestamp, 101), datepart(hh,t.timestamp), t.TSModule, w.WSName  
			having sum(userimagesprocessed) > 0
			) y
            pivot 
            (
                sum(y.Images)
                for Workstation in (' + @cols + ')
            ) p order by xDate desc'



execute(@query)





----SINGLE BOX with SINGLE QUEUE


DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(x.Workstation) 
		  FROM (select distinct w.WSName Workstation from ts_audit  t
		  left join Workstation w
		  on t.WSID = w.WSID
		  where tsmodule in ('Enhance')) x
          FOR XML PATH(''), TYPE
          ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'') 

set @query = 'SELECT tsmodule, xDate, xHour,  ' + @cols + ' from 
            (
			select distinct tsmodule, convert(date, t.timestamp, 101) as xDate, datepart(hh,t.timestamp) as xHour , 
			ISNULL(sum(t.userimagesprocessed), 0) as Images, w.WSName Workstation
			from ts_audit t
			left join Workstation w
			on t.WSID = w.WSID
			where t.timestamp > ''2016-11-28 13:0:0''
			and tsmodule in (''Enhance'')
			group by convert(date, t.timestamp, 101), datepart(hh,t.timestamp), t.TSModule, w.WSName  
			having sum(userimagesprocessed) > 0
			) y
            pivot 
            (
                sum(y.Images)
                for Workstation in (' + @cols + ')
            ) p order by xDate desc'



execute(@query)





---


select * from Workstation where wsname = 'mtv-va-fscn-1e'



select * from TS_Audit where wsid = 704 and tsmodule in ('Enhance', 'FOCR', 'Enhance2', 'AutoIndex')


select w.WSName, * from TS_Audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp > '2016-11-27' and w.WSName like 'MTV-VA-PC%'
and tsmodule in ('Enhance', 'FOCR', 'Enhance2', 'AutoIndex')


---OTHER GOOD SAMPLE QUERIES


select w.WSName, sum(t.UserImagesProcessed) Images from TS_Audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp > '2016-11-27 13:00:00' 
and tsmodule in ('Enhance2')
group by WSName
order by Images


select w.WSName, sum(t.UserImagesProcessed) Images from TS_Audit t
left join Workstation w
on t.WSID = w.WSID
where t.TimeStamp > '2016-11-27 13:00:00' 
and tsmodule in ('FOCR')
group by WSName
order by Images
