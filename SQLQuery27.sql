USE [DVA]
GO
/****** Object:  StoredProcedure [dbo].[DVA_WEB_SELECT_FREQDOCUMENT]    Script Date: 10/25/2012 10:58:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DVA_WEB_SELECT_FREQDOCUMENT]
@DateIN as VArchar(50),
@DateOut  as Varchar(50)
AS
BEGIN 
	SET NOCOUNT ON; 
 	select dcsid, dociddoctype ,max(ftpstime) , count(*) as Cnt from document
	where comments ='success' and ftpstime between @DateIN and @DateOut
	group by dcsid,dociddoctype, ftpstime
	order by dcsid, cnt desc
    
END 
