CREATE PROCEDURE [dbo].[spUsersRegisterinsert]
	
@user_fname nvarchar(50),
@user_lname nvarchar(50),
@email nvarchar(50),
@password nvarchar(100)
as
begin
     declare @count int
	 declare @returnvalue int
	 select @count = COUNT(user_email) from users where user_email = @email
	     if @count>0
		      begin
			      set @returnvalue =-1
				  
			   end
			   
		else
		  begin
		      set @returnvalue =1
			  insert into users (user_fname,user_lname,user_password,user_email) values
			  (@user_fname,@user_lname,@password,@email)
			 end
		select @returnvalue as returnvalue
end