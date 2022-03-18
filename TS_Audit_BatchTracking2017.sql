select username, 
                        case
                        WHEN TSModule = '4' then 'Separation'
                        WHEN TSModule = 'AutoIndex' then 'AutoIndex'
                        WHEN TSModule = 'DocID' then 'DocID'
                        WHEN TSModule = 'DocID QC' then 'DocID QC'
                        WHEN TSModule = 'Enhance' then 'Enhance'
                        WHEN TSModule = 'Enhance2' then 'Enhance2'
                        WHEN TSModule = 'FOCR' then 'FullPageOCR'
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
                        TimeStamp, batchname BatchName
                        from [mtv-va-sql-4\p1].turboscanng1.dbo.TS_Audit where batchname = '02170821013406' and username <> '998' order by timestamp


						select top(100) pbatch BatchName, DeletedBy, DeletedDate, DeletedRequestedBy from PhysicalBatch_bck order by deleteddate desc


						select * from PhysicalBatch where pbatch in (
						'02170461106406',
'02170461106405',
'02170461106404',
'02170461106403',
'02170461106402',
'02170461106401')