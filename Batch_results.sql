10



select batchname BatchName, username, 
                        case
                        WHEN TSModule = '4' then 'Separation'
                        WHEN TSModule = 'AutoIndex' then 'AutoIndex'
                        WHEN TSModule = 'DocID' then 'DocID'
                        WHEN TSModule = 'DocID QC' then 'DocID QC'
                        WHEN TSModule = 'Enhance' then 'Enhance'
                        WHEN TSModule = 'ImageQC' then 'ImageQC'
                        WHEN TSModule = 'Manual Index' then 'Manual Index'
                        WHEN TSModule = 'Manual Index QC' then 'Manual Index QC'
                        WHEN TSModule = 'PREP' then 'Prep'
                        WHEN TSModule = 'Verification' then 'Verification'
                        END
                        AS TSModule,
                        totalimages TotalIMG, ImagesProcessed ProcIMG, ImagesRejected RejIMG, UserImagesProcessed UserProcIMG, 
                        RIGHT('0' + CAST(UserProcTime/3600 as varchar),2) + ':' + 
                        RIGHT('0' + CAST((UserProcTime/60) % 60 as varchar),2) + ':' +
                        RIGHT('0' + CAST(UserProcTime % 60 as varchar),2) as UserProcTime, 
                        TimeStamp
                        from TS_Audit where batchname in ('01190041401512', '02183651603303')
						and username <> '998' 
						and TSModule = 'ImageQC'
						--and UserName in ('twoods', 'pwilson') and UserImagesProcessed > 0
						order by timestamp


select batchname BatchName, username, 
                        case
                        WHEN TSModule = '4' then 'Separation'
                        WHEN TSModule = 'AutoIndex' then 'AutoIndex'
                        WHEN TSModule = 'DocID' then 'DocID'
                        WHEN TSModule = 'DocID QC' then 'DocID QC'
                        WHEN TSModule = 'Enhance' then 'Enhance'
                        WHEN TSModule = 'ImageQC' then 'ImageQC'
                        WHEN TSModule = 'Manual Index' then 'Manual Index'
                        WHEN TSModule = 'Manual Index QC' then 'Manual Index QC'
                        WHEN TSModule = 'PREP' then 'Prep'
                        WHEN TSModule = 'Verification' then 'Verification'
                        END
                        AS TSModule,
                        totalimages TotalIMG, ImagesProcessed ProcIMG, ImagesRejected RejIMG, UserImagesProcessed UserProcIMG, 
                        RIGHT('0' + CAST(UserProcTime/3600 as varchar),2) + ':' + 
                        RIGHT('0' + CAST((UserProcTime/60) % 60 as varchar),2) + ':' +
                        RIGHT('0' + CAST(UserProcTime % 60 as varchar),2) as UserProcTime, 
                        TimeStamp
                        from TS_Audit where batchname in ('01190041401512', '02183651603303')
						and username <> '998' 
						--and TSModule = 'ImageQC'
						--and UserName in ('twoods', 'pwilson') and UserImagesProcessed > 0
						order by timestamp


--1034


