CREATE TABLE [dbo].[question]
(
question_id int identity primary key,
question_name nvarchar(4000),
option_one nvarchar(4000),
option_two nvarchar(4000),
option_three nvarchar(4000),
option_four nvarchar(4000),
question_answer int,
exam_fid int,
)
