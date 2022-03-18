
--DOCID batches not worked
						select BatchName, BatchDesc
                        FROM Batches b
                        WHERE WFStep = 8 and AppStep = 1 and BatchStatus = 1
						and not exists (select * from ts_audit where b.batchname = BatchName and tsmodule = 'DocID')
                        Group by BatchName, BatchDesc


						select
                        case 
                        WHEN WFStep = 1 then 'Capture'
                        WHEN WFStep = 2 then 'Enhance'
                        WHEN WFStep = 3 then 'FullPageOCR'
                        WHEN WFStep = 4 then 'Enhance2'
                        WHEN WFStep = 7 then 'AutoIndex'
                        WHEN WFStep = 8 then 'DocID'
                        WHEN WFStep = 9 then 'DocIDQC'
                        WHEN WFStep = 10 then 'Manual Index'
                        --WHEN WFStep = 10 then 'Manual IndexQC'
                        WHEN WFStep = 12 then 'Verification'
                        WHEN WFStep = 13 and batchlocation <> 0 then 'Export' 
                        --WHEN WFStep = 13 and batchlocation = 0 then 'Clean'
                        END
                        AS BatchLocation, BatchDesc
                        FROM Batches 
                        WHERE WFStep = 8
						and not exists (select * from ts_audit where batches.batchname = BatchName and tsmodule = 'DocID')
                        Group by WFStep, Batchlocation, BatchDesc
                        Order by WFStep, BatchLocation



						select BatchName, BatchDesc
                        FROM Batches b
                        WHERE WFStep = 8 and AppStep = 1 and BatchStatus = 1
						and not exists (select * from ts_audit where b.batchname = BatchName and tsmodule = 'DocID')
                        Group by BatchName, BatchDesc



                        Order by WFStep, BatchLocation

						select * from batches where batchname = '02170481601403'

						select * from TS_Audit where BatchName in (
						'02170111402101',
'02170111402102',
'02170111402910',
'02170111403507',
'02170111405201',
'02170111407801')