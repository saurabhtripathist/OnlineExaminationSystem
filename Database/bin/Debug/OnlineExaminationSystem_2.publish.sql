/*
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
PRINT N'Starting rebuilding table [dbo].[category]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_category] (
    [category_id]   INT           IDENTITY (1, 1) NOT NULL,
    [category_name] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([category_id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[category])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_category] ON;
        INSERT INTO [dbo].[tmp_ms_xx_category] ([category_id], [category_name])
        SELECT   [category_id],
                 [category_name]
        FROM     [dbo].[category]
        ORDER BY [category_id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_category] OFF;
    END

DROP TABLE [dbo].[category];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_category]', N'category';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[exam]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_exam] (
    [exam_id]            INT             IDENTITY (1, 1) NOT NULL,
    [exam_name]          NVARCHAR (500)  NULL,
    [exam_description]   NVARCHAR (4000) NULL,
    [exam_date]          DATE            NULL,
    [exam_duration]      INT             NULL,
    [exam_marks]         INT             NULL,
    [exam_negativemarks] INT             NULL,
    [exam_totalquestion] INT             NULL,
    [category_fid]       INT             NULL,
    [subject_fid]        INT             NULL,
    [exampass_marks]     INT             NULL,
    PRIMARY KEY CLUSTERED ([exam_id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[exam])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_exam] ON;
        INSERT INTO [dbo].[tmp_ms_xx_exam] ([exam_id], [exam_name], [exam_description], [exam_date], [exam_duration], [exam_marks], [exam_negativemarks], [exam_totalquestion], [category_fid], [subject_fid], [exampass_marks])
        SELECT   [exam_id],
                 [exam_name],
                 [exam_description],
                 [exam_date],
                 [exam_duration],
                 [exam_marks],
                 [exam_negativemarks],
                 [exam_totalquestion],
                 [category_fid],
                 [subject_fid],
                 [exampass_marks]
        FROM     [dbo].[exam]
        ORDER BY [exam_id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_exam] OFF;
    END

DROP TABLE [dbo].[exam];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_exam]', N'exam';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[question]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_question] (
    [question_id]     INT             IDENTITY (1, 1) NOT NULL,
    [question_name]   NVARCHAR (4000) NULL,
    [option_one]      NVARCHAR (4000) NULL,
    [option_two]      NVARCHAR (4000) NULL,
    [option_three]    NVARCHAR (4000) NULL,
    [option_four]     NVARCHAR (4000) NULL,
    [question_answer] INT             NULL,
    [exam_fid]        INT             NULL,
    PRIMARY KEY CLUSTERED ([question_id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[question])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_question] ON;
        INSERT INTO [dbo].[tmp_ms_xx_question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid])
        SELECT   [question_id],
                 [question_name],
                 [option_one],
                 [option_two],
                 [option_three],
                 [option_four],
                 [question_answer],
                 [exam_fid]
        FROM     [dbo].[question]
        ORDER BY [question_id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_question] OFF;
    END

DROP TABLE [dbo].[question];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_question]', N'question';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[result]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_result] (
    [result_id]     INT           IDENTITY (1, 1) NOT NULL,
    [result_status] NVARCHAR (50) NULL,
    [result_score]  INT           NULL,
    [user_email]    NVARCHAR (50) NULL,
    [totalquestion] INT           NULL,
    [exam_fid]      INT           NULL,
    [exam_date]     DATE          NULL,
    PRIMARY KEY CLUSTERED ([result_id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[result])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_result] ON;
        INSERT INTO [dbo].[tmp_ms_xx_result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date])
        SELECT   [result_id],
                 [result_status],
                 [result_score],
                 [user_email],
                 [totalquestion],
                 [exam_fid],
                 [exam_date]
        FROM     [dbo].[result]
        ORDER BY [result_id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_result] OFF;
    END

DROP TABLE [dbo].[result];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_result]', N'result';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Refreshing Procedure [dbo].[spExamList]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spExamList]';


GO
PRINT N'Refreshing Procedure [dbo].[spExamListDetails]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spExamListDetails]';


GO
PRINT N'Refreshing Procedure [dbo].[spSubjecteditfill]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spSubjecteditfill]';


GO
PRINT N'Refreshing Procedure [dbo].[spSubjectList]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spSubjectList]';


GO
PRINT N'Refreshing Procedure [dbo].[spAddexam]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spAddexam]';


GO
PRINT N'Refreshing Procedure [dbo].[spEditexam]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spEditexam]';


GO
PRINT N'Refreshing Procedure [dbo].[spEditexamfill]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spEditexamfill]';


GO
PRINT N'Refreshing Procedure [dbo].[spEditquestionfill]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spEditquestionfill]';


GO
PRINT N'Refreshing Procedure [dbo].[spExamquestion]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spExamquestion]';


GO
PRINT N'Refreshing Procedure [dbo].[spExamsearchcategory]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spExamsearchcategory]';


GO
PRINT N'Refreshing Procedure [dbo].[spgetallquestion]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spgetallquestion]';


GO
PRINT N'Refreshing Procedure [dbo].[spQuestionsearchexam]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spQuestionsearchexam]';


GO
PRINT N'Refreshing Procedure [dbo].[spUserresult]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spUserresult]';


GO
PRINT N'Refreshing Procedure [dbo].[spAddquestion]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spAddquestion]';


GO
PRINT N'Refreshing Procedure [dbo].[spEditquestion]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spEditquestion]';


GO
PRINT N'Refreshing Procedure [dbo].[spResultinsert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spResultinsert]';


GO
PRINT N'Update complete.';


GO
