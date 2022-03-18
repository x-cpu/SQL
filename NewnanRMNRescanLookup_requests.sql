select LTRIM(RTRIM(c.RMN)) RMN, LTRIM(RTRIM(c.operID)) VACheckInUser, u.emailaddress, LTRIM(RTRIM(c.trackingno)) TrackingNo, LTRIM(RTRIM(c.insertdate)) VACheckInDate, c.claimtype ClaimType, p.pobox Location from customerCheckIn c
left join users u
on c.operID = u.operID
left join pobox p
on c.location = p.SysKey
where rmn in (
'320vb1229147996b')


