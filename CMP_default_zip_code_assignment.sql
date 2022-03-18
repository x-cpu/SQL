select * from document where dcsid = 'HUZXKHW3E43B8T'

select * from manifestDCS where dcsid = 'HUZXKHW3E43B8T'

SELECT d.defaultZipcode
FROM PhysicalBatch pb
LEFT JOIN defaultzipcode d
ON d.pobox = pb.POBox OR d.pobox = pb.CRCDestination
WHERE pb.PBatch = '03133520600401'


select * from PhysicalBatch where CRCDestination = 'st. petersburg'


select * from PhysicalBatch where pobox = 'st. petersburg'

 select * from PhysicalBatch where pbatch = '03133520600401'


 update PhysicalBatch
 set POBox = '5236-Solicited'
 where PBatch = '03133520600401'


  update PhysicalBatch
 set CRCDestination = 'St. Petersburg'
 where PBatch = '03133520600401'


 select cmd.dcsID[Package id]
, cci.insertdate[Check in date]
, ro.ros [Regional office]
, count(1)[Document count]
, sum(cmd.numpages)[Page count] 
from cmpcheckin cci
inner join cm_document cmd
on cci.pbatch = cmd.PBatch
left outer join 
(select re.pbatch
,ro.LOCATION + ' - ' + ro.SITE_CODE ros
from cmprecon re
inner join RO_LOOKUP ro
on re.Office = ro.SOURCE_POBOX_KEY) ro
on cci.pbatch = ro.pBatch
group by cmd.dcsID, cci.insertdate, ro.ros



 PBatch	LocationName	TubName	DocType	RecvDate	BackDate	POBox	PickupTime	OperID	BoxNO	Status	InvTime	Bluerekey	FirstFile	Pretreat	EAPL	CRCDestination	LAT	CER	HIPAA	BatchClassName	cordest	Xray	TEST	SysKey	ortest	RMN	RNDAudit
03133520600401	NULL	NULL	NULL	06/05/2014	12/18/2013	5236-Solicited	NULL	NULL	NULL	NULL	2014-06-05 19:14:05.010	NULL	NULL	NULL	NULL	St. Petersburg	NULL	NULL	NULL	NULL	NULL	NULL	NULL	553294	NULL	RMN20140605191405	NULL