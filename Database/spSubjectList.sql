CREATE PROCEDURE [dbo].[spSubjectList]
	
as
begin
select * from subject
left join category
on
subject.category_fid=category.category_id

end