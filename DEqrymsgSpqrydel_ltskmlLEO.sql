
/******************************************************************************/
/* Procedure					: DEqrymsgSpqrydel_ltskmlLEO								 */
/* Description					: 								 */
/******************************************************************************/
/* Project						: 								 */
/* EcrNo						: 								 */
/* Version						: 								 */
/******************************************************************************/
/* Created By                   : JeyaLatha/Ranjitha              */
/* rTrack ID                    : TECH-16126 on 30-Nov-2017       */
/******************************************************************************/
/* Development history			: 								 */
/******************************************************************************/
/* Author						: ModelExplorer								 */
/* Date							: Nov 29 2017  1:14PM								 */
/******************************************************************************/
/* Modification History			: 								 */
/******************************************************************************/
/* Modified By					: Ranjitha R								 */
/* Date							: Jun 29 2018								 */
/* DefectID						: TECH-23185								 */
/******************************************************************************/

alter Procedure DEqrymsgSpqrydel_ltskmlLEO
	@ctxt_ouinstance          	ctxt_ouinstance, --Input 
	@ctxt_user                	ctxt_user, --Input 
	@ctxt_language            	ctxt_language, --Input 
	@ctxt_service             	ctxt_service, --Input 
	@engg_act_descr           	engg_description, --Input 
	@engg_act_name            	engg_name, --Input 
	@engg_comp_descr          	engg_description, --Input 
	@engg_comp_name           	engg_name, --Input 
	@engg_customer_name       	engg_name, --Input 
	@engg_ico_no              	engg_name, --Input 
	@engg_process_descr       	engg_description, --Input 
	@engg_process_name        	engg_name, --Input 
	@engg_project_name        	engg_name, --Input 
	@engg_query_instance      	engg_name, --Input 
	@engg_query_name          	engg_name, --Input 
	@engg_query_text          	nvarchar(max), --Input 
	@engg_query_type          	engg_name, --Input 
	@engg_ui_descr            	engg_description, --Input 
	@engg_ui_name             	engg_name, --Input 
	@hdncustomer              	engg_name, --Input 
	@hdnproject               	engg_name, --Input 
	@prj_hdn_ctrl             	plf_hdn_ctrl_bt, --Input 
	@m_errorid                	int output --To Return Execution Status
as
Begin
	-- nocount should be switched on to prevent phantom rows
	Set nocount on
	-- @m_errorid should be 0 to Indicate Success
	Set @m_errorid = 0

	--declaration of temporary variables


	--temporary and formal parameters mapping

	Set @ctxt_user                 = ltrim(rtrim(@ctxt_user))
	Set @ctxt_service              = ltrim(rtrim(@ctxt_service))
	Set @engg_act_descr            = ltrim(rtrim(@engg_act_descr))
	Set @engg_act_name             = ltrim(rtrim(@engg_act_name))
	Set @engg_comp_descr           = ltrim(rtrim(@engg_comp_descr))
	Set @engg_comp_name            = ltrim(rtrim(@engg_comp_name))
	Set @engg_customer_name        = ltrim(rtrim(@engg_customer_name))
	Set @engg_ico_no               = ltrim(rtrim(@engg_ico_no))
	Set @engg_process_descr        = ltrim(rtrim(@engg_process_descr))
	Set @engg_process_name         = ltrim(rtrim(@engg_process_name))
	Set @engg_project_name         = ltrim(rtrim(@engg_project_name))
	Set @engg_query_instance       = ltrim(rtrim(@engg_query_instance))
	Set @engg_query_name           = ltrim(rtrim(@engg_query_name))
	Set @engg_query_text           = ltrim(rtrim(@engg_query_text))
	Set @engg_query_type           = ltrim(rtrim(@engg_query_type))
	Set @engg_ui_descr             = ltrim(rtrim(@engg_ui_descr))
	Set @engg_ui_name              = ltrim(rtrim(@engg_ui_name))
	Set @hdncustomer               = ltrim(rtrim(@hdncustomer))
	Set @hdnproject                = ltrim(rtrim(@hdnproject))
	Set @prj_hdn_ctrl              = ltrim(rtrim(@prj_hdn_ctrl))

	--null checking

	IF @ctxt_ouinstance = -915
		Select @ctxt_ouinstance = null  

	IF @ctxt_user = '~#~' 
		Select @ctxt_user = null  

	IF @ctxt_language = -915
		Select @ctxt_language = null  

	IF @ctxt_service = '~#~' 
		Select @ctxt_service = null  

	IF @engg_act_descr = '~#~' 
		Select @engg_act_descr = null  

	IF @engg_act_name = '~#~' 
		Select @engg_act_name = null  

	IF @engg_comp_descr = '~#~' 
		Select @engg_comp_descr = null  

	IF @engg_comp_name = '~#~' 
		Select @engg_comp_name = null  

	IF @engg_customer_name = '~#~' 
		Select @engg_customer_name = null  

	IF @engg_ico_no = '~#~' 
		Select @engg_ico_no = null  

	IF @engg_process_descr = '~#~' 
		Select @engg_process_descr = null  

	IF @engg_process_name = '~#~' 
		Select @engg_process_name = null  

	IF @engg_project_name = '~#~' 
		Select @engg_project_name = null  

	IF @engg_query_instance = '~#~' 
		Select @engg_query_instance = null  

	IF @engg_query_name = '~#~' 
		Select @engg_query_name = null  

	IF @engg_query_text = '~#~' 
		Select @engg_query_text = null  

	IF @engg_query_type = '~#~' 
		Select @engg_query_type = null  

	IF @engg_ui_descr = '~#~' 
		Select @engg_ui_descr = null  

	IF @engg_ui_name = '~#~' 
		Select @engg_ui_name = null  

	IF @hdncustomer = '~#~' 
		Select @hdncustomer = null  

	IF @hdnproject = '~#~' 
		Select @hdnproject = null  

	IF @prj_hdn_ctrl = '~#~' 
		Select @prj_hdn_ctrl = null 
		
	Select	query_name				'engg_le_task_qryname',
			a.quick_code_value		'engg_le_task_qrytype',
			b.quick_code_value		'engg_le_task_qryinstance',
			query_text				'engg_le_task_qrytext'
	from	de_offtask_query qry(nolock),
			de_quick_code_mst a (nolock),
			de_quick_code_mst b (nolock)
	where	customer_name			= @engg_customer_name
	and		project_name			= @engg_project_name
	and		process_name			= @engg_process_name
	and		component_name			= @engg_comp_name
	--and     ecrno					= @engg_ico_no
	and		activity_name			= @engg_act_name
	and		ui_name					= @engg_ui_name 

	and		a.quick_code_type		= 'QUERY_TYPE' 
	and		a.quick_code			= qry.query_type

	and		b.quick_code_type		= 'SEG_INSTANCE' 
	and		b.quick_code			= qry.query_instance
	order by 1 

	/* 
	--OutputList
		Select
		null 'engg_le_task_qryinstance', 
		null 'engg_le_task_qryname', 
		null 'engg_le_task_qrytext', 
	*/
	
Set nocount off

End



