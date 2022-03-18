use DOCID
                        select distinct T.NetworkLocation, T.FreeSpace, T.TotalSize, T.FreePercentage, max(T.LastUpdateDate) LastStatusDate
                        FROM
                        (select 
                        case
	                        when box = 'ATL-VA-IBML01' and drive = 'C:\' then 'ATL-VA-IBML01'
	                        when box = 'ATL-VA-IBML02' and drive = 'C:\' then 'ATL-VA-IBML02'
	                        when box = 'ATL-VA-IBML03' and drive = 'C:\' then 'ATL-VA-IBML03'
	                        when box = 'ATL-VA-IBML04' and drive = 'C:\' then 'ATL-VA-IBML04'
	                        when box = 'ATL-VA-IBML05' and drive = 'C:\' then 'ATL-VA-IBML05'
	                        when box = 'ATL-VA-IBML06' and drive = 'C:\' then 'ATL-VA-IBML06'
	                        when box = 'ATL-VA-IBML07' and drive = 'C:\' then 'ATL-VA-IBML07'
	                        when box = 'ATL-VA-IBML08' and drive = 'C:\' then 'ATL-VA-IBML08'
	                        when box = 'ATL-VA-IBML09' and drive = 'C:\' then 'ATL-VA-IBML09'
	                        Else 'other'
                        END
                        as NetworkLocation, 
                        freespace, totalsize, freepercentage, lastupdatedate
                        from getDriveInfo
                        group by freespace, totalsize, Box, Drive, FreePercentage, lastupdatedate)T
                        where T.NetworkLocation like 'ATL%'
                        group by T.NetworkLocation, T.FreeSpace, T.TotalSize, T.FreePercentage
                        order by T.NetworkLocation