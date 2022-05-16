CREATE PROCEDURE [dbo].[spInsertResult]

@examfid nvarchar(150),
@resultstatus nvarchar(150),
@resultscore int,
@totalquestion int,
@username nvarchar(50)

as
begin
      insert into result (exam_fid,result_status,result_score,totalquestion,user_email) values
	  (@examfid,@resultstatus,@resultscore,@totalquestion,@username)
	  
end