select  customerCheckIn.trackingno as "Tracking Number", customerCheckIn.RMN, manifestDCS.pbatch as "Batch Name", manifestdcs.dcsID as "DCS ID", convert(varchar, manifestDCS.insertdate, 100) as "Receive Date"
from customerCheckIn
inner join manifestdcs
on customerCheckin.RMN = manifestdcs.RMN
order by manifestdcs.pbatch, customerCheckIn.trackingno, customerCheckIn.RMN, manifestDCS.dcsID, manifestDCS.insertdate

