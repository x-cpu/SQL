select distinct t.pbatch BatchName, max(t.datemodified) BatchDateTime
from tmpfaxtifname t
where t.datemodified > '2019-09-01 0:0:0'
and not exists (select * from PhysicalBatch where t.pbatch = pbatch)
group by t.pbatch
order by  max(t.datemodified)


select * from tmpfaxtifname where pbatch = '04192720003401'


select * from PhysicalBatch where pbatch in (
'04192530021601',
'04192540022901',
'04192550009901',
'04192560006701',
'04192610501101',
'04192610010301',
'04192620007701',
'04192630013101',
'04192650006601',
'04192670020501',
'04192720003401')


select * from smsDCSMapping where batchname = '04192630500801'

