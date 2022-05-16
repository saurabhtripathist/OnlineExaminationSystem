CREATE TABLE [dbo].[result]
(
result_id int identity primary key,
result_status nvarchar(50),
result_score int,
user_email nvarchar(50),
totalquestion int,
exam_fid int,
)
