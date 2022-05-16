CREATE PROCEDURE [dbo].[spEditexam]
	
@examid int,
@examname nvarchar(100),
@examdiscription nvarchar(MAX),
@examdate date,
@examduration int,
@exampassmarks int,
@examnmarks int,
@categoryfid int,
@subjectfid int
as
begin
     update exam set exam_name = @examname, exam_description = @examdiscription,exam_date= @examdate,exam_duration = @examduration, exampass_marks = @exampassmarks ,exam_marks =@examnmarks, category_fid =@categoryfid , subject_fid =@subjectfid 
	 where exam_id=@examid
	 
	 end