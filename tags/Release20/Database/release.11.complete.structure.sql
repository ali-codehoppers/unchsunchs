/**************************************************************************
-- -Generated by xSQL SDK for Schema Comparison and Synchronization
-- -Date/Time: November 09, 2009 22:05:40

-- -Summary:
    Contains the T-SQL script that makes the database 
    .\SQLEXPRESS.HSRelease the same as the database .\SQLEXPRESS.HSTEST

-- -Action:
    Execute this script on .\SQLEXPRESS.HSRelease

-- -SQL Server version: 10.0.1600
**************************************************************************/

BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
	SET QUOTED_IDENTIFIER ON
	SET ANSI_NULLS ON
	SET ANSI_PADDING ON
	SET ANSI_WARNINGS ON
	SET ARITHABORT ON
	SET NUMERIC_ROUNDABORT OFF
	SET CONCAT_NULL_YIELDS_NULL ON
	SET XACT_ABORT ON
COMMIT TRANSACTION
GO

IF EXISTS (select * from tempdb..sysobjects where id = OBJECT_ID('tempdb..#ErrorLog')) 
	DROP TABLE #ErrorLog 
CREATE TABLE #ErrorLog 
( pkid [int] IDENTITY(1,1) NOT NULL, errno [int] NOT NULL, errdescr [varchar](100) NULL )
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[un_co_screens] (
	[screen_id] [int] IDENTITY (1,1) NOT NULL,
	[screen_name] [varchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[screen_url] [varchar](200) COLLATE Latin1_General_CI_AS NOT NULL,
	[help_html] [varchar](1000) COLLATE Latin1_General_CI_AS NOT NULL,
	[co_id] [int] NOT NULL
) ON [PRIMARY]
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add table dbo.un_co_screens')
END
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
ALTER TABLE [dbo].[un_co_dept_ords]
	ADD [risk_taking] [varchar](20) COLLATE Latin1_General_CI_AS NULL
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add column dbo.un_co_dept_ords.risk_taking')
END
GO
IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[DepartmentOrderInsertCommand]
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_ref varchar(32),
	@order_client_ref varchar(32),
	@order_sms varchar(32),
	@date_order_created datetime,
	@order_est_of_works int,
	@date_order_review datetime,
	@flg_order_doc_to_client bit,
	@address_no varchar(32),
	@address_line1 varchar(128),
	@address_line2 varchar(128),
	@address_line3 varchar(128),
	@address_line4 varchar(128),
	@address_line5 varchar(128),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@order_desc varchar(1000),
	@flg_multi_emer_exits bit,
	@flg_multi_assem_points bit,
	@flg_cancelled bit,
	@date_cancelled datetime,
	@created_by int,
	@date_created datetime,
	@last_amended_by int,
	@date_last_amended datetime
)
AS
	SET NOCOUNT OFF;
	
DECLARE @orderIdString varchar(6);

INSERT INTO [un_co_dept_ords] ([flg_delete], [dept_id], [co_id], [order_ref], [order_client_ref], [order_sms], [date_order_created], [order_est_of_works], [date_order_review], [flg_order_doc_to_client], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [order_desc], [flg_multi_emer_exits], [flg_multi_assem_points], [flg_cancelled], [date_cancelled], [created_by], [date_created], [last_amended_by], [date_last_amended]) VALUES (@flg_delete, @dept_id, @co_id, @order_ref, @order_client_ref, @order_sms, @date_order_created, @order_est_of_works, @date_order_review, @flg_order_doc_to_client, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @order_desc, @flg_multi_emer_exits, @flg_multi_assem_points, @flg_cancelled, @date_cancelled, @created_by, @date_created, @last_amended_by, @date_last_amended);

SELECT @orderIdString = CAST(SCOPE_IDENTITY() as varchar);

