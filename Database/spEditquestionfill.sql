CREATE PROCEDURE [dbo].[spEditquestionfill]
	@questionid int
	  as 
	  
	  begin
	     select * from question
		 left join exam on
		 question.exam_fid =exam.exam_id
		 where question_id= @questionid
end