select distinct tsmodule, convert(date, t.timestamp, 101) as xDate, datepart(hh,t.timestamp) as xHour , 
			ISNULL(sum(t.userimagesprocessed), 0) as Images, w.WSName Workstation
			from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
			left join [mtv-va-sql-4\p1].turboscanng1.dbo.Workstation w
			on t.WSID = w.WSID
			where t.timestamp > DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
			and tsmodule in ('Enhance')
			group by convert(date, t.timestamp, 101), datepart(hh,t.timestamp), t.TSModule, w.WSName  
			having sum(userimagesprocessed) > 0
			order by xDate, xHour

--sum by module
select 
CASE
	When X.tsModule = 'Enhance' Then 'Enhance'
	When X.tsModule = 'FOCR' Then 'FOCR'
	When X.tsModule = 'Enhance2' Then 'Enhance2'
	When X.tsModule = '4' Then 'Separation'
	When X.tsModule = 'ImageQC' Then 'ImageQC'
	When X.tsModule = 'AutoIndex' Then 'AutoIndex'
	When X.tsModule = 'DocID' Then 'DocID'
	When X.tsModule = 'DocIDQC' Then 'DocIDQC'
	When X.tsModule = 'Manual Index' Then 'Manual Index'
	When X.tsModule = 'Manual Index QC' Then 'Manual Index QC'
	When X.tsModule = 'Verification' Then 'Verification'
END as TSModule, x.xDate, x.xHour, x.Images
FROM
(select distinct tsmodule, convert(date, t.timestamp, 101) as xDate, datepart(hh,t.timestamp) as xHour , 
			ISNULL(sum(t.userimagesprocessed), 0) as Images
			from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
			left join [mtv-va-sql-4\p1].turboscanng1.dbo.Workstation w
			on t.WSID = w.WSID
			where t.timestamp > DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
			and tsmodule in ('Enhance', 'FOCR', 'Enhance2', '4', 'ImageQC', 'AutoIndex', 'DocID', 'DocIDQC', 'Manual Index', 'Manual Index QC', 'Verification')
			group by convert(date, t.timestamp, 101), datepart(hh,t.timestamp), t.TSModule
			having sum(userimagesprocessed) > 0) X
			order by x.xDate, x.xHour


--revised
select 
                        CASE
	                        When X.tsModule = 'Enhance' Then 'Enhance'
	                        When X.tsModule = 'FOCR' Then 'FOCR'
	                        When X.tsModule = 'Enhance2' Then 'Enhance2'
	                        When X.tsModule = '4' Then 'Separation'
	                        --When X.tsModule = 'ImageQC' Then 'ImageQC'
	                        When X.tsModule = 'AutoIndex' Then 'AutoIndex'
	                        --When X.tsModule = 'DocID' Then 'DocID'
	                        --When X.tsModule = 'DocIDQC' Then 'DocIDQC'
	                        --When X.tsModule = 'Manual Index' Then 'Manual Index'
	                        --When X.tsModule = 'Manual Index QC' Then 'Manual Index QC'
	                        --When X.tsModule = 'Verification' Then 'Verification'
                        END as TSModule, x.xDate, x.xHour, x.Images
                        FROM
                        (select distinct tsmodule, convert(date, t.timestamp, 101) as xDate, datepart(hh,t.timestamp) as xHour , 
			                        ISNULL(sum(t.userimagesprocessed), 0) as Images
			                        from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit t
			                        left join [mtv-va-sql-4\p1].turboscanng1.dbo.Workstation w
			                        on t.WSID = w.WSID
			                        where t.timestamp > DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
			                        --and tsmodule in ('Enhance', 'FOCR', 'Enhance2', '4', 'ImageQC', 'AutoIndex', 'DocID', 'DocIDQC', 'Manual Index', 'Manual Index QC', 'Verification')
									and tsmodule in ('Enhance', 'FOCR', 'Enhance2', '4', 'AutoIndex')
			                        group by convert(date, t.timestamp, 101), datepart(hh,t.timestamp), t.TSModule
			                        having sum(userimagesprocessed) > 0) X
			                        order by x.xDate, x.xHour

select distinct TSModule from  [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit