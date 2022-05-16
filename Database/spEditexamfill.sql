CREATE PROCEDURE [dbo].[spEditexamfill]
	@examid int
	 as
	 begin
	     select * from exam where exam_id =@examid
		 
	end