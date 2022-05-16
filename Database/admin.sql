CREATE TABLE [dbo].[admin]
(
admin_id int identity  primary key ,
admin_name nvarchar(500),
admin_email nvarchar(50),
admin_password nvarchar(50),
)
