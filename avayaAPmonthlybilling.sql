select docstatus as "DocStatus", doccategory as "DocCategory",
sum(case when dcn like 'I%' 
or dcn like 'E%' 
or dcn like 'X%' 
or dcn like 'F%' then 1 else 0 end) as "Total # OTHER"
from avayabill
where (doccategory = 'R1' or doccategory = 'P1' or doccategory = 'RP1')
and (docstatus  = 'POSTED' or docstatus  = 'INVALID')
and (DCN like 'I%' or DCN like 'E%' or DCN like 'X%' or DCN like 'F%')
and (UpdateDate BETWEEN '07-01-2013 00:00:00' AND '07-31-2013 00:00:00')
and (scanDate >= '10-31-2011 00:00:00')
group by docstatus, doccategory
order by doccategory, docstatus

select docstatus as "DocStatus", doccategory as "DocCategory",
sum(case when dcn like 'I%' 
or dcn like 'E%' 
or dcn like 'X%' 
or dcn like 'F%' then 1 else 0 end) as "Total # OTHER"
from avayabill
where (doccategory = 'CREDIT' or doccategory = 'FOREIGN CURR' or doccategory = 'INTERENTITY'
or doccategory = 'OTHER' or doccategory = 'PRIORITY' or doccategory = 'RESTRICTED' 
or doccategory = 'STANDARD' or doccategory = 'VPF')
and (docstatus  = 'POSTED' or docstatus  = 'INVALID')
and (DCN like 'I%' or DCN like 'E%' or DCN like 'X%' or DCN like 'F%')
and (UpdateDate BETWEEN '07-01-2013 00:00:00' AND '07-31-2013 00:00:00')
and (scanDate >= '10-31-2011 00:00:00')
group by docstatus, doccategory
order by doccategory, docstatus

select docstatus as "DocStatus", doccategory as "DocCategory",
sum(case when dcn like 'A%' 
or dcn like 'B%' 
or dcn like 'H%' then 1 else 0 end) as "Total # PAPER"
from avayabill
where (doccategory = 'R1' or doccategory = 'P1' or doccategory = 'RP1')
and (docstatus  = 'POSTED' or docstatus  = 'INVALID')
and (DCN like 'A%' or DCN like 'B%' or DCN like 'H%')
and (UpdateDate BETWEEN '07-01-2013 00:00:00' AND '07-31-2013 00:00:00')
and (scanDate >= '10-31-2011 00:00:00')
group by docstatus, doccategory
order by doccategory, docstatus

select docstatus as "DocStatus", doccategory as "DocCategory",
sum(case when dcn like 'A%' 
or dcn like 'B%' 
or dcn like 'H%' then 1 else 0 end) as "Total # PAPER"
from avayabill
where (doccategory = 'CREDIT' or doccategory = 'FOREIGN CURR' or doccategory = 'INTERENTITY'
or doccategory = 'OTHER' or doccategory = 'PRIORITY' or doccategory = 'RESTRICTED' 
or doccategory = 'STANDARD' or doccategory = 'VPF')
and (docstatus  = 'POSTED' or docstatus  = 'INVALID')
and (DCN like 'A%' or DCN like 'B%' or DCN like 'H%')
and (UpdateDate BETWEEN '07-01-2013 00:00:00' AND '07-31-2013 00:00:00')
and (scanDate >= '10-31-2011 00:00:00')
group by docstatus, doccategory
order by docstatus, doccategory

select docstatus as "DocStatus", doccategory as "DocCategory",
sum(case when dcn like 'A%' 
or dcn like 'B%' 
or dcn like 'H%'then 1 else 0 end) as "Total # PAPER",
sum(case when dcn like 'I%' 
or dcn like 'E%' 
or dcn like 'X%' 
or dcn like 'F%' then 1 else 0 end) as "Total # OTHER"
from avayabill
where (docstatus  = 'OPEN' or docstatus  = 'OVER 50K' or docstatus  = 'REJECTED' or docstatus  = 'WIP')
and (UpdateDate BETWEEN '07-01-2013 00:00:00' AND '07-31-2013 00:00:00')
and (scanDate >= '10-31-2011 00:00:00')
group by docstatus, doccategory
order by doccategory, docstatus

select docstatus as "DocStatus", doccategory as "DocCategory",
sum(case when dcn like 'M%'
then 1 else 0 end) as "Total # PAPER"
from avayabill
where DCN like 'M%'
and scandate  BETWEEN '07-01-2013 00:00:00' AND '07-31-2013 00:00:00'
group by docstatus, doccategory
order by doccategory, docstatus

