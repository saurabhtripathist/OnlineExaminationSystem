CREATE PROCEDURE [dbo].[spAdminRegisterinsert]

@admin_name nvarchar(50),
@admin_email nvarchar(50),
@password  nvarchar(100)
as
begin
      declare @count int
	  declare @returnvalue int
	  select @count = COUNT(admin_email) from admin where admin_email=@admin_email
	      if @count>0
		      begin
			     set @returnvalue = -1
				 end
			else
			  begin
			     set @returnvalue = 1
				 insert into admin(admin_name,admin_email,admin_password) values
				(@admin_name,@admin_email,@password)
				 end
		select @returnvalue as returnvalue
end



