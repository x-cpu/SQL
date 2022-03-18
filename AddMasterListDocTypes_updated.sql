--basic insert
insert into docid
(docid, doctype)
select docid, doctype from docid_master where docid = 671


select * from docid_master where not exists (
select * from docid where docid = docid_master.docid)


select * from docid_master where not exists (
select * from docid where doctype = docid_master.DocType)


--select * into docid_temp from docid


select * from docid_temp


--step 1
insert into docid
(docid, doctype)
select docid, doctype from docid_master where not exists (
select * from docid where docid = docid_master.docid)


--check for step 2
select * from docid_master where not exists (
select * from docid where doctype = docid_master.DocType)
order by DocType

--step 2
update docid set doctype = 'Accounting Request Letter - 30 day'where docid = '545'
update docid set doctype = 'Award Print'where docid = '508'
update docid set doctype = 'Bank/Financial Statement'where docid = '452'
update docid set doctype = 'CRCP Excel Calculation'where docid = '484'
update docid set doctype = 'Fiduciary Misuse - Negligence Determination'where docid = '443'
update docid set doctype = 'Field Examination - Fid-Ben'where docid = '551'
update docid set doctype = 'Field Examination - IA/SIA'where docid = '550'
update docid set doctype = 'MAP-D Development Letter'where docid = '700'
update docid set doctype = 'Misuse - Referral to Office of Inspector General'where docid = '444'
update docid set doctype = 'Rating Calculator Worksheets'where docid = '565'
update docid set doctype = 'VA 21-0781, Statement in Support of Claim for PTSD'where docid = '381'
update docid set doctype = 'VA 21-0781a, Statement in Support of Claim for PTSD Secondary to Personal Assault'where docid = '382'
update docid set doctype = 'VA 21-0960B-1 Hairy Cell and other B-Cell Leukemias Disability Benefits Questionnaire'where docid = '567'
update docid set doctype = 'VA 21-0960C-1 Parkinsons Disease Disability Benefits Questionnaire'where docid = '568'
update docid set doctype = 'VA 21-2680 Examination for Housebound Status or Permanent Need for Regular Aid and Attendance'where docid = '111'
update docid set doctype = 'VA 21-4706c Court Appointed Fiduciarys Accounting'where docid = '431'
update docid set doctype = 'VA 27-0820a Report of First Notice of Death'where docid = '496'
update docid set doctype = 'VA 27-0820b Report of Nursing Home or Assisted Living Information'where docid = '497'
update docid set doctype = 'VA 27-0820c Report of Defense Finance & Accounting Service (DFAS)'where docid = '498'
update docid set doctype = 'VA 27-0820d Report of Non-Receipt of Payment'where docid = '499'
update docid set doctype = 'VA 27-0820e Report of Incarceration'where docid = '500'
update docid set doctype = 'VA 27-0820f Report of Month of Death'where docid = '501'
update docid set doctype = 'VA 551 Application for Accrued Benefits by Veterans Spouse, Child or Dependent Parent'where docid = '172'
