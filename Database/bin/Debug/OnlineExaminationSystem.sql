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
:setvar DefaultDataPath "C:\Users\Saurabh Tripathi\AppData\Local\Microsoft\VisualStudio\SSDT\OnlineExaminationSystem"
:setvar DefaultLogPath "C:\Users\Saurabh Tripathi\AppData\Local\Microsoft\VisualStudio\SSDT\OnlineExaminationSystem"

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
/*
The column [dbo].[result].[exam_date] is being dropped, data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[result])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Altering Table [dbo].[result]...';


GO
ALTER TABLE [dbo].[result] DROP COLUMN [exam_date];


GO
PRINT N'Altering Procedure [dbo].[spInsertResult]...';


GO
ALTER PROCEDURE [dbo].[spInsertResult]

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
GO
PRINT N'Refreshing Procedure [dbo].[spUserresult]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUserresult]';


GO
PRINT N'Update complete.';


GO
