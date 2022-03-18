select  sum(totalimages), convert(nvarchar, timestamp, 101) from TS_Audit where TSModule = 'PREP' and UserID = '998' group by convert(nvarchar, timestamp, 101) order by convert(nvarchar, timestamp, 101) desc

use TurboscanNG1
select * from users order by username where username = 'csingleton'