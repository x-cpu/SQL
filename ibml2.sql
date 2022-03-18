select *
from batchtable


select * from sessiontable 


Select i.*,b.bardata from imgtable i left join barcodetable b on i.batchid = b.batchid and i.docid=b.docid inner join doctable d on d.batchid = i.batchid  and d.docid = i.docid where i.batchid='56' and i.Camera in(0, 1) and i.imgwnd in ('1') and d.levelnum = 0 Order by d.posinbatch, i.ImgWnd, i.Camera

select * from imgtable 
