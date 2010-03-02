/**************************************************************************
-- -Generated by xSQL SDK for Schema Comparison and Synchronization
-- -Date/Time: November 11, 2009 00:44:47

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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].[CompanyInsertCommand]
(
	@flg_deleted bit,
	@co_name_short varchar(16),
	@co_name_long varchar(60),
	@contact_title varchar(7),
	@contact_initials varchar(3),
	@contact_forename varchar(60),
	@contact_surname varchar(60),
	@address_no varchar(32),
	@address_line1 varchar(60),
	@address_line2 varchar(60),
	@address_line3 varchar(60),
	@address_line4 varchar(60),
	@address_line5 varchar(60),
	@address_post_code varchar(9),
	@address_full varchar(1000),
	@tel_1 varchar(30),
	@tel_2 varchar(30),
	@tel_fax varchar(30),
	@email varchar(60),
	@co_notes varchar(1000),
	@licenses_purchased int,
	@lincenses_used int,
	@flg_system_locked bit,
	@created_by int,
	@date_created datetime,
	@last_ameneded_by int,
	@date_last_amended datetime,
	@flg_autosave bit,
	@fire_warden_label varchar(50),
	@first_aider_label varchar(50),
	@flg_multi_supervisors bit,
	@supervisor_label varchar(50),
	@flg_active bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_details] ([flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initials], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [licenses_purchased], [lincenses_used], [flg_system_locked], [created_by], [date_created], [last_ameneded_by], [date_last_amended],[flg_autosave],[fire_warden_label],[first_aider_label],[flg_multi_supervisors],[supervisor_label],[flg_active]) VALUES (@flg_deleted, @co_name_short, @co_name_long, @contact_title, @contact_initials, @contact_forename, @contact_surname, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @tel_1, @tel_2, @tel_fax, @email, @co_notes, @licenses_purchased, @lincenses_used, @flg_system_locked, @created_by, @date_created, @last_ameneded_by, @date_last_amended,@flg_autosave,@fire_warden_label,@first_aider_label,@flg_multi_supervisors,@supervisor_label,@flg_active);
	
SELECT co_id, flg_deleted, co_name_short, co_name_long, contact_title, contact_initials, contact_forename, contact_surname, address_no, address_line1, address_line2, address_line3, address_line4, address_line5, address_post_code, address_full, tel_1, tel_2, tel_fax, email, co_notes, licenses_purchased, lincenses_used, flg_system_locked, created_by, date_created, last_ameneded_by, date_last_amended FROM un_co_details WHERE (co_id = SCOPE_IDENTITY())
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.CompanyInsertCommand')
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
ALTER PROCEDURE [dbo].[DocumentTypeDelete]
(
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_doc_type] SET flg_delete = 1  WHERE (([doc_data_type_id] = @Original_doc_data_type_id))
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.DocumentTypeDelete')
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
ALTER PROCEDURE [dbo].[DocumentTypeUpdate]
(
	@doc_data_type_desc varchar(255),
	@sort_order int,
	@required bit,
	@style varchar(500),
	@flg_checked bit,
	@Original_doc_data_type_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_dept_doc_type] SET [doc_data_type_desc] = @doc_data_type_desc, 
	[sort_order] = @sort_order, [required] = @required, [style] = @style, [flg_checked] = @flg_checked
 WHERE (([doc_data_type_id] = @Original_doc_data_type_id));
	

GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.DocumentTypeUpdate')
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
	 AND un_co_details.flg_active = 1;
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


