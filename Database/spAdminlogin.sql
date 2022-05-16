CREATE PROCEDURE [dbo].[spAdminlogin]
	
@admin_email nvarchar(50),
@password nvarchar(100)
as
begin

  Declare @count int
  select @count =COUNT(admin_email) from admin
  where admin_email=@admin_email and admin_password=@password
  if (@count=1)
        begin
		    select 1 as retunvalue
			end
	else
	    begin
		  select -1 as retunvalue
		  end  
end