use DOCID
select 
CASE
	When T.Box = 'ATL-VA-FSCN-1A' and T.Drive = 'J:\' then 'ATL-VA-FS05\DATA'
	When T.Box = 'ATL-VA-FSCN-1B' and T.Drive = 'K:\' then 'ATL-VA-FS06\DATA'
	When T.Box = 'ATL-VA-FSCN-1A' and T.Drive = 'L:\' then 'ATL-VA-FS07\DATA'
	When T.Box = 'ATL-VA-FSCN-1B' and T.Drive = 'M:\' then 'ATL-VA-FS08\DATA'
	END AS Location, 
	T.TotalSize, T.FreeSpace, T.FreePercentage, T.LastUpdateDate	
FROM
(select top(4) *
from getDriveInfo
where (Box = 'ATL-VA-FSCN-1B' and Drive = 'K:\' or
Box = 'ATL-VA-FSCN-1B' and Drive = 'M:\' or
Box = 'ATL-VA-FSCN-1A' and Drive = 'L:\' or
Box = 'ATL-VA-FSCN-1A' and Drive = 'J:\')) T
order by Location