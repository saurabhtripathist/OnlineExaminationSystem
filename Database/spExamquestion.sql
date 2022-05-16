CREATE PROCEDURE [dbo].[spExamquestion]
	@examfid int
as
begin
     select * from question
	 left join exam on
	 question.exam_fid =exam.exam_id
	where exam_fid=@examfid
	end