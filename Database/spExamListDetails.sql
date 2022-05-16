CREATE PROCEDURE [dbo].[spExamListDetails]
@exam_id int
as
begin
     select * from exam
	 left join subject on exam.subject_fid=subject.subject_id
	 left join category on exam.category_fid =category.category_id
	 where exam_id =@exam_id
end