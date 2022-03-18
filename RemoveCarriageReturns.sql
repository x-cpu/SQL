select * from customerCheckIn where rmn like '350VB1210149968B%'

select * from customerCheckIn where rmn = '350VB1210149968B'

 select * from customercheckin where rmn like '%'+char(13)+'%' 

select replace(RMN,CHAR(13), ''), CHAR(10), '' from customercheckin where rmn = '350VB1210140038B'


UPDATE customercheckin
SET RMN = RTRIM(LTRIM(REPLACE(REPLACE(RMN, CHAR(10), ''), CHAR(13), '')))
where operID = 'dewayne'


UPDATE customercheckin
SET trackingno = RTRIM(LTRIM(REPLACE(REPLACE(trackingno, CHAR(10), ''), CHAR(13), '')))
where operID = 'dewayne'
                                
								
update Docid_SubDoctype_bck20150728
SET sourceLocation = RTRIM(LTRIM(REPLACE(REPLACE(sourceLocation, CHAR(10), ''), CHAR(13), '')))
                                                                                                                
                                                                                                                
                                                                                                                
update Docid_SubDoctype
SET sourceLocation = RTRIM(LTRIM(REPLACE(REPLACE(sourceLocation, CHAR(10), ''), CHAR(13), '')))
														
update Docid_SubDoctype
SET received_dateRule = RTRIM(LTRIM(REPLACE(REPLACE(received_dateRule, CHAR(10), ''), CHAR(13), '')))