select customerCheckIn.trackingno, customerCheckIn.RMN, document.dcsid, max(document.ftpstime) as UploadDate
from customerCheckIn
inner join document on customerCheckIn.rmn = document.RMN
--inner join pobox on customerCheckIn.location = pobox.SysKey
where claimtype = 'p' and customercheckin.RMN  in
(select rmn from Document)
group by customerCheckIn.trackingno, customerCheckIn.RMN, document.dcsID




select *
from customerCheckIn
where claimtype = 'p' and rmn in
(select rmn from Document)



select *
from customerCheckIn
where claimtype = 'p'


---uploaded REPORT
select customerCheckIn.trackingno, customerCheckIn.insertdate as VAShipDate, pobox.pobox as Location, customerCheckIn.RMN, document.dcsid, sum(document.NumPages) as NumberOfPages, max(document.ftpstime) as UploadDate, manifestDCS.insertdate as CheckInDate
from customerCheckIn
inner join document on customerCheckIn.rmn = document.RMN
inner join pobox on customerCheckIn.location = pobox.SysKey
inner join manifestDCS on document.dcsID = manifestDCS.dcsID
where claimtype = 'p' and document.ftpstime is not null and customercheckin.RMN in
(select rmn from Document)
group by customerCheckIn.trackingno, customerCheckIn.insertdate, customerCheckIn.RMN, document.dcsID, pobox.pobox, manifestDCS.insertdate
order by customerCheckIn.insertdate DESC


---not uploaded - NOPE
select customerCheckIn.trackingno, pobox.pobox as Location, customerCheckIn.RMN, document.dcsid, max(document.ftpstime) as UploadDate, manifestDCS.insertdate as CheckInDate
from customerCheckIn
inner join document on customerCheckIn.rmn = document.RMN
inner join pobox on customerCheckIn.location = pobox.SysKey
inner join manifestDCS on document.dcsID = manifestDCS.dcsID
where claimtype = 'p' and customercheckin.RMN not in
(select rmn from Document)
group by customerCheckIn.trackingno, customerCheckIn.RMN, document.dcsID, pobox.pobox, manifestDCS.insertdate

---not uploaded - MAYBE
SELECT manifestDCS.RMN, manifestDCS.dcsID, 
		MAX(convert(varchar, manifestDCS.insertdate, 100)) as CheckInDate, 
		MAX(BatchLocation) As BatchLocation
		--INTO #Temp
		FROM TurboscanNG1.dbo.Batches 
		inner join dva.dbo.manifestDCS on substring(TurboscanNG1.dbo.batches.BatchName, 1,12) = manifestDCS.pbatch 
		inner join customerCheckIn on manifestDCS.RMN = customerCheckIn.RMN
		--inner join Document on manifestDCS.RMN = Document.RMN
		WHERE BatchLocation >= 2 AND BatchLocation <= 256
		and customerCheckIn.claimtype = 'p' 
		--and manifestDCS.RMN not in (Document.rmn)
		group by manifestDCS.RMN, manifestDCS.dcsID
		


not uploaded

---not uploaded REPORT
select customerCheckIn.trackingno, customerCheckin.insertdate as VAShipDate, pobox.pobox as Location, customerCheckIn.RMN, manifestDCS.dcsid, manifestDCS.insertdate as CheckInDate
from manifestDCS
inner join customerCheckIn on manifestDCS.RMN = customerCheckIn.RMN
--inner join document on customerCheckIn.rmn = document.RMN
inner join pobox on customerCheckIn.location = pobox.SysKey
--inner join manifestDCS on document.dcsID = manifestDCS.dcsID
where claimtype = 'p' and customercheckin.RMN not in
(select rmn from Document)
group by customerCheckIn.trackingno, customerCheckin.insertdate, customerCheckIn.RMN, manifestDCS.dcsid, pobox.pobox, manifestDCS.insertdate
order by customerCheckin.insertdate


--pending into portal but not checkin
select customerCheckIn.trackingno, rtrim(customerCheckIn.RMN) as RMN, customerCheckin.insertdate as VAPortalEntryDate, pobox.pobox as Location
from customerCheckIn
inner join pobox on customerCheckIn.location = pobox.SysKey
where claimtype = 'p' and RMN not in (select RMN from manifestDCS)
order by customerCheckIn.insertdate

---not uploaded REPORT including batchname
select customerCheckIn.trackingno, pobox.pobox as Location, customerCheckIn.RMN, manifestDCS.dcsid, manifestDCS.insertdate as CheckInDate, manifestDCS.pbatch
from manifestDCS
inner join customerCheckIn on manifestDCS.RMN = customerCheckIn.RMN
--inner join document on customerCheckIn.rmn = document.RMN
inner join pobox on customerCheckIn.location = pobox.SysKey
--inner join manifestDCS on document.dcsID = manifestDCS.dcsID
where claimtype = 'p' and customercheckin.RMN not in
(select rmn from Document)
group by customerCheckIn.trackingno, customerCheckIn.RMN, manifestDCS.dcsid, pobox.pobox, manifestDCS.insertdate, manifestDCS.pbatch


---not uploaded REPORT including distinct batchname
select distinct manifestdcs.pbatch 
from manifestDCS
inner join customerCheckIn on manifestDCS.RMN = customerCheckIn.RMN
--inner join document on customerCheckIn.rmn = document.RMN
inner join pobox on customerCheckIn.location = pobox.SysKey
--inner join manifestDCS on document.dcsID = manifestDCS.dcsID
where claimtype = 'p' and customercheckin.RMN not in
(select rmn from Document)
group by customerCheckIn.trackingno, customerCheckIn.RMN, manifestDCS.dcsid, pobox.pobox, manifestDCS.insertdate, manifestDCS.pbatch


select *
from Document
where dcsid = 'H9BHJ1FE5TV6H'

select distinct RMN
from customerCheckIn
where claimtype = 'p'  


select *
from manifestDCS
where RMN = '376VB1213120224A'   

select *
from document
where PBatch ='02123050003002'            

select *
from PhysicalBatch
where PBatch = '02123050003002'          

select *
from manifestDCS
where dcsid = 'H8Q4448SEQ2IYY'

select rmn, dcsID, insertdate
from manifestDCS
group by dcsID, RMN, insertdate
having (count (dcsid) > 1)
order by dcsID



select sum(numpages)
from document
where rmn = '308VB1026120001C'

---not uploaded - JUSTIN
select customerCheckIn.trackingno, pobox.pobox as Location, customerCheckIn.RMN,  customerCheckIn.insertdate as VAShipDate
from customerCheckIn
--inner join manifestDCS on customerCheckIn.RMN = manifestDCS.RMN
inner join pobox on customerCheckIn.location = pobox.SysKey
--inner join document on customerCheckIn.rmn = document.RMN
where claimtype = 'p'
--- and customercheckin.RMN not in
---(select rmn from manifestdcs)
--group by customerCheckIn.trackingno, customerCheckIn.RMN, pobox.pobox, customerCheckIn.insertdate
order by VAShipDate DESC
                                                                                                            
											
											
select * 
from document
where imageid like 'CACI_12305%8808'
																											
																											
select *
from customerCheckIn
where claimtype = 'p'
order by customerCheckIn.insertdate DESC																											
																																																	
                                                
												
											
select *
from manifestDCS 
where dcsID = 'H8Q4448SEQ2IYY'                                



select *
from document 
where RMN = '316VB1204121491D'   


select *
from CustomerDATA
where rmn = '316VB1204121491D'          



