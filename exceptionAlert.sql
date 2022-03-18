select trackingno as VATracking#, RMN, dcsID, insertdate as ErrorDate, errortype as ExceptionError, SHOVactiondate, SHOVoperID
from exceptions
where DATEDIFF(HOUR, insertdate, GETDATE()) > 48
and SHOVactiondate is null



