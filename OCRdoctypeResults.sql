select count(*), origdoctype,newdoctype from ts_qaformlog where newdoctype = 'Rating Decision (e.g. VA Form 21-6789)' 
group by origdoctype,newdoctype

