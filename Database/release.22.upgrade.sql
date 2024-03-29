/**************************************************************************
-- -Generated by xSQL SDK for Schema Comparison and Synchronization
-- -Date/Time: April 28, 2010 19:01:57

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
ALTER TABLE [dbo].[un_co_details]
	ADD [co_uid] [char](36) COLLATE Latin1_General_CI_AS NULL
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add column dbo.un_co_details.co_uid')
END
GO
IF @@TRANCOUNT=0 BEGIN TRANSACTION
GO
ALTER TABLE [dbo].[un_co_details]
	ADD [flg_show_wizard] [bit] NULL
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add column dbo.un_co_details.flg_show_wizard')
END
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
	@flg_active bit,
	@order_sms_count int,
	@flg_trial bit,
	@trial_start_date date,
	@trial_num_of_days int,
	@trial_end_date date,
	@flg_show_wizard bit	
)
AS
	SET NOCOUNT OFF;
INSERT INTO [un_co_details] ([flg_deleted], [co_name_short], [co_name_long], [contact_title], [contact_initials], [contact_forename], [contact_surname], [address_no], [address_line1], [address_line2], [address_line3], [address_line4], [address_line5], [address_post_code], [address_full], [tel_1], [tel_2], [tel_fax], [email], [co_notes], [licenses_purchased], [lincenses_used], [flg_system_locked], [created_by], [date_created], [last_ameneded_by], [date_last_amended],[flg_autosave],[fire_warden_label],[first_aider_label],[flg_multi_supervisors],[supervisor_label],[flg_active],[order_sms_count],[flg_trial],[trial_start_date],[trial_num_of_days],[trial_end_date],[flg_show_wizard]) VALUES (@flg_deleted, @co_name_short, @co_name_long, @contact_title, @contact_initials, @contact_forename, @contact_surname, @address_no, @address_line1, @address_line2, @address_line3, @address_line4, @address_line5, @address_post_code, @address_full, @tel_1, @tel_2, @tel_fax, @email, @co_notes, @licenses_purchased, @lincenses_used, @flg_system_locked, @created_by, @date_created, @last_ameneded_by, @date_last_amended,@flg_autosave,@fire_warden_label,@first_aider_label,@flg_multi_supervisors,@supervisor_label,@flg_active,@order_sms_count,@flg_trial,@trial_start_date,@trial_num_of_days,@trial_end_date,@flg_show_wizard);
	
SELECT * FROM un_co_details WHERE (co_id = SCOPE_IDENTITY())

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
ALTER PROCEDURE [dbo].[CompanyUpdateCommand]
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
	@last_ameneded_by int,
	@date_last_amended datetime,
	@flg_autosave bit,
	@fire_warden_label varchar(50),
	@first_aider_label varchar(50),
	@flg_multi_supervisors bit,
	@supervisor_label varchar(50),
	@flg_trial bit,
	@trial_start_date date,
	@trial_num_of_days int,
	@trial_end_date date,
	@flg_show_wizard bit,
	@Original_co_id int,
	@co_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [un_co_details] SET [flg_deleted] = @flg_deleted, [co_name_short] = @co_name_short, [co_name_long] = @co_name_long, [contact_title] = @contact_title, [contact_initials] = @contact_initials, [contact_forename] = @contact_forename, [contact_surname] = @contact_surname, [address_no] = @address_no, [address_line1] = @address_line1, [address_line2] = @address_line2, [address_line3] = @address_line3, [address_line4] = @address_line4, [address_line5] = @address_line5, [address_post_code] = @address_post_code, [address_full] = @address_full, [tel_1] = @tel_1, [tel_2] = @tel_2, [tel_fax] = @tel_fax, [email] = @email, [co_notes] = @co_notes, [licenses_purchased] = @licenses_purchased, [lincenses_used] = @lincenses_used, [flg_system_locked] = @flg_system_locked, [last_ameneded_by] = @last_ameneded_by, [date_last_amended] = @date_last_amended ,
	[flg_autosave]=@flg_autosave,[fire_warden_label] = @fire_warden_label, [first_aider_label] = @first_aider_label, [flg_multi_supervisors] = @flg_multi_supervisors, [supervisor_label] = @supervisor_label,[flg_trial] = @flg_trial,[trial_start_date] = @trial_start_date,[trial_num_of_days] = @trial_num_of_days,[trial_end_date] = @trial_end_date,flg_show_wizard = @flg_show_wizard
	
WHERE (([co_id] = @Original_co_id));
	
SELECT * FROM un_co_details WHERE (co_id = @co_id)
GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to alter stored procedure dbo.CompanyUpdateCommand')
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
CREATE PROCEDURE [dbo].[TransferAll]
(
	@sourceCoId int,
	@sourceDeptId int,
	@targetCoId int,
	@targetDeptId int,
	@user_id int
)
AS
	SET NOCOUNT ON;
BEGIN TRY
	BEGIN TRANSACTION    -- Start the transaction	
   
	--Document Types are wrt Co,Dept therefore first we need to copy them. to the target.
	INSERT INTO un_co_dept_doc_type (doc_data_type_desc,flg_delete,co_id,dept_id,sort_order,field_type,generator_class,[required],style,flg_landscape,num_of_sections,flg_checked,category)
	SELECT doc_data_type_desc,flg_delete,@targetCoId,@targetDeptId,sort_order,field_type,generator_class,[required],style,flg_landscape,num_of_sections,flg_checked,category
	FROM un_co_dept_doc_type
	WHERE co_id = @sourceCoId 
	AND dept_id = @sourceDeptId;


	--The documents can be categorized. We need to copy the categories from source to target also. 
	INSERT INTO un_co_dept_categories (dept_id,co_id,category_name,category_type,flg_delete)
	SELECT @targetDeptId,@targetCoId,category_name,category_type,flg_delete
	FROM un_co_dept_categories
	WHERE co_id = @sourceCoId 
	AND dept_id = @sourceDeptId;

	-- Inset the document sections, these are generic sections based on co and dept. 
	insert into un_co_dept_template_sections(flg_delete,co_id,dept_id,section_index,section_desc,section_type,doc_type_id,repeat_columns)
	select un_co_dept_template_sections.flg_delete,@targetCoId,@targetDeptId,section_index,section_desc,section_type,docTypes.doc_data_type_id,repeat_columns
	from un_co_dept_template_sections
	inner join un_co_dept_doc_type 
	on un_co_dept_doc_type.co_id = un_co_dept_template_sections.co_id
	and un_co_dept_doc_type.dept_id = un_co_dept_template_sections.dept_id
	and un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_sections.doc_type_id
	inner join un_co_dept_doc_type docTypes on un_co_dept_doc_type.doc_data_type_desc = docTypes.doc_data_type_desc
	where un_co_dept_template_sections.co_id = @sourceCoId
	and un_co_dept_template_sections.dept_id = @sourceDeptId
	and un_co_dept_doc_type.co_id = @sourceCoId
	and un_co_dept_doc_type.dept_id = @sourceDeptId
	and docTypes.co_id = @targetCoId
	and docTypes.dept_id = @targetDeptId;

	--Insert the document section details
	insert into un_co_dept_template_section_details(section_id,co_id,dept_id,section_detail_index,section_detail_desc,flg_delete)
	select sections.section_id,@targetCoId,@targetDeptId,section_detail_index,section_detail_desc,un_co_dept_template_section_details.flg_delete
	  from un_co_dept_template_section_details
	 inner join un_co_dept_template_sections 
	 on  un_co_dept_template_section_details.co_id = un_co_dept_template_sections.co_id
	 and un_co_dept_template_section_details.dept_id = un_co_dept_template_sections.dept_id
	 and un_co_dept_template_section_details.section_id = un_co_dept_template_sections.section_id
	 inner join un_co_dept_template_sections as sections on sections.section_desc = un_co_dept_template_sections.section_desc
	 where un_co_dept_template_section_details.co_id = @sourceCoId
	   and un_co_dept_template_section_details.dept_id = @sourceDeptId
	   and sections.co_id = @targetCoId
	   and sections.dept_id = @targetDeptId;
	  
	--Insert the documents. For this we need to join the document type on the basis of name and category_id on the basis of name
	insert into un_co_dept_template_docs(co_id,dept_id,doc_type_id,doc_name,doc_desc,doc_code,flg_delete,doc_index,category_id,related_doc_codes,flg_default)
	select @targetCoId,@targetDeptId,doc_type.doc_data_type_id,un_co_dept_template_docs.doc_name,un_co_dept_template_docs.doc_desc,un_co_dept_template_docs.doc_code,
		un_co_dept_template_docs.flg_delete,doc_index,cats.category_id,related_doc_codes,flg_default
	from un_co_dept_template_docs
	inner join un_co_dept_doc_type on un_co_dept_doc_type.doc_data_type_id = un_co_dept_template_docs.doc_type_id
	and un_co_dept_doc_type.co_id = un_co_dept_template_docs.co_id
	and un_co_dept_doc_type.dept_id = un_co_dept_template_docs.dept_id
	inner join un_co_dept_categories on un_co_dept_template_docs.category_id = un_co_dept_categories.category_id
	and un_co_dept_categories.co_id = un_co_dept_template_docs.co_id
	and un_co_dept_categories.dept_id = un_co_dept_template_docs.dept_id
	inner join un_co_dept_doc_type as doc_type on doc_type.doc_data_type_desc = un_co_dept_doc_type.doc_data_type_desc
	inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name
	where un_co_dept_doc_type.dept_id = @sourceDeptId
	and un_co_dept_doc_type.co_id = @sourceCoId
	and doc_type.co_id = @targetCoId
	and doc_type.dept_id = @targetDeptId
	and cats.co_id = @targetCoId
	and cats.dept_id = @targetDeptId
	and cats.category_type = 'D';

	-- insert document items

	insert into un_co_dept_template_items(co_id,dept_id,section_id,doc_id,item_name,item_index,section_detail_id)
	select secs2.co_id,secs2.dept_id,secs2.section_id,docs2.doc_id,items.item_name,items.item_index,section_detail_id
	 from un_co_dept_template_items as items
	inner join un_co_dept_template_docs as docs on docs.doc_id = items.doc_id
	and docs.co_id = items.co_id
	and docs.dept_id = items.dept_id
	inner join un_co_dept_template_docs docs2 on docs.doc_name = docs2.doc_name
	inner join un_co_dept_template_sections as secs on secs.section_id = items.section_id
	and secs.co_id = items.co_id
	and secs.dept_id = items.dept_id
	inner join un_co_dept_template_sections secs2 on secs.section_desc = secs2.section_desc
	where items.co_id = @sourceCoId
	and items.dept_id = @sourceDeptId
	and docs2.co_id = @targetCoId
	and docs2.dept_id = @targetDeptId
	and secs2.co_id = @targetCoId
	and secs2.dept_id = @targetDeptId;
	
	insert into un_ref_co_dept_hazards(flg_deleted,dept_id,co_id,index_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,category_id,flg_default)
	select un_ref_co_dept_hazards.flg_deleted,@targetDeptId,@targetCoId,un_ref_co_dept_hazards.index_seq,un_ref_co_dept_hazards.name_desc,un_ref_co_dept_hazards.created_by,un_ref_co_dept_hazards.date_created,un_ref_co_dept_hazards.last_amended_by,un_ref_co_dept_hazards.date_last_amended,cats.category_id,un_ref_co_dept_hazards.flg_default
	  from un_ref_co_dept_hazards 
	inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_hazards.category_id
	and un_co_dept_categories.co_id = un_ref_co_dept_hazards.co_id
	and un_co_dept_categories.dept_id = un_ref_co_dept_hazards.dept_id
	inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
	where un_co_dept_categories.co_id = @sourceCoId
	and un_co_dept_categories.dept_id = @sourceDeptId 
	and cats.co_id = @targetCoId
	and cats.dept_id = @targetDeptId
	and cats.category_type = 'H';

	insert into un_ref_co_dept_ppe(flg_deleted,dept_id,co_id,index_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,category_id,flg_default)
	select un_ref_co_dept_ppe.flg_deleted,@targetDeptId,@targetCoId,un_ref_co_dept_ppe.index_seq,un_ref_co_dept_ppe.name_desc,un_ref_co_dept_ppe.created_by,un_ref_co_dept_ppe.date_created,un_ref_co_dept_ppe.last_amended_by,un_ref_co_dept_ppe.date_last_amended,cats.category_id,un_ref_co_dept_ppe.flg_default
	  from un_ref_co_dept_ppe 
	inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_ppe.category_id
	and un_co_dept_categories.co_id = un_ref_co_dept_ppe.co_id
	and un_co_dept_categories.dept_id = un_ref_co_dept_ppe.dept_id
	inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
	where un_co_dept_categories.co_id = @sourceCoId
	and un_co_dept_categories.dept_id = @sourceDeptId 
	and cats.co_id = @targetCoId
	and cats.dept_id = @targetDeptId
	and cats.category_type = 'P';

	insert into un_ref_co_dept_tools(flg_deleted,dept_id,co_id,index_seq,name_desc,created_by,date_created,last_amended_by,date_last_amended,category_id,flg_default)
	select un_ref_co_dept_tools.flg_deleted,@targetDeptId,@targetCoId,un_ref_co_dept_tools.index_seq,un_ref_co_dept_tools.name_desc,un_ref_co_dept_tools.created_by,un_ref_co_dept_tools.date_created,un_ref_co_dept_tools.last_amended_by,un_ref_co_dept_tools.date_last_amended,cats.category_id,un_ref_co_dept_tools.flg_default
	  from un_ref_co_dept_tools 
	inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_tools.category_id
	and un_co_dept_categories.co_id = un_ref_co_dept_tools.co_id
	and un_co_dept_categories.dept_id = un_ref_co_dept_tools.dept_id
	inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
	where un_co_dept_categories.co_id = @sourceCoId
	and un_co_dept_categories.dept_id = @sourceDeptId 
	and cats.co_id = @targetCoId
	and cats.dept_id = @targetDeptId
	and cats.category_type = 'T';


	insert into un_ref_co_dept_suggestions(co_id,dept_id,flg_deleted,category_id,suggestion_text,index_seq,suggestion_type,flg_default)
	select @targetCoId,@targetDeptId,un_ref_co_dept_suggestions.flg_deleted,cats.category_id,un_ref_co_dept_suggestions.suggestion_text,un_ref_co_dept_suggestions.index_seq,un_ref_co_dept_suggestions.suggestion_type,un_ref_co_dept_suggestions.flg_default
	  from un_ref_co_dept_suggestions 
	inner join un_co_dept_categories on un_co_dept_categories.category_id = un_ref_co_dept_suggestions.category_id
	and un_co_dept_categories.co_id = un_ref_co_dept_suggestions.co_id
	and un_co_dept_categories.dept_id = un_ref_co_dept_suggestions.dept_id
	inner join un_co_dept_categories as cats on cats.category_name = un_co_dept_categories.category_name 
	where un_co_dept_categories.co_id = @sourceCoId
	and un_co_dept_categories.dept_id = @sourceDeptId 
	and cats.co_id = @targetCoId
	and cats.dept_id = @targetDeptId

	update un_co_details set flg_show_wizard = 0 where co_id = @targetCoId;

	COMMIT;

END TRY
BEGIN CATCH
  -- Whoops, there was an error
  IF @@TRANCOUNT > 0
     ROLLBACK
 
  -- Raise an error with the details of the exception
  DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int
  SELECT @ErrMsg = ERROR_MESSAGE(),
         @ErrSeverity = ERROR_SEVERITY()
 
  RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH

GO
IF @@ERROR<>0 
Begin
	IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
	INSERT INTO #ErrorLog (errno,errdescr) values(@@ERROR,'Failed to add stored procedure dbo.TransferAll')
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
	
SELECT un_co_user_details.*,un_co_details.co_name_short FROM un_co_user_details 
inner join un_co_details on un_co_details.co_id = un_co_user_details.co_id
WHERE (user_id = SCOPE_IDENTITY())

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


