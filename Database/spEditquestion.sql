CREATE PROCEDURE [dbo].[spEditquestion]
	@questionid int,
	@questionname nvarchar(MAX),
	@optionone nvarchar(MAX),
	@optiontwo nvarchar(MAX),
	@optionthree nvarchar(MAX),
	@optionfour nvarchar(MAX),
	@questionanswer int,
	@examfid int
	as
	begin
	  update question set question_name=@questionname, option_one=@optionone,option_two=@optiontwo, option_three=@optionthree, option_four=@optionfour,question_answer=@questionanswer, exam_fid=@examfid 
	  where question_id=@questionid
	  
	  end