UPDATE [un_co_dept_ords] SET order_sms = REPLICATE('0',6 - LEN(@orderIdString)) + @orderIdString where sequence = SCOPE_IDENTITY();
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = SCOPE_IDENTITY())
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.DepartmentOrderInsertCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[DepartmentOrderUpdateCommand]
(
	@flg_delete bit,
	@dept_id int,
	@co_id int,
	@order_ref varchar(32),
	@order_client_ref varchar(32),
	@order_sms varchar(32),
	@date_order_created datetime,
	@order_est_of_works int,
	@est_num_of_operatives int,
	@date_order_review datetime,
	@flg_order_doc_to_client bit,
	@address_no varchar(32),
	@address_line1 varchar(128),
	@address_line2 varchar(128),
	@address_line3 varchar(128),
	@address_line4 varchar(128),
	@address_line5 varchar(128),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@order_desc varchar(1000),
	@desc_of_work varchar(1000),
	@flg_multi_emer_exits bit,
	@flg_multi_assem_points bit,
	@flg_cancelled bit,
	@date_cancelled datetime,
	@last_amended_by int,
	@date_last_amended datetime,
	@risk_taking varchar(20),
	@Original_sequence int,
	@sequence int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_ords] SET [flg_delete] = @flg_delete,[est_num_of_operatives]=@est_num_of_operatives, [dept_id] = @dept_id, [co_id] = @co_id, [order_ref] = @order_ref, [order_client_ref] = @order_client_ref, [order_sms] = @order_sms, [date_order_created] = @date_order_created, [order_est_of_works] = @order_est_of_works, [date_order_review] = @date_order_review, [flg_order_doc_to_client] = @flg_order_doc_to_client, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [order_desc] = @order_desc,[desc_of_work] = @desc_of_work,[flg_multi_emer_exits] = @flg_multi_emer_exits, [flg_multi_assem_points] = @flg_multi_assem_points, [flg_cancelled] = @flg_cancelled, [date_cancelled] = @date_cancelled, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended,risk_taking=@risk_taking WHERE (([sequence] = @Original_sequence));
	
SELECT sequence, flg_delete, dept_id, co_id, order_ref, order_client_ref, order_sms, date_order_created, order_est_of_works, date_order_review, flg_order_doc_to_client, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, order_desc, flg_multi_emer_exits, flg_multi_assem_points, flg_cancelled, date_cancelled, created_by, date_created, last_amended_by, date_last_amended FROM un_co_dept_ords WHERE (sequence = @sequence)
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.DepartmentOrderUpdateCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[DocumentTypeInsert]
(
	@doc_data_type_desc varchar(255),
	@flg_delete bit,
	@co_id int,
	@dept_id int,
	@sort_order tinyint,
	@field_type varchar(50),
	@generator_class varchar(255),
	@required bit,
	@style varchar(500),
	@flg_landscape bit,
	@num_of_sections int,
	@flg_checked bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_dept_doc_type] ([doc_data_type_desc], [flg_delete], [co_id],[dept_id],[sort_order],
		[field_type],[generator_class],[required],[style],[flg_landscape],[num_of_sections],[flg_checked])
      VALUES (@doc_data_type_desc, @flg_delete, @co_id,@dept_id,@sort_order,@field_type,@generator_class,
		@required,@style,@flg_landscape,@num_of_sections,@flg_checked);
	

GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.DocumentTypeInsert')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DocumentTypeSelectByName]
	@dept_id int,
	@co_id int,
	@doc_type_name varchar(255)
AS
	SET NOCOUNT ON;
SELECT        un_co_dept_doc_type.*
FROM            un_co_dept_doc_type
WHERE		dept_id = @dept_id
AND		co_id = @co_id
AND		doc_data_type_desc = @doc_type_name
and flg_delete = 0
ORDER BY sort_order
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.DocumentTypeSelectByName')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE dbo.ScreenDeleteCommand
(
	@Original_screen_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [un_co_screens] WHERE (([screen_id] = @Original_screen_id))
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenDeleteCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE dbo.ScreenInsertCommand
(
	@screen_name varchar(100),
	@screen_url varchar(200),
	@help_html varchar(1000),
	@co_id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_screens] ([screen_name], [screen_url], [help_html], [co_id]) VALUES (@screen_name, @screen_url, @help_html, @co_id);
	
SELECT screen_id, screen_name, screen_url, help_html, co_id FROM un_co_screens WHERE (screen_id = SCOPE_IDENTITY())
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenInsertCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScreenSelectByCoId]
	@co_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_screens.*
