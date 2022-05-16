CREATE TABLE [dbo].[users]
(
user_id int identity(1,1) primary key,
user_fname nvarchar(50),
user_lname nvarchar(50),
user_email nvarchar(50),
user_password nvarchar(100),
)
