execute VA_QAErrorReportSummary_Types_Reviewed @fromdate = '2013-01-01 0:0:0' , @todate = '2013-04-28 23:59:59', @526Only = 0

select distinct username from  tserrortracking where errordatetime > '1/1/2013 0:0:1' and errordatetime  < '4/28/2013 23:59:59' 


select * from tserrortracking where username not in (
'Dbarnett2',
'Mspears',
'Dbond',
'Lmiller2',
'Cwilloughby',
'pparker')



select * from TSErrorTracking where TSModule is null and errordatetime > '1/1/2013 0:0:1' and errordatetime  < '4/28/2013 23:59:59'  and username in (
'hparman',
'rhammond',
'LHundley',
'pwilson',
'jhickey',
'Aarthur',
'gwhitaker',
'HLewis',
'SNapier',
'TMinton',
'Jtincher',
'SHundley',
'SNapier2',
'SOwens3',
'MSpears',
'DBond',
'LMiller2',
'CWiloughby',
'pparker')



delete from TSErrorTracking where TSModule <> 'Manual Index' and username in (
'hparman',
'rhammond',
'LHundley',
'pwilson',
'jhickey',
'Aarthur',
'gwhitaker',
'HLewis',
'SNapier',
'TMinton',
'Jtincher',
'SHundley',
'SNapier2',
'SOwens3',
'MSpears',
'DBond',
'LMiller2',
'CWiloughby',
'pparker')



delete from TSErrorTracking where TSModule is null and errordatetime > '1/1/2013 0:0:1' and errordatetime  < '4/28/2013 23:59:59'  and username in (
'hparman',
'rhammond',
'LHundley',
'pwilson',
'jhickey',
'Aarthur',
'gwhitaker',
'HLewis',
'SNapier',
'TMinton',
'Jtincher',
'SHundley',
'SNapier2',
'SOwens3',
'MSpears',
'DBond',
'LMiller2',
'CWiloughby',
'pparker')
