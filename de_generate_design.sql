IF EXISTS( SELECT 'Y' FROM sysobjects WHERE name = 'de_generate_design' AND TYPE = 'P')
BEGIN
	DROP PROC de_generate_design
END
GO
/********************************************************************************/
/* procedure  de_generate_design           */
/* description  Design Generation SP          */
/********************************************************************************/
/* project  Design Engineering            */
/* version                  */
/********************************************************************************/
/* referenced                 */
/* tables                  */
/********************************************************************************/
/* development history               */
/********************************************************************************/
/* author  Giridharan.V             */
/* date   09/ DEC/ 2003             */
/********************************************************************************/
/* modification history               */
/********************************************************************************/
/* modified by : A.G.Senthil kumar            */
/* date  : 23-04-2004              */
/* description : bugid :DEENG203SYS_000012          */
/* modified by : DNR               */
/* date  : 05-05-2004              */
/* description : bugid :DEENG203ACC_000033          */
/*   Modified on      : 07-Mar-2005
Modified By     : Shriram V Bug Id : DEPFSUPPORT_000029
Purpose   : Consolidated Fix for Engineering 2.04 -DE Component   */
/*   Modified on      : 09-Mar-2005
Modified By     : Shriram V Bug Id : DEENG203SYS_000531
Purpose : Customer JNJ Project GAIT ECR MntCompECR Activty:Maintain Components UI: Select Components. Go to Design Generation Tab.
Select all the services in the Multiline. Press Generate Service Tab. We are getting "BT Synonym is getting duplicating within the task.
Change the page prefix and proceed" error.http://ramcovm156/rvw */
/* Modified By     : Arunn for the Bug ID PNR2.0_2241
Purpose : While trying to generate services , we get this error DELETE statement conflicted with TABLE REFERENCE constraint
'de_fw_des_be_placeholder_fkey_de_fw_des_br_logical_parameter'. The conflict occurred in database 'rvw20appdb', table 'de_fw_des_be_placeholder'.
*/
/********************************************************************************* */
/* modified by	   : Balaji S                                                      */
/* date            : 04/07/2005                                                    */
/* description	   : Inserting Non-Integration Methods in History Table			   */
/* BugID		   : PNR2.0_3121												   */
/*******************************************************************************   */
/* modified by	   : Sangeetha L											       */
/* date			   : 18/07/2005                                                    */
/* description     : Invalid primary key violation in table fw_des_service.		   */
/* BugID           : PNR2.0_3277												   */
/*******************************************************************************   */
/* modified by		: Saravana Kumar P                                             */
/* date				: 20/07/2005                                                   */
/* description		: Invalid foreign key violation in table de_fw_des_businessrule */
/* BugID  : PNR2.0_3312             */
/********************************************************************************/
/* modified by      : Balaji S                                                  */
/* date             : 23/08/2005                                                */
/* description      : I failed to generate the service for the following ecr 
"salad_pro_ecr02"   The System throws the following error. "Un specified error" */
/* BugID			: PNR2.0_3630             */
/********************************************************************************/
/* modified by		: Balaji S													*/
/* date				: 11/11/2005												*/
/* description		: Hdr Segment Dataitem is displayed as I/O For Hdr Refresh	*/
/* BugID			: PNR2.0_4566												*/
/********************************************************************************/
/* modification history                                                         */
/* Modified by		: Balaji S for BugId : PNR2.0_4649							*/
/* Modified on		: 22/11/05													*/
/* Description		: Default Value For Date-Time is Date						*/
/********************************************************************************/
/* modification history                                                         */
/* Modified by		: Balaji S for BugId : PNR2.0_4858							*/
/* Modified on		: 02/12/05													*/
/* Description		: AT the time of service generation following error is comming
Cannot insert duplicate key row in object 'de_flowbr_method_map'
with unique index 'de_flowbr_method_map_sysid_index'							*/
/********************************************************************************/
/* modification history                                                         */
/* Modified by		: Balaji S for BugId : PNR2.0_4874							*/
/* Modified on		: 05/12/05													*/
/* Description		: Commenting Previous BugId :  PNR2.0_4858					*/
/********************************************************************************/
/* Modified by		: Kiruthika R												*/
/* Modified on		: 14/12/05													*/
/* Description		: PNR2.0_4926												*/
/********************************************************************************/
/* modified by		: Saravanan kumar P											*/
/* date				: 02-03-2006												*/
/* BugId			: PNR2.0_6784												*/
/********************************************************************************/
/* modified by		: Saravanan kumar P											*/
/* date				: 04-07-2006												*/
/* BugId			: PNR2.0_9286												*/
/********************************************************************************/
/* modified by		: kiruthika R												*/
/* date				: 17-07-2006												*/
/* BugId			: PNR2.0_9500												*/
/********************************************************************************/
/* modified by		: Anuradha M												*/
/* date				: 31-07-2006												*/
/* BugId			: PNR2.0_9737												*/
/********************************************************************************/
/* modified by		: kiruthika R												*/
/* date				: 10-08-2006												*/
/* BugId			: PNR2.0_9871												*/
/********************************************************************************/
/* modified by		: Chanheetha N A											*/
/* date				: 26-Aug-2006												*/
/* BugId			: PNR2.0_10045												*/
/********************************************************************************/
/* modified by		:  Balaji S													*/
/* date				:  10-Nov-2006												*/
/* bug id			:  PNR2.0_10877												*/
/********************************************************************************/
/* modified by		: Chanheetha N A											*/
/* date				: 27-Feb-2007												*/
/* BugId			: PNR2.0_12376												*/
/********************************************************************************/
/* modified by		: Chanheetha N A											*/
/* date				: 18-Apr-2007												*/
/* BugId			: PNR2.0_13288												*/
/********************************************************************************/
/* modified by		: Chanheetha N A											*/
/* date				: 18-Apr-2007												*/
/* BugId			: PNR2.0_13341												*/
/********************************************************************************/
/* modified by		: Kiruthika R												*/
/* date				: 28-May-2007												*/
/* BugId			: PNR2.0_13853												*/
/********************************************************************************/
/* modified by		: Chanheetha N A											*/
/* date				: 30-May-2007												*/
/* BugId			: PNR2.0_13892												*/
/********************************************************************************/
/* modified by		: Chanheetha N A											*/
/* date				: 17-nov-2007												*/
/* BugId			: PNR2.0_16023												*/
/********************************************************************************/
/* modified by		: Saravanan													*/
/* date				: 09-Jan-2008												*/
/* BugId			: PNR2.0_16427												*/
/********************************************************************************/
/* modified by		: Gowrisankar M												*/
/* date				: 02-Apr-2008												*/
/* BugId			: PNR2.0_17463												*/
/* Modificaiton Description  :													*/
/*  Performance tuning for the Insert of table de_fw_req_bterm_synonym */
/********************************************************************************/
/* modified by		: Feroz														*/
/* date				: 25-nov-2008												*/
/* BugId			: PNR2.0_1790												*/
/********************************************************************************/
/* modified by		: Feroz														*/
/* date				: 16-Feb-2009												*/
/* BugId			: PNR2.0_21085												*/
/********************************************************************************/
/* modified by		: Sangeetha G												*/
/* date				: 19-Feb-2009												*/
/* BugId			: PNR2.0_21147												*/
/* Bug Desc			: Error While Generating Services							*/
/*     Violation of PRIMARY KEY constraint 'de_fw_des_ilbo_service_view_datamap_pkey.*/
/************************************************************************************************************/
/* modified by		: Chanheetha N A																		*/
/* date				: 10-Aug-2009																			*/
/* BugId			: PNR2.0_23219																			*/
/* Bug Desc			: System hangs While Generating Services												*/
/************************************************************************************************************/
/* modified by		: Chanheetha N A																		*/
/* date				: 14-Jun-2010																			*/
/* BugId			: PNR2.0_27139																			*/
/* Bug Desc			: System hangs While Generating Services												*/
/************************************************************************************************************/
/* modified by		: Saravanan																				*/
/* date				: 23-Jul-2010																			*/
/* BugId			: PNR2.0_27694																			*/
/* Bug Desc  : Override Option to be made hidden in Specify UI State										*/
/************************************************************************************************************/
/* modified by		: Kanagavel																				*/
/* date				: 12-mar-2014																			*/
/* BugId			: PLF2.0_07805																			*/
/* Bug Desc			: Error While Generating Services														*/
/*     Violation of PRIMARY KEY constraint 'de_fw_des_ilbo_service_view_datamap_pkey.						*/
/************************************************************************************************************/
/* modified by   : Ganesh Prabhu S      																	*/
/* date			 : 10-Sep-2014     																			*/
/* description	 : Code Added to involve tree grid in fetch													*/
/* Primary BugID : PLF2.0_09523																				*/
/************************************************************************************************************/

/* Modified by  : Veena U                                                  */
/* Date         : 25-Feb-2015                                                  */
/* Call ID		: PLF2.0_11499                                                 */
/********************************************************************************/ 
/* Modified by  : Veena U	                                                  */
/* Date         : 07-Aug-2015                                                  */
/* Defect ID	: PLF2.0_14096                                                 */
/********************************************************************************/
/* modified by			Date				Defect ID							*/
/* Veena U				08-Jun-2016			PLF2.0_18487						*/
/********************************************************************************/
/* modified by  : Loganayaki P                                      					*/  
/* date         : OCT 14 2016                                      				*/  
/* BugId        : TECH-218														*/
/********************************************************************************/ 
/* Modified by : Jeya Latha K/Ganesh Prabhu S	for callid TECH-7349				*/
/* Modified on : 14-03-2017				 											*/
/* Description :  New Base Control types RSAssorted, RSPivotGrid, RSTreeGrid and New Feature Organization chart */
/***********************************************************************************/
/* Modified by  : Jeya Latha K	Date: 30-Apr-2018  Defect ID : TECH-20897 */  
/* Modified by  : Jeya Latha K	Date: 01-Nov-2019  Defect ID : TECH-39534 */  
/*******************************************************************************/

CREATE	PROCEDURE de_generate_design
@CTxt_Language  engg_ctxt_language,
@CTxt_Service  engg_ctxt_service,
@CTxt_OUInstance engg_ctxt_ouinstance,
@CTxt_User   engg_ctxt_user,
@customer_name  engg_name,
@project_name  engg_name,
@ico_number   engg_name,
@process_name  engg_name,
@component_name  engg_name,
@activity_name  engg_name,
@ui_name   engg_name,
@page_name   engg_name,
@task_name   engg_name
as
Begin

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NAMING CONVENTIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*                 */
/* Service Name  : COMPONENT_PRFX+[MAINSCREEN]PAGE PRFX+SERVICE IDENTIFIER+TASK PRFX [For Init And Fetch] */
/* Service Name  : COMPONENT_PRFX+PAGE PRFX+SERVICE IDENTIFIER+CONTROL PRFX  [All Other Tasks] */
/* Method Name  : COMPONENT_PRFX+PAGE PRFX+METHOD IDENTIFIER+CONTEXT      */
/* SP Name   : COMPONENT_PRFX+PAGE PRFX+SP IDENTIFIER+CONTEXT       */
/*                 */
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
SET NOCOUNT ON
--DECLARATION PART STARTS
Declare
@merror_id engg_seqno,
@msg    engg_description,
@component_prfx  engg_name,
@page_prfx   engg_name,
@service_idfr  engg_name,
@method_idfr  engg_name,
@sp_idfr   engg_name,
@service_name  engg_name,
@bo_idfr   engg_name,
@hdr_sgmt_idfr  engg_name,
@cb_sgmt_idfr  engg_name,
@cbhdr_sgmt_idfr engg_name,
@mlcb_sgmt_idfr  engg_name,
@ml_sgmt_idfr  engg_name,
@ml_out_sgmt_idfr engg_name,
@mt_prfx   engg_name,
@cb_load_idfr  engg_name,
@cb_def_idfr  engg_name,
@hdr_valid_idfr  engg_name,
@hdr_ref_idfr  engg_name,
@hdr_fet_idfr  engg_name,
@hdr_chk_idfr  engg_name,
@err_chk_idfr  engg_name,
@hdr_save_idfr  engg_name,
@sp_prfx   engg_name,
@rs_prfx   engg_name,
@ps_prfx   engg_name,
@mt_out_idfr  engg_name,
@ps_ref_idfr  engg_name,
@sp_out_idfr  engg_name,
@m_errorid   engg_id,
@activity_id  engg_id,
@hdn_view_tmp  engg_Seqno,
--@ctrl_hdn_page  engg_name,
--@ctrl_hdn_section engg_name,
--@ctrl_hdn_ctrl  engg_name,
--@ctrl_hdn_grd_ctrl engg_name,
@ctrl_hdb_ctrl_id engg_name,
--@ctrl_hdn_ctrl_name engg_name,
@ctrl_hdn_name  engg_name,
@cur_val   engg_description,
@hostname    engg_name,
@getdate   engg_date,
@text    engg_description,
@id     engg_description,
@grid_ctrl_name  engg_name,
@grid_clmn_name  engg_name,
@grid_ctrl_id  engg_name,
@hdr_fetch_req_tmp  engg_name

select  @hostname = host_name(),
@getdate = getdate(),
@id   = newid()


--DECLARATION PART ENDS

Set @activity_id = 0

--VALIDATING IN PARAMETERS
If IsNull(DataLength(@customer_name), 0) = 0
begin
Set @msg = 'Customer name is null.'
exec engg_error_sp 'de_generate_design',
1,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@project_name), 0) = 0
begin
Set @msg = 'Project name is null.'
exec engg_error_sp 'de_generate_design',
2,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@process_name), 0) = 0
begin
Set @msg = 'Process name is null.'
exec engg_error_sp 'de_generate_design',
3,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@component_name), 0) = 0
begin
Set @msg = 'Component name is null.'
exec engg_error_sp 'de_generate_design',
4,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@activity_name), 0) = 0
begin
Set @msg = 'Activity name is null.'
exec engg_error_sp 'de_generate_design',
5,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@ui_name), 0) = 0
begin
Set @msg = 'UI name is null.'
exec engg_error_sp 'de_generate_design',
6,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@page_name), 0) = 0
begin
Set @msg = 'Page name is null.'
exec engg_error_sp 'de_generate_design',
7,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If IsNull(DataLength(@task_name), 0) = 0
begin
Set @msg = 'Task name is null.'
exec engg_error_sp 'de_generate_design',
8,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end

--DELETING TASK SERVICE MAPPING FOR THE TASK
/*
Delete de_task_service_map
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and activity_name = @activity_name
and ui_name  = @ui_name
and task_name = @task_name
*/

--CODE ADDED BY GIRI ON 01/03/2004 TO VALIDATE TASK CONTROL MAPPING
--  If Not Exists ( Select 'A'
--       from de_task_control_map (nolock)
--       where customer_name = @customer_name
--       and  project_name = @project_name
--       and  process_name = @process_name
--       and  component_name = @component_name
--       and  activity_name = @activity_name
--       and  ui_name   = @ui_name
--       and  action_name  = @task_name
--       and  map_flag  = 'Y')
--  begin
--   Set @msg = 'No controls mapped to the task : ' + @task_name + '. Map controls to the task and proceed.'
--   exec engg_error_sp 'de_generate_design',
--      8,
--      @msg,
--      @ctxt_language,
--      @ctxt_ouinstance,
--      @ctxt_service,
--      @ctxt_user,
--      '',
--      '',
--      '',
--      '',
--      @m_errorid output
--   return
--  end

