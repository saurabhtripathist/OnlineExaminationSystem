CREATE PROCEDURE [dbo].[spAddquestion]
	
@questionname nvarchar(MAX),
@optionone nvarchar(MAX),
@optiontwo nvarchar(MAX),
@optionthree nvarchar(MAX),
@optionfour nvarchar(MAX),
@questionanswer int,
@examfid int
as
begin
        insert into question( question_name,option_one,option_two,option_three,option_four,question_answer,exam_fid) 
		 values (@questionname,@optionone,@optiontwo,@optionthree,@optionfour,@questionanswer,@examfid)
end