set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DepartmentOrderSearchCommand] 
@dept_id int,
@site_add varchar(100),
@ord_ref varchar(32),
@client_ref varchar(32),
@from_date varchar(20),
@to_date varchar(20),
@postal_code varchar(9)
AS
BEGIN
Select un_co_dept_ords.sequence,un_co_dept_details.co_name_short as department,un_co_dept_ords.order_ref,un_co_dept_ords.order_sms,
	un_co_dept_ords.order_client_ref,un_co_dept_ords.date_order_created,un_co_dept_ords.address_post_code,
	un_co_dept_ords.date_order_review
from [un_co_dept_ords]
inner join [un_co_dept_details]  on un_co_dept_ords.dept_id = un_co_dept_details.dept_id
where un_co_dept_ords.dept_id =@dept_id
and (@site_add IS null  or un_co_dept_ords.address_full = @site_add)
and (@ord_ref IS null  or un_co_dept_ords.order_ref = @ord_ref)
and (@client_ref IS null  or un_co_dept_ords.order_client_ref = @client_ref)
and (@from_date IS null  or un_co_dept_ords.date_created >= convert(datetime,@from_date,103))
and (@to_date IS null  or un_co_dept_ords.date_created <= dateadd(d,1,convert(datetime,@to_date,103)))
and (@postal_code IS null or un_co_dept_ords.address_post_code = @postal_code)
and un_co_dept_ords.flg_delete = 0
and un_co_dept_ords.flg_cancelled = 0
order by date_order_created desc 
END