--CODE ADDED BY GIRI ON 05-May-2004 to over come control bt synonym duplication with in UI
update de_task_control_map
set  control_id    = b.control_id,
view_name    = b.view_name,
new_control_bt_synonym = a.control_bt_Synonym
from de_task_control_map  a (nolock),
de_ui_control   b (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.action_name   = @task_name
-- and  a.map_flag    = 'Y'

and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.section_name   = b.section_bt_synonym
and  a.control_bt_synonym = b.control_bt_synonym

--CODE ADDED BY GIRI ON 05-May-2004 to over come control bt synonym duplication with in UI
update de_task_control_map
set  control_id    = b.control_id,
view_name    = b.view_name,
new_control_bt_synonym = a.control_bt_Synonym
from de_task_control_map  a (nolock),
de_ui_grid    b (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.action_name   = @task_name
-- and  a.map_flag    = 'Y'

and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.section_name   = b.section_bt_synonym
and  a.control_bt_synonym = b.column_bt_synonym
--code added by Chanheetha N A for the call id : PNR2.0_10045 on 26-Aug-2006
update de_task_control_map
set  control_id    = b.control_id,
view_name    = b.view_name,
new_control_bt_synonym = a.control_bt_Synonym
from de_task_control_map  a (nolock),
de_hidden_view   b (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.action_name   = @task_name

and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_name
and  a.section_name   = b.section_name
and  a.control_bt_synonym = b.hidden_view_bt_synonym
--code added by Chanheetha N A for the call id : PNR2.0_10045 on 26-Aug-2006


--  Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029
select @text = 'A'
from de_hidden_view    a (nolock),
de_glossary    b (nolock)
where a.customer_name    = @customer_name
and  a.project_name    = @project_name
and  a.process_name    = @process_name
and  a.component_name   = @component_name
and  a.activity_name    = @activity_name
and  a.ui_name     = @ui_name
and  a.customer_name    = b.customer_name
and  a.project_name    = b.project_name
and  a.process_name    = b.process_name
and  a.component_name   = b.component_name
and  a.hidden_view_bt_synonym = b.bt_synonym_name
and  IsNull(b.bt_name, '')  = ''

if @text = 'A'
begin
Set @msg = 'BT Name is not available for some of the Hidden View(s) defined. Please associate Business Term Synonyms'
exec engg_error_sp 'de_generate_design',
9,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end

select @text = ''

select @text = 's'
from de_hidden_view    a (nolock),
de_task_control_map  b (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_name
and  a.section_name   = b.section_name
and  a.control_bt_synonym = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  (isnull(a.control_id,'')= ''
or  isnull(a.view_name,'') = ''
or   isnull(a.new_control_bt_synonym, '') = '')


-- code modified by Ganesh on 20/11/2004 for the bugid:: DEENG203ACC_000114
-- hidden view controlid viewname has to be populate while saving & download of ecr
-- code modified by Ganesh on 29/11/2004 for the bugid:: DEENG203ACC_000114
if @text = 's'
begin

--CODE ADDED BY GIRI ON 05-May-2004 to over come control bt synonym duplication with in UI
--    update de_hidden_view
--    set  control_id    = b.control_id,
--      view_name    = 'h'+b.view_name,
--      new_control_bt_synonym = a.hidden_view_bt_synonym
--    from de_hidden_view   a (nolock),
--      de_ui_control   b (nolock)
--    where a.customer_name   = @customer_name
--    and  a.project_name   = @project_name
--    and  a.process_name   = @process_name
--    and  a.component_name  = @component_name
--    and  a.activity_name   = @activity_name
--    and  a.ui_name    = @ui_name
--   --  and  a.page_name    = @page_name
--    and  a.customer_name   = b.customer_name
--    and  a.project_name   = b.project_name
--    and  a.process_name   = b.process_name
--    and  a.component_name  = b.component_name
--    and  a.activity_name   = b.activity_name
--    and  a.ui_name    = b.ui_name
--    and  a.page_name    = b.page_bt_synonym
--    and  a.section_name   = b.section_bt_synonym
--    and  a.control_bt_synonym = b.control_bt_synonym
--    --  Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029
--    declare  hidd_cur
--    insensitive cursor
--    for
--    Select distinct
--      a.page_name,   a.section_name, b.control_bt_synonym,
--      a.control_bt_synonym, b.control_id, a.hidden_view_bt_synonym
--    from de_hidden_view   a (nolock),
--      de_ui_grid    b (nolock)
--    where a.customer_name   = @customer_name
--    and  a.project_name   = @project_name
--    and  a.process_name   = @process_name
--    and  a.component_name  = @component_name
--    and  a.activity_name   = @activity_name
--    and  a.ui_name    = @ui_name
--    and  a.customer_name   = b.customer_name
--    and  a.project_name   = b.project_name
--    and  a.process_name   = b.process_name
--    and  a.component_name  = b.component_name
--    and  a.activity_name   = b.activity_name
--    and  a.ui_name    = b.ui_name
--    and  a.page_name    = b.page_bt_synonym
--    and  a.section_name   = b.section_bt_synonym
--    and  a.control_bt_synonym = b.column_bt_synonym
--    order by a.page_name,  a.section_name,  b.control_bt_synonym
--
--    open hidd_cur
--
--    set @ctrl_hdn_ctrl_name  = ''
--
--    while 1= 1
--    begin
--
--      fetch next
--      from hidd_cur
--      into @ctrl_hdn_page,
--        @ctrl_hdn_section,
--        @ctrl_hdn_grd_ctrl,
--        @ctrl_hdn_ctrl,
--        @ctrl_hdb_ctrl_id,
--        @ctrl_hdn_name
--
--      if @@fetch_status <> 0
--       break
--
--      if @ctrl_hdn_ctrl_name <> @ctrl_hdn_page+@ctrl_hdn_grd_ctrl
--      begin
--       set  @ctrl_hdn_ctrl_name  = @ctrl_hdn_page+@ctrl_hdn_grd_ctrl
--
--       Select @hdn_view_tmp   = max(convert(int, b.view_name))
--       from de_ui_grid    b (nolock)
--       where b.customer_name   = @customer_name
--       and  b.project_name   = @project_name
--       and  b.process_name   = @process_name
--       and  b.component_name  = @component_name
--       and  b.activity_name   = @activity_name
--       and  b.ui_name    = @ui_name
--        and  b.page_bt_synonym  = @ctrl_hdn_page
--       and  b.section_bt_synonym = @ctrl_hdn_section
--       and  b.control_bt_synonym = @ctrl_hdn_grd_ctrl
--
--       If IsNull(@hdn_view_tmp, 0) = 0
--        Set @hdn_view_tmp   = 0
--      end
--
--      set  @hdn_view_tmp = @hdn_view_tmp + 1
--
--      --CODE ADDED BY GIRI ON 05-May-2004 to over come control bt synonym duplication with in UI
--      update de_hidden_view
--      set  control_id    = @ctrl_hdb_ctrl_id,
--        view_name    = @hdn_view_tmp,
--        new_control_bt_synonym = a.hidden_view_bt_synonym
--      from de_hidden_view   a (nolock)
--      where a.customer_name   = @customer_name
--      and  a.project_name   = @project_name
--      and  a.process_name   = @process_name
--      and  a.component_name  = @component_name
--      and  a.activity_name   = @activity_name
--      and  a.ui_name    = @ui_name
--      and  a.page_name    = @ctrl_hdn_page
--      and  a.section_name   = @ctrl_hdn_section
--      and  a.control_bt_synonym = @ctrl_hdn_ctrl
--      and  a.hidden_view_bt_synonym = @ctrl_hdn_name
--    end
--
--    close  hidd_cur
--    deallocate hidd_cur

-- code modified by Ganesh for the bugid :: PNR2.0_2603 on 30/5/5
-- view name was not updated properly
update de_hidden_view
set  control_id    = b.control_id,
view_name    = 'h'+hidden_view_bt_synonym
--     new_control_bt_synonym = a.hidden_view_bt_synonym
from de_hidden_view   a (nolock),
de_ui_control   b (nolock),
es_comp_ctrl_type_mst c (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.control_bt_synonym = b.control_bt_synonym
and  b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.control_type   = c.ctrl_type_name
and  c.base_ctrl_type  <> 'Grid'

declare  hidd_cur
insensitive cursor
for
Select b.page_bt_synonym,  b.control_bt_synonym
from de_ui_control   b (nolock),
es_comp_ctrl_type_mst c (nolock)
where b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.control_type   = c.ctrl_type_name
and  c.base_ctrl_type  = 'Grid'


open hidd_cur

while 1= 1
begin

fetch next
from hidd_cur
into @page_name, @grid_ctrl_name

if @@fetch_status <> 0
break

set  @hdn_view_tmp = 0

Select @hdn_view_tmp   = max(convert(int, b.view_name))
from de_ui_grid    b (nolock)
where b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.page_bt_synonym  = @page_name
and  b.control_bt_synonym = @grid_ctrl_name
and isnumeric(view_name) = 1 --Code Added for Defect ID : TECH-39534

declare  gird_hdn_view
insensitive cursor
for
Select a.control_id, b.hidden_view_bt_synonym
from de_ui_control   a (nolock),
de_hidden_view   b (nolock),
es_comp_ctrl_type_mst c (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.page_bt_synonym  = @page_name
and  a.control_bt_synonym = @grid_ctrl_name
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_bt_synonym  = b.page_name
and  a.control_bt_synonym = b.control_bt_synonym
and  a.customer_name   = c.customer_name
and  a.project_name   = c.project_name
and  a.process_name   = c.process_name
and  a.component_name  = c.component_name
and  a.control_type   = c.ctrl_type_name
and  c.base_ctrl_type  = 'Grid'

open gird_hdn_view
begin
while 1= 1
begin

fetch next
from gird_hdn_view
into @ctrl_hdb_ctrl_id,
@ctrl_hdn_name

if @@fetch_status <> 0
break

set  @hdn_view_tmp = @hdn_view_tmp + 1

update de_hidden_view
set  control_id    = @ctrl_hdb_ctrl_id,
view_name    = @hdn_view_tmp
--       new_control_bt_synonym = @ctrl_hdn_name
from de_hidden_view   a (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.page_name    = @page_name
and  a.control_bt_synonym = @grid_ctrl_name
and  a.hidden_view_bt_synonym= @ctrl_hdn_name
end

close  gird_hdn_view
deallocate gird_hdn_view

end


set @ctrl_hdn_name = ''

declare  gird_ctrl_hdn_view
insensitive cursor
for
Select b.control_bt_synonym, a.control_id, b.hidden_view_bt_synonym
from de_ui_grid    a (nolock),
de_hidden_view   b (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name  = @activity_name
and  a.ui_name    = @ui_name
and  a.page_bt_synonym  = @page_name
and  a.control_bt_synonym = @grid_ctrl_name
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_bt_synonym  = b.page_name
and  a.column_bt_synonym  = b.control_bt_synonym

open gird_ctrl_hdn_view

while 1= 1
begin

fetch next
from gird_ctrl_hdn_view
into @grid_clmn_name, @grid_ctrl_id, @ctrl_hdn_name

if @@fetch_status <> 0
break

set  @hdn_view_tmp = @hdn_view_tmp + 1

update de_hidden_view
set  control_id    = @grid_ctrl_id,
view_name    = @hdn_view_tmp
--       new_control_bt_synonym = a.hidden_view_bt_synonym
from de_hidden_view   a (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.page_name    = @page_name
and  a.control_bt_synonym = @grid_clmn_name
and  a.hidden_view_bt_synonym= @ctrl_hdn_name

end

close  gird_ctrl_hdn_view
deallocate gird_ctrl_hdn_view

end

close  hidd_cur
deallocate hidd_cur

update a
set  controlid   = b.control_id,
viewname   = b.view_name
from de_fw_des_ilbo_service_view_datamap   a (nolock),
de_hidden_view       b (nolock)
where a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ilbocode   = b.ui_name
and  a.page_bt_synonym = b.page_name
and  a.control_bt_synonym= b.new_control_bt_synonym
and  a.customer_name  = @customer_name
and  a.project_name  = @project_name
and  a.process_name  = @process_name
and  a.component_name = @component_name
and  a.activity_name  = @activity_name
and  a.ilbocode   = @ui_name

end -- end of chk for controlid & viewname null for hidden view

--GETTING THE PREFIXES
EXEC de_get_prefixes  @Ctxt_Language,
@Ctxt_Service,
@Ctxt_OUInstance,
@Ctxt_User,
@customer_name,
@project_name,
@ico_number,
@process_name,
@component_name,
@activity_name,
@ui_name,
@page_name,
@component_prfx  OUTPUT,
@page_prfx  OUTPUT,
@service_idfr  OUTPUT,
@method_idfr  OUTPUT,
@sp_idfr  OUTPUT,
@bo_idfr  output,
@hdr_sgmt_idfr  output,
@cb_sgmt_idfr  output,
@cbhdr_sgmt_idfr output,
@mlcb_sgmt_idfr  output,
@ml_sgmt_idfr  output,
@ml_out_sgmt_idfr output,
@mt_prfx  output,
@cb_load_idfr  output,
@cb_def_idfr  output,
@hdr_valid_idfr  output,
@hdr_ref_idfr  output,
@hdr_fet_idfr  output,
@hdr_chk_idfr  output,
@err_chk_idfr  output,
@hdr_save_idfr  output,
@sp_prfx  output,
@rs_prfx  output,
@ps_prfx  output,
@mt_out_idfr  output,
@ps_ref_idfr  output,
@sp_out_idfr  output

Select @component_prfx  = IsNull(@component_prfx, '')
Select @page_prfx  = IsNull(@page_prfx, '')
Select @service_idfr  = IsNull(@service_idfr, '')
Select @method_idfr  = IsNull(@method_idfr, '')
Select @sp_idfr  = IsNull(@sp_idfr, '')

Select @component_prfx  = LTRIM(RTRIM(@component_prfx))
Select @page_prfx  = LTRIM(RTRIM(@page_prfx))
Select @service_idfr  = LTRIM(RTRIM(@service_idfr))
Select @method_idfr  = LTRIM(RTRIM(@method_idfr))
Select @sp_idfr  = LTRIM(RTRIM(@sp_idfr))

--VALIDATING PREFIXES
If @component_prfx  = ''
begin
Set @msg = 'Unable to Identify Component Prefix.'
exec engg_error_sp 'de_generate_design',
9,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If @page_prfx   = ''
begin
Set @msg = 'Unable to Identify Page Prefix.'
exec engg_error_sp 'de_generate_design',
10,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If @service_idfr  = ''
begin
Set @msg = 'Unable to Identify Service Identifier.'
exec engg_error_sp 'de_generate_design',
11,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
If @method_idfr   = ''
begin
Set @msg = 'Unable to Identify Method Identifier.'
exec engg_error_sp 'de_generate_design',
12,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end

If @sp_idfr   = ''
begin
Set @msg = 'Unable to Identify SP Identifier.'
exec engg_error_sp 'de_generate_design',
13,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end

--  --UPDATING MAP_TO_MULTILINE COLUMN IN TASK CONTROL MAPPING TABLE
Update de_task_control_map
Set  map_ml_flag  = 'Y'
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  activity_name = @activity_name
and  ui_name   = @ui_name
and  action_name  = @task_name
and  map_ml_flag  Is Null

--ADDED BY GIRI ON 05-MAY-2004
update de_task_control_map
set  new_control_bt_synonym = replace(b.page_prefix, '_', '') + '_' + control_bt_synonym
from de_task_control_map  a (nolock),
de_ui_page    b (nolock)
where a.customer_name  = @customer_name
and  a.project_name  = @project_name
and  a.process_name  = @process_name
and  a.component_name  = @component_name
and  a.activity_name  = @activity_name
and  a.ui_name    = @ui_name
and  a.action_name   = @task_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   = b.ui_name
and  a.page_name   = b.page_bt_synonym
and  a.component_name+a.activity_name+a.ui_name+a.control_bt_synonym+a.action_name in(
select component_name+activity_name+ui_name+control_bt_synonym+action_name
from de_task_control_map (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
and  action_name   = @task_name
group by component_name, activity_name, ui_name, control_bt_synonym, action_name
having count(*) > 1)

--code modified for bugid:PNR2.0_9500
Update d
--set d.new_control_bt_synonym = replace(b.page_prefix, '_', '') + '_' + d.control_bt_synonym
--code modified for bugid:PNR2.0_9871
set d.new_control_bt_synonym = replace(b.page_prefix, '_', '') + '_' + d.hidden_view_bt_synonym
from de_hidden_view_usage a (nolock),
de_ui_page  b (nolock),
de_hidden_view  d (nolock)
where a.customer_name  = @customer_name
and  a.project_name  = @project_name
and  a.process_name  = @process_name
and  a.component_name = @component_name
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name
and  a.action_name  = @task_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and    a.component_name = b.component_name
and    a.activity_name  = b.activity_name
and    a.ui_name   = b.ui_name
--and    a.page_name   = b.page_bt_synonym
and    a.control_page_name  = b.page_bt_synonym

and  a.customer_name  = d.customer_name
and  a.project_name  = d.project_name
and  a.process_name  = d.process_name
and    a.component_name = d.component_name
and    a.activity_name  = d.activity_name
and    a.ui_name   = d.ui_name
-- code modified by Anuradha M on 31-jul-2006 for the Bug Id :: PNR2.0_9737
--  and    a.page_name   = d.page_name
and     a.control_page_name   = d.page_name
and    a.control_bt_sysnonym = d.control_bt_synonym
and  a.hidden_view_bt_sysnonym= d.hidden_view_bt_synonym
and   exists (Select 'x' from  de_task_control_map  c (nolock)
where a.customer_name  = c.customer_name
and  a.project_name  = c.project_name
and  a.process_name  = c.process_name
and  a.component_name = c.component_name
and  a.activity_name  = c.activity_name
and  a.ui_name  = c.ui_name
and  a.control_page_name <> c.page_name
-- code modified by Anuradha M on 31-jul-2006 for the Bug Id :: PNR2.0_9737
-- code modified by Anuradha M on 01-Aug-2006 for the Bug Id :: PNR2.0_9737
and   a.hidden_view_bt_sysnonym = c.control_bt_synonym
--      and    a.hidden_view_bt_sysnonym = c.new_control_bt_synonym
and  a.action_name  = c.action_name)
and   not exists (Select 'x' from  de_task_control_map  c (nolock)
where  a.customer_name  = c.customer_name
and a.project_name   = c.project_name
and a.process_name   = c.process_name
and a.component_name  = c.component_name
and a.activity_name   = c.activity_name
and a.ui_name    = c.ui_name
and a.control_page_name  = c.page_name
-- code modified by Anuradha M on 31-jul-2006 for the Bug Id :: PNR2.0_9737
-- code modified by Anuradha M on 01-Aug-2006 for the Bug Id :: PNR2.0_9737
and  a.hidden_view_bt_sysnonym  = c.control_bt_synonym
--       and   a.hidden_view_bt_sysnonym  = c.new_control_bt_synonym
and a.action_name   = c.action_name)

-- Code Added by Ganesh on 9/9/04 for the bugid::DEENG203ACC_000104

set @text=''
select  @text='s'
from de_task_control_map (nolock)
where customer_name    = @customer_name
and  project_name    = @project_name
and  process_name    = @process_name
and  component_name    = @component_name
and  activity_name    = @activity_name
and  ui_name      = @ui_name
and  action_name     = @task_name
and  len(new_control_bt_synonym) > 30
-- Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029
/* If exists ( select 's'
from de_task_control_map (nolock)
where customer_name    = @customer_name
and  project_name    = @project_name
and  process_name    = @process_name
and  component_name    = @component_name
and  activity_name    = @activity_name
and  ui_name      = @ui_name
and  action_name     = @task_name
and  len(new_control_bt_synonym) > 30) */
if @text='s'
begin
update a
set  new_control_bt_synonym  = left (replace(b.page_prefix, '_', '') + '_' +
replace(control_prefix ,'_','') + '_' +
c.control_bt_synonym, 29)
from de_task_control_map  a (nolock),
de_ui_page    b (nolock),
de_ui_control   c (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.action_name   = @task_name
and  len(a.new_control_bt_synonym)> 30
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.customer_name   = c.customer_name
and  a.project_name   = c.project_name
and  a.process_name   = c.process_name
and  a.component_name  = c.component_name
and  a.activity_name   = c.activity_name
and  a.ui_name    = c.ui_name
and  a.page_name    = c.page_bt_synonym
and  a.section_name   = c.section_bt_synonym
and  a.control_bt_synonym = c.control_bt_synonym

update a
set  new_control_bt_synonym  = left (replace(b.page_prefix, '_', '') + '_' +
replace(column_prefix ,'_','') + '_' +
column_bt_synonym, 29)
from de_task_control_map  a (nolock),
de_ui_page    b (nolock),
de_ui_grid    c (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.action_name   = @task_name
and  len(a.new_control_bt_synonym)> 30
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.customer_name   = c.customer_name
and  a.project_name   = c.project_name
and  a.process_name   = c.process_name
and  a.component_name  = c.component_name
and  a.activity_name   = c.activity_name
and  a.ui_name    = c.ui_name
and  a.page_name    = c.page_bt_synonym
and  a.section_name   = c.section_bt_synonym
and  a.control_bt_synonym = c.column_bt_synonym

end

--  Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029
set @text=''
select  @text= 's'
from de_task_control_map (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
and  action_name   = @task_name
--modified by Shriram V on 09/03/04 for Bug Id :DEENG203SYS_000531
and new_control_bt_synonym is not null
--  modified by Shriram V on 09/03/04 for Bug Id :DEENG203SYS_000531
group by component_name, activity_name, ui_name, new_control_bt_synonym, action_name
having count(*) > 1
/*if exists(
select distinct 's'
from de_task_control_map (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
and  action_name   = @task_name
group by component_name, activity_name, ui_name, new_control_bt_synonym, action_name
having count(*) > 1) */

if @text='s'
begin
Set @msg = 'BT Synonym is getting duplicating within the task. Change the page prefix and proceed'
exec engg_error_sp 'de_generate_design',
12,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
--  Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029
-- code added by Ganesh on 28/10/04 to update the btname for the new_bt_synonym
-- for the control where the btname is changed
--  Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029
set  @text=''
select  @text = 's'
from de_task_control_map  b (nolock)
where b.customer_name   = @customer_name
and b.project_name   = @project_name
and b.process_name   = @process_name
and b.component_name  = @component_name
and b.activity_name   = @activity_name
and b.ui_name   = @ui_name
and b.action_name   = @task_name
and new_control_bt_synonym   <> control_bt_synonym

/*if exists ( select  distinct 's'
from de_task_control_map  b (nolock)
where b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  new_control_bt_synonym  <> control_bt_synonym )*/
if @text='s'
begin
update c
set  c.data_type    = a.data_type,
c.length    = a.length,
c.bt_name    = a.bt_name,
c.modifiedby   = A.modifiedby,
c.modifieddate   = @getdate
from de_glossary    a (nolock),
de_task_control_map  b (nolock),
de_glossary    c (nolock)
where b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.new_control_bt_synonym= c.bt_synonym_name
and  c.ref_bt_synonym_name = b.control_bt_synonym
and  b.new_control_bt_synonym<>b.control_bt_synonym

and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym

and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
end
--  Modified By : Shriram V on 07/03/05 for Bug Id : DEPFSUPPORT_000029

--INSERTING NEW SYNONYMS INTO GLOSSARY MASTER
Insert into de_glossary(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status,ecrno)--chan
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    b.new_control_bt_synonym,   a.data_type,
a.length,     b.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     b.control_bt_synonym,
a.bt_synonym_doc,   a.bt_name,     a.synonym_status, @ico_number --chan
from de_glossary    a (nolock),
de_task_control_map  b (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  b.new_control_bt_synonym<>b.control_bt_synonym
and   not exists (select 'x'
from de_glossary  c (nolock)
				  where  b.customer_name		  = c.customer_name
					and  b.project_name			  = c.project_name
					and  b.process_name			  = c.process_name
					and  b.component_name         = c.component_name
					and  b.new_control_bt_synonym = c.bt_synonym_name)
union---attributemap change kiruthika
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    a.new_control_bt_synonym,   b.data_type,
b.length,     a.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     a.control_bt_synonym,
a.control_bt_synonym,   a.btname,     'R', @ico_number
from de_task_control_attributemap    a (nolock),
     de_business_term                b (nolock)
where a.customer_name    = @customer_name
and   a.project_name     = @project_name
and   a.process_name     = @process_name
and   a.component_name   = @component_name
and   a.activity_name    = @activity_name
and   a.ui_name          = @ui_name
and   a.action_name      = @task_name
and   a.customer_name    = b.customer_name
and   a.project_name     = b.project_name
and   a.process_name     = b.process_name
and   a.component_name   = b.component_name
and   a.btname           = b.bt_name
and   not exists (select 'x'
				  from   de_glossary  c(nolock)
				  where  a.customer_name		  = c.customer_name
					and  a.project_name			  = c.project_name
					and  a.process_name			  = c.process_name
					and  a.component_name         = c.component_name
					and  a.new_control_bt_synonym = c.bt_synonym_name)

Insert into re_glossary(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status,rcnno)--chan
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    b.new_control_bt_synonym, a.data_type,
a.length,     b.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     b.control_bt_synonym,
a.bt_synonym_doc,   a.bt_name,     a.synonym_status,@ico_number --chan
from de_glossary    a (nolock),
de_task_control_map  b (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  b.new_control_bt_synonym<>b.control_bt_synonym
and   not exists (select 'x'
from re_glossary  c (nolock)
				  where  b.customer_name		  = c.customer_name
					and  b.project_name			  = c.project_name
					and  b.process_name			  = c.process_name
					and  b.component_name         = c.component_name
					and  b.new_control_bt_synonym = c.bt_synonym_name)
union---attributemap change kiruthika
select  a.customer_name, a.project_name,    a.component_name,
a.process_name,    a.new_control_bt_synonym, b.data_type,
b.length,     a.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     a.control_bt_synonym,
a.control_bt_synonym,   a.btname,     'R',@ico_number
from de_task_control_attributemap    a (nolock),
     de_business_term                b (nolock)
where a.customer_name    = @customer_name
and   a.project_name     = @project_name
and   a.process_name     = @process_name
and   a.component_name   = @component_name
and   a.activity_name    = @activity_name
and   a.ui_name          = @ui_name
and   a.action_name      = @task_name
and   a.customer_name    = b.customer_name
and   a.project_name     = b.project_name
and   a.process_name     = b.process_name
and   a.component_name   = b.component_name
and   a.btname           = b.bt_name
and   not exists (select 'x'
				  from   re_glossary  c(nolock)
				  where  a.customer_name		  = c.customer_name
					and  a.project_name			  = c.project_name
					and  a.process_name			  = c.process_name
					and  a.component_name         = c.component_name
					and  a.new_control_bt_synonym = c.bt_synonym_name)


/*Insert into re_published_glossary(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status,
ecr_no)
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    b.new_control_bt_synonym, a.data_type,
a.length,     b.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     b.control_bt_synonym,
a.bt_synonym_doc,   a.bt_name,     a.synonym_status,
c.ecr_no
from de_glossary    a (nolock),
de_task_control_map  b (nolock),
re_ui_ecr     c (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  b.new_control_bt_synonym<>b.control_bt_synonym
and  b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.activity_name   = c.activity_name
and  b.ui_name    = c.ui_name
and  a.customer_name+a.project_name+a.process_name+a.component_name+b.new_control_bt_synonym not in (
Select customer_name+project_name+process_name+component_name+bt_synonym_name
from re_published_glossary  d (nolock)
where a.customer_name   = d.customer_name
and  a.project_name   = d.project_name
and  a.process_name   = d.process_name
and  a.component_name  = d.component_name
and  c.ecr_no    = d.ecr_no)*/

Insert into ep_component_glossary_mst(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status,
req_no,wrkreqno)
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    b.new_control_bt_synonym, a.data_type,
a.length,     b.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     b.control_bt_synonym,
a.bt_synonym_doc,   a.bt_name,     a.synonym_status,
'BASE', @ico_number --chan
from de_glossary    a (nolock),
de_task_control_map  b (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  b.new_control_bt_synonym<>b.control_bt_synonym
and   not exists (select 'x'
from ep_component_glossary_mst d (nolock)
				  where  b.customer_name		  = d.customer_name
					and  b.project_name			  = d.project_name
					and  b.process_name			  = d.process_name
					and  b.component_name         = d.component_name
					and  b.new_control_bt_synonym = d.bt_synonym_name)
union---attributemap change kiruthika
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    a.new_control_bt_synonym, b.data_type,
b.length,     a.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     a.control_bt_synonym,
a.control_bt_synonym,   a.btname,     'R',
'BASE', @ico_number 
from de_task_control_attributemap    a (nolock),
     de_business_term                b (nolock)
where a.customer_name    = @customer_name
and   a.project_name     = @project_name
and   a.process_name     = @process_name
and   a.component_name   = @component_name
and   a.activity_name    = @activity_name
and   a.ui_name          = @ui_name
and   a.action_name      = @task_name
and   a.customer_name    = b.customer_name
and   a.project_name     = b.project_name
and   a.process_name     = b.process_name
and   a.component_name   = b.component_name
and   a.btname           = b.bt_name
and   not exists (select 'x'
				  from   ep_component_glossary_mst  c(nolock)
				  where  a.customer_name		  = c.customer_name
					and  a.project_name			  = c.project_name
					and  a.process_name			  = c.process_name
					and  a.component_name         = c.component_name
					and  a.new_control_bt_synonym = c.bt_synonym_name)
if exists( select 'x' from sysobjects (nolock) where name = 'de_customer_space' and type ='u')
begin 

Insert into ep_published_comp_glossary_mst(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status,
req_no)
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    b.new_control_bt_synonym, a.data_type,
a.length,     b.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     b.control_bt_synonym,
a.bt_synonym_doc,   a.bt_name,     a.synonym_status,
c.req_no
from de_glossary    a (nolock),
de_task_control_map  b (nolock),
ep_ui_req_dtl   c (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  b.new_control_bt_synonym<>b.control_bt_synonym
and  b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.activity_name   = c.activity_name
and  b.ui_name    = c.ui_name
and  b.ecrno      =c.req_no
and  a.customer_name+a.project_name+a.process_name+a.component_name+b.new_control_bt_synonym not in (
Select customer_name+project_name+process_name+component_name+bt_synonym_name
from ep_published_comp_glossary_mst d (nolock)
where a.customer_name   = d.customer_name
and  a.project_name   = d.project_name
and  a.process_name   = d.process_name
and  a.component_name  = d.component_name
and  c.req_no    = d.req_no)
end
else
begin
Insert into ep_published_comp_glossary_mst(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status,
req_no)
select distinct a.customer_name, a.project_name,    a.component_name,
a.process_name,    b.new_control_bt_synonym, a.data_type,
a.length,     b.new_control_bt_synonym, '',
a.timestamp,    @ctxt_user,     @getdate,
@ctxt_user,     @getdate,     b.control_bt_synonym,
a.bt_synonym_doc,   a.bt_name,     a.synonym_status,
c.req_no
from de_glossary    a (nolock),
de_task_control_map  b (nolock),
ep_ui_req_dtl   c (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.control_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.action_name   = @task_name
and  b.new_control_bt_synonym<>b.control_bt_synonym
and  b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.activity_name   = c.activity_name
and  b.ui_name    = c.ui_name
and  a.customer_name+a.project_name+a.process_name+a.component_name+b.new_control_bt_synonym not in (
Select customer_name+project_name+process_name+component_name+bt_synonym_name
from ep_published_comp_glossary_mst d (nolock)
where a.customer_name   = d.customer_name
and  a.project_name   = d.project_name
and  a.process_name   = d.process_name
and  a.component_name  = d.component_name
and  c.req_no    = d.req_no)
end

--attributemap changes kiruthika
--insert into de_glossary_lng_extn(customer_name,project_name,process_name,
--component_name,bt_synonym_name,data_type,length,bt_synonym_caption,
--glossary_sysid,languageid,timestamp,createdby,createddate,modifiedby,
--modifieddate,ref_bt_synonym_name,bt_synonym_doc,bt_name,synonym_status,
--singleinst_sample_data,multiinst_sample_data,ecrno)
--select distinct a.customer_name, a.project_name,    a.process_name,
--a.component_name,    a.new_control_bt_synonym,   b.data_type,
--b.length,     a.new_control_bt_synonym, '',d.quick_code,
--a.timestamp,    @ctxt_user,     @getdate,
--@ctxt_user,     @getdate,     a.control_bt_synonym,
--a.control_bt_synonym,   a.btname,     'R',null,null, @ico_number
--from de_task_control_attributemap    a (nolock),
--     de_business_term                b (nolock),
--	 ep_language_met                 d (nolock)
--where a.customer_name    = @customer_name
--and   a.project_name     = @project_name
--and   a.process_name     = @process_name
--and   a.component_name   = @component_name
--and   a.activity_name    = @activity_name
--and   a.ui_name          = @ui_name
--and   a.action_name      = @task_name
--and   a.customer_name    = b.customer_name
--and   a.project_name     = b.project_name
--and   a.process_name     = b.process_name
--and   a.component_name   = b.component_name
--and   a.btname           = b.bt_name
--and   d.quick_code_type  = 'language_code'
--and   not exists (select 'x'
--				  from   de_glossary_lng_extn  c(nolock)
--				  where  a.customer_name		  = c.customer_name
--					and  a.project_name			  = c.project_name
--					and  a.process_name			  = c.process_name
--					and  a.component_name         = c.component_name
--					and  a.new_control_bt_synonym = c.bt_synonym_name
--					and  d.quick_code             = c.languageid)

--insert into re_glossary_lng_extn(customer_name,project_name,process_name,
--component_name,bt_synonym_name,data_type,length,bt_synonym_caption,
--glossary_sysid,languageid,timestamp,createdby,createddate,
--modifiedby,modifieddate,ref_bt_synonym_name,bt_synonym_doc,
--bt_name,synonym_status,singleinst_sample_data,multiinst_sample_data,rcnno)
--select distinct a.customer_name, a.project_name,    a.process_name,
--a.component_name,    a.new_control_bt_synonym,   b.data_type,
--b.length,     a.new_control_bt_synonym, '',d.quick_code,
--a.timestamp,    @ctxt_user,     @getdate,
--@ctxt_user,     @getdate,     a.control_bt_synonym,
--a.control_bt_synonym,   a.btname,     'R',null,null, @ico_number
--from de_task_control_attributemap    a (nolock),
--     de_business_term                b (nolock),
--	 ep_language_met                 d (nolock)
--where a.customer_name    = @customer_name
--and   a.project_name     = @project_name
--and   a.process_name     = @process_name
--and   a.component_name   = @component_name
--and   a.activity_name    = @activity_name
--and   a.ui_name          = @ui_name
--and   a.action_name      = @task_name
--and   a.customer_name    = b.customer_name
--and   a.project_name     = b.project_name
--and   a.process_name     = b.process_name
--and   a.component_name   = b.component_name
--and   a.btname           = b.bt_name
--and   d.quick_code_type  = 'language_code'
--and   not exists (select 'x'
--				  from   re_glossary_lng_extn  c(nolock)
--				  where  a.customer_name		  = c.customer_name
--					and  a.project_name			  = c.project_name
--					and  a.process_name			  = c.process_name
--					and  a.component_name         = c.component_name
--					and  a.new_control_bt_synonym = c.bt_synonym_name
--					and  d.quick_code             = c.languageid)

--insert into ep_component_glossary_mst_lng_extn(customer_name,project_name,req_no,
--process_name,component_name,bt_synonym_name,data_type,length,bt_synonym_caption,
--glossary_sysid,languageid,timestamp,createdby,createddate,modifiedby,modifieddate,
--ref_bt_synonym_name,bt_synonym_doc,bt_name,synonym_status,singleinst_sample_data,
--multiinst_sample_data,wrkreqno)
--select distinct a.customer_name, a.project_name, 'base',   a.process_name,
--a.component_name,    a.new_control_bt_synonym,   b.data_type,
--b.length,     a.new_control_bt_synonym, '',d.quick_code,
--a.timestamp,    @ctxt_user,     @getdate,
--@ctxt_user,     @getdate,     a.control_bt_synonym,
--a.control_bt_synonym,   a.btname,     'R',null,null, @ico_number
--from de_task_control_attributemap    a (nolock),
--     de_business_term                b (nolock),
--	 ep_language_met                 d (nolock)
--where a.customer_name    = @customer_name
--and   a.project_name     = @project_name
--and   a.process_name     = @process_name
--and   a.component_name   = @component_name
--and   a.activity_name    = @activity_name
--and   a.ui_name          = @ui_name
--and   a.action_name      = @task_name
--and   a.customer_name    = b.customer_name
--and   a.project_name     = b.project_name
--and   a.process_name     = b.process_name
--and   a.component_name   = b.component_name
--and   a.btname           = b.bt_name
--and   d.quick_code_type  = 'language_code'
--and   not exists (select 'x'
--				  from   ep_component_glossary_mst_lng_extn  c(nolock)
--				  where  a.customer_name		  = c.customer_name
--					and  a.project_name			  = c.project_name
--					and  a.process_name			  = c.process_name
--					and  a.component_name         = c.component_name
--					and  a.new_control_bt_synonym = c.bt_synonym_name
--					and  d.quick_code             = c.languageid)
------------------------For Parent and Current Context Information
-------------------For Parent Context and Current Context Information
	if exists (	Select 'x' from es_comp_task_type_mst tsk (nolock),
				de_action	act(nolock)
				where	act.customer_name				= tsk.customer_name
				and		act.project_name				= tsk.project_name
				and		act.process_name				= tsk.process_name
				and		act.component_name				= tsk.component_name
				and		act.task_name					= @task_name
				and		act.task_pattern				= tsk.task_type_name
				and		act.customer_name				= @customer_name
				and		act.project_name				= @project_name
				and		act.process_name				= @process_name
				and		act.component_name				= @component_name
				and		tsk.ParentContextInformation	= 'Y'
				)			
	Begin
	
		If not exists(Select 'x' from de_business_term (nolock)
						where customer_name  = @customer_name
						and   project_name	 = @project_name
						and   process_name	 = @process_name
						and   component_name = @component_name
						and   bt_name		= 'engg_name')
		begin
			Insert into de_business_term
				(customer_name,		project_name,		process_name,
				component_name,		bt_name,			bt_descr,
				data_type,			bt_sysid,			timestamp,
				createdby,			createddate,		modifiedby,
				modifieddate,		length,				precision_type,		ecrno)
			values
				(@customer_name,   @project_name,		@process_name,
				@component_name,   'engg_name',			'engg_name',
				'Char',				newid(),			1,
				@hostname,			@getdate,			@hostname,
				@getdate,			60,					null,				@ico_number )
		end
		If not exists (Select 'x' from DE_GLOSSARY (nolock)
						where customer_name  = @customer_name
						and   project_name   = @project_name
						and   process_name  = @process_name
						and   component_name  = @component_name
						and   bt_synonym_name = 'rvwrt_cctxt_pactivity')
		begin
			Insert into de_glossary
				(customer_name,			project_name,				process_name,
				component_name,			bt_synonym_name,			data_type,
				length,					bt_synonym_caption,			glossary_sysid,
				timestamp,				createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,
				bt_synonym_doc,			bt_name,					synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,
				@component_name,		'rvwrt_cctxt_pactivity',    'Char',
				60,						'rvwrt_cctxt_pactivity',    newid(),
				1,						@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',
				'rvwrt_cctxt_pactivity','engg_name',				'U',						@ico_number )
		end

		If not exists (Select 'x' from DE_GLOSSARY (nolock)
						where customer_name  = @customer_name
						and   project_name   = @project_name
						and   process_name  = @process_name
						and   component_name  = @component_name
						and   bt_synonym_name = 'rvwrt_cctxt_pcomponent')
		begin
			Insert into de_glossary
				(customer_name,			project_name,				process_name,
				component_name,			bt_synonym_name,			data_type,
				length,					bt_synonym_caption,			glossary_sysid,
				timestamp,				createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,
				bt_synonym_doc,			bt_name,					synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,
				@component_name,		'rvwrt_cctxt_pcomponent',   'Char',
				60,						'rvwrt_cctxt_pcomponent',   newid(),
				1,						@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',
				'rvwrt_cctxt_pcomponent','engg_name',				'U',						@ico_number )
		end

		
		If not exists (Select 'x' from DE_GLOSSARY (nolock)
						where customer_name  = @customer_name
						and   project_name   = @project_name
						and   process_name  = @process_name
						and   component_name  = @component_name
						and   bt_synonym_name = 'rvwrt_cctxt_pilbo')
		begin
			Insert into de_glossary
				(customer_name,			project_name,				process_name,
				component_name,			bt_synonym_name,			data_type,
				length,					bt_synonym_caption,			glossary_sysid,
				timestamp,				createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,
				bt_synonym_doc,			bt_name,					synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,
				@component_name,		'rvwrt_cctxt_pilbo',		'Char',
				60,						'rvwrt_cctxt_pilbo',		newid(),
				1,						@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',
				'rvwrt_cctxt_pilbo',	'engg_name',				'U',						@ico_number )
		end

	End
	
	if exists (	Select 'x' from es_comp_task_type_mst tsk (nolock),
				de_action	act(nolock)
				where	act.customer_name				= tsk.customer_name
				and		act.project_name				= tsk.project_name
				and		act.process_name				= tsk.process_name
				and		act.component_name				= tsk.component_name
				and		act.task_name					= @task_name
				and		act.task_pattern				= tsk.task_type_name
				and		act.customer_name				= @customer_name
				and		act.project_name				= @project_name
				and		act.process_name				= @process_name
				and		act.component_name				= @component_name
				and		tsk.CurrentContextInformation	= 'Y'
				)			
				
	Begin
		If not exists(Select 'x' from de_business_term (nolock)
						where customer_name  = @customer_name
						and   project_name	 = @project_name
						and   process_name	 = @process_name
						and   component_name = @component_name
						and   bt_name		= 'engg_name')
		begin
			Insert into de_business_term
				(customer_name,		project_name,		process_name,
				component_name,		bt_name,			bt_descr,
				data_type,			bt_sysid,			timestamp,
				createdby,			createddate,		modifiedby,
				modifieddate,		length,				precision_type,		ecrno)
			values
				(@customer_name,   @project_name,		@process_name,
				@component_name,   'engg_name',			'engg_name',
				'Char',				newid(),			1,
				@hostname,			@getdate,			@hostname,
				@getdate,			60,					null,				@ico_number )
		end
		If not exists (Select 'x' from DE_GLOSSARY (nolock)
						where customer_name  = @customer_name
						and   project_name   = @project_name
						and   process_name  = @process_name
						and   component_name  = @component_name
						and   bt_synonym_name = 'rvwrt_cctxt_activity')
		begin
			Insert into de_glossary
				(customer_name,			project_name,				process_name,
				component_name,			bt_synonym_name,			data_type,
				length,					bt_synonym_caption,			glossary_sysid,
				timestamp,				createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,
				bt_synonym_doc,			bt_name,					synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,
				@component_name,		'rvwrt_cctxt_activity',    'Char',
				60,						'rvwrt_cctxt_activity',    newid(),
				1,						@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',
				'rvwrt_cctxt_activity','engg_name',				'U',						@ico_number )
		end
		If not exists (Select 'x' from DE_GLOSSARY (nolock)
						where customer_name  = @customer_name
						and   project_name   = @project_name
						and   process_name  = @process_name
						and   component_name  = @component_name
						and   bt_synonym_name = 'rvwrt_cctxt_component')
		begin
			Insert into de_glossary
				(customer_name,			project_name,				process_name,
				component_name,			bt_synonym_name,			data_type,
				length,					bt_synonym_caption,			glossary_sysid,
				timestamp,				createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,
				bt_synonym_doc,			bt_name,					synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,
				@component_name,		'rvwrt_cctxt_component',   'Char',
				60,						'rvwrt_cctxt_component',   newid(),
				1,						@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',
				'rvwrt_cctxt_component','engg_name',				'U',						@ico_number )
		end
		If not exists (Select 'x' from DE_GLOSSARY (nolock)
						where customer_name  = @customer_name
						and   project_name   = @project_name
						and   process_name  = @process_name
						and   component_name  = @component_name
						and   bt_synonym_name = 'rvwrt_cctxt_ilbo')
		begin
			Insert into de_glossary
				(customer_name,			project_name,				process_name,
				component_name,			bt_synonym_name,			data_type,
				length,					bt_synonym_caption,			glossary_sysid,
				timestamp,				createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,
				bt_synonym_doc,			bt_name,					synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,
				@component_name,		'rvwrt_cctxt_ilbo',		'Char',
				60,						'rvwrt_cctxt_ilbo',		newid(),
				1,						@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',
				'rvwrt_cctxt_ilbo',	'engg_name',				'U',						@ico_number )
		end

	End
		
	if exists (Select 'x' from de_glossary (nolock)
				where	customer_name			= @customer_name
				and		project_name			= @project_name
				and		process_name			= @process_name
				and		component_name			= @component_name
				and		bt_synonym_caption		like 'rvwrt_cctxt%')
	Begin
		If not exists(Select 'x' from de_business_term (nolock)
						where customer_name  = @customer_name
						and   project_name	 = @project_name
						and   process_name	 = @process_name
						and   component_name = @component_name
						and   bt_name		= 'engg_name')
		begin
			Insert into de_business_term
				(customer_name,		project_name,		process_name,
				component_name,		bt_name,			bt_descr,
				data_type,			bt_sysid,			timestamp,
				createdby,			createddate,		modifiedby,
				modifieddate,		length,				precision_type,		ecrno)
			values
				(@customer_name,   @project_name,		@process_name,
				@component_name,   'engg_name',			'engg_name',
				'Char',				newid(),			1,
				@hostname,			@getdate,			@hostname,
				@getdate,			60,					null,				@ico_number )
		end	
		
		Update	de_glossary
		Set		bt_name					= 'engg_name',
				data_type				= 'Char',
				length					= 60				
		where	customer_name			= @customer_name
		and		project_name			= @project_name
		and		process_name			= @process_name
		and		component_name			= @component_name
		and		bt_synonym_caption		in( 'rvwrt_cctxt_pcomponent','rvwrt_cctxt_component','rvwrt_cctxt_pactivity','rvwrt_cctxt_activity','rvwrt_cctxt_pilbo','rvwrt_cctxt_ilbo')	
		and		isnull(bt_name,'')		<> 'engg_name'
	End

		-- Added for TECH-20897 Starts
	if exists (	Select 'x' 
	from	es_comp_task_type_mst tsk (nolock),
			de_action	act(nolock)
	where	act.customer_name				= tsk.customer_name
	and		act.project_name				= tsk.project_name
	and		act.process_name				= tsk.process_name
	and		act.component_name				= tsk.component_name
	and		act.task_name					= @task_name
	and		act.task_pattern				= tsk.task_type_name
	and		act.customer_name				= @customer_name
	and		act.project_name				= @project_name
	and		act.process_name				= @process_name
	and		act.component_name				= @component_name
	and		tsk.BulkValidation				= 'Y'
	)						
	Begin
	
		If not exists (Select 'x' 
		from	de_business_term (nolock)
		where	customer_name	= @customer_name
		and		project_name	= @project_name
		and		process_name	= @process_name
		and		component_name	= @component_name
		and		bt_name			= 'ctxt_Validation'
		and		data_type		= 'Integer')
		begin		
			Insert into de_business_term
				(customer_name,			project_name,			process_name,			component_name,		
				bt_name,				bt_descr,				data_type,				bt_sysid,			
				timestamp,				createdby,				createddate,			modifiedby,
				modifieddate,			length,					precision_type,			ecrno)
			values
				(@customer_name,		@project_name,			@process_name,			@component_name,   
				'ctxt_Validation',		'ctxt_Validation',		'Integer',				newid(),
				1,						@hostname,				@getdate,				@hostname,
				@getdate,				4,						null,					@ico_number )
		end
		If not exists (Select 'x' 
		from	DE_GLOSSARY (nolock)
		where	customer_name	= @customer_name
		and		project_name	= @project_name
		and		process_name	= @process_name
		and		component_name  = @component_name
		and		bt_synonym_name = 'ctxt_Validation')
		begin
		
			Insert into de_glossary
				(customer_name,			project_name,				process_name,				component_name,			
				bt_synonym_name,		data_type,					length,						bt_synonym_caption,			
				glossary_sysid,			timestamp,					createdby,					createddate,
				modifiedby,				modifieddate,				ref_bt_synonym_name,		bt_synonym_doc,			
				bt_name,				synonym_status,				ecrno)
			Values
				(@customer_name,	    @project_name,				@process_name,				@component_name,		
				'ctxt_Validation',		'Integer',					4,							'Validation',				
				newid(),				1,							@ctxt_user,					@getdate,
				@ctxt_user,				@getdate,					'',							'ctxt_Validation',		
				'ctxt_Validation',		'U',						@ico_number )
		end
	End
	-- Added for TECH-20897 Ends

update de_hidden_view
set  new_control_bt_synonym = replace(b.page_prefix, '_', '') + '_' + hidden_view_bt_synonym
from de_hidden_view   a (nolock),
de_ui_page    b (nolock)
where a.customer_name  = @customer_name
and  a.project_name  = @project_name
and  a.process_name  = @process_name
and  a.component_name = @component_name
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   = b.ui_name
and  a.page_name   = b.page_bt_synonym
and  a.component_name+a.activity_name+a.ui_name+a.hidden_view_bt_synonym in(
select component_name+activity_name+ui_name+hidden_view_bt_synonym
from de_hidden_view (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
group by component_name, activity_name, ui_name, hidden_view_bt_synonym
having count(*) > 1)

If exists ( select distinct 's'
from de_hidden_view (nolock)
where customer_name    = @customer_name
and  project_name    = @project_name
and  process_name    = @process_name
and  component_name    = @component_name
and  activity_name    = @activity_name
and  ui_name      = @ui_name
and  len(new_control_bt_synonym) > 30)
begin
update a
set  new_control_bt_synonym  = left (replace(b.page_prefix, '_', '') + '_' +
replace(control_prefix ,'_','') + '_' +
a.hidden_view_bt_synonym, 29)
from de_hidden_view   a (nolock),
de_ui_page    b (nolock),
de_ui_control   c (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  len(a.new_control_bt_synonym)> 30
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.customer_name   = c.customer_name
and  a.project_name   = c.project_name
and  a.process_name   = c.process_name
and  a.component_name  = c.component_name
and  a.activity_name   = c.activity_name
and  a.ui_name    = c.ui_name
and  a.page_name    = c.page_bt_synonym
and  a.section_name   = c.section_bt_synonym
and  a.control_bt_synonym = c.control_bt_synonym

update a
set  new_control_bt_synonym  = left (replace(b.page_prefix, '_', '') + '_' +
replace(column_prefix ,'_','') + '_' +
a.hidden_view_bt_synonym, 29)
from de_hidden_view   a (nolock),
de_ui_page    b (nolock),
de_ui_grid    c (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  len(a.new_control_bt_synonym)> 30
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_bt_synonym
and  a.customer_name   = c.customer_name
and  a.project_name   = c.project_name
and  a.process_name   = c.process_name
and  a.component_name  = c.component_name
and  a.activity_name   = c.activity_name
and  a.ui_name    = c.ui_name
and  a.page_name    = c.page_bt_synonym
and  a.section_name   = c.section_bt_synonym
and  a.control_bt_synonym = c.column_bt_synonym
end

if exists(
select component_name+activity_name+ui_name+new_control_bt_synonym
from de_hidden_view (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
group by component_name, activity_name, ui_name, new_control_bt_synonym
having count(*) > 1)
begin
Set @msg = 'Hidden view BT Synonym is getting duplicating within the task. Change the page prefix and proceed'
exec engg_error_sp 'de_generate_design',
13,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end

Insert into de_glossary(
customer_name,    project_name,    component_name,
process_name,    bt_synonym_name,   data_type,
length,      bt_synonym_caption,   glossary_sysid,
timestamp,     createdby,     createddate,
modifiedby,     modifieddate,    ref_bt_synonym_name,
bt_synonym_doc,    bt_name,     synonym_status, ecrno)--chan
select distinct a.customer_name,    a.project_name,    a.component_name,
a.process_name,     b.new_control_bt_synonym,   a.data_type,
a.length,      b.new_control_bt_synonym, '',
a.timestamp,     @ctxt_user,     @getdate,
@ctxt_user,      @getdate,     b.hidden_view_bt_synonym,
a.bt_synonym_doc,    a.bt_name,     a.synonym_status, @ico_number --chan
from de_glossary    a (nolock),
de_hidden_view   b (nolock)
where a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.hidden_view_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name
and  b.new_control_bt_synonym<>b.hidden_view_bt_synonym
and  a.customer_name+a.project_name+a.process_name+a.component_name+b.new_control_bt_synonym not in (
Select customer_name+project_name+process_name+component_name+bt_synonym_name
from de_glossary  c (nolock)
where a.customer_name   = c.customer_name
and  a.project_name   = c.project_name
and  a.process_name   = c.process_name
and  a.component_name  = c.component_name)

--UPDATING HIDDEN VIEW TABLE
--REASON: IF THE TRANSFER_FLAG FOR ANY ONE OF THE HIDDEN VIEW OF A CONTROL IS 'N' THEN
--   ALL THE HIDDEN VIEWS OF THE CONTROL SHOULD BE 'N'
Update a
Set  transfer_flag   = 'N'
from de_hidden_view   a (nolock),
de_hidden_view   b (nolock)
where a.customer_name   = @customer_name
and  a.project_name   = @project_name
and  a.process_name   = @process_name
and  a.component_name  = @component_name
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name
and  a.page_name    = @page_name
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.page_name    = b.page_name
and  a.control_bt_synonym = b.control_bt_synonym
and  b.transfer_flag   = 'N'

-- 1/3
--  --UPDATING HIDDEN VIEW TABLE
--  --REASON: FOR ALL THE CONTROLS WHICH ARE OF TYPE ENUMERATED, VALUE OF TRANSFER_FLAG SHOULD BE 'Y'
--  Update de_hidden_view
--  Set transfer_flag  = 'Y'
--  from de_hidden_view  a (nolock),
--    de_enum_value  b (nolock)
--  where a.customer_name  = @customer_name
--  and a.project_name  = @project_name
--  and a.process_name  = @process_name
--  and a.component_name = @component_name
--  and a.activity_name  = @activity_name
--  and a.ui_name   = @ui_name
--  and a.page_name   = @page_name
--  and a.customer_name  = b.customer_name
--  and a.project_name  = b.project_name
--  and a.process_name  = b.process_name
--  and a.component_name = b.component_name
--  and a.activity_name  = b.activity_name
--  and a.ui_name   = b.ui_name
--  and a.page_name   = b.page_bt_synonym
--  and a.control_bt_synonym = b.control_bt_synonym

-- code modified by ganesh on 24/11/04 to update only the new control bt synonym
update c
set  c.data_type    = a.data_type,
c.length    = a.length,
c.bt_name    = a.bt_name,
c.modifiedby   = A.modifiedby,
c.modifieddate   = @getdate
from de_glossary    a (nolock),
de_hidden_view   b (nolock),
de_glossary c (nolock)
where b.customer_name   = c.customer_name
and  b.project_name   = c.project_name
and  b.process_name   = c.process_name
and  b.component_name  = c.component_name
and  b.new_control_bt_synonym= c.bt_synonym_name
and  c.ref_bt_synonym_name = b.hidden_view_bt_synonym
and  b.new_control_bt_synonym<>b.hidden_view_bt_synonym
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.bt_synonym_name  = b.hidden_view_bt_synonym
and  b.customer_name   = @customer_name
and  b.project_name   = @project_name
and  b.process_name   = @process_name
and  b.component_name  = @component_name
and  b.activity_name   = @activity_name
and  b.ui_name    = @ui_name

--code modified For BugId : PNR2.0_4858
--Code Modified For BugId : PNR2.0_4874
insert into de_flowbr_method_map
(   customer_name,  project_name,  process_name,
component_name,  activity_name,  ui_name,
service_name,  flowbr_name,  method_name,
metbr_sysid,  timestamp,   createdby,
createddate,  modifiedby,   modifieddate, ecrno)--chan
select  distinct
g.customer_name, g.project_name,  g.process_name,
g.component_name, g.activity_name, g.ui_name,
g.service_name,  '',     f.method_name,
@id,    1,     @ctxt_user,
@getdate,   @ctxt_user,   @getdate, @ico_number --chan
from de_fw_des_processsection_br_is  f (nolock),
de_task_service_map     g (nolock)
where g.customer_name    = @customer_name
and  g.project_name    = @project_name
and  g.process_name    = @process_name
and  g.component_name   = @component_name
and  g.activity_name    = @activity_name
and  g.ui_name     = @ui_name
and  g.task_name     = @task_name
and  f.customer_name    = g.customer_name
and  f.project_name    = g.project_name
and  f.process_name    = g.process_name
and  f.component_name   = g.component_name
and  f.servicename    = g.service_name
and  not exists ( select 's'
from de_flowbr_method_map h(nolock)
where g.customer_name    = h.customer_name
and  g.project_name    = h.project_name
and  g.process_name    = h.process_name
and  g.component_name   = h.component_name
and  g.activity_name    = h.activity_name
and  g.ui_name     = h.ui_name
and  f.servicename    = h.service_name
and  f.method_name    = h.method_name)


delete de_gen_service_method_history
where task_name = @task_name

-- code modified by Ganesh on 06/10/2004 for the bugid :::DEENG203SYS_000382
--Code Added for BugId : PNR2.0_3121
Insert into de_gen_service_method_history(
task_name,    old_service_name,   flow_br_name,
old_method_id,   old_method_name,   control_id,
view_name,    event_name)
select  @task_name,    a.service_name,    d.flowbr_name,
c.methodid,    c.method_name,    d.control_id,
d.view_name,   d.event_name
from  de_task_service_map     a (nolock),
de_flowbr_method_map    b (nolock),
de_fw_des_processsection_br_is  c (nolock),
de_flowbr       d (nolock)
where  a.customer_name    = @customer_name
and   a.project_name    = @project_name
and   a.process_name    = @process_name
and   a.component_name   = @component_name
and   a.activity_name    = @activity_name
and   a.ui_name     = @ui_name
and   a.task_name     = @task_name

and   a.customer_name    = b.customer_name
and   a.project_name    = b.project_name
and   a.process_name    = b.process_name
and   a.component_name   = b.component_name
and   a.activity_name    = b.activity_name
and   a.ui_name     = b.ui_name
and   a.service_name    = b.service_name

and   b.customer_name    = c.customer_name
and   b.project_name    = c.project_name
and   b.process_name    = c.process_name
and   b.component_name   = c.component_name
and   b.service_name    = c.servicename
and   b.method_name    = c.method_name

and   c.customer_name    = d.customer_name
and   c.project_name    = d.project_name
and   c.process_name    = d.process_name
and   c.component_name   = d.component_name

and  d.activity_name    = a.activity_name
and   d.ui_name     = a.ui_name
--- Code commented by Saravanan for PNR2.0_3312 -- Start
--- and   d.page_bt_synonym   = @page_name
--- Code commented by Saravanan for PNR2.0_3312 -- End
and   d.task_name     = a.task_name
and   d.flowbr_name    = b.flowbr_name
and   c.isbr      = 1
union
--Code Modified for BugId : PNR2.0_10877
select  @task_name,    e.service_name,  e.flowbr_name, -- e.method_name,
f.methodid,    e.method_name,   '',
'',      ''
from  de_flowbr_method_map    e (nolock),
de_fw_des_processsection_br_is  f (nolock),
de_task_service_map     g (nolock)
where  g.customer_name    = @customer_name
and   g.project_name    = @project_name
and   g.process_name    = @process_name
and   g.component_name   = @component_name
and   g.activity_name    = @activity_name
and   g.ui_name     = @ui_name
and   g.task_name     = @task_name
and   e.customer_name    = f.customer_name
and   e.project_name    = f.project_name
and   e.process_name    = f.process_name
and   e.component_name   = f.component_name
and   e.service_name    = f.servicename
and   e.method_name    = f.method_name
and   e.customer_name    = g.customer_name
and   e.project_name    = g.project_name
and   e.process_name    = g.process_name
and   e.component_name   = g.component_name
and   e.activity_name    = g.activity_name
and   e.ui_name     = g.ui_name
and   e.service_name    = g.service_name
and   isnull(flowbr_name, '')  = ''
and   f.isbr      = 1

Delete de_flowbr_method_map
from de_flowbr_method_map a (nolock),
de_task_service_map  b (nolock)
where a.customer_name = @customer_name
and  a.project_name = @project_name
and  a.process_name = @process_name
and  a.component_name= @component_name
and  a.activity_name = @activity_name
and  a.ui_name  = @ui_name
and  a.customer_name = b.customer_name
and  a.project_name = b.project_name
and  a.process_name = b.process_name
and  a.component_name= b.component_name
and  a.activity_name = b.activity_name
and  a.ui_name  = b.ui_name
and  b.task_name  = @task_name
and  a.service_name = b.service_name

--INSERTING BRO DETAILS
-- code modified by Ganesh on 26/10/04 for the bugid ::: DEPF204SYS_000025

/* Modified by Bakiaraj V on 18-jan-2005 for the bug id   : DEPF204ACC_000060
bug desc : Addtion of Process Name in different tables.  */
If Not Exists ( Select 'A'
from de_fw_des_bro (nolock)
where customer_name =  @customer_name
and project_name = @project_name
and process_name =  @process_name
and componentname =  @component_name
and broname  = @component_name + '101')
begin
Insert into de_fw_des_bro ( brodescription,
broname,
broscope,
brotype,
clsid,
clsname,
componentname,
createdby,
createddate,
customer_name,
dllname,
modifiedby,
modifieddate,
progid,
project_name,
systemgenerated,
timestamp,
updtime,
upduser,
process_name,
ecrno)--chan
values ( 'Non-Integration - SystemGenerated - Update Business Rule Object for ' + @Component_name,
@component_name + '101',
0,
1,
NULL,
'Cls101',
@component_name,
@hostname,
@getdate,
@customer_name,
@component_name + '0.dll',
@hostname,
@getdate,
'BRO' + @Component_name + '0.Cls101',
@project_name,
'',
1,
@getdate,
@hostname,
@process_name,
@ico_number)--chan
end

--chan
--Modification for PNR2.0_17463 starts here. Modified by Gowrisankar on 02-Apr-2008
if exists ( select  'x'
from de_glossary  a(nolock)
where  customer_name  = @customer_name
and   project_name   = @project_name
and    process_name    = @process_name
and   component_name  = @component_name
and   isnull(bt_name,'')  <> ''
and   not exists (  select 'x'
from  de_fw_req_bterm_synonym  b(nolock)
where  b.customer_name  = a.customer_name
and     b.project_name   = a.project_name
and    b.process_name    = a.process_name
and   b.component_name   =  a.component_name
and  b.btsynonym   = a.bt_synonym_name        )
and   exists    (  select 'x'
from  de_fw_req_bterm c(nolock)
where  c.customer_name  =  a.customer_name
and   c.project_name   =  a.project_name
and    c.process_name  = a.process_name
and   c.component_name   =  a.component_name
and  c.btname   = a.bt_name )
)
begin

insert into de_fw_req_bterm_synonym
(btsynonym, btname,upduser,updtime,
customer_name,project_name,timestamp,createdby,createddate,process_name,component_name,ecrno)--chan
select  bt_synonym_name,bt_name,host_name(),getdate(),
customer_name,project_name,1,host_name(),getdate(),process_name,component_name,@ico_number
from de_glossary  a(nolock)
where  customer_name  = @customer_name
and   project_name   = @project_name
and    process_name    = @process_name
and   component_name  = @component_name
and   isnull(bt_name,'')  <> ''
and   not exists (  select 'x'
from  de_fw_req_bterm_synonym  b(nolock)
where  b.customer_name  = a.customer_name
and     b.project_name   = a.project_name
and    b.process_name    = a.process_name
and   b.component_name   =  a.component_name
and  b.btsynonym   = a.bt_synonym_name        )
and   exists    (  select 'x'
from  de_fw_req_bterm c(nolock)
where  c.customer_name  =  a.customer_name
and   c.project_name   =  a.project_name
and    c.process_name  = a.process_name
and   c.component_name   =  a.component_name
and  c.btname   = a.bt_name )
and  len(bt_synonym_name) < 31
end
--Modification for PNR2.0_17463 starts here. Modified by Gowrisankar on 02-Apr-2008

--GENERATING BUSINESS OBJECT DATA [BUSINESS OBJECTS, BO SEGMENTS AND BO DATAITEMS]
exec de_generate_bo @Ctxt_Language,
@Ctxt_Service,
@Ctxt_OUInstance,
@Ctxt_User,
@customer_name,
@project_name,
@ico_number,
@process_name,
@component_name,
@activity_name,
@ui_name,
@page_name,
@task_name,
@component_prfx,
@bo_idfr,
@hdr_sgmt_idfr,
@cb_sgmt_idfr,
@mlcb_sgmt_idfr,
@ml_sgmt_idfr

--GENERATING SERVICE DATA [SERVICE, SERVICE SEGMENTS, SEGMENT DATAITEM, PROCESS SECTIONS,
--METHODS AND METHOD PARAMETERS]

exec de_generate_service @Ctxt_Language,
@Ctxt_Service,
@Ctxt_OUInstance,
@Ctxt_User,
@customer_name,
@project_name,
@ico_number,
@process_name,
@component_name,
@activity_name,
@ui_name,
@page_name,
@task_name,
@component_prfx,
@service_idfr,
@mt_prfx,
@cb_load_idfr,
@cb_def_idfr,
@hdr_valid_idfr,
@hdr_sgmt_idfr,
@cb_sgmt_idfr,
@ml_sgmt_idfr,
@mlcb_sgmt_idfr,
@ml_out_sgmt_idfr,
@sp_prfx,
@rs_prfx,
@ps_prfx,
@cbhdr_sgmt_idfr,
@hdr_ref_idfr,
@hdr_fet_idfr,
@hdr_chk_idfr,
@err_chk_idfr,
@hdr_save_idfr,
@ps_ref_idfr,
@mt_out_idfr,
@sp_out_idfr,
@bo_idfr,
@hdr_sgmt_idfr,
@cb_sgmt_idfr,
@mlcb_sgmt_idfr,
@ml_sgmt_idfr,
@ml_out_sgmt_idfr,
@service_name output,
--code added for the caseid : PNR2.0_27694 starts
@merror_id output

if @merror_id <> 0
begin
return
end
--code added for the caseid : PNR2.0_27694 ends



--DELETING ALL THE SERVICE DATAITEM WHICH ARE NOT PRESENT IN METHOD PARAMETER MAPPING
Delete de_fw_des_service_dataitem
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename  = @service_name
and (servicename+segmentname+DataItemName
not in ( Select servicename+segmentname+DataItemName
from de_fw_des_di_Parameter (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename = @service_name)
or servicename+segmentname
not in ( Select servicename+segmentname
from de_fw_des_service_segment (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename = @service_name))

--DELETING ALL THE SERVICE SEGMENTS WHICH ARE NOT HAVING ANY SERVICE DATAITEM
Delete de_fw_des_service_segment
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename = @service_name
and servicename+segmentname
not in ( Select servicename+segmentname
from de_fw_des_service_dataitem (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename = @service_name)

--DELETING SERVICE DOCUMENTATION WHICH IS NOT HAVING ANY PROCESSSECTION OR SEGMENT
Delete de_fw_des_service_documentation
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename  = @service_name
and servicename not in ( Select servicename
from de_fw_Des_service_segment (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and servicename = @service_name
and component_name = @component_name
union
Select servicename
from de_fw_Des_processsection (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and servicename = @service_name
and component_name = @component_name)

--DELETING SERVICE WHICH IS NOT HAVING ANY PROCESSSECTION OR SEGMENT
Delete de_fw_des_service
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and componentname = @component_name
and servicename  = @service_name
and servicename not in ( Select servicename
from de_fw_Des_service_segment (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and servicename = @service_name
and component_name = @component_name
union
Select servicename
from de_fw_Des_processsection (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and servicename = @service_name
and component_name = @component_name)



--DELETING SERVICE DOCUMENTATION FOR THE NON EXISTANT SERVICES
Delete de_fw_des_service_documentation
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename = @service_name
and servicename not in ( Select servicename
from de_fw_Des_service (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and servicename = @service_name)


--  --INSERTING ILBO SERVICE VIEW DATAMAP
--  Insert into de_fw_des_ilbo_service_view_datamap ( customer_name,
--         project_name,
--         process_name,
--         component_name,
--         ILBOCode,
--         ServiceName,
--         ActivityId,
--         activity_name,
--         page_bt_synonym,
--         control_bt_synonym,
--         TaskName,
--         SegmentName,
--         DataItemName,
--         IsControl,
--         ControlID,
--         ViewName,
--         VariableName,
--         UpdUser,
--         UpdTime,
--         timestamp,
--         Createdby,
--         createddate,
--         modifiedby,
--         modifieddate)
--  Select @customer_name,
--   @project_name,
--   @process_name,
--   @component_name,
--   @ui_name,
--   @service_name,
--   @activity_id,
--   @activity_name,
--   @page_name,
--   b.control_bt_synonym,
--   @task_name,
--   a.segmentname,
--   a.dataitemname,
--   1,
--   b.control_id,
--   b.view_name,
--   '',
--   @hostname,
--   @getdate,
--   1,
--   @hostname,
--   @getdate,
--   @hostname,
--   @getdate
--  from de_fw_des_service_dataitem a (nolock),
--    de_ui_control    b (nolock)
--  where a.customer_name  = @customer_name
--  and a.project_name  = @project_name
--  and a.process_name  = @process_name
--  and a.component_name = @component_name
--  and a.servicename  = @service_name
--  and a.dataitemname  <> 'ModeFlag'
--  and a.customer_name  = b.customer_name
--  and a.project_name  = b.project_name
--  and a.process_name  = b.process_name
--  and a.component_name = b.component_name
--  and a.dataitemname  = b.control_bt_synonym
--  and b.activity_name  = @activity_name
--  and b.ui_name  = @ui_name
--  and b.page_bt_synonym = @page_name
--  union
--  Select @customer_name,
--   @project_name,
--   @process_name,
--   @component_name,
--   @ui_name,
--   @service_name,
--   @activity_id,
--   @activity_name,
--   @page_name,
--   b.column_bt_synonym,
--   @task_name,
--   a.segmentname,
--   a.dataitemname,
--   1,
--   b.control_id,
--   b.column_no,--b.view_name, --Modified BY DNR on 31/03/2004
--   '',
--   @hostname,
--   @getdate,
--   1,
--   @hostname,
--   @getdate,
--   @hostname,
--   @getdate
--  from de_fw_des_service_dataitem a (nolock),
--   de_ui_grid   b (nolock)
--  where a.customer_name  = @customer_name
--  and a.project_name  = @project_name
--  and a.process_name  = @process_name
--  and a.component_name = @component_name
--  and a.servicename  = @service_name
--  and a.dataitemname  <> 'ModeFlag'
--  and a.customer_name  = b.customer_name
--  and a.project_name  = b.project_name
--  and a.process_name  = b.process_name
--  and a.component_name = b.component_name
--  and a.dataitemname  = b.column_bt_synonym
--  and b.activity_name  = @activity_name
--  and b.ui_name  = @ui_name
--  and b.page_bt_synonym = @page_name
--  union
--  Select @customer_name,
--   @project_name,
--   @process_name,
--   @component_name,
--   @ui_name,
--   @service_name,
--   @activity_id,
--   @activity_name,
--   @page_name,
--   b.control_bt_synonym,
--   @task_name,
--   a.segmentname,
--   a.dataitemname,
--   1,
--   b.control_id,
--   'h' + b.view_name,
--   '',
--   @hostname,
--   @getdate,
--   1,
--   @hostname,
--   @getdate,
--   @hostname,
--   @getdate
--  from de_fw_des_service_dataitem a (nolock),
--   de_ui_control   b (nolock),
--   de_hidden_view   c (nolock)
--  where a.customer_name  = @customer_name
--  and a.project_name  = @project_name
--  and a.process_name  = @process_name
--  and a.component_name = @component_name
--  and a.servicename  = @service_name
--  and a.dataitemname  <> 'ModeFlag'
--  and a.customer_name  = b.customer_name
--  and a.project_name  = b.project_name
--  and a.process_name  = b.process_name
--  and a.component_name = b.component_name
--  and a.dataitemname  = b.control_bt_synonym
--  and b.activity_name  = @activity_name
--  and b.ui_name  = @ui_name
--  and b.page_bt_synonym = @page_name
--  and c.customer_name  = b.customer_name
--  and c.project_name  = b.project_name
--  and c.process_name  = b.process_name
--  and c.component_name = b.component_name
--  and c.hidden_view_bt_synonym= a.dataitemname
--  and c.activity_name  = @activity_name
--  and c.ui_name  = @ui_name
--  and c.page_name  = @page_name
--  union
--  Select @customer_name,
--   @project_name,
--   @process_name,
--   @component_name,
--   @ui_name,
--   @service_name,
--   @activity_id,
--   @activity_name,
--   @page_name,
--   b.column_bt_synonym,
--   @task_name,
--   a.segmentname,
--   a.dataitemname,
--   1,
--   b.control_id,
--   'h' + b.view_name,
--   '',
--   @hostname,
--   @getdate,
--   1,
--   @hostname,
--   @getdate,
--   @hostname,
--   @getdate
--  from de_fw_des_service_dataitem a (nolock),
--   de_ui_grid   b (nolock),
--   de_hidden_view   c (nolock)
--  where a.customer_name  = @customer_name
--  and a.project_name  = @project_name
--  and a.process_name  = @process_name
--  and a.component_name = @component_name
--  and a.servicename  = @service_name
--  and a.dataitemname  <> 'ModeFlag'
--  and a.customer_name  = b.customer_name
--  and a.project_name  = b.project_name
--  and a.process_name  = b.process_name
--  and a.component_name = b.component_name
--  and a.dataitemname  = b.column_bt_synonym
--  and b.activity_name  = @activity_name
--  and b.ui_name  = @ui_name
--  and b.page_bt_synonym = @page_name
--  and c.customer_name  = b.customer_name
--  and c.project_name  = b.project_name
--  and c.process_name  = b.process_name
--  and c.component_name = b.component_name
--  and c.hidden_view_bt_synonym= a.dataitemname
--  and c.activity_name  = @activity_name
--  and c.ui_name  = @ui_name
--  and c.page_name  = @page_name

--CODE MODIFIED BY GIRI ON 05-MAY-2004

If Exists ( Select 'A'
from de_Fw_des_service (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  componentname  = @component_name
and  servicename   = @service_name)
begin


--INSERTING TASK AND SERVICE MAPPING
Insert into de_task_service_map ( customer_name,
project_name,
process_name,
component_name,
activity_name,
ui_name,
task_name,
service_name,
taskser_sysid,
timestamp,
createdby,
createddate,
modifiedby,
modifieddate,
ecrno)--chan
Values ( @customer_name,
@project_name,
@process_name,
@component_name,
@activity_name,
@ui_name,
@task_name,
@service_name,
newid(),
1,
@hostname,
@getdate,
@hostname,
@getdate,
@ico_number)--chan

--INSERTING ILBO SERVICE VIEW DATAMAP
Insert into de_fw_des_ilbo_service_view_datamap ( customer_name,
project_name,
process_name,
component_name,
ILBOCode,
ServiceName,
ActivityId,
activity_name,
page_bt_synonym,
control_bt_synonym,
TaskName,
SegmentName,
DataItemName,
IsControl,
ControlID,
ViewName,
VariableName,
UpdUser,
UpdTime,
timestamp,
Createdby,
createddate,
modifiedby,
modifieddate,
ecrno)--chan
Select distinct @customer_name,
@project_name,
@process_name,
@component_name,
@ui_name,
@service_name,
@activity_id,
@activity_name,
-- code modified by shafina on 14-feb-2005 for DEPFSUPPORT_000014 (In the ilbo service view data map the page name is to be updated.)
b.page_name,
b.new_control_bt_synonym,
@task_name,
a.segmentname,
a.dataitemname,
1,
b.control_id,
b.view_name,
null,--'',/*PNR2.0_13288*/
@hostname,
@getdate,
1,
@hostname,
@getdate,
@hostname,
@getdate,
@ico_number --chan
from de_fw_des_service_dataitem a (nolock),
de_task_control_map   b (nolock),
de_task_service_map   c (nolock)
where a.customer_name  = @customer_name
and a.project_name  = @project_name
and a.process_name  = @process_name
and a.component_name = @component_name
and a.servicename  = @service_name
and a.dataitemname  <> 'ModeFlag'
and a.customer_name  = b.customer_name
and a.project_name  = b.project_name
and a.process_name  = b.process_name
and a.component_name = b.component_name
and a.dataitemname  = b.new_control_bt_synonym
and b.activity_name  = @activity_name
and b.ui_name   = @ui_name
--  and b.page_name   = @page_name
and b.action_name  = @task_name
and a.customer_name  = c.customer_name
and a.project_name  = c.project_name
and a.process_name  = c.process_name
and a.component_name = c.component_name
and a.servicename  = c.service_name
and c.task_name   = b.action_name
-- -- Start Added By Feroz For Ext Js -- PNR2.0_1790
and not exists (select 'x'
from   de_fw_des_ilbo_service_view_datamap ex (nolock)
where  ex.customer_name   = @customer_name
and  ex.project_name   = @project_name
and  ex.process_name   = @process_name
and  ex.component_name  = @component_name
and  ex.servicename   = @service_name
and  ex.ilbocode   = @ui_name
and  ex.activityid  = @activity_id
and  ex.taskname   = c.task_name
and  ex.segmentname  = a.segmentname
and  ex.dataitemname  = a.dataitemname)
-- -- End Added By Feroz For Ext Js -- PNR2.0_1790
--Code modification done by Sangeetha G for PNR2.0_21147  starts
and  not exists (select  '*' from  de_spin_control spn(nolock)
where b.customer_name   =  spn.customer_name
and   b.project_name    =  spn.project_name
and   b.process_name  = spn.process_name
and   b.component_name  = spn.component_name
and   b.activity_name   =      spn.activity_name
and   b.ui_name  = spn.ui_name
and   b.page_name   =      spn.page_bt_synonym
and   b.section_name   =      spn.spincontrol_section
and   b.control_bt_synonym =   spn.spin_control_bt_synonym)
--Code modification done by Sangeetha G for PNR2.0_21147  ends
union
Select @customer_name,
@project_name,
@process_name,
@component_name,
@ui_name,
@service_name,
@activity_id,
@activity_name,
c.page_name,
c.new_control_bt_synonym,
@task_name,
a.segmentname,
a.dataitemname,
1,
c.control_id,
c.view_name,
NULL,--'',/*PNR2.0_13341*/
@hostname,
@getdate,
1,
@hostname,
@getdate,
@hostname,
@getdate,
@ico_number --chan
from de_fw_des_service_dataitem a (nolock),
de_hidden_view    c (nolock),
de_hidden_view_usage  d (nolock)
where a.customer_name  = @customer_name
and a.project_name  = @project_name
and a.process_name  = @process_name
and a.component_name = @component_name
and a.servicename  = @service_name
and a.dataitemname  <> 'ModeFlag'
and c.customer_name  = a.customer_name
and c.project_name  = a.project_name
and c.process_name  = a.process_name
and c.component_name = a.component_name
and c.new_control_bt_synonym= a.dataitemname
and c.activity_name  = @activity_name
and c.ui_name  = @ui_name
--  and c.page_name  = @page_name
and a.servicename  = @service_name
--code modified for bugid:PNR2.0_9286
and c.customer_name  = d.customer_name
and c.project_name  = d.project_name
and c.process_name  = d.process_name
and c.component_name = d.component_name
and c.activity_name  = d.activity_name
and c.ui_name   = d.ui_name
and c.page_name   = d.control_page_name
and c.control_bt_synonym    = d.control_bt_sysnonym --code modified for bugid:PNR2.0_9500
and c.hidden_view_bt_synonym = d.hidden_view_bt_sysnonym
and d.action_name  = @task_name
union
-- Added by feroz to populate spin control
Select distinct
@customer_name, @project_name,  @process_name, @component_name, @ui_name, @service_name, @activity_id,
@activity_name, d.page_bt_synonym, d.spin_control_bt_synonym, @task_name, a.segmentname, a.dataitemname, 1,
e.control_id, e.view_name,  null, @hostname,  @getdate, 1, @hostname, @getdate, @hostname, @getdate,@ico_number --chan-------Added "null" for bug id "PLF2.0_07805" 
from de_fw_des_service_dataitem a (nolock),
de_task_service_map   c (nolock),
de_spin_control    d (nolock),
de_ui_control     e (nolock)
where a.customer_name  = @customer_name
and  a.project_name  = @project_name
and  a.process_name  = @process_name
and  a.component_name = @component_name
and  a.servicename  = @service_name
and  a.dataitemname  <> 'ModeFlag'

and  a.customer_name  = c.customer_name
and  a.project_name  = c.project_name
and  a.process_name  = c.process_name
and  a.component_name = c.component_name
and  a.servicename  = c.service_name

and  a.customer_name  = d.customer_name
and  a.project_name  = d.project_name
and  a.process_name  = d.process_name
and  a.component_name = d.component_name
and  a.dataitemname   = d.spin_control_bt_synonym

and  d.customer_name  = e.customer_name
and  d.project_name  = e.project_name
and  d.process_name  = e.process_name
and  d.component_name = e.component_name
and  d.activity_name  = e.activity_name
and  d.ui_name   = e.ui_name
and  d.spin_control_bt_synonym = e.control_bt_synonym


--attributemap changes kiruthika

Insert into de_fw_des_ilbo_service_view_attributemap 
			( customer_name,ilbocode,servicename,activityid,taskname,
			segmentname,dataitemname,project_name,process_name,
			component_name,activity_name,page_bt_synonym,control_bt_synonym,
			createdby,createddate,modifiedby,modifieddate,
			controlid,viewname,ecrno,PropertyType,PropertyName,type) -- code changed against TECH-218 
Select distinct @customer_name,@ui_name,@service_name,@activity_id,@task_name,
				b.segmentname,b.dataitemname,@project_name,@process_name,
				@component_name,@activity_name,a.page_name,a.control_bt_synonym,
				@hostname,@getdate,@hostname,@getdate,
				a.control_id,a.view_name,@ico_number,a.PropertyType,a.PropertyName,a.type -- code changed against TECH-218 
from de_task_control_attributemap a (nolock),
     de_fw_des_service_dataitem b (nolock)
where a.customer_name= @customer_name
and a.project_name   = @project_name
and a.process_name   = @process_name
and a.component_name = @component_name
and a.activity_name  = @activity_name
and a.ui_name        = @ui_name
and a.action_name    = @task_name
and a.customer_name  = b.customer_name
and a.project_name   = b.project_name
and a.process_name   = b.process_name
and a.component_name = b.component_name
and b.servicename    = @service_name
and b.dataitemname   = a.new_control_bt_synonym
and not exists (select 'x'
from   de_fw_des_ilbo_service_view_attributemap ex (nolock)
where ex.customer_name    = @customer_name
and  ex.project_name      = @project_name
and  ex.process_name      = @process_name
and  ex.component_name    = @component_name
and  ex.servicename       = @service_name
and  ex.ilbocode          = @ui_name
and  ex.activityid        = @activity_id
and  ex.taskname          = a.action_name
and  ex.segmentname       = b.segmentname
and  ex.dataitemname      = b.dataitemname)

--INSERTING ILBO SERVICE MAPPING
Insert into de_fw_des_ilbo_services ( customer_name,
project_name,
process_name,
component_name,
ILBOCode,
ServiceName,
IsPrepopulate,
UpdUser,
UpdTime,
timestamp,
Createdby,
createddate,
modifiedby,
modifieddate,
ecrno)--chan
Values ( @customer_name,
@project_name,
@process_name,
@component_name,
@ui_name,
@service_name,
0,
@hostname,
@getdate,
1,
@hostname,
@getdate,
@hostname,
@getdate,
@ico_number)--chan
end
--code uncommented By chanheetha N A for the call id  : PNR2.0_12376 on 27-feb-2007 -start
--Code commented by Saravanan on 02/03/2006 for PNR2.0_6784 - START
--- Code added by Saravanan on 01/03/2006 for Hdn View Usage - START
--- Even if Task Control Map does not exist do not delete the service - Only hdn views can exist in the service
If Not Exists( Select 'A'
from de_task_control_map (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
--     and  page_name   = @page_name
and  action_name   = @task_name
and  map_flag   = 'Y'
-- start Added BY Feroz For bug id : PNR2.0_21085
union
select 'A'
from #populate_mapped_controls_extjs (nolock)
union
select 'A'
from  #populate_header_control_extjs (nolock))
-- end Added BY Feroz For bug id : PNR2.0_21085
--code added By chanheetha N A for the call id  : PNR2.0_12376 on 27-feb-2007
and not exists (Select 'x'
from de_hidden_view_usage  (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
and  action_name   = @task_name)
--code added By chanheetha N A for the call id  : PNR2.0_12376 on 27-feb-2007
begin

delete de_fw_des_di_parameter
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  servicename   = @service_name
--Code added By Sangeetha L for the Bug ID:PNR2.0_3277
--Bug Descr:Invalid primary key violation in table fw_des_service
-- PNR2.0_13892
delete a
from de_fw_des_reqbr_desbr a(nolock ),
de_fw_des_processsection_br_is b (nolock)
where   b.customer_name     = @customer_name
and     b.project_name  = @project_name
and     b.process_name  = @process_name
and     b.component_name = @component_name
and     b.servicename  = @service_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.method_name  = b.method_name

delete a
from de_fw_des_sp a (nolock),
de_fw_des_processsection_br_is b (nolock)
where   b.customer_name     = @customer_name
and     b.project_name  = @project_name
and     b.process_name  = @process_name
and     b.component_name = @component_name
and     b.servicename  = @service_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.method_name  = b.method_name

delete a
from de_fw_des_br_documentation a (nolock),
de_fw_des_processsection_br_is b (nolock)
where   b.customer_name     = @customer_name
and     b.project_name  = @project_name
and     b.process_name  = @process_name
and     b.component_name = @component_name
and     b.servicename  = @service_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.method_name = b.method_name
-- PNR2.0_13892
Delete a
from de_fw_des_br_logical_parameter a ,
de_fw_des_processsection_br_is b (nolock)
where b.customer_name  = @customer_name
and  b.project_name  = @project_name
and  b.process_name  = @process_name
and  b.component_name = @component_name
and  b.servicename  = @service_name

and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.method_name  = b.method_name


--Code added By Sangeetha L for the Bug ID:PNR2.0_3277
--Bug Descr:Invalid primary key violation in table fw_des_service
-- PNR2.0_13892
select customer_name,project_name,process_name,component_name,servicename,methodid,method_name
into #de_fw_des_processsection_br_is
from  de_fw_des_processsection_br_is
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  servicename   = @service_name
-- PNR2.0_13892

delete de_fw_des_processsection_br_is
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  servicename   = @service_name

-- Code modified by Saravanan for PNR2.0_16427

delete c
from de_fw_des_businessrule a (nolock),
de_fw_des_brerror c (nolock),
#de_fw_des_processsection_br_is b (nolock)
where   b.customer_name     = @customer_name
and     b.project_name  = @project_name
and     b.process_name  = @process_name
and     b.component_name = @component_name
and     b.servicename  = @service_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.methodname  = b.method_name

and  a.customer_name  = c.customer_name
and  a.project_name  = c.project_name
and  a.process_name  = c.process_name
and  a.component_name = c.component_name
and  a.methodid   = c.methodid
and  a.methodname  = b.method_name

-- PNR2.0_13892
delete a
from de_fw_des_businessrule a (nolock),
#de_fw_des_processsection_br_is b (nolock)
where   b.customer_name     = @customer_name
and     b.project_name  = @project_name
and     b.process_name  = @process_name
and     b.component_name = @component_name
and     b.servicename  = @service_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.methodname  = b.method_name
-- PNR2.0_13892

delete de_fw_des_service_dataitem
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  servicename   = @service_name

delete de_fw_des_service_segment
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  servicename   = @service_name
end

--- Code added by Saravanan on 01/03/2006 for Hdn View Usage - END
--- Even if Task Control Map does not exist do not delete the service - Only hdn views can exist in the service
--Code commented by Saravanan on 02/03/2006 for PNR2.0_6784 - end
--code uncommented By chanheetha N A for the call id  : PNR2.0_12376 on 27-feb-2007 -End
--DELETING PROCESS SECTIONS WHICH ARE NOT HAVING ANY BR MAPPING
--Code modified By Sangeetha L for the Bug ID:PNR2.0_3277
--Bug Descr:Invalid primary key violation in table fw_des_service
Delete a
from de_fw_des_processsection a
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name
and  not exists ( Select 's'
from de_fw_Des_processsection_br_is b (nolock)
where b.customer_name  = a.customer_name
and  b.project_name  = a.project_name
and  b.process_name  = a.process_name
and  b.component_name = a.component_name
and  b.servicename  = a.servicename
and  b.sectionname  = a.sectionname)
--Code modified By Sangeetha L for the Bug ID:PNR2.0_3277
--Bug Descr:Invalid primary key violation in table fw_des_service
delete de_fw_des_di_parameter
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name
and  servicename+convert(varchar,methodid)+convert(varchar,sequenceno)+parametername
in (
select servicename+convert(varchar,methodid)+convert(varchar,sequenceno)+parametername
from de_fw_des_di_parameter a  (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name
and segmentname=@hdr_sgmt_idfr)
and servicename+convert(varchar,methodid)+convert(varchar,sequenceno)+parametername
in (
select servicename+convert(varchar,methodid)+convert(varchar,sequenceno)+parametername
from de_fw_des_di_parameter a  (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name
and segmentname<>@hdr_sgmt_idfr)
and segmentname=@hdr_sgmt_idfr
-- code modified  for the call id : PNR2.0_23219 starts
Delete  a
from  de_fw_des_di_Parameter a (nolock)
where  customer_name  = @customer_name
and   project_name  = @project_name
and   process_name  = @process_name
and   component_name  = @component_name
and   not exists  (  Select 'x'
from  de_fw_Des_businessrule b(nolock)
--code modified for the caseid : PNR2.0_27139 starts
where  b.customer_name  = @customer_name
and   b.project_name   = @project_name
and   b.process_name   = @process_name
and   b.component_name = @component_name
and b.customer_name  = a.customer_name
and  b.project_name   = a.project_name
and  b.component_name = a.component_name
and  b.methodid  = a.methodid )

/*
-- and  servicename  = @service_name
and  methodid  not  in ( Select methodid
from de_fw_Des_businessrule (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name)
*/
--DELETE METHOD PARAMETERS FOR THOSE METHOD ID NOT EXISTS
Delete a
from  de_fw_des_br_logical_parameter a (nolock)
where customer_name  = @customer_name
and   project_name  = @project_name
and   process_name   = @process_name
and   component_name   = @component_name
and   not exists  (  Select 'x'
from  de_fw_Des_businessrule b(nolock)
where   b.customer_name  = @customer_name
and     b.project_name   = @project_name
and  b.customer_name  = a.customer_name
and  b.project_name   = a.project_name
and  b.methodid   = a.methodid )
--code modified for the caseid : PNR2.0_27139 ends
/*
and  methodid not in ( Select methodid
from de_fw_Des_businessrule (nolock)
where customer_name = @customer_name
and project_name = @project_name)
*/
--       and process_name = @process_name
--       and component_name = @component_name)
-- code modified  for the call id : PNR2.0_23219 ends
-- DELETING UNNECESSARY PARAMETERS WHICH ARE NOT HAVING ANY MAPPINGS


Delete a
from de_fw_des_br_logical_parameter a ,
de_fw_des_processsection_br_is b (nolock)
where b.customer_name  = @customer_name
and  b.project_name  = @project_name
and  b.process_name  = @process_name
and  b.component_name = @component_name
and  b.servicename  = @service_name

and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.methodid   = b.methodid
and  a.method_name  = b.method_name
--code modified for the caseid : PNR2.0_27139 starts
and   not exists(
select 'x' from de_fw_des_di_parameter c(nolock)
where c.customer_name  = @customer_name
and  c.project_name  = @project_name
and  c.process_name  = @process_name
and  c.component_name = @component_name
and  c.servicename  = @service_name
and  c.customer_name = a.customer_name
and  c.project_name = a.project_name
and  c.process_name = a.process_name  --Code added by Arunn on 29/04/2005 for PNR2.0_2241 - Start
and  c.component_name = a.component_name
and  c.methodid  = a.methodid
and   c.method_name     = a.method_name
and   c.parametername =  a.logicalparametername) -- PNR2.0_2241     --END
and   not exists(
select 'x' from de_fw_des_be_placeholder d(nolock)
where d.customer_name  = @customer_name
and  d.project_name  = @project_name
and  d.process_name  = @process_name
and  d.component_name = @component_name
and  d.customer_name = a.customer_name
and  d.project_name = a.project_name
and  d.process_name = a.process_name  --Code added by Arunn on 29/04/2005 for PNR2.0_2241 - Start
and  d.component_name = a.component_name
and  d.methodid  = a.methodid
and   d.method_name     = a.method_name
and   d.parametername =  a.logicalparametername
)
--code modified for the caseid : PNR2.0_27139 ends
-- --PNR2.0_13853
-- and  convert(varchar(10), a.methodid)+ a.method_name+ a.logicalparametername not in(
-- select convert(varchar(10), methodid)+method_name+parametername
-- from de_fw_des_di_parameter c(nolock)
-- where c.customer_name = @customer_name
-- and  c.project_name = @project_name
-- and  c.process_name = @process_name  --Code added by Arunn on 29/04/2005 for PNR2.0_2241 - Start
-- and  c.component_name = @component_name) -- PNR2.0_2241     --END
-- --- Code added by Saravanan on 27/04/2005 for PNR2.0_2202 - Start
-- and   convert(varchar(10), a.methodid)+ a.method_name+ a.logicalparametername not in(
-- select convert(varchar(10), methodid)+method_name+parametername
-- from de_fw_des_be_placeholder d (nolock)
-- where d.customer_name = @customer_name
-- and  d.project_name = @project_name
-- and  d.process_name = @process_name  --Code added by Arunn on 29/04/2005 for PNR2.0_2241 - Start
-- and  d.component_name = @component_name) -- PNR2.0_2241     --END
-- --- Code added by Saravanan on 27/04/2005 for PNR2.0_2202 - End


--DELETE SP MAPPING FOR THOSE METHOD ID NOT EXISTS
Delete de_fw_des_sp
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  methodid not in ( Select methodid
from de_fw_Des_businessrule (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name)


If Not Exists( Select 'A'
from de_fw_des_processsection_br_is (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name)
begin

delete de_fw_des_service_documentation
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name

delete  de_fw_des_ilbo_services
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  servicename  = @service_name

delete de_task_service_map
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  service_name = @service_name

delete de_fw_des_service
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  componentname = @component_name
and  servicename  = @service_name
end

-- 1/3
--  update de_fw_des_ilbo_service_view_datamap
--  set  controlid = replace(replace(replace(controlid, '[', ''), ']', ''), '-', '_'),
--    viewname = replace(replace(replace(viewname, '[', ''), ']', ''), '-', '_')
--  where customer_name = @customer_name
--  and  project_name = @project_name
--  and  process_name = @process_name
--  and  component_name = @component_name
--  and  servicename  = @service_name

--  update  de_fw_des_service_dataitem
--  set  FlowAttribute = 1
--  from de_fw_des_ilbo_service_view_datamap  a (nolock),
--    de_ui_control       b (nolock),
--    de_fw_des_service_dataitem    c (nolock),
--    es_comp_ctrl_type_mst     d (nolock),
--    de_flowbr_combo       flw (nolock)
--  where a.customer_name    = @customer_name
--  and  a.project_name    = @project_name
--  and  a.process_name    = @process_name
--  and  a.component_name   = @component_name
--  and  a.servicename    = @service_name
--  and  a.SegmentName like 'CB%'
--  and  a.customer_name    = c.customer_name
--  and  a.project_name    = c.project_name
--  and  a.process_name    = c.process_name
--  and  a.component_name   = c.component_name
--  and  a.servicename    = c.servicename
--  and  a.segmentname    = c.segmentname
--  and  a.dataitemname    = c.dataitemname
--  and  a.customer_name    = b.customer_name
--  and  a.project_name    = b.project_name
--  and  a.process_name    = b.process_name
--  and  a.component_name   = b.component_name
--  and  b.activity_name    = @activity_name
--  and  b.ui_name     = @ui_name
--  and  a.controlid     = b.control_id
--  and  a.viewname     = b.view_name
--  and  b.customer_name    = d.customer_name
--  and  b.project_name    = d.project_name
--  and  b.process_name    = d.process_name
--  and  b.component_name   = d.component_name
--  and  b.control_type    = d.ctrl_type_name
--  and  d.base_ctrl_type   = 'Combo'
--  and  flw.customer_name   = b.customer_name
--  and  flw.project_name   = b.project_name
--  and  flw.process_name   = b.process_name
--  and  flw.component_name   = b.component_name
--  and  flw.activity_name   = b.activity_name
--  and  flw.ui_name     = b.ui_name
--  and  flw.combo_page_name   = b.page_bt_synonym
--  and  flw.task_name    = @task_name
--  and  flw.combo_bt_synonym  = b.control_bt_synonym


update  de_fw_des_service_dataitem
set  FlowAttribute = 1
from de_fw_des_ilbo_service_view_datamap  a (nolock),
de_ui_control       b (nolock),
de_fw_des_service_dataitem    c (nolock),
de_flowbr_combo       flw (nolock)
where a.customer_name    = @customer_name
and  a.project_name    = @project_name
and  a.process_name    = @process_name
and  a.component_name   = @component_name
and  a.servicename    = @service_name
and  a.SegmentName like 'CB%'
and  a.customer_name    = c.customer_name
and  a.project_name    = c.project_name
and  a.process_name    = c.process_name
and  a.component_name   = c.component_name
and  a.servicename    = c.servicename
and  a.segmentname    = c.segmentname
and  a.dataitemname    = c.dataitemname
and  a.customer_name    = b.customer_name
and  a.project_name    = b.project_name
and  a.process_name    = b.process_name
and  a.component_name   = b.component_name
and  b.activity_name    = @activity_name
and  b.ui_name     = @ui_name
and  a.controlid     = b.control_id
and  a.viewname     = b.view_name
and  flw.customer_name   = b.customer_name
and  flw.project_name   = b.project_name
and  flw.process_name   = b.process_name
and  flw.component_name   = b.component_name
and  flw.activity_name   = b.activity_name
and  flw.ui_name     = b.ui_name
and  flw.combo_page_name   = b.page_bt_synonym
and  flw.task_name    = @task_name
and  flw.combo_bt_synonym  = b.control_bt_synonym

update  de_fw_des_service_dataitem
set  FlowAttribute = 1
from de_fw_des_ilbo_service_view_datamap  a (nolock),
de_hidden_view       b (nolock),
de_fw_des_service_dataitem    c (nolock),
de_flowbr_combo       flw (nolock)
where a.customer_name    = @customer_name
and  a.project_name    = @project_name
and  a.process_name    = @process_name
and  a.component_name   = @component_name
and  a.servicename    = @service_name
and  a.SegmentName like 'CB%'
and  a.customer_name    = c.customer_name
and  a.project_name    = c.project_name
and  a.process_name    = c.process_name
and  a.component_name   = c.component_name
and  a.servicename    = c.servicename
and  a.segmentname    = c.segmentname
and  a.dataitemname    = b.new_control_bt_synonym
and  a.customer_name    = b.customer_name
and  a.project_name    = b.project_name
and  a.process_name    = b.process_name
and  a.component_name   = b.component_name
and  b.activity_name    = @activity_name
and  b.ui_name     = @ui_name
and  a.controlid     = b.control_id
and  a.viewname     = b.view_name
and  flw.customer_name   = b.customer_name
and  flw.project_name   = b.project_name
and  flw.process_name   = b.process_name
and  flw.component_name   = b.component_name
and  flw.activity_name   = b.activity_name
and  flw.ui_name     = b.ui_name
and  flw.combo_page_name   = b.page_name
and  flw.task_name    = @task_name
and  flw.combo_bt_synonym  = b.control_bt_synonym
and  c.dataitemname    = a.dataitemname

update  de_fw_des_service_dataitem
set  FlowAttribute = 1
from de_fw_des_ilbo_service_view_datamap  a (nolock),
de_ui_grid        b (nolock),
de_fw_des_service_dataitem    c (nolock),
de_flowbr_combo       flw (nolock)
where a.customer_name    = @customer_name
and  a.project_name    = @project_name
and  a.process_name    = @process_name
and  a.component_name   = @component_name
and  a.servicename    = @service_name
and  a.SegmentName like 'CB%'
and  a.customer_name    = c.customer_name
and  a.project_name    = c.project_name
and  a.process_name    = c.process_name
and  a.component_name   = c.component_name
and  a.servicename    = c.servicename
and  a.segmentname    = c.segmentname
and  a.dataitemname    = c.dataitemname
and  a.customer_name    = b.customer_name
and  a.project_name    = b.project_name
and  a.process_name    = b.process_name
and  a.component_name   = b.component_name
and  b.activity_name    = @activity_name
and  b.ui_name     = @ui_name
and  a.controlid     = b.control_id
and  a.viewname     = b.view_name
and  flw.customer_name   = b.customer_name
and  flw.project_name   = b.project_name
and  flw.process_name   = b.process_name
and  flw.component_name   = b.component_name
and  flw.activity_name   = b.activity_name
and  flw.ui_name     = b.ui_name
and  flw.combo_page_name   = b.page_bt_synonym
and  flw.task_name    = @task_name
and  flw.combo_bt_synonym  = b.column_bt_synonym


--Code Modified For BugId : PNR2.0_4566
select @hdr_fetch_req_tmp  = hdr_ref_req
from es_comp_task_type_mst a(nolock),
de_action    b(nolock)
where b.customer_name    = @customer_name
and  b.project_name    = @project_name
and  b.process_name    = @process_name
and  b.component_name   = @component_name
and  b.activity_name    = @activity_name
and  b.ui_name     = @ui_name
and  b.page_bt_synonym   = @page_name
and  b.task_name     = @task_name
and  a.customer_name    = b.customer_name
and  a.project_name    = b.project_name
and  a.process_name    = b.process_name
and  a.component_name   = b.component_name
and  a.task_type_name      = b.task_pattern



if @hdr_fetch_req_tmp = 'N'
begin
update de_fw_des_service_dataitem
set  flowattribute = 0
from de_fw_des_service_dataitem  a (nolock),
de_task_control_map    b (nolock),
de_task_service_map    c (nolock),
de_flowbr_combo     d (nolock)
where a.servicename    = @service_name
and  d.customer_name    = @customer_name
and  d.project_name    = @project_name
and  d.process_name    = @process_name
and  d.component_name   = @component_name
and  d.activity_name    = @activity_name
and  d.ui_name     = @ui_name
and  b.page_name     = @page_name
and  b.action_name    = @task_name
and  a.customer_name    = b.customer_name
and  a.project_name    = b.project_name
and  a.process_name    = b.process_name
and  a.component_name   = b.component_name
and  a.dataitemname    = b.new_control_bt_synonym
and  a.customer_name    = c.customer_name
and  a.project_name    = c.project_name
and  a.process_name    = c.process_name
and  a.component_name   = c.component_name
and  a.servicename    = c.service_name
and  a.customer_name    = d.customer_name
and  a.project_name    = d.project_name
and  a.process_name    = d.process_name
and  a.component_name   = d.component_name
and  b.customer_name    = c.customer_name
and  b.project_name    = c.project_name
and  b.process_name    = c.process_name
and  b.component_name   = c.component_name
and  b.activity_name    = c.activity_name
and  b.ui_name     = c.ui_name
and  b.action_name    = c.task_name
and  b.customer_name    = d.customer_name
and  b.project_name    = d.project_name
and  b.process_name    = d.process_name
and  b.component_name   = d.component_name
and  b.activity_name    = d.activity_name
and  b.ui_name     = d.ui_name
and  b.action_name    = d.task_name
and  d.combo_bt_synonym   = b.control_bt_synonym
and  a.flowattribute    = 2
and  a.servicename    not like '%fet'
end

-- For Updating Flow Direction for segment dataitem
-- DEENG203SYS_000424 on 21/10/04
select @cur_val = current_value
from es_comp_param_mst (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  param_category   = 'HDRSEGNAME'

-- code modified by Ganesh for the bugid :: DEENG203ACC_000119 on 10/12/04
-- to update the flow direction of the control as IN,
-- where the flow direction of the parameter in all the method as IN
--Code Modified for BugId : PNR2.0_3630
update de_fw_des_service_dataitem
set flowattribute  = 0
where customer_name  = @customer_name
and project_name  = @project_name
and process_name  = @process_name
and component_name  = @component_name
and servicename   = @service_name
and segmentname   = @cur_val
and flowattribute  = 2
and dataitemname in
( select logicalparametername
from de_fw_des_br_logical_parameter  a (nolock),
de_fw_des_processsection_br_is  b (nolock),
de_fw_des_service_dataitem  c (nolock)
where c.customer_name   = @customer_name
and c.project_name   = @project_name
and c.process_name   = @process_name
and c.component_name  = @component_name
and c.servicename   = @service_name
and c.segmentname   = @cur_val
and a.flowdirection   = 0

and b.customer_name   = c.customer_name
and b.project_name   = c.project_name
and b.process_name   = c.process_name
and b.component_name  = c.component_name
and b.servicename   = c.servicename

and a.customer_name   = b.customer_name
and a.project_name   = b.project_name
and a.process_name   = b.process_name
and a.component_name  = b.component_name
and a.methodid   = b.methodid
and a.method_name   = b.method_name

and a.customer_name   = c.customer_name
and a.project_name   = c.project_name
and a.process_name   = c.process_name
and a.component_name  = c.component_name
and a.logicalparametername  = c.dataitemname

and  logicalparametername  not in
(  select logicalparametername
from de_fw_des_br_logical_parameter  a (nolock),
de_fw_des_processsection_br_is  b (nolock),
de_fw_des_service_dataitem c (nolock)
where b.customer_name   = c.customer_name
and b.project_name   = c.project_name
and b.process_name   = c.process_name
and b.component_name  = c.component_name
and b.servicename   = c.servicename

and a.customer_name   = b.customer_name
and a.project_name   = b.project_name
and a.process_name   = b.process_name
and a.component_name  = b.component_name
and a.methodid   = b.methodid
and a.method_name   = b.method_name

and a.customer_name   = c.customer_name
and a.project_name   = c.project_name
and a.process_name   = c.process_name
and a.component_name  = c.component_name
and a.logicalparametername  = c.dataitemname

and c.customer_name   = @customer_name
and c.project_name   = @project_name
and c.process_name   = @process_name
and c.component_name  = @component_name
and c.servicename   = @service_name
and c.segmentname   = @cur_val
and flowdirection    <>  0
)
)
and  component_name+dataitemname not in (
select component_name+btsynonym
from de_scratch_variables_sys (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
union
select component_name+scratch_name
from de_scratch_variable (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name)

---------------------
--RESET BR SEQUENCE--
---------------------

exec de_reset_br_sequence @Ctxt_Language,
@Ctxt_Service,
@Ctxt_OUInstance,
@Ctxt_User,
@customer_name,
@project_name,
@ico_number,
@process_name,
@component_name,
@activity_name,
@ui_name,
@page_name,
@task_name,
@component_prfx,
@service_name

-- Code added by Ganesh to populate the record for error on 07/06/2004
exec de_gen_error_map_sp      @Ctxt_Language,
@ctxt_OUInstance,
@Ctxt_Service,
@ctxt_User,
@customer_name,
@project_name,
@process_name,
@component_name,
@activity_name,
@ui_name,
-- Extra parameter added on 11/8/04 by Ganesh
@page_name,
@task_name,
@ico_number,--chan
@m_errorid out

-- code added by Ganesh on 30/15/04 for the bugid :: DRENG203SYS_000105
-- to maintain the unmapped error in DR
-- to delete the unmapped errors which are removed in requirement level
delete  from de_fw_des_brerror_unmap
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name
and  cast(methodid as varchar(10))+method_name not in (
select cast(methodid as varchar(10))+method_name
from de_fw_des_brerror (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name = @process_name
and  component_name = @component_name)


-- to delete the errors which are unmapped in DR
delete  from de_fw_des_brerror
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name
and cast(methodid as varchar(10))+cast(errorid as varchar(10))+method_name in (
select cast(methodid as varchar(10))+cast(errorid as varchar(10))+method_name
from de_fw_des_brerror_unmap (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name = @process_name
and component_name = @component_name)


-- modifed by Ganesh For the Bugid ::: DEENG203SYS_000316 on 26/07/04
update a
set  a.activityid = b.activityid
from de_fw_des_ilbo_service_view_datamap a (nolock),
de_fw_req_activity b (nolock)
where a.customer_name = @customer_name
and  a.project_name = @project_name
and  a.process_name = @process_name
and  a.component_name= @component_name
and  a.servicename = @service_name
and  a.customer_name = b.customer_name
and  a.project_name = b.project_name
and  a.process_name = b.process_name
and  a.component_name= b.componentname
and  a.activity_name = b.activityname

--attributemap changes kiruthika 
update a
set  a.activityid = b.activityid
from de_fw_des_ilbo_service_view_attributemap a (nolock),
de_fw_req_activity b (nolock)
where a.customer_name = @customer_name
and  a.project_name = @project_name
and  a.process_name = @process_name
and  a.component_name= @component_name
and  a.servicename = @service_name
and  a.customer_name = b.customer_name
and  a.project_name = b.project_name
and  a.process_name = b.process_name
and  a.component_name= b.componentname
and  a.activity_name = b.activityname


--Code added BY DNR on 29-June-2004 for the bug id(DEENG203ACC_000081)
--To populate the refinement tables.
exec de_refinedata_population_sp @ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
@activity_name,
@component_name,
@customer_name,
@process_name,
@project_name,
@ico_number,
@ui_name,
@page_name,
@task_name,
@service_name,
@m_errorid output

-- Code added by Ganesh to populate the record for BTstring & BTsynonymString on 15/7/04
exec  de_gen_matchpattern_sp  @Ctxt_Language,
@ctxt_OUInstance,
@Ctxt_Service,
@ctxt_User,
@customer_name,
@project_name,
@process_name,
@component_name,
@service_name,
@m_errorid output

-- code added by Ganesh on 15/9/04 for the bugid ::: DEENG203ACC_000107
-- to populate the service log details table

-- starts here

declare  @sequence_no  engg_seqno,
@log_text  engg_documentation,
@pscount  engg_seqno,
@brcount  engg_seqno,
@segcount  engg_seqno

select @pscount = count(distinct  sectionname)
from de_fw_des_processsection_br_is (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name  = @process_name
and component_name  = @component_name
and servicename  = @service_name

select @brcount = count(distinct  method_name)
from de_fw_des_processsection_br_is (nolock)
where customer_name = @customer_name
and project_name = @project_name
and process_name  = @process_name
and component_name  = @component_name
and servicename = @service_name

select @segcount = count(distinct  segmentname)
from de_fw_des_service_segment (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  servicename  = @service_name

if ( @brcount > 0 )

begin
select @log_text = ' For the service :' + @service_name+
' Number of Process sections : ' + cast (@pscount as varchar(5)) +
', Number of Methods : ' + cast (@brcount as varchar(5)) +
', Number of Segments : ' + cast (@segcount as varchar(5)) +
' were created sucessfully'

select @sequence_no = isnull(max(sequence_no), 0)
from de_service_gen_log_dtl (nolock)
where customer_name = @customer_name
and  project_name = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name = @activity_name
and  ui_name   = @ui_name
and  task_name  = @task_name

if isnull (@sequence_no, 0) = 0
select @sequence_no = 0

select @sequence_no = @sequence_no + 1

if not exists ( select 's'
from de_service_gen_log_dtl (nolock)
where customer_name  = @customer_name
and  project_name  = @project_name
and  process_name  = @process_name
and  component_name  = @component_name
and  activity_name  = @activity_name
and  ui_name    = @ui_name
and  task_name   = @task_name
and  sequence_no   = @sequence_no)
begin

insert into de_service_gen_log_dtl
(customer_name,   project_name,  process_name,  component_name,
activity_name,   ui_name,   task_name,   service_name,
sequence_no,   log_text,   timestamp,   createdby,
createddate,   modifiedby,   modifieddate,  ecrno)--chan
values  (@customer_name,  @project_name,  @process_name,  @component_name,
@activity_name,   @ui_name,   @task_name,   @service_name,
@sequence_no,   @log_text,   1,     @ctxt_user,
@getdate,    @ctxt_user,   @getdate,   @ico_number)--chan
end
end

-- ends here

/*-- code added By Ganesh on 24/5/5 for the bugid :: PNR2.0_2570
If not Exists ( select  's'
from  es_comp_param_mst (nolock)
where customer_name =  @customer_name
and  project_name =  @project_name
and  process_name =  @process_name
and  component_name =  @component_name
and  param_category in ('CHAR', 'DATE','INTEGER','TIME') --CODE MODIFIED BY KIRUTHIKA FOR BUG ID:PNR2.0_4926
)
begin
Set @msg = 'Default Value For The Component Is Not Present'
exec engg_error_sp 'de_generate_design',
1,
@msg,
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
'',
'',
'',
'',
@m_errorid output
return
end
else
begin
--code Modified For BugId : PNR2.0_4649 Default Value For Date-Time is Date
update a
set  a.defaultvalue   =  c.current_value
from de_fw_des_Service_dataitem  a (nolock),
de_glossary     b (nolock),
es_comp_param_mst   c (nolock)
where a.customer_name  =  @customer_name
and  a.project_name  =  @project_name
and  a.process_name  =  @process_name
and  a.component_name =  @component_name
and  a.servicename  =  @service_name
and  a.customer_name  =  b.customer_name
and  a.project_name  =  b.project_name
and  a.process_name  =  b.process_name
and  a.component_name =  b.component_name
and  a.dataitemname  =  b.bt_synonym_name
and  b.customer_name  =  c.customer_name
and  b.project_name  =  c.project_name
and  b.process_name  =  c.process_name
and  b.component_name =  c.component_name
and  c.param_category =   case  b.data_type
when 'Numeric' then 'Integer'
when 'Date-Time' then 'Date'
else b.data_type
end
and  a.dataitemname  <>  'ModeFlag'


if exists ( select 'x'
from de_fw_des_Service_dataitem  a (nolock),
de_glossary     b (nolock),
es_comp_param_mst   c (nolock)
where a.customer_name  =  b.customer_name
and  a.project_name  =  b.project_name
and  a.process_name  =  b.process_name
and  a.component_name =  b.component_name
and  a.dataitemname  =  b.bt_synonym_name
and  b.data_type   =  'Char'
and  b.length    <  3
and  b.customer_name  =  c.customer_name
and  b.project_name  =  c.project_name
and  b.process_name  =  c.process_name
and  b.component_name =  c.component_name
and  b.data_type   = c.param_category
and  len(current_value)  >  2
and  a.customer_name  =  @customer_name
and  a.project_name  =  @project_name
and  a.process_name  =  @process_name
and  a.component_name =  @component_name
and  a.servicename  =  @service_name
and  a.dataitemname  <> 'ModeFlag')
begin

update a
set  a.defaultvalue   =  substring(current_value, 1, cast(b.length as int))
from de_fw_des_Service_dataitem  a (nolock),
de_glossary     b (nolock),
es_comp_param_mst   c (nolock)
where a.customer_name  =  @customer_name
and  a.project_name  =  @project_name
and  a.process_name  =  @process_name
and  a.component_name =  @component_name
and  a.servicename  =  @service_name
and  a.customer_name  =  b.customer_name
and  a.project_name  =  b.project_name
and  a.process_name  =  b.process_name
and  a.component_name =  b.component_name
and  a.dataitemname  =  b.bt_synonym_name
and  b.customer_name  =  c.customer_name
and  b.project_name  =  c.project_name
and  b.process_name  =  c.process_name
and  b.component_name =  c.component_name
and  b.data_type   = c.param_category
and  b.data_type   =   'CHAR'
and  a.dataitemname  <>  'ModeFlag'
and  b.length    <  3

end
end*/

SET NOCOUNT ON
end
GO
IF EXISTS( SELECT 'Y' FROM sysobjects WHERE name = 'de_generate_design' AND TYPE = 'P')
BEGIN
    GRANT EXEC ON de_generate_design TO PUBLIC
END
GO






