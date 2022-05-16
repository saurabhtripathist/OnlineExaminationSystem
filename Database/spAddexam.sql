CREATE PROCEDURE [dbo].[spAddexam]
	
@examname nvarchar(500),
@examdis nvarchar(MAX),
@examdate date,
@examduration int,
@exampassmarks int,
@exammarks int,
@examsubjectfid int,
@examcategoryfid int
as
begin
      insert into exam (exam_name,exam_description,exam_date,exam_duration,exampass_marks,exam_marks,subject_fid,category_fid) 
	  values
	  (@examname,@examdis,@examdate,@examduration,@exampassmarks,@exammarks,@examsubjectfid,@examcategoryfid)
end