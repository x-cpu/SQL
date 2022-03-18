select * from cmpxmldownload where insertdate > '2015-06-02' 
--and xmlfilename = '04150910000101-14db3d891f7'
order by insertdate desc

select * from cmprecon where insertdate > '2015-06-02' 
and DocumentStatus <> 'upload'
order by insertdate desc