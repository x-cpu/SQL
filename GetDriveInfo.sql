use DOCID
select distinct T.NetworkLocation, T.FreeSpace, T.TotalSize, T.FreePercentage, max(T.LastUpdateDate) LastStatusDate
FROM
(select 
case
	when box = 'ATL-VA-FSCN-1A' and drive = 'F:\' then 'ATL-VA-FS01'
	when box = 'ATL-VA-FSCN-1A' and drive = 'J:\' then 'ATL-VA-FS05'
	when box = 'ATL-VA-FSCN-1B' and drive = 'G:\' then 'ATL-VA-FS02'
	when box = 'ATL-VA-FSCN-1B' and drive = 'K:\' then 'ATL-VA-FS06'
	when box = 'ATL-VA-FSCN-1C' and drive = 'H:\' then 'ATL-VA-FS03'
	when box = 'ATL-VA-FSCN-1C' and drive = 'L:\' then 'ATL-VA-FS07'
	when box = 'ATL-VA-FSCN-1D' and drive = 'I:\' then 'ATL-VA-FS04'
	when box = 'ATL-VA-FSCN-1D' and drive = 'M:\' then 'ATL-VA-FS08'
	Else 'other'
END
as NetworkLocation, 
freespace, totalsize, freepercentage, lastupdatedate
from getDriveInfo
--where box in ('ATL-VA-FSCN-1A', 'ATL-VA-FSCN-1B', 'ATL-VA-FSCN-1C', 'ATL-VA-FSCN-1D')
group by freespace, totalsize, Box, Drive, FreePercentage, lastupdatedate)T
where T.NetworkLocation like 'ATL%'
group by T.NetworkLocation, T.FreeSpace, T.TotalSize, T.FreePercentage
order by T.NetworkLocation


select * from getDriveInfo