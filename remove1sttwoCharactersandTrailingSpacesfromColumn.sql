select * from docid_subdoctype where subdoctype = 'Accident Report'


--00012 to 012
update docid_subdoctype
set docid = stuff(docid, 1,2, '')
where subdoctype <> 'Accident Report'

--trim trailing spaces example
update docid_subdoctype
set subDoctype = ltrim(subDoctype)



subDoctype
DocType
Keywords
DocTypeSource
docid
received_dateRule
sourceLocation