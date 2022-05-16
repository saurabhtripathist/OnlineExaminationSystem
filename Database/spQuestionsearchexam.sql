CREATE PROCEDURE [dbo].[spQuestionsearchexam]
	@examid int
as
begin
     select * from question
	 join exam
	 on
	 exam.exam_id = question.exam_fid
	 where exam_fid = @examid
	 
end