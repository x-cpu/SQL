select * from dcslookup where exists (
select * from tmp_felreturn where dcslookup.dcsid = tmp_felreturn.dcsid) and RMNCompleted is null and comments is null



select * from tmp_felreturn where exists (
select * from dcslookup where tmp_felreturn.dcsid = dcslookup.dcsid and RMNCompleted is null and comments is null)