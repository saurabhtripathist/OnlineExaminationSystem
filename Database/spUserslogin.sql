CREATE PROCEDURE [dbo].[spUserslogin]
	
@user_email nvarchar(50),
@password nvarchar(100)
as
begin
      Declare @count int
	  select @count =COUNT(user_email) from users
	  where user_email= @user_email and user_password=@password
	  if (@count = 1)
	         begin
			      select 1 as retunvalue
			end
			
	   else
	       begin
		       select -1 as retunvalue
			end
end