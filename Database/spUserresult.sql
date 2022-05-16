CREATE PROCEDURE [dbo].[spUserresult]
	
@email nvarchar(50)
as 
begin
     select * from result
	 join exam
	 on
	 result.exam_fid = exam.exam_id
	 where user_email= @email
end