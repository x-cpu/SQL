select '\\atl-va-fs08\data\ExportOCR\' + PBatch + '\' + ImageID + '|\\atl-va-fs07\data\Export\' + PBatch + '\' + PBatch + '.txt|' + FileNumber + '|' + imageid + '|' + dcsID from document where RMN = 'rmndd214' and ftpstime is null and Comments = 'FileNumber is invalid!'




select distinct dcsID from document where RMN = 'rmndd214' and ftpstime is null and Comments = 'FileNumber is invalid!'
