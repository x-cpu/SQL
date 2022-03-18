select name, count(*) from vvftpdetails
group by name
having count(*) > 1