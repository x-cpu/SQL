select s.batchname OrigBatchName, s.dcsid, s.xmlModified SplitRequest_ReceiveDate, c.insertdate SplitRequest_CreatedinTSDate, c.newpbatch NewBatchName
from smsDCSMapping s
left join cmpRescanMapping c
on s.dcsid = c.dcsid
where status like '%split%' and s.insertdate > '2017-07-01'
order by c.insertdate desc