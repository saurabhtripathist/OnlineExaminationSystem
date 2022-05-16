﻿/*
Deployment script for OnlineExaminationSystem

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "OnlineExaminationSystem"
:setvar DefaultFilePrefix "OnlineExaminationSystem"
:setvar DefaultDataPath "C:\Users\Saurabh Tripathi\AppData\Local\Microsoft\VisualStudio\SSDT\"
:setvar DefaultLogPath "C:\Users\Saurabh Tripathi\AppData\Local\Microsoft\VisualStudio\SSDT\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering Table [dbo].[result]...';


GO
ALTER TABLE [dbo].[result] ALTER COLUMN [exam_date] DATETIME NULL;


GO
PRINT N'Altering Procedure [dbo].[spResultinsert]...';


GO
ALTER PROCEDURE [dbo].[spResultinsert]
	
@examfid int,
@resultstatus nvarchar(50),
@resultscore int,
@totalquestion int,
@username nvarchar(50),
@examdate datetime

as
begin
      insert into result (exam_fid,result_status,result_score,totalquestion,user_email,exam_date) values
	  (@examfid,@resultstatus,@resultscore,@totalquestion,@username,@examdate)
	  
end
GO
PRINT N'Refreshing Procedure [dbo].[spUserresult]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUserresult]';


GO
PRINT N'Update complete.';


GO