FROM            un_co_screens
WHERE co_id  = @co_id
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenSelectByCoId')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScreenSelectById]
	@screen_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_screens.*
FROM            un_co_screens
WHERE screen_id  = @screen_id
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenSelectById')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScreenSelectbyURL]
	@co_id int,
	@screen_url varchar(200)
AS
	SET NOCOUNT ON;
SELECT        un_co_screens.*
FROM            un_co_screens
where co_id = @co_id
and un_co_screens.screen_url = @screen_url
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenSelectbyURL')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE dbo.ScreenSelectCommand
AS
	SET NOCOUNT ON;
SELECT        un_co_screens.*
FROM            un_co_screens
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenSelectCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE dbo.ScreenUpdateCommand
(
	@screen_name varchar(100),
	@screen_url varchar(200),
	@help_html varchar(1000),
	@co_id int,
	@Original_screen_id int,
	@screen_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_screens] SET [screen_name] = @screen_name, [screen_url] = @screen_url, [help_html] = @help_html, [co_id] = @co_id WHERE (([screen_id] = @Original_screen_id));
	
SELECT screen_id, screen_name, screen_url, help_html, co_id FROM un_co_screens WHERE (screen_id = @screen_id)
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.ScreenUpdateCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[UserDeleteCommand]
(
	@Original_user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_user_details] SET flg_deleted = 1 WHERE (([user_id] = @Original_user_id))
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.UserDeleteCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[UserInsertCommand]
(
	@flg_deleted bit,
	@co_id int,
	@user_level int,
	@user_name varchar(50),
	@user_logon varchar(50),
	@user_enable varchar(50),
	@user_enable_reminder varchar(50),
	@user_telephone varchar(16),
	@user_tel_ext varchar(6),
	@user_tel_mobile varchar(16),
	@user_email varchar(254),
	@user_department varchar(32),
	@user_location varchar(256),
	@created_by int,
	@date_created datetime,
	@last_amended_by int,
	@date_last_amended datetime,
	@role varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_user_details] ([flg_deleted], [co_id], [user_level], [user_name], [user_logon], [user_enable], [user_enable_reminder], [user_telephone], [user_tel_ext], [user_tel_mobile], [user_email], [user_department], [user_location], [created_by], [date_created], [last_amended_by], [date_last_amended],[role]) VALUES (@flg_deleted, @co_id, @user_level, @user_name, @user_logon, @user_enable, @user_enable_reminder, @user_telephone, @user_tel_ext, @user_tel_mobile, @user_email, @user_department, @user_location, @created_by, @date_created, @last_amended_by, @date_last_amended,@role);
	
SELECT user_id, flg_deleted, co_id, user_level, user_name, user_logon, user_enable, user_enable_reminder, user_telephone, user_tel_ext, user_tel_mobile, user_email, user_department, user_location, created_by, date_created, last_amended_by, date_last_amended FROM un_co_user_details WHERE (user_id = SCOPE_IDENTITY())
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.UserInsertCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UserLogin]
	-- Add the parameters for the stored procedure here
	@user_logon varchar(50),
	@user_enable varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT un_co_user_details.*,un_co_details.co_name_short
	  FROM un_co_user_details 
	 INNER JOIN un_co_details ON un_co_details.co_id = un_co_user_details.co_id
	 WHERE user_logon = @user_logon AND user_enable = @user_enable
END
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.UserLogin')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UserSelectByCoAndRole]
	@co_id int,
	@role varchar(50)
