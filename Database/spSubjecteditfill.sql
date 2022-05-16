CREATE PROCEDURE [dbo].[spSubjecteditfill]
	
@id int
as
begin
     select * from subject
	 left join category
	 on
	 subject.category_fid=category.category_id where subject_id=@id
	 
end