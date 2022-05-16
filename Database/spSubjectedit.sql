CREATE PROCEDURE [dbo].[spSubjectedit]
	
@subject_name nvarchar(50),
@category_id int,
@subject_id int
as
begin
     update subject set subject_name= @subject_name, category_fid=@category_id where subject_id=@subject_id 
	 
	 
end
