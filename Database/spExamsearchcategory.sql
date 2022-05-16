CREATE PROCEDURE [dbo].[spExamsearchcategory]
	@subjectid int
as
begin
     select * from subject
	 join exam
	 on
	 subject.subject_id = exam.subject_fid
	 where subject_id = @subjectid
end