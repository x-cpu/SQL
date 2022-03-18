select * from stats_ibml where releasedate >= '2017-04-18' and releasedate <= '2017-04-18 23:59:59.999'

--1173622 export
--1833479 scan
--1386211 docid


15.5% patch sheets
36% everything
20.5% blank pages


select sum(images) from stats_ibml where kbatch in (
select kbatch from stats where releasedate >= '2017-04-18' and releasedate <= '2017-04-18 23:59:59.999')



select sum(userimagesprocessed) from [mtv-va-sql-4\p1].turboscanng1.dbo.ts_audit where tsmodule = 'docid' and batchname in (
select kbatch from stats where releasedate >= '2017-04-18' and releasedate <= '2017-04-18 23:59:59.999')