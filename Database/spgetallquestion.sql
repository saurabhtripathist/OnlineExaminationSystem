CREATE PROCEDURE [dbo].[spgetallquestion]
as

begin 
      select * from question
	  left join exam on
	  question.exam_fid = exam.exam_id
	  
end