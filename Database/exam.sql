CREATE TABLE [dbo].[exam]
(
exam_id int identity primary key,
exam_name nvarchar(500),
exam_description nvarchar(4000),
exam_date date,
exam_duration int,
exam_marks int,
exam_negativemarks int,
exam_totalquestion int,
category_fid  int,
subject_fid int,
exampass_marks int,
)
