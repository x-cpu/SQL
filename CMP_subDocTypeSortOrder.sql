select * from docid.dbo.Docid_SubDoctype ds
left join docid.dbo.docid dd
on ds.DocType = dd.DocType
where subDoctype like '%526%'
order by totalhit desc



SELECT DISTINCT d.DocID, d.DocType, d.TotalHit, d.SamplePath1, sd.SubDocType, sd.KeyWords, sd.DocTypeSource, sd.Received_DateRule, sd.SourceLocation, sd.SysKey
                                FROM DOCID.dbo.docid_SubDocType sd 
                                LEFT JOIN DOCID.dbo.docid d
                                ON d.DocID = sd.DocID 
                                WHERE d.DocID Is Not NULL 
								and sd.subDoctype like '%526%'
								order by d.totalhit desc, d.docid, 
								sd.subdoctype  




SELECT DISTINCT d.DocID, d.DocType, d.TotalHit, d.SamplePath1, sd.SubDocType, sd.KeyWords, sd.DocTypeSource, sd.Received_DateRule, sd.SourceLocation, sd.SysKey
                                FROM DOCID.dbo.docid_SubDocType sd 
                                LEFT JOIN DOCID.dbo.docid d
                                ON d.DocID = sd.DocID 
                                WHERE d.DocID Is Not NULL 
								and sd.subDoctype like '%military%'
								order by d.totalhit desc, d.docid, 
								sd.subdoctype 
