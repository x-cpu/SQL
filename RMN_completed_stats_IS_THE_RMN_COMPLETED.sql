select distinct T.RMN, T.BatchName,
CASE
	When T.StatsBatch is not null Then 'Exported'
	Else 'Not Exported'
	END ExportStatus,
CASE
	When T.NumExported > 1 and T.NumExported = T.NumUploaded Then 'Upload Completed'
	Else 'Upload Pending'
	END UploadStatus
FROM
(select distinct p.rmn RMN, p.pbatch BatchName, s.kbatch StatsBatch, d.PBatch DocumentBatch, count(distinct d.imageid) NumExported, count(distinct (convert(nvarchar, d.ftpstime,101) + d.ImageID)) NumUploaded
from PhysicalBatch p 
left join stats s
on p.pbatch = s.kbatch
left join document d
on p.pbatch = d.pbatch 
where p.RMN in (
'HC1-95772336',
'HC1-100107836',
'HC1-95783588',
'HC1-95773708',
'HC1-95786695',
'HC1-95786230',
'HC1-95771588',
'HC1-95774957',
'HC1-95767899',
'HC1-95775936',
'HC1-95768205',
'HC1-95796544',
'HC1-95783825',
'HC1-100111421',
'HC1-95766692',
'HC1-95794530',
'HC1-95726171',
'HC1-95792516',
'HC1-95777565',
'HC1-95681268',
'HC1-95762306',
'HC1-66872204',
'HC1-95787709',
'HC1-95791183',
'HC1-66868184',
'HC1-95767031',
'HC1-100107854',
'HC1-155036099',
'HC1-95762132',
'HC1-95781910',
'HC1-155036111',
'HC1-233341685',
'HC1-155036117',
'HC1-155036102',
'HC1-236578291',
'HC1-95774161',
'HC1-236578297',
'HC1-100110464',
'HC1-155036096',
'HC1-236578288',
'HC1-95788376',
'HC1-236578300',
'HC1-155036114',
'HC1-155036108',
'HC1-236578294',
'HC1-95793248',
'HC1-155036105',
'HC1-155036093',
'HC1-95777409',
'HC1-95788382',
'HC1-233342615',
'HC1-237143580',
'HC1-95788388',
'HC1-95795031',
'HC1-66868988',
'HC1-95785254',
'HC1-95788364',
'HC1-95782492')
group by p.rmn, p.pbatch, s.kbatch, d.PBatch) T
order by T.RMN, T.BatchName