AS
	SET NOCOUNT ON;
SELECT        un_co_user_details.*,un_co_details.co_name_short
FROM            un_co_user_details
inner join un_co_details on un_co_details.co_id = un_co_user_details.co_id
WHERE		un_co_user_details.flg_deleted = 0
AND (@co_id = -1 OR un_co_user_details.co_id = @co_id)
AND	(@role = 'all' OR un_co_user_details.role = @role)
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.UserSelectByCoAndRole')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UserSelectById]
	@user_id int
AS
	SET NOCOUNT ON;
SELECT        un_co_user_details.*,un_co_details.co_name_short
FROM            un_co_user_details
inner join un_co_details on un_co_details.co_id = un_co_user_details.co_id
WHERE		un_co_user_details.flg_deleted = 0
and un_co_user_details.user_id = @user_id;
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.UserSelectById')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserSelectByLogon]
	-- Add the parameters for the stored procedure here
	@user_logon varchar(50),
	@user_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT un_co_user_details.*,un_co_details.co_name_short
	  FROM un_co_user_details 
	 INNER JOIN un_co_details ON un_co_details.co_id = un_co_user_details.co_id
	 WHERE user_logon = @user_logon 
	   AND (@user_id IS NULL OR un_co_user_details.user_id <> @user_id)
END
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.UserSelectByLogon')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[UserSelectCommand]
AS
	SET NOCOUNT ON;
SELECT        un_co_user_details.*,un_co_details.co_name_short
FROM            un_co_user_details
inner join un_co_details on un_co_details.co_id = un_co_user_details.co_id
WHERE		un_co_user_details.flg_deleted = 0;
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.UserSelectCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[UserUpdateCommand]
(
	@user_level int,
	@user_name varchar(50),
	@user_logon varchar(50),
	@user_enable varchar(50),
	@user_enable_reminder varchar(50),
	@user_telephone varchar(16),
	@user_tel_ext varchar(6),
	@user_tel_mobile varchar(16),
	@user_email varchar(254),
	@user_department varchar(32),
	@user_location varchar(256),
	@last_amended_by int,
	@date_last_amended datetime,
	@Original_user_id int,
	@user_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_user_details] SET [user_level] = @user_level, [user_name] = @user_name, [user_logon] = @user_logon, [user_enable] = @user_enable, [user_enable_reminder] = @user_enable_reminder, [user_telephone] = @user_telephone, [user_tel_ext] = @user_tel_ext, [user_tel_mobile] = @user_tel_mobile, [user_email] = @user_email, [user_department] = @user_department, [user_location] = @user_location, [last_amended_by] = @last_amended_by, [date_last_amended] = @date_last_amended WHERE (([user_id] = @Original_user_id));
	
SELECT user_id, flg_deleted, co_id, user_level, user_name, user_logon, user_enable, user_enable_reminder, user_telephone, user_tel_ext, user_tel_mobile, user_email, user_department, user_location, created_by, date_created, last_amended_by, date_last_amended FROM un_co_user_details WHERE (user_id = @user_id)
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.UserUpdateCommand')
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
if not exists (select * from sys.objects where [name] = N'PK_un_co_screens' and [type] = 'PK')
ALTER TABLE [dbo].[un_co_screens] ADD 
	CONSTRAINT [PK_un_co_screens] PRIMARY KEY CLUSTERED 
	(
		[screen_id]
	) ON [PRIMARY];
GO

IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add primary key dbo.un_co_screens.PK_un_co_screens')
END
GO
IF EXISTS (Select * from #ErrorLog)
BEGIN
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
END
ELSE
BEGIN
	IF @@TRANCOUNT>0 COMMIT TRANSACTION
END
IF EXISTS (Select * from #ErrorLog)
BEGIN
	Print 'Database synchronization script failed'
	GOTO QuitWithErrors
END
ELSE
BEGIN
	Print 'Database synchronization completed successfully'
END



QuitWithErrors:


