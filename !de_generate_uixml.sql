IF EXISTS (SELECT 'X' FROM SYSOBJECTS WHERE NAME = 'de_generate_uixml' AND TYPE = 'P')
BEGIN
	DROP PROC de_generate_uixml                                                                 
END
GO
/**************************************************************************************/
/*      V E R S I O N      :  PNR2.0_25308											  */
/*      Released By        :  Development Team										  */
/*      Release Comments   :  Phase 4 Release										  */
/**************************************************************************************/
/* PROCEDURE de_generate_uixml														  */
/* DESCRIPTION  SPmstsc to generate xml for the run time html						  */
/**************************************************************************************/
/* PROJECT   DE																	      */
/* VERSION																		      */
/**************************************************************************************/
/* Referenced																		  */
/* Tables																			  */
/**************************************************************************************/
/* Development history																  */
/**************************************************************************************/
/* Author  Ganesh																      */
/* Date   23/ 08/ 2005															      */
/**************************************************************************************/
/* modification history                                                               */
/* Modified by : Balaji S for callid PNR2.0_4149									  */
/* Modified on : 06/09/2005															  */
/* Description : In RumTime HTml,the trail bar at the bottom is wrapped and			  */
/*     right aligned																  */
/**************************************************************************************/
/* modification history                                                               */
/* Modified by : Ganesh for callid PNR2.0_4395									      */
/* Modified on : 26/09/2005															  */
/* Description : Tab Index not in sequence.											  */
/**************************************************************************************/
/* modified by  :	Gankan G														  */
/* date         :	07-Jan-2014												     	  */
/* Bug ID		:	PLF2.0_07135 													  */
/* Description	:	Changes for listedit column visible length						  */
/**************************************************************************************/
/* modified by  :	Gankan G														  */
/* date         :	16-Jan-2014												     	  */
/* Bug ID		:	PLF2.0_07231 													  */
/* Description	:	Changes for filtering special characters in grid column's		  */
/*					proto tool tip and sample data									  */
/**************************************************************************************/
/* modified by  :	Shakthi P														  */
/* date         :	07-FEB-2014												     	  */
/* Bug ID		:	PLF2.0_07428 													  */
/* Description	:	Changes for tree section node task								  */
/**************************************************************************************/
/* modified by  :	Shakthi P														  */
/* date         :	26-FEB-2014												     	  */
/* Bug ID		:	PLF2.0_07676 													  */
/* Description	:	Changes for 2.x-3.x iEDK Tab Index,Custom CSS inclusion, Grid Tool*/
/*Bar Hiding, Grid Tool Bar With Only Pagination, Grid Without Column Seperator and   */
/*					Grid Without Row Seperator										  */
/* More changes, so, no modification history										  */
/**************************************************************************************/
/* modified by  :	 Shakthi P             											  */
/* date         : 12-Mar-2014            											  */
/* Bug ID  		: PLF2.0_07805          											  */
/* Description 	: Changes for Section Level RowSpan, ColSpan, Filler Section - Control*/ 
/*					Level RowSpan													  */
/* More Changes, so comments are not included										  */
/**************************************************************************************/
/* modified by  :	Kanagavel A														  */
/* date         :	24-MAR-2014												     	  */
/* Bug ID		:	PLF2.0_07931 													  */
/* Description	:	Tab_seq is not in proper order when the UI designed with		  */
/*					parent section                                                    */
/* More changes, so, no modification history										  */
/**************************************************************************************/
/* modified by  : Shakthi P                                                     	  */
/* date         : 30 May 2014                                               	      */
/* Bug Id       : PLF2.0_08470                                      	        	  */
/* Description  : Tooltip Not Required.ForceFit,Grid Column Caption Not Required 	  */
/* There is log of changes so,no modification History                            	  */
/**************************************************************************************/
/* modified by  :	Kanagavel A														  */
/* date         :	17/06/2014												     	  */
/* Description	:	For Section type Map, Properties Mapin and mapout added			  */
/* More changes, so, no modification history										  */
/**************************************************************************************/
/* modified by  :	Ganesh Prabhu S													  */
/* date         :	11-Aug-2014														  */
/* Bug ID		:	PLF2.0_09422         											  */
/* Description	:	Vss Updation													  */
/**************************************************************************************/
/* modified by  : Veena U   			                                              */
/* date         : Oct 10 2014														  */
/* BugId        : PLF2.0_09035														  */
/* description  : Model changes for rowspan,colspan,IsStatic,IsCallout				  */
/*				  in  layout level.												      */
/**************************************************************************************/
/* Modified by  : Veena U                                                             */
/* Date         : 25-Feb-2015                                                         */
/* Call ID		: PLF2.0_11499                                                        */
/**************************************************************************************/  
/* Modified by  : Kanagavel A	                                                      */
/* Date         : 08-26-2015														  */
/* Defect Desc	: Implementing Changes for New features                               */
/**************************************************************************************/
/* Modified by  : Veena U                                                             */
/* Date         : 24-Feb-2016														  */
/* Defect ID	: PLF2.0_16291														  */
/**************************************************************************************/  
/* Created by  	: Veena U                                                             */
/* Date         : 28-Mar-2016														  */
/*Defect Id 	: PLF2.0_17570														  */
/**************************************************************************************/  
/* Created by  	: Veena U														      */
/* Date         : 19-May-2016														  */
/*Defect Id 	: PLF2.0_18487														  */
/**************************************************************************************/ 
/* Created by  	: Loganayaki P														  */
/* Date         : 26-May-2016														  */
/*Defect Id 	: PLF2.0_18487 - combo links caption shoulb in lowercase,only mapped  */
/*					links should be listed											  */
/**************************************************************************************/ 
/* modified by			Date				Defect ID								  */
/* Veena U				08-Jun-2016			PLF2.0_18487							  */
/**************************************************************************************/
/* Modified by : Jeya Latha K/Ganesh Prabhu S	for callid TECH-7349				  */
/* Modified on : 14-03-2017				 											  */
/* Description :  New Base Control types RSAssorted, RSPivotGrid, RSTreeGrid and New  */
/*					Feature Organization chart       								  */
/**************************************************************************************/
/* Modified by : Ganesh Prabhu S/Ranjitha R      for callid  TECH-10118               */
/* Modified on : 30-May-2017                                                          */
/* Description : Platform Feature Release                                             */
/**************************************************************************************/
/* Modified by  : Jeya Latha K		Date: 16-Aug-2017  Defect ID	:TECH-12776		  */  
/**************************************************************************************/
/* Modified by : Ganesh Prabhu S													  */
/* Modified on : 10-OCt-2017                                                          */
/* Description : Control name attribute is handled in customlist tag                  */
/**************************************************************************************/
/* Modified by  : JeyaLatha K/Ranjitha R	Date: 31-Jan-2018  Defect ID : TECH-18349 */  
/**************************************************************************************/
/* Modified by  : Venkatesan K	Date: 03-mar-2018  Defect ID : TECH-19895             */  
/* Description : Section collapse property disabled for  help screen ok section.      */
/**************************************************************************************/
/* Modified by  : JeyaLatha	Date: 02-Apr-2018  Defect ID : TECH-20326                 */  
/* Description  : Implementation of Scan for Mobility								  */
/**************************************************************************************/
/*Modified by	: Jeya Latha K   Defect ID: TECH-20897      On: 30-Apr-2018			  */
/**************************************************************************************/
/* Modified by	: Ganesh Prabhu S   Defect ID: TECH-23600       On: 30-june-2018	  */
/* Modified by	: Jeya Latha K      Defect ID: TECH-27036       On: 11-Oct-2018		  */
/* Modified by	: Jeya Latha K      Defect ID: TECH-27286       On: 22-Oct-2018	      */
/* Modified By  : Jeya Latha K		Date: 08-Jan-2019			Defect ID: TECH-29822 */
/* Modified by  : Jeya Latha K		Date: 28-Jun-2019			Defect ID: TECH-35368 */
/* Modified by  : Jeya Latha K		Date: 25-Jul-2019			Defect ID: TECH-36371 */
/* Modified by  : Kiruthika R		Date: 20-Aug-2019	By kiruthika for enum code 	  */	
/* Modified by  : Jeya Latha K      Date: 30-Aug-2019			Defect ID: TECH-37471 */
/* Modified by  : Jeya Latha K      Date: 01-Nov-2019			Defect ID: TECH-39534 */
/* Modified by  : Jeya Latha K      Date: 07-Nov-2019			Defect ID: TECH-39785 */
/* Modified by : Jeya Latha K       Date: 04-Dec-2019			Defect ID : TECH-40809 */
/****************************************************************************************/
/* Modified by : Hareesh K/Jeya Latha K     Date: 04-Dec-2019   Defect ID : TECH-40809  */ 
/* Modified by : Jeya Latha K				Date: 14-Jan-2020	Defect ID: TECH-41979   */
/* Modified by : Jeya Latha K  	            Date: 29-Jan-2020   Defect ID : TECH-42483  */
/* Modified by : Jeya Latha K  	            Date: 07-Feb-2020   Defect ID : TECH-42760  */
/**************************************************************************************************/
/* Modified by  : Jeya Latha K		 Date: 24-Apr-2020  Defect ID	:TECH-45546					  */
/* Modified by : Venkatesan K  	     Date: 06-May-2020   Defect ID : TECH-45828                   */
/* Modified by : Venkatesan K  	     Date: 29-May-2020   Defect ID : TECH-46646                   */
/* Modified by : Manoj S		     Date: 14-Apr-2021   Defect ID : TECH-56570                   */
/* Modified by : Manoj S             Date: 14-Apr-2021   Defect ID : TECH-57347                   */
/* Modified by : Manoj S             Date: 20-Apr-2021   Defect ID : TECH-57390                   */
/* Modified by  : Jeya Latha K		 Date: 28-Jul-2021   Defect ID : TECH-60451					  */
/* TECH-60451   : Launching Help&Link UIs, Popup sections and Grid Extensions in Side Drawer      */ 
/**************************************************************************************************/
/* TECH-64197   : To identify incoming UI having GraphQL mapping or not.						  */ 
/**************************************************************************************************/
/* Modified by  : Ganesh Prabhu S		 Date: 25-May-2022   Defect ID : TECH-69346				  */
/**************************************************************************************************/
/* Modified by	:	Jeya Latha K/Ponmalar A														  */
/* Modified on	:	15-Jun-2022				 													  */
/* Defect ID	:	TECH-69624																	  */
/* Description	:	Custom border, Custom actions and Responsive layout							  */
/**************************************************************************************************/
/* Modified by	:	Ponmalar A/Jeya Latha K														  */
/* Modified on	:	11-July-22				 													  */
/* Defect ID	:	TECH-70687																	  */
/* Description	:	Tool and Toolbars															  */
/**************************************************************************************************/
/* Modified by  :   Ponmalar A																	  */
/* Modified on	:	23-Aug-2022				 													  */
/* Defect ID	:	TECH-72114																	  */
/* Description	:	Platform Modeling for Section Title Icon.									  */
/*					BadgeText Property for DataHyperLink Controls/Columns.						  */
/*					Top Inner option in UI Level.												  */
/**************************************************************************************************/
/* Modified by  : Ponmalar A		 Date: 29-Sep-2022		Defect ID : TECH-73216				  */
/**************************************************************************************************/
/* Modified by : Deepika S			  Date: 16-Sep-2022    Defect ID : TECH-72657				  */
/**************************************************************************************************/
/* Modified by	:	Ponmalar A																	  */
/* Modified on	:	27-Oct-2022				 													  */
/* Defect ID	:	TECH-73996																	  */
/* Description	:	Platform Release for the month of October'22								  */
/**************************************************************************************************/
/* Modified by	:	Ponmalar A																	  */
/* Modified on	:	01-Dec-2022				 													  */
/* Defect ID	:	TECH-75230																	  */
/* Description	:	Platform Release for the month of Nov'22									  */
/**************************************************************************************************/
/* Modified by	:	Ponmalar A																	  */
/* Modified on	:	21-Dec-2022				 													  */
/* Defect ID	:	TECH-75956																	  */
/* Description	:	Platform release for the Month of Dec'2022									  */
/**************************************************************************************************/
/* Modified by : Ponmalar A			  Date: 03-Jan-2023    Defect ID : TECH-76231				  */
/**************************************************************************************************/
/* Modified by : Jeya Latha K		  Date: 12-Jan-2023    Defect ID : TECH-76600				  */
/**************************************************************************************************/
/* Modified by	:	Ponmalar A																	  */
/* Modified on	:	31-Jan-2023				 													  */
/* Defect ID	:	TECH-77097																	  */
/* Description	:	Platform feature release for the month of Jan'23							  */
/**************************************************************************************************/
/* Modified by : Ponmalar A				Date: 28-Feb-2023    Defect ID : TECH-77908				  */
/* Modified by : Athul M				Date: 01-Mar-2023    Defect ID : TECH-75609				  */
/**************************************************************************************************/
CREATE PROCEDURE de_generate_uixml
@ctxt_language_in             engg_ctxt_language,
@ctxt_ouinstance_in           engg_ctxt_ouinstance,
@ctxt_service_in              engg_ctxt_service,
@ctxt_user_in                 engg_ctxt_user,
@engg_act_descr_in            engg_description,
@engg_actname_in              engg_name,
@engg_att_ui_cap_align_in     engg_name,
@engg_att_ui_format_in        engg_description,
@engg_att_ui_trail_bar_in     engg_name,
@engg_component_descr_in      engg_description,
@engg_customer_name_in        engg_name,
@engg_language_name_in        engg_name,
@engg_project_name_in         engg_name,
@engg_req_no_in               engg_name,
@engg_smartspan_in            engg_flag,
@engg_stylesheet_in           engg_description,
@engg_virdir_in               engg_path,
@guid_in                      engg_guid,
@engg_ui_descr_in       engg_description,
@sample_data_from       engg_name = 'Layout',
@html_gen_path        engg_description ,
@itk_flag        engg_seqno = 0,
@m_errorid                    engg_rowno output

as
begin
set nocount on

--declaration of temporary variables
declare @ctxt_language                engg_ctxt_language
declare @ctxt_ouinstance              engg_ctxt_ouinstance
declare @ctxt_service                 engg_ctxt_service
declare @ctxt_user                    engg_ctxt_user
declare @engg_act_descr               engg_description
declare @engg_actname                 engg_name
declare @engg_att_ui_cap_align        engg_name
declare @engg_att_ui_format           engg_description
declare @engg_att_ui_trail_bar        engg_name
declare @engg_customer_name           engg_name
declare @engg_language_name           engg_name
declare @engg_project_name            engg_name
declare @engg_req_no                  engg_name
declare @engg_smartspan               engg_flag
declare @engg_stylesheet              engg_description
declare @engg_virdir                  engg_path
declare @engg_ui_descr        engg_description
declare @guid                     engg_guid
declare @linkSection    engg_flag
declare @buttonSection    engg_flag
declare @GanttSection    engg_flag
declare @SectionRenderAs    engg_description	--Clde Added for Defect ID : TECH-39534
declare @StatusMessage    engg_documentation
declare @ConfirmationMessage    engg_documentation_lng --Modified against the Defect ID :TECH-72657
declare @CVS    engg_flag
declare @ExcelReport    engg_flag
declare @pref_pagename    engg_name
declare @Tree    engg_flag
declare @Chart    engg_flag
declare @FullTree    engg_flag
declare @ManualReport   engg_name
declare @associated_control  engg_name   --Added for PNR2.0_23175
declare @is_email engg_flag --PNR2.0_25954
--code added for the caseid : PNR2.0_28319 starts
declare @image_row_width	engg_seqno
declare @image_preview_height	engg_seqno
declare @image_preview_width	engg_seqno
declare @image_preview_req	engg_flag
declare @Accept_Type	engg_name
declare @Lite_Attach_Image	engg_flag
Declare @IsListBox	       engg_name-- modified for bugID:PLF2.0_03057
Declare @filesize	engg_name
Declare @UPEEnabled_Comp	engg_name

--code added for the caseid : PNR2.0_28319 ends
declare @ok_caption engg_description_lng -- code modified by kiruthika for bugid :PNR2.0_28767 on 21-oct-2010
-- Modification for PNR2.0_17733 by Gowrisankar on 4-Apr-2008 starts; engg_description is replaced by engg_description_lng
declare @activity_name 			engg_name,		@engg_component_descr  engg_description_lng, --engg_description,
		@engg_component    		engg_name,		@ui_sysid_tmp     	   engg_sysid,		@ui_name_tmp     		engg_name,      @engg_ui_descr_tmp    engg_description_lng, 
		@ui_type_tmp     		engg_name,		@ui_format_tmp     	   engg_name,		@caption_alignment_tmp  engg_name,
		@trail_bar_tmp    		engg_name,		@tab_height_tmp    	   engg_rowno,		@page_bt_synonym_tmp    engg_name,		@page_descr_tmp     engg_description_lng, 
		@mainpage_tmp    		engg_name,		@oksectionname_tmp     engg_name,		@horder_tmp     		engg_rowno,		@vorder_tmp         engg_rowno,
		@section_bt_synonym_tmp engg_name,		@section_descr_tmp     engg_description_lng, --engg_description,
		@visible_flag_tmp    	engg_flag,		@title_required_tmp    engg_flag,		@border_required_tmp   	engg_flag,
		@parent_section_tmp   	engg_name,		@control_bt_synonym_tmp  engg_name,		@ctrl_descr_tmp    		engg_description_lng, --engg_description,
		@control_type_tmp   	engg_name,		@base_ctrl_type_tmp    engg_name,		@proto_tooltip_tmp   	engg_description_lng, --engg_description,
		@sample_data_tmp   		engg_documentation,@hiddensectrow_tmp  engg_rowno,		@oksectionrow_tmp   	engg_rowno,		@visible_length_tmp   engg_rowno,
		@mandatory_flag_tmp   	engg_flag,		@editable_flag_tmp     engg_flag,		@caption_req_tmp    	engg_flag,		@select_flag_tmp      engg_flag,
		@zoom_req_tmp     		engg_flag,		@help_req_tmp     	   engg_flag,		@ellipses_req_tmp    	engg_flag,		@visible_rows_tmp     engg_rowno,
		@data_column_width_tmp  engg_seqno,		@controldoc_tmp    	   engg_documentation_lng, --engg_description,
		@label_column_width_tmp engg_seqno,		@column_bt_synonym_tmp  engg_name,		@le_ref_column_bt_synonym_tmp 	engg_name,
		@col_descr_tmp    		engg_description_lng, --engg_description,
		@column_type_tmp    	engg_name,		@column_no_tmp    		engg_rowno,		@button_code_tmp   		engg_name,		@seq_no_tmp     	   engg_rowno,
		@button_caption_tmp   	engg_description_lng, --engg_description,
		@targetdir_tmp    		engg_description,@xmlpath_tmp    		engg_description,@default_flag_tmp   	engg_flag,		@previous_section_tmp  engg_name,
		@previous_horder_tmp  	engg_rowno,		@previous_vorder_tmp  	engg_rowno,		@position_vindex_tmp  	engg_rowno,		@position_sindex_tmp   engg_rowno,
		@position_hindex_tmp  	engg_rowno,		@transformed_horder_tmp engg_rowno,		@transformed_vorder_tmp  engg_rowno,	@transformed_seqno_tmp engg_rowno,
		@datatype_tmp    		engg_name,		@datalength_tmp    		engg_rowno,		@uitaskname_tmp    		 engg_name,
		@controlid_tmp    		engg_name,--   @engg_process_name_tmp  engg_name,
		@process_name    		engg_name,		@process_descr    		engg_description,@link_name_tmp    		 engg_name,		@link_page_tmp    		engg_name,
		@link_section_tmp    	engg_name,	    @link_type_tmp     		engg_name,		 @linked_component_tmp   engg_name,		@linked_activity_tmp   	engg_name,
		@linked_ui_tmp    		engg_name,--   @engg_base_req_no   engg_name,
		@xml_seq_tmp    		engg_rowno,--   @cntincr_tmp    engg_rowno,
		@prjsecrow     			engg_rowno,		@caption_wrap_tmp  		engg_flag,		 @caption_position_tmp   engg_name,		@sectitle_align_tmp   	engg_name,--   @val      engg_description,
		@order_seq_tmp    		engg_rowno,		@associated_task   		engg_name,		 @default_for_tmp   	 engg_name,		@ui_descr_tmp    		engg_description_lng, --engg_description,
		@task_name_tmp    		engg_name,		@task_type_tmp    		engg_name,		 @task_descr_tmp    	 engg_description_lng, --engg_description,
		@default_sample_data_tmp engg_description,@task_seq_tmp    		engg_seqno,		 @task_pattern_tmp   	 engg_name,		@viewname_tmp    		engg_name,
		@primary_control_bts_tmp engg_name,		@ctrl_position_tmp   	engg_name,		 @label_class_tmp   	 engg_name,		@ctrl_class_tmp    		engg_name,
		@delete_flag_tmp   		 engg_flag,		@entry_ui_tmp    		engg_name,		 @engg_function    		 engg_name,		@pubflag     			engg_flag,
		@activity_type    		 engg_type,		@password_char_tmp   	engg_flag,		 @task_img_tmp    		 engg_name,		@help_img_tmp    		engg_name,
		@radhorder_tmp    		 engg_rowno,	@radvorder_tmp    		engg_rowno,		 @task_descr_link_tmp  	 engg_description_lng, --engg_description,
		@engg_act_descr_temp  	 engg_description_lng, --engg_description,
		@decimal_length_ctrl  	 engg_length,	@decimal_length_grid  	engg_length,	 @language_code    		 engg_name,		@data_column_scalemode  engg_prefix,
		@label_column_scalemode  engg_prefix,	@tab_seq_tmp           	engg_seqno,		 @tab_seq     			 engg_name,		@tab_seq_lbl     		engg_name,   
		@tab_sec_horder    		 engg_rowno,	@tab_sec_vorder    		engg_rowno,		 @set_first_tab    		 Numeric(8,0),	@set_first_tab_grid   Numeric(8,0),
		@rtuitype     			 engg_name,		@engg_act_descr_lng     engg_description_lng, --engg_description,
		@vis_page     			 engg_name,		@vis_ctrl     			engg_name,		 @vis_col     			 engg_name, /* PNR2.0_11203 */
		@vis_leng     			 engg_seqno,	@Sum_vis_leng    		engg_seqno,		 @filler_seq_no    		 engg_length,	@page_prefix    		engg_prefix,
		@section_type_tmp   	 engg_name,		@html_text_area    		engg_flag,		 @spin_required    		 engg_flag,
		@spin_up_image    		 engg_description,@spin_down_image   	engg_description,@helptext     			 engg_description_lng,
		@section_height_tmp   	 engg_seqno,	@section_width_tmp   	engg_seqno,		 @section_heightscalemode_tmp engg_name,
		@section_widthscalemode_tmp  engg_name,	@associated_spin_task   engg_name,		 @associated_spin_ctrl    engg_name,     @associated_primary_ctrl  engg_name,
--Code Modified For BugId : PNR2.0_7461
		@offlinepackage     	 engg_seqno,	@value_tmp     			engg_description_lng, --engg_description,
--code modified for bugId : PNR2.0_10693
		@report_reqd    		 engg_flag,		@section_level    		engg_seqno,		 @filler_seq_no_control_tmp engg_seqno,	 @filler_seq_no_filler_tmp engg_seqno,
--Code Modified for bugid : PNR2.0_11183
		@modelsectioname_tmp  	 engg_name,		@ocx_Name     			engg_name,		 @progid      				engg_name,	 @enum_code_tmp     		engg_name,
		@enum_caption_tmp    	 engg_description_lng, --engg_description,
		@StateEnabled     		 engg_name,		@FillerClass    		engg_name ,--Code Added For Bug_id PNR2.0_17856
		@itk_enum_cnt     		 engg_seqno,	@itk_rem_cnt     		engg_seqno,
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
		@InPlaceCalendar    	 engg_flag,		@InPlaceCal_Display    	engg_flag,		 @EditMaskPattern    engg_name,
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
@AccessKey    engg_name, -- Added By Jeya
@itk_req engg_flag, -- added by feroz for bug id PNR2.0_18385
-- Modification for PNR2.0_17733 by Gowrisankar on 4-Apr-2008 Ends; engg_description is replaced by engg_description_lng
@Set_User_Pref engg_flag ,--Code Added For BugId : PNR2.0_18436
@PageClass engg_name,
-- Modification for PNR2.0_17733 by Gowrisankar on 4-Apr-2008 Ends; engg_description is replaced by engg_description_lng
@SectionPrefixClass engg_name, --Code Added For BugId PNR2.0_18564
@help_tabstop engg_name,  --code added for bugid:PNR2.0_19031
@help_tabstop_tmp engg_name, --code added for bugid:PNR2.0_19031
-- Parameter addition for  PNR2.0_20049  starts
		@data_type  			engg_name,		@data_type_ctrl   		engg_name,		 @data_type_grid   	 engg_name,-- Parameter addition for  PNR2.0_20049  ends
-- Parameter addition for  PNR2.0_20849   starts
		@lang_settings    		engg_documentation,@NoofLinesPerRow   	engg_flag,		 @RowHeight       	 engg_flag,		@Vscrollbar_Req    			engg_flag,
		@ServerName   			engg_name,		@DatabaseName   		engg_name,		 @gridlite  		 engg_flag   ,	@extjs_values    			engg_documentation,
		@extjs_ctrl_type   		engg_name,		@section_type    		engg_name,		 @extjs_base_ctrl    engg_name,		@type_prefix    			engg_type,
		@callout_task_tmp   	engg_flag,		@pivot_prop_tmp    		engg_documentation,@callout_type     engg_type,		@page_type     				engg_type,
		@bulletlink_req    		engg_flag,			@buttoncombo_req   		engg_flag,		 @dataascaption    	 engg_flag,		@associatedlist_req   		engg_flag,
		@onfocustask_req   		engg_flag,		@listrefilltask_req   	engg_flag,		 @listedit_NoofColumns  engg_seqno,	@attach_document   			engg_flag,
		@image_upload    		engg_flag,		@inplace_image    		engg_flag,		 @image_icon     		engg_flag,	@image_row_height   		engg_seqno,
		@relative_url_path   	engg_description,@relative_document_path  engg_description,@relative_image_path  engg_description,@save_doc_content_to_db  engg_flag,
		@save_image_content_to_db engg_flag,	@onfocus_taskname   	engg_name,		 @associatedlist_name  engg_name,	@listrefill_taskname  		engg_name,
		@primary_search_column  engg_name,		@list_index_search   	engg_seqno,		 @hidden_view_name     engg_name,	@mapped_list_controlid  	engg_name,
		@mapped_list_viewname  	engg_name,		@date_highlight_req   	engg_flag,		 @mapped_sec_controlid  engg_name,	@mapped_sec_viewname  		engg_name,
		@group_task_name   		engg_name,		@tb_display_seqno   	engg_seqno,		 @tb_class_name    		engg_name,	@tb_display_text   			engg_description,
		@tb_caption_req    		engg_flag,		@tb_control_req    		engg_flag,		 @tbg_group_task_name  	engg_name,	@tbg_task_seqno    			engg_seqno,
		@tbg_class_name    		engg_name,		@tbg_display_text   	engg_description,@tbg_control_req   	engg_flag,	@toolbar_id     			engg_name,
		@tb_type     			engg_type,		@tbg_type     			engg_type,		 @group_task_desc   	engg_description,@task_seqno_tmp    	engg_seqno,
		@group_name     		engg_name,		@tb_controlid    		engg_name,		 @tbg_controlid    		engg_name,	@tb_viewname    			engg_name,
		@tbg_viewname    		engg_name,		@freezecount    		engg_rowno, -- code added for the caseid:PNR2.0_26872
--code added for the Bud ID: PNR2.0_27796 starts
		@Lite_Attach    		engg_flag,		@BrowseButton  			engg_flag,		 @DeleteButton  engg_flag,
		@colspan				engg_seqno,		@uicolspan      		engg_seqno,		 @nonuicolspan   engg_seqno,
-- Code modification for  PNR2.0_30127 starts
		@ErrorLookup    		engg_flag,		@FollowupTask    		engg_flag,		 @enablefiller	 engg_flag, --code added for the caseid : PNR2.0_31178	-	PNR2.0_31287
 --Code Added for PNR2.0_30869 Starts
		@ProcessingMessage		engg_documentation, @timezone			engg_flag,		 @default_required	engg_flag,
--Code Added for PNR2.0_30869 End
@AssociatedML		engg_documentation,  -- Code Added for PNR2.0_31051
@autoexpand			engg_flag, -- Code Added for the Bug ID PNR2.0_32053 
@Disp_Only_Apply_Len    engg_flag, -- Code Added for the Bug ID PNR2.0_32770
/*Modification made by Sangeetha G for Bug id : PNR2.0_33378 starts*/
		@gridcollength   		engg_name ,		@editcombo_req   		engg_flag,		 @java_combocss   engg_flag,
/*Modification made by Sangeetha G for Bug id : PNR2.0_33378 ends*/
@Section_Position engg_type, @ProtoLaunchMode engg_flag, @LinkLaunchType engg_name,/*Code Added for the Bug ID: PNR2.0_35383*/ @SlidingBarHeight_tmp engg_seqno   ---11742

Declare @LabelLink engg_flag --Code Added for the Bug ID: PNR2.0_36309
Declare @Associatedcontrol engg_name --PLF2.0_03715
        Declare @page_image         engg_name ,         @popup_page         engg_name,         @popup_section      engg_name,         @popup_close        engg_flag ,
         @captiontype        engg_name ,         @controlstyle       engg_name,
         @controlimage       engg_name,         @Image              engg_name         
declare  @alignbtn  engg_flag  
select    @alignbtn= ''
declare  @algnbtn_h_tmp engg_seqno ,         	 @algnbtn_v_tmp 		engg_seqno,      @horder_1  		engg_seqno ,         @vorder_1 engg_seqno 
declare	 @width_page   		   engg_seqno ,		 @Toolbar_Not_Req   	engg_name,		 @ColumnBorder_Not_Req   engg_name,		 @RowBorder_Not_Req   engg_name,
		 @PagenavigationOnly   engg_name,		 @custom_styles 		engg_flag,		 @RowNo_Not_Req   	engg_name,		 	 @ButtonHome_Req   engg_name,
		 @ButtonPrevious_Req   engg_name,		 @ExtType   			engg_name,		 @ColumnClass   	engg_name,		 	 @ColumnStyle   	engg_name,		 
		 @NRowSpan   		   engg_seqno,		 @NColSpan   			engg_seqno, 	 @ControlColSpan    engg_seqno,		 	 @ControlRowSpan   engg_seqno,
		 @ToolTip_Not_Req      engg_name,		 @Forcefit   			engg_name,		 @columncaption_Not_Req   engg_name,	 @Border_Not_Req   engg_name,
		 @IsModal  			   engg_name,		 @Alternate_Color_Req  	engg_name,		 @Map_In_Req		 engg_name,		 	 @Map_Out_Req	   engg_name,
		 @New_Line_Ui		   engg_flag,		 @TabType				engg_name,		 @norowdisplay		 engg_name
		--code added for bugid: PLF2.0_07676 ends
-------
 Declare	@combo_control_bt_synonym_tmp engg_name,	@link_control_bt_synonym_tmp engg_name,		@link_control_caption_tmp engg_name,	@display_seqno_tmp engg_seqno,
			@separatelink_req_tmp engg_name,			@map_tmp engg_name,							@associated_task_name_tmp engg_name,	@combo_default engg_name, 
			@control_task_type_tmp engg_name,			@iscallout engg_flag,						--- @isstatic engg_flag,
			@section_collapse_mode engg_name,			@section_collapseable engg_name,			@section_prefix_class engg_name,		 --@Columnhdrclass engg_name,
			@SourceCtrl  engg_name,						@TargetCtrl  engg_name,						@controltype  engg_name,				--@isbrowse engg_name,
			@qrflag  		engg_name,					@barcodeflag 	 engg_name,					@width		engg_seqno,					@height 		 engg_seqno,		
			@Toolbar_notreq	engg_seqno,					@browse_control	engg_name,					@path_control	 engg_name,				@btype 		engg_name,		
			@group_node_task	engg_name ,				@tabposition	engg_flag,					@postlaunchtask engg_flag,				@iSDeviceInfo	 engg_flag,		
			@Datagrid	engg_flag,						@Email				engg_flag,				@TemplateID		engg_name,				@Phone			engg_flag,		
			@StaticCaption	 engg_flag,					@Orientation	engg_name,					@MoveFirst			engg_flag,			@Move_PrevSet	engg_flag,
			@Move_Next		engg_flag,					@Move_NextSet	 engg_flag,					@Move_Last		engg_flag,				@Carousel_Req		engg_flag,			
			@Wrapcount		engg_seqno,					@Box_Type		engg_seqno,					@CarouselNavigation	engg_flag,			@Move_Previous	engg_flag,	
			@colname		engg_name,					@listcontrol	 engg_flag,					@col_caption_align	engg_name,			@ctrl_col_caption_align engg_name,	
			@dg_section_bt_synonym 	engg_name,			@RowIndicator 	engg_name,					@Gridtoolbarstyle   engg_name,			@Gridheaderstyle  engg_name  ,	
			@preevent		engg_flag ,					@postevent  		engg_flag , 			@SmartHide		engg_flag,				@Isdevice		engg_flag ,		
			@SectionIndicator engg_name ,				@IlboTitleReq	engg_flag ,					@col_data_align		engg_name,			@avn_download   engg_flag , 
			@Exclude_Systemtabindex engg_flag,			@systemspin		engg_flag,					@cell_spacing	engg_seqno,				@cell_padding	engg_seqno ,	
			@isPivot		engg_flag,					@DeviceType			engg_name,				@TabStyle		engg_name,				@HeaderPosition	engg_name,		
			@TabRotation	engg_name,					@TabTitleStyle	engg_name,					@TabIconPosition	engg_name,			@PageLayout		engg_name,
			@XYCoordinates	engg_description,			@ColumnLayWidth engg_description,			@Region		engg_name,					@TitlePosition		engg_name,			
			@CollapseDir	engg_name,					@SectionLayout	engg_name,					@IsDesktop		engg_flag,				@IsPhone		engg_flag,	
			@IsTablet			engg_flag,				@Hide_Print engg_flag,						@treeGrdNew	engg_documentation,			@UiLayout	engg_name,		
			@TemplateCat	engg_name,					@TemplateSpecific	engg_documentation,		@ExpandImageEvent engg_flag,			@Control_class_ext6 engg_name  , 
			@Icon_Class engg_name,						@Control_cls_ext6 engg_name,				@button_prev_service engg_name  ,		@PopupCloseOnClick engg_Flag,
			@renderas engg_name,						@rowexpander engg_flag,						@gridtoform engg_flag ,					@hdrpersonalization engg_flag,
			@hidedefaults engg_flag ,					@Icon_Position engg_name,					@Classprops engg_description,			@SparkChart engg_doc_type, 
			@uisubtype engg_name,						@hidden_view_name1 engg_name,				@tablayout		engg_name,				@sectionlaunchtype engg_name, 
			@smartviewsection engg_flag,				@preserveposition engg_flag,				@scan			engg_flag,				@grporientation	engg_doc_type,
			@QuickTask		engg_name,					@OfflineTask	engg_name,					@SystemTask		engg_name,				@SystemTaskType	engg_name,
			@IsCalendar		engg_flag,					@setfocusevent	engg_name,					@leavefocusevent	engg_name,			@setfocuseventoccur	engg_flag,
			@leavefocuseventoccur engg_flag,			@CompactView	engg_flag,					@DirectPrint		engg_flag,			@titlebar_Search	engg_flag,
			@SpellCheckRequired	engg_flag,				@IsResponsive	engg_flag,					@fullview			engg_flag,			@DynamicFileUpload	engg_flag,
			@UPEEnabled	engg_flag,						@MoreEventName	engg_name,					@ImageType			engg_name,			@DynamicStyleControlName engg_name,
			@section_prefix	engg_name,					@PaginationRequired	engg_flag,				@AssociatedUpdateTask	engg_name,		@AssociatedDeleteTask	engg_name,
			@IsMobile	engg_flag,						@UpdateTaskReqd	engg_flag,					@DeleteTaskReqd		engg_flag,			@RowAlwaysExpanded		engg_flag,
			@tmp_node	engg_name,						@IsSideDrawer	engg_flag,					@IsExtension		engg_flag,			@ExtensionOrder			engg_Seqno,
			@IsGql		engg_flag,						@IsFilter		engg_flag,					@forresponsive		engg_name, 			@Sidebar				engg_flag,		--TECH-70687
			@TitleIcon	engg_name,						@BadgeText		engg_flag,					@labelname			engg_name,			@AutoHeight				engg_flag, --TECH-72114
			@EyeIconforPassword	engg_flag,				@PreviousCount	engg_seqno,					@Signature			engg_name,			@Stepper				engg_name, --TECH-73996
			@PullToRefresh	engg_flag,					@SecOrientation	engg_name,					@ColIconPosition	engg_name,	--TECH-75230
			@IconRequired	engg_flag,					@SystemClass	engg_flag,					@ColSystemClass		engg_flag,			@ButtonHeight			engg_flag --TECH-77097

--temporary and formal parameters mapping
select @ctxt_language				  = @ctxt_language_in
select @ctxt_ouinstance               = @ctxt_ouinstance_in
select @ctxt_service                  = ltrim(rtrim(@ctxt_service_in))
select @ctxt_user					  = ltrim(rtrim(@ctxt_user_in))
select @engg_act_descr                = ltrim(rtrim(@engg_act_descr_in))
select @engg_actname				  = ltrim(rtrim(@engg_actname_in))
select @engg_att_ui_cap_align         = ltrim(rtrim(@engg_att_ui_cap_align_in))
select @engg_att_ui_format            = ltrim(rtrim(@engg_att_ui_format_in))
select @engg_att_ui_trail_bar         = ltrim(rtrim(@engg_att_ui_trail_bar_in))
select @engg_component_descr          = ltrim(rtrim(@engg_component_descr_in))
select @engg_customer_name            = ltrim(rtrim(@engg_customer_name_in))
select @engg_language_name            = ltrim(rtrim(@engg_language_name_in))
select @engg_project_name             = ltrim(rtrim(@engg_project_name_in))
select @engg_req_no                   = ltrim(rtrim(@engg_req_no_in))
select @engg_smartspan                = ltrim(rtrim(@engg_smartspan_in))
select @engg_stylesheet               = ltrim(rtrim(@engg_stylesheet_in))
select @engg_virdir                   = ltrim(rtrim(@engg_virdir_in))
select @guid                          = ltrim(rtrim(@guid_in))
select @engg_ui_descr				  = ltrim(rtrim(@engg_ui_descr_in))

select @entry_ui_tmp				= ''
select @default_sample_data_tmp		= ''
select @pubflag						= 'C'
select @previous_horder_tmp			= 0
select @previous_vorder_tmp			= 0
select @tab_seq_tmp					= 0
--Code Modified For BugId : PNR2.0_7461
select @offlinepackage				= 0

set @itk_enum_cnt = 0
Declare @depst_page engg_name, @depst_sec  engg_name, @depst_page_tmp engg_name , @dep_state engg_flag --Added for PNR2.0_34596 


if @ctxt_service_in = 'offlinepackage'
begin
	Select @offlinepackage = 1
	Select @ctxt_service_in = 'BulkGenerate'
end

--Code addition  for PNR2.0_20849 starts
select  @ServerName  = @@servername
select  @DatabaseName = db_name()

select @ServerName        = ltrim(rtrim(@ServerName))
select @DatabaseName      = ltrim(rtrim(@DatabaseName))

--Code addition  for PNR2.0_20849 ends

--Code addition  for PNR2.0_21576 starts
select @gridlite      = ltrim(rtrim(@gridlite))
--Code addition  for PNR2.0_21576 ends


-- Check nulls for input parameters
if @engg_project_name  is null
begin
	select @m_errorid = 1
	raiserror ('Invlaid Project Name',16,1)
	return
end

if @engg_customer_name  is null
begin
	select @m_errorid = 2
	raiserror ('Invlaid Customer Name',16,1)
	return
end

if @engg_component_descr is null
begin
	select @m_errorid = 3
	raiserror ('Invlaid Component Name',16,1)
	return
end

-- Check component, project, customer existence
if not exists  (select 'x'
from  de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name  = @engg_project_name
and  ico_no   = @engg_req_no
and  component_descr = @engg_component_descr)
begin
	select @m_errorid = 4
	raiserror ('Component not found',16,1)
	return
end

Select @process_name = process_name,
@process_descr = process_descr,
@engg_component = ltrim(rtrim(component_name)),
--@activity_name = activity_name,-- Code Commented For BUG_ID PNR2.0_17184
@pubflag  = ico_status
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  component_descr = @engg_component_descr
--and  activity_descr = @engg_act_descr
and  ico_no   = @engg_req_no

Select @activity_name = @engg_actname -- Code Added For BUG_ID PNR2.0_17184

--Code Modified For BugId : PNR2.0_4719
select @ui_name_tmp = ui_name,@New_Line_Ui=ISNULL(New_Line_Ui,'N'),
@TabType=ISNULL(Tab_Type,'N'),
@SmartHide=ISNULL(SmartHide,'N'),@Isdevice=ISNULL(Is_device,'N'),
@Ilbotitlereq=ISNULL(HideIlbotitlemenu_req,''),
@Exclude_Systemtabindex = isnull(Exclude_Systemtabindex,'N'),
@devicetype		= isnull(DeviceType,''),
@TabStyle	= isnull(TabStyle,''),
@IsDesktop	= isnull(IsDesktop,''),
@Hide_Print= isnull(Hide_Print,'N'),
@UiLayout	= ISNULL(Layout,''),
@XYCoordinates	= ISNULL(XYCoordinates,''),
@ColumnLayWidth	= ISNULL(ColumnLayWidth,''),
@hdrpersonalization = ISNULL(personalization,''),
@hidedefaults = ISNULL(hide_imp_defaults,''),
@uisubtype		= isnull(ui_subtype,''),
@titlebar_Search = isnull(titlebar_Search, ''),
@Sidebar		= ISNULL(Sidebar,'N'),  --TECH-70687
@PullToRefresh	= ISNULL(PullToRefresh,'N')	--TECH-75230
from de_published_ui (nolock)
where  customer_name = @engg_customer_name
and project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
--Code Modified For BugId : PNR2.0_4780
and  ui_descr  = isnull(@engg_ui_descr,ui_descr)

--11536

	SELECT @UPEEnabled_Comp	=	UpeEnabled
	FROM	engg_devcon_codegen_comp_metadata (NOLOCK)
	WHERE	ComponentName	=	@engg_component

--  and  ui_type  in ('Search','Main')

select @engg_stylesheet = @engg_stylesheet_in

if @devicetype = 'P' 
Begin
	select	@IsPhone	= 'Y',	
			@IsTablet	= 'N'
End
if @devicetype = 'T' 
Begin
	select	@IsPhone	= 'N',	
			@IsTablet	= 'Y'
End
if @devicetype = 'B' 
Begin
	select	@IsPhone	= 'Y',	
			@IsTablet	= 'Y'
End


select @set_first_tab   = Null,
@set_first_tab_grid = Null
-- Code added for the Bug ID: PNR2.0_31178 starts	-	PNR2.0_31287
	--To enable Filler
	select 	@enablefiller=''
	select @ProtoLaunchMode = ''
	
	
	select 	@ProtoLaunchMode	= upper(current_value)
	from 	es_comp_param_mst_vw (nolock)
	where 	customer_name	= @engg_customer_name
	and	project_name	= @engg_project_name
	and	req_no		= 'Base'
	and	process_name	= @process_name
	and	component_name	= @engg_component
	and 	param_type 	= 'CONFIG'
	and	param_category 	= 'PROTOGLAUNCHMODE'

	select 	@enablefiller	= current_value
	from 	es_comp_param_mst_vw (nolock)
	where 	customer_name	= @engg_customer_name
	and	project_name	= @engg_project_name
	and	req_no		= 'Base'
	and	process_name	= @process_name
	and	component_name	= @engg_component
	and 	param_type 	= 'UIFORMAT'
	and	param_category 	= 'ENABLEFILLER'
-- Code Modification added for PNR2.0_34596   starts 
	select @dep_state	=  ltrim(rtrim(current_value))
    from es_project_param_mst (nolock)
    where  customer_name = @engg_customer_name  
    and    project_name = @engg_project_name  
    and   param_category 		=	  'DEPSTATEREQ'
	and   param_type		    =	  'UIFORMAT'

--Code Commented by 11536 starts
--TECH-75230
	IF EXISTS ( SELECT	'X'		--TECH-64197
				FROM	de_task_gql_mapping (NOLOCK)
				WHERE	CustomerName	=	@engg_customer_name
				AND		ProjectName		=	@engg_project_name
				AND		ComponentName	=	@engg_component
				AND		ProcessName		=	@process_name
				AND		ActivityName	=	@activity_name
				AND		UIName			=	@ui_name_tmp )
				BEGIN
					SELECT	@IsGql	= 'Y'
				END

	--			IF EXISTS (	SELECT 'X'
	--						FROM	de_publication a (NOLOCK),
	--								de_resolved_link b (nolock),
	--								de_task_gql_mapping c (nolock)
	--						where	a.Customer_Name		=	b.Customer_Name
	--						AND		a.Project_Name		=	b.Project_Name
	--						AND		a.Component_Name	=	b.publication_comp_name
	--						AND		a.Activity_Name		=	b.publication_act_name
	--						AND		a.UI_Name			=	b.publication_ui_name

	--						AND		b.Customer_Name		=	c.CustomerName
	--						AND		b.Project_Name		=	c.ProjectName
	--						AND		b.Process_Name		=	c.ProcessName
	--						AND		b.Component_Name	=	c.ComponentName
	--						AND		b.Activity_Name		=	c.ActivityName
	--						AND		b.UI_Name			=	c.UIName
							
	--						AND		a.Customer_Name		=	@engg_customer_name
	--						AND		a.Project_Name		=	@engg_project_name
	--						AND		a.Component_Name	=	@engg_component
	--						AND		a.Process_Name		=	@process_name
	--						AND		a.Activity_Name		=	@activity_name
	--						AND		a.UI_Name			=	@ui_name_tmp )
	--						BEGIN
	--							SELECT	@IsGql	= 'Y'
	--						END
	--Code Commented by 11536 Ends	*/
	--TECH-75230
	If isnull(@dep_state,'' ) = ''
	select @dep_state = 'N'

	If @dep_state 	= 'Y'
	begin
	If exists (Select customer_name, project_name, ecrno, process_name, component_name, activity_name, ui_name  ,section_bt_synonym
			from  de_published_ui_section (nolock)
			where  customer_name = @engg_customer_name
			and    project_name = @engg_project_name
			and    ecrno   = @engg_req_no
			and    component_name = @engg_component
			and    activity_name = @activity_name
			and    ui_name		  =	@ui_name_tmp 
			group by customer_name, project_name, ecrno, process_name, component_name, activity_name, ui_name,section_bt_synonym
			having count ('*') > 1 )

			Begin
			select @m_errorid = 3
			raiserror ('SectionName duplicated within UI and DeploymentState Enabled',16,1)
			return
			End
			end
-- Code Modification added for PNR2.0_34596   ends 	


	if isnull(@enablefiller,'') = ''		
		select @enablefiller = 'No'
-- Code added for the Bug ID: PNR2.0_31178 ends		-	PNR2.0_31287
/*Modification made by Sangeetha G for Bug id : PNR2.0_33378 Starts*/
  select @gridcollength	=  ltrim(rtrim(current_value))
  from es_project_param_mst (nolock)
   where  customer_name = @engg_customer_name  
  and  project_name = @engg_project_name  
  and   param_category 		=	  'gridcollength'
  and   param_text		    =     'Grid Column VisibleLength'
  and   param_type		    =	  'UIFORMAT'	
    
if isnull(@gridcollength,0) in (0 ,'')
	select @gridcollength	= '12' 

if exists ( select 's'
from fw_bpt_activity_vw     a (nolock),
fw_bpt_function_component_vw b (nolock)
where a.CustomerID = b.CustomerID
and  a.ProjectID  = b.ProjectID
and  a.BPID   = b.BPID
and  a.FunctionID = b.FunctionID

and  b.CustomerID = @engg_customer_name
and  b.ProjectID  = @engg_project_name
and  b.BPID   = @process_name
and  b.componentname = @engg_component

and  a.CustomerID = @engg_customer_name
and  a.ProjectID  = @engg_project_name
and  a.BPID   = @process_name
and  a.activityid = @activity_name
and  a.ActivityType = 'USR' )
begin
if not exists
(select 'x'
from  de_published_ui (nolock)
where customer_name =  @engg_customer_name
and  project_name =  @engg_project_name
and  ecrno   = @engg_req_no
and  component_name =  @engg_component
and  activity_name =  @activity_name
and  ui_type   in ('Main', 'Mainmodify')) -- = 'Main')   --Modified for PNR2.0_26631
begin
select @m_errorid = 7
raiserror ('Main UI does not exist for this activity',16,1)
return
end
end

if exists  (select 'x'
from de_published_ui_page  pg (nolock)
where pg.customer_name =   @engg_customer_name
and  pg.project_name  = @engg_project_name
and  pg.ecrno   = @engg_req_no
and  pg.process_name  = @process_name
and  pg.component_name = @engg_component
and  pg.activity_name =  @activity_name
and  pg.ui_name   =  @ui_name_tmp
and  not exists (select 'x'
from de_published_ui_section sec(nolock)
where pg.customer_name = sec.customer_name
and  pg.project_name  = sec.project_name
and pg.ecrno   = sec.ecrno
and  pg.process_name  = sec.process_name
and  pg.component_name = sec.component_name
and  pg.activity_name = sec.activity_name
and  pg.ui_name   = sec.ui_name
and  pg.page_bt_synonym = sec.page_bt_synonym))
begin
select @m_errorid = 6
--Code Modified for bugId : PNR2.0_11746
raiserror ('For Component : %s, Activity: %s, Section is not defined for one or more of the Pages.',16,1,@engg_component,@activity_name)
return
end

if exists  (select 'x'
from  de_published_ui_section (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
and  ui_name   = @ui_name_tmp
and  (horder   = 0 or vorder = 0))
begin
select @m_errorid = 5
--Code Modified for bugId : PNR2.0_11746
raiserror ('For Component : %s, Activity: %s, Page Layout is not defined for one or more of the pages.',16,1,@engg_component,@activity_name)
return
end
if exists  (select 'x'
from de_published_ui_control  ctrl (nolock),
es_comp_ctrl_type_mst_vw  ctype (nolock)
where ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  ctype.base_ctrl_type = 'Grid'
and  ctrl.customer_name  =   @engg_customer_name
and  ctrl.project_name  = @engg_project_name
and  ctrl.ecrno    = @engg_req_no
and  ctrl.process_name  = @process_name
and  ctrl.component_name  = @engg_component
and  ctrl.activity_name  =  @activity_name
and  ctrl.ui_name   =  @ui_name_tmp
and  not exists (select 'x'
from de_published_ui_grid grd(nolock)
where ctrl.customer_name  = grd.customer_name
and  ctrl.project_name  = grd.project_name
and  ctrl.ecrno    = grd.ecrno
and  ctrl.process_name  = grd.process_name
and  ctrl.component_name  = grd.component_name
and  ctrl.activity_name  = grd.activity_name
and  ctrl.ui_name   = grd.ui_name
and  ctrl.page_bt_synonym = grd.page_bt_synonym
and  ctrl.section_bt_synonym = grd.section_bt_synonym
and  ctrl.control_bt_synonym = grd.control_bt_synonym))
begin
select @m_errorid = 6
--Code Modified for bugId : PNR2.0_11746
raiserror ('For Component : %s, Activity: %s, Columns are not defined for one or more of the Grid Controls.',16,1,@engg_component,@activity_name)
return
end
if exists  (select 'x'
from de_published_ui_control  ctrl (nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  ctype.base_ctrl_type = 'RadioButton'
and  ctrl.customer_name =   @engg_customer_name
and  ctrl.project_name  = @engg_project_name
and  ctrl.ecrno    = @engg_req_no
and  ctrl.process_name  = @process_name
and  ctrl.component_name  = @engg_component
and  ctrl.activity_name  =  @activity_name
and  ctrl.ui_name   =  @ui_name_tmp
and  not exists (select 'x'
from de_published_radio_button rd(nolock)
where ctrl.customer_name  = rd.customer_name
and  ctrl.project_name  = rd.project_name
and  ctrl.ecrno    = rd.ecrno
and  ctrl.process_name  = rd.process_name
and  ctrl.component_name  = rd.component_name
and  ctrl.activity_name  = rd.activity_name
and  ctrl.ui_name   = rd.ui_name
and  ctrl.page_bt_synonym = rd.page_bt_synonym
and  ctrl.section_bt_synonym = rd.section_bt_synonym
and  ctrl.control_bt_synonym = rd.control_bt_synonym))
begin
select @m_errorid = 6
raiserror ('For Component : %s, Activity: %s, Code is not defined for one or more of the Radio Button Controls.',16,1,@engg_component,@activity_name)
return
end

select  @xml_seq_tmp  = 0,
@mainpage_tmp = '[MAINSCREEN]',
@prjsecrow  = 1,
@m_errorid  = 0

-- Delete existing XML for the component
delete ep_genxml_tmp
where guid   = @guid


--Code Added For Bug_id PNR2.0_17856 Starts Here

select  @FillerClass = isnull(current_value,'')
from es_comp_param_mst_vw (nolock)
where  customer_name  = @engg_customer_name
and  project_name  = @engg_project_name
and  param_category  = 'FILLERCLASS'
and  process_name = @process_name
and  component_name = @engg_component

--Code Added For Bug_id PNR2.0_17856 Ends Here

select  @xmlpath_tmp  = isnull(@html_gen_path,'') + '\_proto_\' + @engg_req_no + '_' + @engg_customer_name + '\'+ @ui_name_tmp + '.xml',
@targetdir_tmp  = @html_gen_path + '\_proto_\' + @engg_req_no + '_' + @engg_customer_name

-- Entry Point UI
select @entry_ui_tmp = isnull(ui_name,'')
from de_published_ui (nolock)
where  customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
and  ui_type  in ('Search','Main' , 'Mainmodify')  -- Modified for PNR2.0_26631

if @engg_language_name is null
select @engg_language_name  = 'English'

-- Getting the Language Id
select @language_code  = quick_code,
@lang_settings  = lang_settings     -- Code added  for  PNR2.0_20849
from ep_language_met (nolock)
where quick_code_value  = @engg_language_name
and  quick_code_type  = 'language_code'

--code modified by kiruthika for bugid :PNR2.0_28767 on 21-oct-2010 starts
	if exists (select 'x'
			   from   ep_quick_code_mst(nolock)
			   where  quick_code_type = 'Help_Caption'
			   and    quick_code      = convert(varchar(3),@language_code)   )
	begin
		select @ok_caption     = quick_code_value 
		from   ep_quick_code_mst(nolock)
		where  quick_code_type = 'Help_Caption'
		and    quick_code      = convert(varchar(3),@language_code)
	end
	else
	begin
		select @ok_caption     = convert(varchar(3),@language_code) + '_'+'OK'
	end

--code modified by kiruthika for bugid :PNR2.0_28767 on 21-oct-2010 ends

Declare @de_published_glossary_lng_extn Table 
			(customer_name	VARCHAR(60),project_name VARCHAR(60),process_name VARCHAR(60),
			 component_name VARCHAR(60),bt_synonym_name VARCHAR(64),bt_synonym_caption Nvarchar(255),data_type VARCHAR(60),length int,ecrno VARCHAR(60),
			 singleinst_sample_data Nvarchar(255),multiinst_sample_data Nvarchar(255), bt_name VARCHAR(60),languageid int 
			 PRIMARY KEY (customer_name,project_name,process_name,component_name,bt_synonym_name,ecrno,languageid))

	Declare @de_published_glossary Table 
	(customer_name	VARCHAR(60),project_name VARCHAR(60),process_name VARCHAR(60),
	component_name VARCHAR(60),bt_synonym_name VARCHAR(64),bt_synonym_caption Nvarchar(255),data_type VARCHAR(60),length int,ecrno VARCHAR(60),
	singleinst_sample_data Nvarchar(255),multiinst_sample_data Nvarchar(255), bt_name VARCHAR(60)
	PRIMARY KEY (customer_name,project_name,process_name,component_name,bt_synonym_name,ecrno))


if @language_code <> 1
begin

insert into @de_published_glossary (customer_name,project_name,process_name,component_name,bt_synonym_name,bt_synonym_caption,data_type,length,ecrno,singleinst_sample_data,multiinst_sample_data,bt_name)
select	distinct a.customer_name,a.project_name,a.process_name,a.component_name,a.bt_synonym_name,a.bt_synonym_caption,a.data_type,a.length,@engg_req_no,singleinst_sample_data,multiinst_sample_data,bt_name
from	de_published_glossary a (nolock)
where	a.customer_name		=	@engg_customer_name
and		a.project_name		=	@engg_project_name
and		a.ecrno				=	@engg_req_no
and		a.process_name		=	@process_name
and		a.component_name	=	@engg_component
	
insert into @de_published_glossary_lng_extn(customer_name,project_name,process_name,component_name,bt_synonym_name,bt_synonym_caption,data_type,[length],ecrno,singleinst_sample_data,multiinst_sample_data,bt_name,languageid)
select	a.customer_name,a.project_name,a.process_name,a.component_name,a.bt_synonym_name,
--(case when isnull(b.Targetcaption,'')='' then a.bt_synonym_caption  else b.Targetcaption  end ) ,
(case when b.Targetcaption is null then a.bt_synonym_caption  else b.Targetcaption  end ) ,			--TECH-69346
a.data_type,a.length,@engg_req_no as ecrno,singleinst_sample_data,multiinst_sample_data,bt_name,@language_code  as languageid
from	@de_published_glossary a  left outer join 
		PLF_XLTranslated_Meta_Master b (nolock)
on		a.customer_name		=	@engg_customer_name
and		a.project_name		=	@engg_project_name
and		a.ecrno				=	@engg_req_no
and		a.process_name		=	@process_name
and		a.component_name	=	@engg_component
and		a.customer_name		=	b.customer_name
and		a.project_name		=	b.project_name
and		a.bt_synonym_caption=	b.Sourcecaption
and		b.Targetlanguageid  =	@language_code
--group by a.customer_name,a.project_name,process_name,component_name,bt_synonym_name,bt_synonym_caption,Targetcaption,data_type,[length],ecrno,singleinst_sample_data,multiinst_sample_data,bt_name

End
Else if @language_code = 1

begin

insert into @de_published_glossary_lng_extn(customer_name,project_name,process_name,component_name,bt_synonym_name,bt_synonym_caption,data_type,length,ecrno,singleinst_sample_data,multiinst_sample_data,bt_name,languageid)
select	distinct a.customer_name,a.project_name,a.process_name,a.component_name,a.bt_synonym_name,a.bt_synonym_caption,a.data_type,a.length,@engg_req_no,singleinst_sample_data,multiinst_sample_data,bt_name,1
from	de_published_glossary a (nolock)
where	a.customer_name		=	@engg_customer_name
and		a.project_name		=	@engg_project_name
and		a.ecrno				=	@engg_req_no
and		a.process_name		=	@process_name
and		a.component_name	=	@engg_component


end


select @ui_descr_tmp = bt_synonym_caption
from	@de_published_glossary_lng_extn --(nolock)
where  customer_name  = @engg_customer_name
and  project_name  = @engg_project_name
--and  ecrno   = @engg_req_no
and  process_name = @process_name
and  component_name = @engg_component
and  bt_synonym_name = @ui_name_tmp
--and  languageid  = @language_code

select @ui_descr_tmp = replace(@ui_descr_tmp,'&','&amp;')
select @ui_descr_tmp = replace(@ui_descr_tmp,'<','&lt;')
select @ui_descr_tmp = replace(@ui_descr_tmp,'>','&gt;')
select @ui_descr_tmp = replace(@ui_descr_tmp,'"','&quot;')

select @engg_component_descr = bt_synonym_caption
from @de_published_glossary_lng_extn --(nolock)
where  customer_name  = @engg_customer_name
and  project_name  = @engg_project_name
--and  ecrno   = @engg_req_no
and  process_name = @process_name
and  component_name = @engg_component
and  bt_synonym_name = @engg_component
--and  languageid  = @language_code

select @engg_act_descr_lng = bt_synonym_caption
from @de_published_glossary_lng_extn-- (nolock)
where  customer_name  = @engg_customer_name
and  project_name  = @engg_project_name
--and  ecrno   = @engg_req_no
and  process_name = @process_name
and  component_name = @engg_component
and  bt_synonym_name = @activity_name
--and  languageid  = @language_code

select @engg_component_descr = replace(@engg_component_descr,'&','&amp;')
select @engg_component_descr = replace(@engg_component_descr,'<','&lt;')
select @engg_component_descr = replace(@engg_component_descr,'>','&gt;')
select @engg_component_descr = replace(@engg_component_descr,'"','&quot;')

select @engg_act_descr_temp = replace(@engg_act_descr,'&','&amp;')
select @engg_act_descr_temp = replace(@engg_act_descr_temp,'<','&lt;')
select @engg_act_descr_temp = replace(@engg_act_descr_temp,'>','&gt;')
select @engg_act_descr_temp = replace(@engg_act_descr_temp,'"','&quot;')

-- For Component Configuration Root Node
--Code Modified For BugId : PNR2.0_7461
if @offlinepackage  = 0
begin
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,
component_name,   activity_name,   guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name,
@engg_component, @activity_name, @guid,
'<Configuration ComponentName="'+ isnull(@engg_component,'') +
'" ComponentDesc="' + isnull(@engg_component_descr,'') +
'" ActivityName ="' + isnull(@activity_name,'') +
'" ActivityDesc="' + isnull(@engg_act_descr_temp,'') +
'" ILBOCode="' + isnull(@ui_name_tmp,'') +
'" ILBODesc="' + isnull(@ui_descr_tmp,'') +
'" TargetDirectory="' + isnull(@targetdir_tmp,'') +
'" IsDevice="'  + isnull(ltrim(rtrim(@Isdevice)),'N')+ 
'" XMLPath="' + isnull(@xmlpath_tmp,'') +
'" ProtoLaunchMode="' + isnull(upper(@ProtoLaunchMode),'') +
'" Activity="Activity"></Configuration>' ,1)
end

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,
component_name,   activity_name,   guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,
@engg_component, @activity_name, @guid,   '<Activities>',@xml_seq_tmp)


select @activity_name = upper(@activity_name)

-- Getting Function ID
select @engg_function = FunctionID
from Fw_BPT_Function_Component_Vw(nolock)
where CustomerID  = @engg_customer_name
and ProjectID  = @engg_project_name
and BPID   = @process_name
and ComponentName  = @engg_component

-- Getting Activity type
--code Modified for bugId : PNR2.0_11270
select @activity_type = upper(ActivityType)
from fw_bpt_activity_vw(nolock)
where CustomerID  = @engg_customer_name
and  ProjectID = @engg_project_name
and  BPID   = @process_name
and  FunctionID  = @engg_function
and  ActivityID  = @activity_name

select @process_descr = replace(@process_descr,'&','&amp;')
select @process_descr = replace(@process_descr,'<','&lt;')
select @process_descr = replace(@process_descr,'>','&gt;')
select @process_descr = replace(@process_descr,'"','&quot;')

select @engg_act_descr_lng = bt_synonym_caption
from @de_published_glossary_lng_extn-- (nolock)
where  customer_name  = @engg_customer_name
and project_name  = @engg_project_name
--and ecrno  = @engg_req_no
and process_name = @process_name
and component_name = @engg_component
and bt_synonym_name = @activity_name
--and languageid = @language_code

--Code Added for bugId :  PNR2.0_14879
if @engg_act_descr_lng is null
begin

raiserror ('For languageid : %s, Component : %s, Activity: %s, synonym name %s  not found in glossary',16,1,@language_code,@engg_component,@activity_name,@activity_name)
return
end


select @engg_act_descr_lng  = replace(@engg_act_descr_lng,'&','&amp;')
select @engg_act_descr_lng  = replace(@engg_act_descr_lng,'<','&lt;')
select @engg_act_descr_lng  = replace(@engg_act_descr_lng,'>','&gt;')
select @engg_act_descr_lng  = replace(@engg_act_descr_lng,'"','&quot;')

-- Insert Activity entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,
component_name,   activity_name,   guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,
@engg_component, @activity_name, @guid,
'<Activity Name="'   + ltrim(rtrim(@activity_name))       + '" ' +
'ActivityDescription="'  + ltrim(rtrim(@engg_act_descr_lng))      + '" ' +
'ActivityType="'   + ltrim(rtrim(isnull(@activity_type,'USR')))   + '" ' +
'ProcessName="'    + upper(isnull(@process_name,''))      + '" ' +
'ProcessDescription="'   + isnull(@process_descr,'')        + '" ' +
'ComponentName="'   + ltrim(rtrim(@engg_component))       + '" ' +
'ComponentDescription="' + ltrim(rtrim(@engg_component_descr))     + '" ' +
'EntryPointUI="'    + ltrim(rtrim(@entry_ui_tmp))       + '" ' +
'DisplaySequence="'   + '0'       + '" ' +
--Code Added For BugId : PNR2.0_8069
'LanguageId="'    + @language_code          + '" ' +
'Customer="'    + ltrim(rtrim(@engg_customer_name))      + '" ' +
'Project="'     + ltrim(rtrim(@engg_project_name))      + '" ' +
'Request="'     + ltrim(rtrim(@engg_req_no))           + '" ' +
--Code Addition for PNR2.0_20849 starts
'LanguageSettings="'     + ltrim(rtrim(isnull(@lang_settings,'')))      + '" ' +
'ServerName="'     + ltrim(rtrim(isnull(@ServerName,'')))      + '" ' +
'DatabaseName="'     + ltrim(rtrim(isnull(@DatabaseName,'')))      + '">',@xml_seq_tmp )
--Code Addition for PNR2.0_20849 ends

-- Set Wildcard filter for All UIs
--Code Modified For BugId : PNR2.0_4780
if @engg_ui_descr is null or @engg_ui_descr = 'All' or @engg_ui_descr = ''
select @engg_ui_descr = null

-- Insert Base Entry for ILBOs
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,
component_name,   activity_name,   guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,
@engg_component, @activity_name, @guid,   '<ILBOs>',@xml_seq_tmp)

declare uicurs cursor FAST_FORWARD  for
select ui_sysid,  upper(ui_name),     ui_descr,
ui_type,  ui_format,       caption_alignment,
trail_bar, tab_height,     isnull(state_processing,'No'),
isnull(callout_type,'None') ,isnull(TabPosition,'Top'),isnull(PostLaunchTask ,'No')-- added by feroz for extjs --PNR2.0_1790
from de_published_ui  (nolock)
where  customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
--code Modified For BugId : PNR2.0_4780
and  ui_descr  = isnull(@engg_ui_descr,ui_descr)
order by ui_name
open uicurs

-- For each UI generate entries
while (1=1)
begin
fetch next from uicurs into
@ui_sysid_tmp,  @ui_name_tmp,   @engg_ui_descr_tmp,
@ui_type_tmp,   @ui_format_tmp,   @caption_alignment_tmp,
@trail_bar_tmp,  @tab_height_tmp,  @StateEnabled,
@callout_type,@TabPosition,@PostLaunchTask -- added by feroz for extjs --PNR2.0_1790

if @@fetch_status <> 0
break

select
--     @cntincr_tmp  = 0,
@tab_seq_tmp = 0

select @rtuitype = case @ui_type_tmp
when  'EntryPoint'  then 1
when  'Main'   then 2
when  'Modify'  then 3
when 'MainModify' then 4
when 'MainView'  then 5
when 'Others'  then 6
when 'Security'  then 7
when 'View'   then 8
when 'Snapshot'  then 9
when 'Help'   then  6
when 'Search'  then 1
else 6
end

-- Added By Feroz for Extjs Start --PNR2.0_1790
if @callout_type in  ('Client', 'Both')
select @callout_type = 'Y'
else
select @callout_type = 'N'
-- Added By Feroz for Extjs End --PNR2.0_1790

if @StateEnabled = 'YES'
select @StateEnabled = 'Y'
else
select @StateEnabled = 'N'

-- Insert UI Entry
select @xml_seq_tmp=@xml_seq_tmp+1
--if @engg_att_ui_format_in = 'Controls Beside Captions'
--select  @ui_format_tmp = 'BES'
--else
--select @ui_format_tmp = 'UND'

select @engg_ui_descr_tmp = bt_synonym_caption
from @de_published_glossary_lng_extn-- (nolock)
where  customer_name   = @engg_customer_name
and  project_name   = @engg_project_name
--and  ecrno    = @engg_req_no  /* PNR2.0_7808 */
and  process_name  = @process_name
and  component_name  = @engg_component
and  bt_synonym_name  = @ui_name_tmp
--and  languageid   = @language_code


select @engg_ui_descr_tmp = replace(@engg_ui_descr_tmp,'&','&amp;')
select @engg_ui_descr_tmp = replace(@engg_ui_descr_tmp,'<','&lt;')
select @engg_ui_descr_tmp = replace(@engg_ui_descr_tmp,'>','&gt;')
select @engg_ui_descr_tmp = replace(@engg_ui_descr_tmp,'"','&quot;')

-- code modified by Anuradha M on 25-Apr-2006 for the Bug id :: PNR2.0_7964 -- Start
-- code added by Ganesh for callid PNR2.0_4395 on 26/10/05
--code Modified for bugId : PNR2.0_13438
;with cte1 as
(select customer_name,project_name,ecrno,process_name,component_name,activity_name,ui_name,page_bt_synonym,section_bt_synonym ,parent_section ,level=1,horder,vorder,case page_bt_synonym when '[mainscreen]' then 1 else 2 end 'count'
from de_published_ui_section a(nolock)
where a.customer_name  = @engg_customer_name
and a.project_name  = @engg_project_name
and a.ecrno   = @engg_req_no
and a.process_name  = @process_name
and a.component_name = @engg_component
and a.activity_name  = @activity_name
and a.ui_name  = @ui_name_tmp
and  a.parent_section =''
union all
select b.customer_name,b.project_name,b.ecrno,b.process_name,b.component_name,b.activity_name,b.ui_name,b.page_bt_synonym,b.section_bt_synonym ,b.parent_section ,c.level+1 as level,b.horder,b.vorder,case b.page_bt_synonym when '[mainscreen]' then 1 else 2
 end 'count'
from de_published_ui_section b(nolock) inner join cte1 as c
on  b.customer_name  = c.customer_name
and b.project_name  = c.project_name
and b.ecrno   = c.ecrno
and b.process_name  = c.process_name
and b.component_name = c.component_name
and b.activity_name  = c.activity_name
and b.ui_name  = c.ui_name
and b.page_bt_synonym = c.page_bt_synonym
and b.parent_section = c.section_bt_synonym
where b.customer_name  = @engg_customer_name
and b.project_name  = @engg_project_name
and b.ecrno   = @engg_req_no
and b.process_name  = @process_name
and b.component_name = @engg_component
and b.activity_name  = @activity_name
and b.ui_name  = @ui_name_tmp
and  b.parent_section <>''
)

select * into #cte from cte1  
declare @page_bt_synonym engg_name,@section_bt_synonym engg_name,@horder int,@vorder int
create table #tabindex (ui_name varchar(60) collate database_default,page_bt_synonym varchar(60) collate database_default,section_bt_synonym varchar(60) collate database_default,tabindex int identity(1,1))
create table #tabindex1 (ui_name varchar(60) collate database_default,page_bt_synonym varchar(60) collate database_default,section_bt_synonym varchar(60) collate database_default,horder int,vorder int,level int)



declare tabindex cursor
for
select page_bt_synonym,section_bt_synonym ,horder,vorder
from #cte a(nolock)
where a.customer_name  = @engg_customer_name
and a.project_name  = @engg_project_name
and a.ecrno   = @engg_req_no
and a.process_name  = @process_name
and a.component_name = @engg_component
and a.activity_name  = @activity_name
and a.ui_name  = @ui_name_tmp
and a.parent_section = ''
order by count,page_bt_synonym,horder,vorder

open tabindex
fetch next from tabindex into @page_bt_synonym,@section_bt_synonym,@horder,@vorder
while (@@fetch_status = 0 )
begin



            insert into #tabindex1 (ui_name,page_bt_synonym,section_bt_synonym,horder,vorder,level)
            select   @ui_name_tmp,@page_bt_synonym,@section_bt_synonym,@horder,@vorder,1
                           
              while ( 1=1)
              begin 
					if not exists(select 'x'
								  from   #tabindex1(nolock))
					break

					                         
                           select top 1 @section_bt_synonym=section_bt_synonym
                           from    #tabindex1(nolock)
                           where  ui_name         = @ui_name_tmp
                           and    page_bt_synonym = @page_bt_synonym
                            order by level desc,horder asc,vorder asc

							if exists (select 'x'
										 from   #cte(nolock)
										 where  ui_name         = @ui_name_tmp
										 and    page_bt_synonym = @page_bt_synonym
										 and    parent_section  = @section_bt_synonym
										 )
							begin
									insert into #tabindex (ui_name,page_bt_synonym,section_bt_synonym) values (@ui_name_tmp,@page_bt_synonym,@section_bt_synonym)

									delete from #tabindex1
									where  ui_name            = @ui_name_tmp
									and    page_bt_synonym    = @page_bt_synonym
									and    section_bt_synonym = @section_bt_synonym 

									 insert into #tabindex1 (ui_name,page_bt_synonym,section_bt_synonym,horder,vorder,level)
									 select   @ui_name_tmp,@page_bt_synonym,section_bt_synonym,horder,vorder,level
									 from    #cte(nolock)
									 where  ui_name         = @ui_name_tmp
									 and    page_bt_synonym = @page_bt_synonym
									 and    parent_section  = @section_bt_synonym
										  

							end
							else
							begin 
									insert into #tabindex (ui_name,page_bt_synonym,section_bt_synonym) values (@ui_name_tmp,@page_bt_synonym,@section_bt_synonym)
									delete from #tabindex1
									where  ui_name = @ui_name_tmp
									and    page_bt_synonym = @page_bt_synonym
									and    section_bt_synonym = @section_bt_synonym 
							end
              end


fetch next from tabindex into @page_bt_synonym,@section_bt_synonym,@horder,@vorder
end
close tabindex
deallocate tabindex
declare @temp_tab_index1 table
( ui_name    varchar(60),
page_bt_synonym  varchar(60),
control_bt_synonym varchar(60),
 sec_index  int,
horder    int,
vorder    int,
order_seq   int,
basectrl   varchar(60),
tab_index    int identity(1,1))

-- Code added for PNR2.0_21450 on 13-Mar-2009 - Begins
insert into @temp_tab_index1
( ui_name,page_bt_synonym, control_bt_synonym,sec_index,horder, vorder,order_seq,basectrl)
select a.ui_name,
a.page_bt_synonym,
a.control_bt_synonym,
d.tabindex 'sec_index',
a.horder,
a.vorder,
order_seq,
c.base_ctrl_type
from de_published_ui_control a (nolock),
es_comp_ctrl_type_mst  c (nolock),
#tabindex              d(nolock),
de_published_ui_section  b(nolock)
where a.customer_name  = b.customer_name
and a.project_name  = b.project_name
and a.ecrno   = b.ecrno
and a.process_name  = b.process_name
and a.component_name = b.component_name
and a.ui_name  = b.ui_name
and a.page_bt_synonym = b.page_bt_synonym
and a.section_bt_synonym = b.section_bt_synonym
and d.ui_name  = b.ui_name
and d.page_bt_synonym = b.page_bt_synonym
and d.section_bt_synonym = b.section_bt_synonym

and a.customer_name  = c.customer_name
and a.project_name  = c.project_name
and a.process_name  = c.process_name
and a.component_name = c.component_name
and a.control_type  = c.ctrl_type_name
-- Code modification  for  PNR2.0_22481  starts
and (editable_flag  = 'Y' or
base_ctrl_type in ('CheckBox', 'Button', 'Combo', 'RadioButton', 'DataHyperLink', 'Link','grid' ))
--and base_ctrl_type  <> 'Grid'
-- Code modification  for  PNR2.0_22481  ends
and c.visisble_flag  = 'Y'
and b.visisble_flag  = 'Y'
and a.control_type  not in ('filler', 'filler2')

and a.customer_name  = @engg_customer_name
and a.project_name  = @engg_project_name
and a.ecrno   = @engg_req_no
and a.process_name  = @process_name
and a.component_name = @engg_component
and a.activity_name  = @activity_name
and a.ui_name  = @ui_name_tmp
and isnull(a.tab_seq,0) <> 0 -- Code modified by pavithra 
order by a.tab_seq,'sec_index', a.horder, a.vorder, order_seq
-- Code added for PNR2.0_21450 on 13-Mar-2009 - Ends

insert into @temp_tab_index1
( ui_name,page_bt_synonym, control_bt_synonym,sec_index,horder, vorder,order_seq,basectrl)
select a.ui_name,
a.page_bt_synonym,
a.control_bt_synonym,
d.tabindex 'sec_index',
a.horder,
a.vorder,
order_seq,
c.base_ctrl_type
from de_published_ui_control a (nolock),
es_comp_ctrl_type_mst  c (nolock),
#tabindex              d(nolock),
de_published_ui_section  b(nolock)
where a.customer_name  = b.customer_name
and a.project_name  = b.project_name
and a.ecrno   = b.ecrno
and a.process_name  = b.process_name
and a.component_name = b.component_name
and a.ui_name  = b.ui_name
and a.page_bt_synonym = b.page_bt_synonym
and a.section_bt_synonym = b.section_bt_synonym
and d.ui_name  = b.ui_name
and d.page_bt_synonym = b.page_bt_synonym
and d.section_bt_synonym = b.section_bt_synonym

and a.customer_name  = c.customer_name
and a.project_name  = c.project_name
and a.process_name  = c.process_name
and a.component_name = c.component_name
and a.control_type  = c.ctrl_type_name
and (editable_flag  = 'Y' or
-- Code modification  for  PNR2.0_22481  starts
base_ctrl_type in ('CheckBox', 'Button', 'Combo', 'RadioButton', 'DataHyperLink', 'Link','grid' ))
--and base_ctrl_type  <> 'Grid'
-- Code modification  for  PNR2.0_22481  ends0

-- code modified by Ganesh for the callid :: PNR2.0_4412 on 26/10/05
and c.visisble_flag  = 'Y'
and b.visisble_flag  = 'Y'
and a.control_type  not in ('filler', 'filler2')  -- Code modified for PNR2.0_21450 on 13-Mar-2009

and a.customer_name  = @engg_customer_name
and a.project_name  = @engg_project_name
and a.ecrno   = @engg_req_no
and a.process_name  = @process_name
and a.component_name = @engg_component
and a.activity_name  = @activity_name
and a.ui_name  = @ui_name_tmp
-- Code added for PNR2.0_21450 on 13-Mar-2009 - Begins
and isnull(a.tab_seq,0) = 0 -- Code modified by pavithra
-- Code added for PNR2.0_21450 on 13-Mar-2009 - Ends

order by 'sec_index', a.horder, a.vorder, order_seq  --a.tab_seq is removed against TECH-57390

delete
from @temp_tab_index1
where tab_index < (
select top 1 tab_index
from @temp_tab_index1
-- Code modification  for  PNR2.0_22481  starts
where basectrl not in ( 'link','DataHyperLink','Button','grid' )
-- Code modification  for  PNR2.0_22481  ends
order by tab_index)


declare @temp_tab_index table
( ui_name    varchar(60),
page_bt_synonym  varchar(60),
control_bt_synonym varchar(60),
horder    int,
vorder    int,
order_seq  int,
basectrl   varchar(60),
tab_index    int identity(1,1))


insert into @temp_tab_index
(ui_name,page_bt_synonym, control_bt_synonym,
horder, vorder,order_seq,basectrl)
select ui_name,page_bt_synonym, control_bt_synonym,
horder, vorder,order_seq,basectrl
from @temp_tab_index1
drop table #cte
drop table #tabindex
drop table #tabindex1


-- code modified by Anuradha M on 25-Apr-2006 for the Bug id :: PNR2.0_7964 -- End
--code modified for bugId :  PNR2.0_11597
select @ocx_Name = @ui_name_tmp + '.OCX'
select @progid   = @ui_name_tmp + '.main_scr'


--Code modification for PNR2.0_33378  starts 

If exists (select  'K' from  de_ui_control		   a (nolock) ,
							 es_comp_ctrl_type_mst b (nolock)
			where a.customer_name    =	 @engg_customer_name
			and   a.project_name	 =   @engg_project_name
			and   a.process_name	 =   @process_name
			and   a.component_name   =   @engg_component
			and   a.activity_name    =   @activity_name
			and   a.ui_name			 =   @ui_name_tmp
			and   a.customer_name    =   b.customer_name
			and   a.project_name      =	 b.project_name
			and   a.process_name     =   b.process_name 
			and   a.component_name   =   b.component_name 
			and   a.control_type	 =   b.ctrl_type_name
			and   b.base_ctrl_type	 =   'combo'
			and   isnull(b.editcombo_req,'N')	= 'Y'
			
			union 
			
			select 'K' from  de_ui_grid		   a (nolock) ,
							 es_comp_ctrl_type_mst b (nolock)
			where a.customer_name    =	 @engg_customer_name
			and   a.project_name	 =   @engg_project_name
			and   a.process_name	 =   @process_name
			and   a.component_name   =   @engg_component
			and   a.activity_name    =   @activity_name
			and   a.ui_name			 =   @ui_name_tmp
			and   a.customer_name    =   b.customer_name
			and   a.project_name      =	 b.project_name
			and   a.process_name     =   b.process_name 
			and   a.component_name   =   b.component_name 
			and   a.column_type	 =   b.ctrl_type_name
			and   b.base_ctrl_type	 =   'combo'
			and   isnull(b.editcombo_req,'N')	= 'Y'
)

Begin

select @java_combocss = 'Y'

End 

Else 

Begin

select @java_combocss = 'N'

End 

--Code modification for PNR2.0_33378 ends 
--code added for bugid: PLF2.0_07676 starts
if exists (select 'x'
		   from    de_fw_des_publish_ilbo_service_view_attributemap(nolock)
		   where  customername     =   @engg_customer_name
			and   projectname	   =   @engg_project_name
			and   ecrno			   =   @engg_req_no
			and   processname	   =   @process_name
			and   componentname    =   @engg_component
			and   activity_name    =   @activity_name
			and   ilbocode		   =   @ui_name_tmp
			and   PropertyName     =   'Style'
		  )
begin
			select @custom_styles ='Y'
end
Else
begin
			select @custom_styles ='N'
end
--code added for bugid: PLF2.0_07676 ends
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<ILBO Name="'    + isnull(ltrim(rtrim(@ui_name_tmp)),'')      + '" ' +
'ILBODescription="'  + isnull(ltrim(rtrim(@engg_ui_descr_tmp)),'')    + '" ' +
'ActivityName="'   + isnull(ltrim(rtrim(@activity_name)),'')    + '" ' +
'ComponentName="'   + isnull(ltrim(rtrim(@engg_component)),'')    + '" ' +
'UIType="'     + isnull(ltrim(rtrim(@ui_type_tmp)),'')      + '" ' +
'UIFormat="'    + isnull(ltrim(rtrim(@ui_format_tmp)),'')     + '" ' +
'TrailBar="'    + isnull(ltrim(rtrim(@engg_att_ui_trail_bar_in)),'')  + '" ' +
'StyleSheet="'    + isnull(ltrim(rtrim(@engg_stylesheet)),'RSGlobalStyles') + '" ' +
'CmbCssForJava="'    + isnull(@java_combocss,'N') + '" ' +    --Code modified for PNR2.0_33378 
'CaptionAlignment="' + isnull(ltrim(rtrim(@engg_att_ui_cap_align_in)),'')   + '" ' +
--code modified for bugId :  PNR2.0_31403,PNR2.0_31505
'SmartSpan="'  + isnull(ltrim(rtrim(case @engg_smartspan when 'y' then 'Yes' when 'n' then 'No' else @engg_smartspan end )),'No')     + '" '  +
'TabHeight="'    + isnull(ltrim(rtrim(CONVERT(VARCHAR,@tab_height_tmp))),400) + '" '  +
--code modified for bugId :  PNR2.0_11597
'OCX_Name="'    + isnull(ltrim(rtrim(@ocx_Name)),'')      + '" ' +
'progid="'     + isnull(ltrim(rtrim(@progid)),'')       + '" ' +
'StateEnabled="'   + isnull(ltrim(rtrim(@StateEnabled)),'')            + '" ' +
'FillerClass="'   + isnull(ltrim(rtrim(@FillerClass)),'')      + '" '+ --Code Added For Bug_id PNR2.0_17856
'BaseCallOut="'   + isnull(ltrim(rtrim(@callout_type)),'N')            + '" ' + -- Added By Feroz for Extjs  --PNR2.0_1790
'RTUITYPE="'    + isnull(ltrim(rtrim(@rtuitype)),'')        + '" '+
'GridColLength="'    + isnull(ltrim(rtrim(@gridcollength)),'') + '" '+  /*Modification made by Sangeetha G for Bug id : PNR2.0_33378*/
'DeploymentState="'    + isnull(ltrim(rtrim(@dep_state)),'N') + '" '+  -- Code Modification added for PNR2.0_34596     
'CustomStyles="'    + isnull(ltrim(rtrim(@custom_styles)),'N') + '" '+ --code added for bugid: PLF2.0_07676
'IncludeLine="'    + isnull(ltrim(rtrim(@New_Line_Ui)),'N') + '" '+
'TabType="'    + isnull(ltrim(rtrim(@TabType)),'N') + '" '+
'EnableFiller="' + isnull(ltrim(rtrim(@enablefiller)),'No') + '" '+  --Code Added For Bug_id: PNR2.0_31178
'TabPosition="'    + isnull(ltrim(rtrim(@tabposition)),'Top')        + '" '+
'SmartHide="'    + isnull(ltrim(rtrim(@SmartHide)),'N')        + '" '+
'HideIlboTitleMenu="'    + isnull(ltrim(rtrim(@IlboTitleReq)),'')        + '" '+
'Exclude_Systemtabindex="'    + isnull(ltrim(rtrim(@Exclude_Systemtabindex)),'')        + '" '+
--'DeviceType="'    + isnull(ltrim(rtrim(@DeviceType)),'')        + '" '+
'Hide_Print="'    + isnull(ltrim(rtrim(@Hide_Print)),'')        + '" '+
'Hide_personalization="'    + isnull(ltrim(rtrim(@hdrpersonalization)),'')        + '" '+
'Hide_defaults="'    + isnull(ltrim(rtrim(@hidedefaults)),'')        + '" '+
'IsDesktop="'    + isnull(ltrim(rtrim(@IsDesktop)),'')        + '" '+
'IsPhone="'    + isnull(ltrim(rtrim(@IsPhone)),'')        + '" '+
'IsTablet="'    + isnull(ltrim(rtrim(@IsTablet)),'')        + '" '+
--'TabStyle="'    + isnull(ltrim(rtrim(@TabStyle)),'')        + '" '+
'UILayout="'    + isnull(ltrim(rtrim(@UiLayout)),'')        + '" '+
'XYCoordinates="'    + ltrim(rtrim(isnull(@XYCoordinates,'')))  + '" ' +
'ColumnLayWidth="'    + ltrim(rtrim(isnull(@ColumnLayWidth,'')))  + '" ' +
'PostLaunchTask="'    + isnull(ltrim(rtrim(@PostLaunchTask)),'No') + '" ' +
'IsGQL="'    + isnull(ltrim(rtrim(@IsGQL)),'No') + '" ' +	--	TECH-64197
'TitlebarSearch="'    + isnull(ltrim(rtrim(@titlebar_Search)),'No') + '" ' +
'Sidebar="'    + isnull(ltrim(rtrim(@Sidebar)),'N') + '" ' +			--TECH-70687
'PullToRefresh="'    + isnull(ltrim(rtrim(@PullToRefresh)),'N') + '" ' +			--TECH-75230
'UISubType="'    + isnull(ltrim(rtrim(@uisubtype)),'') + '">',@xml_seq_tmp) 


-- Insert Base Entry for Pages
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,    process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,    @process_name, @engg_component,
@activity_name,  @guid,    '<Pages>',@xml_seq_tmp)

-- Fetch Pages
--code Modified For BugId :PNR2.0_5812
declare pagecurs cursor FAST_FORWARD  for
--  Code Modification  for  PNR2.0_18516 starts
select upper(page_bt_synonym),  isnull(bt_synonym_caption,page_bt_synonym), horder, vorder,page_prefix,pg.PageClass, pg.page_Type,pg.pageimage,width -- Column added for the BugID PNR2.0_1790,PLF2.0_00961--PLF2.0_04721
,isnull(HeaderPosition,''),isnull(TabRotation,''),isnull(TabTitleStyle,''),isnull(TabIconPosition,''),isnull(PageLayout,'Table'),isnull(XYCoordinates,''),isnull(ColumnLayWidth,'')
from de_published_ui_page pg (nolock),
@de_published_glossary_lng_extn gls --(nolock)
where pg.customer_name  = gls.customer_name
and  pg.project_name   = gls.project_name
----and  pg.ecrno    =  gls.ecrno
and  pg.process_name   =  gls.process_name
and  pg.component_name  =  gls.component_name
and  pg.page_bt_synonym  = gls.bt_synonym_name
and  pg.customer_name  =   @engg_customer_name
and  pg.project_name   = @engg_project_name
and  pg.ecrno    =  @engg_req_no
and  pg.component_name  = @engg_component
and  pg.activity_name  =  @activity_name
and  pg.ui_name    =  @ui_name_tmp
--and  gls.languageid   =  @language_code
union
select '[MAINSCREEN]',    '[MAINSCREEN]',        horder, vorder,page_prefix,pg.PageClass, pg.page_Type,pg.pageimage,width -- Column added for the BugID PNR2.0_1790,PLF2.0_00961--PLF2.0_04721
,isnull(HeaderPosition,''),isnull(TabRotation,''),isnull(TabTitleStyle,''),isnull(TabIconPosition,''),isnull(PageLayout,'Table'),isnull(XYCoordinates,''),isnull(ColumnLayWidth,'')
from de_published_ui_page pg (nolock)
where pg.customer_name  =   @engg_customer_name
and  pg.project_name   = @engg_project_name
and  pg.ecrno    =  @engg_req_no
and  pg.component_name  = @engg_component
and  pg.activity_name  =  @activity_name
and  pg.ui_name    =  @ui_name_tmp
and  pg.page_bt_synonym  =  '[MAINSCREEN]'
order by horder, vorder

open pagecurs
-- For each Page generate entries
-- code modified by Sangeetha L on 27-Jan-2006 for the Bug Id : PNR2.0_5826
while (1=1)
begin
fetch next from pagecurs into @page_bt_synonym_tmp, @page_descr_tmp, @horder_tmp, @vorder_tmp,@page_prefix,@PageClass,@page_type,@page_image,@width_page-- Column added for the BugID PNR2.0_1790,PLF2.0_00961--PLF2.0_04721
,@HeaderPosition,@TabRotation,@TabTitleStyle,@TabIconPosition,@PageLayout,@XYCoordinates,@ColumnLayWidth
if @@fetch_status <> 0
break

select @page_descr_tmp = replace(@page_descr_tmp,'&','&amp;')
select @page_descr_tmp = replace(@page_descr_tmp,'<','&lt;')
select @page_descr_tmp = replace(@page_descr_tmp,'>','&gt;')
select @page_descr_tmp = replace(@page_descr_tmp,'"','&quot;')

-- Insert UI Page Entry
--code Modified For BugId :PNR2.0_5812
select @xml_seq_tmp=@xml_seq_tmp+1
If isnull(@PageClass ,'') = ''
set  @PageClass = ''

If isnull(@page_type ,'') = ''
set  @page_type = 'Normal'

	--Code Modification for PNR2.0_30869 starts 
	Declare @page_mappedtask	engg_name
	Declare @page_mapptasktype	engg_name

	select	@page_mappedtask	= ''
	select	@page_mapptasktype	= ''

	select	@page_mappedtask= isnull(upper(Task_Onclick),'')
	from	de_published_ui_pageevents (nolock)
	where	customer_name	= @engg_customer_name
	and		project_name	= @engg_project_name
	and		ecrno			= @engg_req_no
	and		component_name  = @engg_component
	and		activity_name	= @activity_name
	and		ui_name			= @ui_name_tmp
	and		page_bt_synonym	= @page_bt_synonym_tmp

	select	@page_mapptasktype= isnull(upper(task_type),'')
	from	de_published_action (nolock)
	where	customer_name	= @engg_customer_name
	and		project_name	= @engg_project_name
	and		ecrno			= @engg_req_no
	and		component_name  = @engg_component
	and		activity_name	= @activity_name
	and		ui_name			= @ui_name_tmp
	and		page_bt_synonym	= @page_bt_synonym_tmp
	and		task_name		= @page_mappedtask

	If isnull(@page_mapptasktype,'') = '' and isnull(@page_mappedtask,'') <> ''
		select @page_mapptasktype = 'Trans'
	
if @PageLayout = 'Accor'
	select @PageLayout = 'Table'

	--Code Modification for PNR2.0_30869 ends 

insert into ep_genxml_tmp
(customer_name,   project_name,    req_no,    process_name,    component_name,
activity_name,    guid,      gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name,  @engg_req_no,    @process_name ,  @engg_component,
@activity_name,  @guid,
'<Page Name="'   + ltrim(rtrim(@page_bt_synonym_tmp))   + '" ' +
'PageCaption="'  + ltrim(rtrim(@page_descr_tmp))     + '" ' +
'ILBOName="'   + ltrim(rtrim(@ui_name_tmp))     + '" ' +
'ActivityName="'  + ltrim(rtrim(@activity_name))    + '" ' +
'ComponentName="' + ltrim(rtrim(@engg_component))    + '" ' +
'PagePrefix="'  + ltrim(rtrim(@page_prefix))    + '" ' +
'PageClass="'  + ltrim(rtrim(@PageClass)) + '" ' +
'PageType="'  + ltrim(rtrim(@page_Type))    + '" ' +
'HOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@horder_tmp),3))) + '" ' +
'VOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@vorder_tmp),3)))  + '" ' +
--Code Modification for PNR2.0_30869 starts 
'MappedTask="'    + ltrim(rtrim(isnull(@page_mappedtask,'')))  + '" ' +
'TaskType="'    + ltrim(rtrim(isnull(@page_mapptasktype,'')))  + '" ' +
--Code Modification for PNR2.0_30869 ends
--'PageImage="'           +ltrim(rtrim(isnull(@page_image,''))) + '"/>',@xml_seq_tmp)	--Code added for Bug ID:PLF2.0_00961--PLF2.0_04721
'PageImage="'    + ltrim(rtrim(isnull(@page_image,'')))  + '" ' +--PLF2.0_0472
--'HeaderPosition="'    + ltrim(rtrim(isnull(@HeaderPosition,'')))  + '" ' +
--'TabRotation="'    + ltrim(rtrim(isnull(@TabRotation,'')))  + '" ' +
'TabTitleStyle="'    + ltrim(rtrim(isnull(@TabTitleStyle,'')))  + '" ' +
'TabIconPosition="'    + ltrim(rtrim(isnull(@TabIconPosition,'')))  + '" ' +
'PageLayout="'    + ltrim(rtrim(isnull(@PageLayout,'Table')))  + '" ' + 
'XYCoordinates="'    + ltrim(rtrim(isnull(@XYCoordinates,'')))  + '" ' +
'ColumnLayWidth="'    + ltrim(rtrim(isnull(@ColumnLayWidth,'')))  + '" ' +
'Width="'           +ltrim(rtrim(isnull(cast(@width_page as varchar),''))) + '"/>',@xml_seq_tmp)--PLF2.0_0472

--  Code Modification  for  PNR2.0_18516 ends
end
close pagecurs
deallocate pagecurs

-- Insert Closing entry for Pages
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid, '</Pages>',@xml_seq_tmp)

--Code added for Bug ID:PLF2.0_00961 starts
create table #AlignBtn  
( activityname varchar(60),ilbocode varchar(60),pagename varchar(60),sectionname varchar(60),control_name varchar(60), algnbtn_h int , algnbtn_v int ,
horder int ,  vorder int 
)  
--Code added for Bug ID:PLF2.0_00961 ends


-- Insert Base Entry for Sections
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<Sections>',@xml_seq_tmp)


-- Getting Max Horder for PRJHDNSECTION
select @prjsecrow    = isnull(max(horder),0)
from de_published_ui_section  sec (nolock),
@de_published_glossary_lng_extn gls --(nolock)
where sec.customer_name  = gls.customer_name
and  sec.project_name  = gls.project_name
--and  sec.ecrno    = gls.ecrno
and  sec.process_name  =  gls.process_name
and  sec.component_name  =  gls.component_name
and  sec.section_bt_synonym = gls.bt_synonym_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  sec.section_bt_synonym <>  'PRJHDNSECTION'
and  sec.visisble_flag       = 'Y'  -- Added For Removing Space BUG_ID:PNR2.0_17856
--and  gls.languageid   =  @language_code

if @ui_type_tmp = 'Help'
begin
select @hiddensectrow_tmp = @prjsecrow + 2,
@oksectionrow_tmp = @prjsecrow + 1
end
else
begin
select @hiddensectrow_tmp = @prjsecrow + 1
end
--Code Modified For BugId : PNR2.0_8896
if exists ( select 'x'
from de_published_ui_section(nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  component_name  = @engg_component
and  activity_name  =  @activity_name
and  ui_name    =  @ui_name_tmp
and  isnull(parent_section,'') <> '')
begin
-- For Generating Section Hierarcy
exec de_generate_sechierarchy
@ctxt_language,
@ctxt_ouinstance,
@ctxt_service,
@ctxt_user,
@engg_customer_name,
@engg_project_name,
@engg_req_no,
@process_name,
@engg_component,
@activity_name,
@ui_name_tmp,
@guid,
@pubflag
end

select @tablayout	= isnull(Layout,'Table') -- This column is Tab Layout column in Format tab
from de_published_ui  (nolock)
where customer_name   = @engg_customer_name
and  project_name   = @engg_project_name
and  ecrno       = @engg_req_no
and  process_name   = @process_name
and  component_name   = @engg_component
and  activity_name   = @activity_name
and  ui_name      = @ui_name_tmp

-- Fetch Sections --PLF2.0_03715
declare seccurs cursor FAST_FORWARD  for
select upper(sec.section_bt_synonym),    isnull(gls.bt_synonym_caption,sec.section_bt_synonym),
upper(ltrim(rtrim(sec.visisble_flag))),  upper(ltrim(rtrim(sec.title_required))),
upper(ltrim(rtrim(sec.border_required))), upper(sec.parent_section),
sec.horder,        sec.vorder,
upper(sec.page_bt_synonym),     isnull(sec.title_alignment,'LEFT'),
upper(sec.SECTION_TYPE),     isnull(sec.height,0),
isnull(sec.width,0),      isnull(sec.Setion_height_Scalemode,'px'),
isnull(sec.Setion_width_Scalemode,'px'), isnull(sec.SectionPrefixClass,''),isnull(sec.splitter_pos,''),isnull(sec.Associated_Control,''),isnull(NColSpan,''),isnull(NRowSpan,''),--Code Added For BugId PNR2.0_18564,PNR2.0_35383,PLF2.0_18487	
--isnull(sec.IsStatic, 'N'),
case  when isnull(sec.section_collapsemode,'') = 'Col' then 'Y'
						  when isnull(sec.section_collapsemode,'') = 'Exp' then 'N'
						  else ''
						  end ,isnull(sec.section_collapse,''),isnull(CarouselNavigation,'N')
,isnull(sec.cell_spacing,0),isnull(sec.cell_padding,0)					
,isnull(Region,''),isnull(TitlePosition,''),isnull(CollapseDir,''),isnull(SectionLayout,'Table'), -- code added for  Defect ID : TECH-18349 
 isnull(XYCoordinates,''),isnull(ColumnLayWidth,''),isnull(Slidingbar_Height,0)	 , ISNULL(IsResponsive,'N'), ISNULL(mob_pop_fullview, 'N'),ISNULL(sec.TitleIcon,''),		--TECH-72114
 ISNULL(sec.Orientation,'')	--TECH-75230
from de_published_ui_section sec (nolock),
@de_published_glossary_lng_extn gls --(nolock)
where sec.customer_name  = gls.customer_name
and  sec.project_name  = gls.project_name
--and  sec.ecrno    = gls.ecrno
and  sec.process_name  =  gls.process_name
and  sec.component_name  =  gls.component_name
and  sec.section_bt_synonym = gls.bt_synonym_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
--Code modified For PNR2.0_21234 on 25-Feb-2009 - Starts
and  sec.section_bt_synonym not in ('PRJHDNSECTION','[tabcontrol]') -- <>  'PRJHDNSECTION'
--Code modified For PNR2.0_21234 on 25-Feb-2009 - Ends
--Code Added For Bugid: PNR2.0_4146
and		(sec.visisble_flag		= 	'Y'or  sec.section_type = 'PopUp')--Code added for Bug ID:PLF2.0_00961
--and  gls.languageid   = @language_code
and sec.section_type<>'tree'--PLF2.0_03715 starts
union
-- code added by Ganesh for the callid :: Platform_2.0.3.X_500 on 06/09/05
select upper(sec.section_bt_synonym),    '[tabcontrol]',
upper(ltrim(rtrim(sec.visisble_flag))),  upper(ltrim(rtrim(sec.title_required))),
upper(ltrim(rtrim(sec.border_required))), upper(sec.parent_section),
sec.horder,         sec.vorder,
upper(sec.page_bt_synonym),     isnull(sec.title_alignment,'LEFT'),
upper(sec.SECTION_TYPE),     isnull(sec.height,0),
--Code Modified For BugId : PNR2.0_7273
isnull(sec.width,0),      isnull(sec.Setion_height_Scalemode,'px'),
isnull(sec.Setion_width_Scalemode,'px'), isnull(sec.SectionPrefixClass,''),isnull(sec.splitter_pos,''),isnull(sec.Associated_Control,''),isnull(NColSpan,''),isnull(NRowSpan,'')--Code Added For BugId PNR2.0_18564,PNR2.0_35383,PLF2.0_18487	
--,isnull(IsStatic,'N')
,case  when isnull(sec.section_collapsemode,'') = 'Col' then 'Y'
						  when isnull(sec.section_collapsemode,'') = 'Exp' then 'N'
						  else ''
						  end ,isnull(section_collapse,''),isnull(CarouselNavigation,'N')
,isnull(sec.cell_spacing,0),isnull(sec.cell_padding,0)
,isnull(Region,''),isnull(TitlePosition,''),isnull(CollapseDir,''),@tablayout,--isnull(SectionLayout,''),
----layout control value in format tab will be used as layout for '[tabcontrol]' since All pages should be of same layout type 
isnull(XYCoordinates,''),isnull(ColumnLayWidth,''),isnull(Slidingbar_Height,0) , ISNULL(IsResponsive,'N'), ISNULL(mob_pop_fullview, 'N'), --11742	
 ISNULL(sec.TitleIcon,''),ISNULL(sec.Orientation,'')	--TECH-72114 --TECH-75230
from de_published_ui_section sec (nolock)
where sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  sec.page_bt_synonym  =   '[MAINSCREEN]'
and  sec.section_bt_synonym = '[tabcontrol]'
---Changes for  PLF2.0_18487 Starts
union
select upper(sec.section_bt_synonym),    isnull(gls.bt_synonym_caption,sec.section_bt_synonym),
upper(ltrim(rtrim(sec.visisble_flag))),  upper(ltrim(rtrim(sec.title_required))),
upper(ltrim(rtrim(sec.border_required))), upper(sec.parent_section),
sec.horder,        sec.vorder,
upper(sec.page_bt_synonym),     isnull(sec.title_alignment,'LEFT'),
upper(sec.SECTION_TYPE),     isnull(sec.height,0),
isnull(sec.width,0),      isnull(sec.Setion_height_Scalemode,'px'),
isnull(sec.Setion_width_Scalemode,'px'), isnull(sec.SectionPrefixClass,''),isnull(sec.splitter_pos,''),UPPER(isnull(con.control_id,'')),isnull(NColSpan,''),isnull(NRowSpan,'')--Code Added For BugId PNR2.0_18564,PNR2.0_35383
--,isnull(IsStatic,'N')
,case  when isnull(sec.section_collapsemode,'') = 'Col' then 'Y'
						  when isnull(sec.section_collapsemode,'') = 'Exp' then 'N'
						  else ''
						  end ,isnull(section_collapse,''),isnull(CarouselNavigation,'N')
,isnull(sec.cell_spacing,0),isnull(sec.cell_padding,0)						  
,isnull(Region,''),isnull(TitlePosition,''),isnull(CollapseDir,''),isnull(SectionLayout,'Table'), -- code added for  Defect ID : TECH-18349 
isnull(XYCoordinates,''),isnull(ColumnLayWidth,''),isnull(Slidingbar_Height,0) , ISNULL(IsResponsive, 'N'), ISNULL(mob_pop_fullview, 'N'), ----11742	
 ISNULL(sec.TitleIcon,''),ISNULL(sec.Orientation,'')	--TECH-72114	--TECH-75230
from de_published_ui_section sec (nolock),
@de_published_glossary_lng_extn gls, --(nolock),
de_published_ui_control con (nolock)
where sec.customer_name  = gls.customer_name
and  sec.project_name  = gls.project_name
--and  sec.ecrno    = gls.ecrno
and  sec.process_name  =  gls.process_name
and  sec.component_name  =  gls.component_name
and  sec.section_bt_synonym = gls.bt_synonym_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  sec.section_bt_synonym not in ('PRJHDNSECTION','[tabcontrol]')
and  (sec.visisble_flag  =  'Y'or  sec.section_type = 'PopUp')
--and  gls.languageid   = @language_code
and  sec.section_type= 'tree'

and sec.customer_name		 = con.customer_name		 
and sec.project_name		 = con.project_name		 
and   sec.ecrno				 = con.ecrno				 
and   sec.component_name	 = con.component_name	 
and   sec.activity_name		 = con.activity_name			
and   sec.ui_name			 = con.ui_name			 
and   sec.page_bt_synonym	 = con.page_bt_synonym	 
and   sec.section_bt_synonym = con.section_bt_synonym 

--PLF2.0_03715 ends
order by sec.horder,sec.vorder


---Changes for  PLF2.0_18487 ends
-- For each Section  generate entries
open seccurs
while (1=1)
begin
fetch next from seccurs into
@section_bt_synonym_tmp, @section_descr_tmp,  @visible_flag_tmp,
@title_required_tmp,  @border_required_tmp, @parent_section_tmp,
@horder_tmp,     @vorder_tmp,    @page_bt_synonym_tmp,
@sectitle_align_tmp,  @section_type_tmp,
--Code Modified For BugId : PNR2.0_7273
@section_height_tmp,  @section_width_tmp,  @section_heightscalemode_tmp,
@section_widthscalemode_tmp, @SectionPrefixClass,@Section_Position,@AssociatedControl,@NColSpan,@NRowSpan--Code Added For BugId PNR2.0_18564,PNR2.0_35383 --PLF2.0_03715
--,@isstatic
,@section_collapse_mode,@section_collapseable	,@CarouselNavigation
,@cell_spacing,	@cell_padding
,@Region,@TitlePosition,@CollapseDir,@SectionLayout,@XYCoordinates,@ColumnLayWidth,@SlidingBarHeight_tmp,
@IsResponsive,	@FullView,	@TitleIcon,	@SecOrientation --TECH-75230

if @@fetch_status <> 0
break

select @section_descr_tmp = replace(@section_descr_tmp,'&','&amp;')
select @section_descr_tmp = replace(@section_descr_tmp,'<','&lt;')
select @section_descr_tmp = replace(@section_descr_tmp,'>','&gt;')
select @section_descr_tmp = replace(@section_descr_tmp,'"','&quot;')

 ----Code added for Bug ID:PLF2.0_00961 starts   
  
 select   @alignbtn	=	''
 declare  @activityname_1 varchar(60),@ilbocode_1 varchar(60),@pagename_1 varchar(60) ,@sectionname_1 varchar(60),
		  @control_name_1 varchar(60) , @algnbtn_h_1 int ,@algnbtn_v_1 int
 

   
if exists (select '*' from  de_published_ui_control a(nolock),
 							es_comp_ctrl_type_mst b (nolock)
	    where a.customer_name		 =   @engg_customer_name  
		 and  a.project_name		 =	 @engg_project_name  
		 and  a.ecrno				 =	 @engg_req_no
		 and  a.process_name		 =	 @process_name  
		 and  a.component_name		 =	 @engg_component  
		 and  a.activity_name		 =   @activity_name  
	     and  a.ui_name				 =	 @ui_name_tmp  
	     and  a.page_bt_synonym		 =	 @page_bt_synonym_tmp    
	     and  a.section_bt_synonym   =   @section_bt_synonym_tmp  
		 and  a.customer_name		 =   b.customer_name  
		 and  a.project_name		 =   b.project_name  
		 and  a.process_name		 =   b.process_name  
		 and  a.component_name		 =	 b.component_name   
		 and  a.control_type		 =   b.ctrl_type_name  
		 and  b.base_ctrl_type		 in ('button') )

BEGIN
if  
(				 
 (select count(*) from  de_published_ui_control a(nolock),
 						es_comp_ctrl_type_mst b (nolock)
	    where a.customer_name		 =   @engg_customer_name  
		 and  a.project_name		 =	 @engg_project_name  
		 and  a.ecrno				 =	 @engg_req_no
		 and  a.process_name		 =	 @process_name  
		 and  a.component_name		 =	 @engg_component  
		 and  a.activity_name		 =   @activity_name  
	     and  a.ui_name				 =	 @ui_name_tmp  
	     and  a.page_bt_synonym		 =	 @page_bt_synonym_tmp    
	     and  a.section_bt_synonym   =   @section_bt_synonym_tmp  
		 and  a.customer_name		 =   b.customer_name  
		 and  a.project_name		 =   b.project_name  
		 and  a.process_name		 =   b.process_name  
		 and  a.component_name		 =	 b.component_name   
		 and  a.control_type		 =   b.ctrl_type_name  
		 and  (b.base_ctrl_type  in ('button') or   b.ctrl_type_name in ('filler','filler2')))  =  (select count(*)  from  de_published_ui_control c(nolock)
																									where c.customer_name		 =   @engg_customer_name  
																									 and  c.project_name		 =	 @engg_project_name  
																									 and  c.ecrno				 =	 @engg_req_no
																									 and  c.process_name		 =	 @process_name  
																									 and  c.component_name		 =	 @engg_component  
																									 and  c.activity_name		 =   @activity_name  
																									 and  c.ui_name				 =	 @ui_name_tmp  
																									 and  c.page_bt_synonym		 =	 @page_bt_synonym_tmp    
																									 and  c.section_bt_synonym   =   @section_bt_synonym_tmp   )
																																													   
)
																						   
										   
 begin 
	
	select @alignbtn =	 'Y'
	
	insert into #AlignBtn 
	( activityname ,ilbocode ,pagename ,sectionname ,control_name , algnbtn_h  , algnbtn_v , horder , vorder )
	select distinct activity_name , ui_name  , page_bt_synonym  ,section_bt_synonym,control_bt_synonym, 0 , 0 ,a.horder,a.vorder
	from  de_published_ui_control  a (nolock),
		  es_comp_ctrl_type_mst b (nolock)
    where a.customer_name		 =   @engg_customer_name  
	and   a.project_name		 =	 @engg_project_name  
	and	  a.ecrno				 =	 @engg_req_no
	and   a.process_name		 =	 @process_name  
	and   a.component_name		 =	 @engg_component  
	and   a.activity_name		 =   @activity_name  
	and   a.ui_name				 =	 @ui_name_tmp  
	and   a.page_bt_synonym		 =	 @page_bt_synonym_tmp    
	and   a.section_bt_synonym	 =   @section_bt_synonym_tmp  
	and   a.customer_name		 =   b.customer_name  
	and   a.project_name		 =   b.project_name  
	and   a.process_name		 =   b.process_name  
	and   a.component_name		 =	 b.component_name   
	and   a.control_type		 =   b.ctrl_type_name  
	and   b.base_ctrl_type		in	('button') 
	order by  a.page_bt_synonym  ,a.section_bt_synonym,a.horder , a.vorder asc
	
	  
	select  @algnbtn_h_1 = 1 , @algnbtn_v_1 = 1 

   declare align_btn cursor FAST_FORWARD  for   
   select distinct activityname ,ilbocode ,pagename ,sectionname ,control_name , horder  ,vorder
   from #AlignBtn (nolock)  
	where  activityname 	=    @activity_name  
	and    ilbocode			=	 @ui_name_tmp  
	and	   pagename			=	 @page_bt_synonym_tmp    
	and    sectionname		=    @section_bt_synonym_tmp  
	order by  horder  ,vorder 

  open align_btn  
  while (1=1)  
  begin  -- cur   
	
fetch next from align_btn into  @activityname_1 ,@ilbocode_1 ,@pagename_1 ,@sectionname_1 ,@control_name_1 , @horder_1 , @vorder_1

	if @@fetch_status <> 0   
	break     
     
    
   if @algnbtn_v_1 > 6
     begin
		select @algnbtn_h_1	=  @algnbtn_h_1 + 1
		select @algnbtn_v_1	=  1	
	 end
   

   update #AlignBtn
   set   algnbtn_h =  @algnbtn_h_1 ,
		 algnbtn_v =  @algnbtn_v_1
   where activityname	=	@activityname_1
   and   ilbocode		=	@ilbocode_1
   and   pagename		=	@pagename_1
   and   sectionname	=	@sectionname_1
   and   control_name	=	@control_name_1
   

  select @algnbtn_v_1	=  @algnbtn_v_1 + 1 
	  

   end -- cur   
      
    close  align_btn  
   deallocate  align_btn  

 end
 END
 --END --1

----Code added for Bug ID:PLF2.0_00961 ends




-- code modified for the caseid : PNR2.0_28642 starts
	select  @uicolspan = isnull(max(vorder),0)
	from    de_published_ui_control (nolock)
	where 	customer_name		=  	@engg_customer_name
	and	project_name		=	@engg_project_name
	and	ecrno			=	@engg_req_no
	and	process_name		=	@process_name
	and	component_name		=	@engg_component
	and	activity_name		= 	@activity_name
	and	ui_name			=	@ui_name_tmp
	and	page_bt_synonym		=	@page_bt_synonym_tmp		
	and 	section_bt_synonym	= 	@section_bt_synonym_tmp

	select  @nonuicolspan = isnull(max(vorder),0)
	from    de_published_non_ui_control (nolock)
	where 	customer_name		=  	@engg_customer_name
	and	project_name		=	@engg_project_name
	and	ecrno			=	@engg_req_no
	and	process_name		=	@process_name
	and	component_name		=	@engg_component
	and	activity_name		= 	@activity_name
	and	ui_name			=	@ui_name_tmp
	and	page_bt_synonym		=	@page_bt_synonym_tmp		
	and 	section_bt_synonym	= 	@section_bt_synonym_tmp

if isnull(@uicolspan,0) > isnull(@nonuicolspan,0)
begin
	select @colspan = @uicolspan*2
end
else
begin
	select @colspan = @nonuicolspan*2
end
-- code modified for the caseid : PNR2.0_28642 ends
--Code Modified for BugId : PNR2.0_7420
--Code commented for BugId : PNR2.0_35383 starts
/*if @section_type_tmp = 'Tree'
select @section_heightscalemode_tmp = 'px',
@section_widthscalemode_tmp  = 'px'*/
--Code commented for BugId : PNR2.0_35383 ends
if exists ( select 'x'
from ep_section_hierarchy(nolock)
where guid     =  @guid
and  customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  =  @activity_name
and  ui_name    = @ui_name_tmp
and  page_name   = @page_bt_synonym_tmp
and  section_name   =  @section_bt_synonym_tmp)
begin
-- For Gettting Section Level
select @section_level  =  level
from ep_section_hierarchy (nolock)
where guid    = @guid
and  customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  =  @activity_name
and  ui_name    = @ui_name_tmp
and  page_name   = @page_bt_synonym_tmp
and  section_name   =  @section_bt_synonym_tmp
and req_no = @engg_req_no_in   --code added for bugid : PNR2.0_18751
end
else
begin
select @section_level  =  0
end

select @linkSection = 'N',
@buttonSection = 'N',
@GanttSection = 'N',
@SectionRenderAs = '' --Code Added for Defect ID : TECH-39534

if exists(
select '*'
from de_published_ui_section  a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  not exists( select 'A'
from de_published_ui_control  b (nolock),
es_comp_ctrl_type_mst  c (nolock)
where b.customer_name   = a.customer_name
and  b.project_name   = a.project_name
and  b.ecrno     = a.ecrno
and  b.process_name   = a.process_name
and  b.component_name  = a.component_name
and  b.activity_name   = a.activity_name
and  b.ui_name    = a.ui_name
and  b.page_bt_synonym  = a.page_bt_synonym
and  b.section_bt_synonym = a.section_bt_synonym
and  b.control_type   not in('Filler', 'Filler2')
and  c.customer_name   = b.customer_name
and  c.project_name   = b.project_name
and  c.process_name   = b.process_name
and  c.component_name  = b.component_name
and  c.ctrl_type_name  = b.control_type
and  c.base_ctrl_type  <> 'Link')
and  exists( select 'A'
from de_published_ui_control  d (nolock)
where d.customer_name   = a.customer_name
and  d.project_name   = a.project_name
and  d.ecrno     = a.ecrno
and  d.process_name   = a.process_name
and  d.component_name  = a.component_name
and  d.activity_name   = a.activity_name
and  d.ui_name    = a.ui_name
and  d.page_bt_synonym  = a.page_bt_synonym
and  d.section_bt_synonym = a.section_bt_synonym))
begin
set @linkSection = 'Y'
end

if exists(
select '*'
from de_published_ui_section  a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  not exists( select 'A'
from de_published_ui_control  b (nolock),
es_comp_ctrl_type_mst  c (nolock)
where b.customer_name   = a.customer_name
and  b.project_name   = a.project_name
and  b.ecrno     = a.ecrno
and  b.process_name   = a.process_name
and  b.component_name  = a.component_name
and  b.activity_name   = a.activity_name
and  b.ui_name    = a.ui_name
and  b.page_bt_synonym  = a.page_bt_synonym
and  b.section_bt_synonym = a.section_bt_synonym
and  b.control_type   not in('Filler', 'Filler2')
and  c.customer_name   = b.customer_name
and  c.project_name   = b.project_name
and  c.process_name   = b.process_name
and  c.component_name  = b.component_name
and  c.ctrl_type_name  = b.control_type
and  c.base_ctrl_type  <> 'Button')
and  exists( select 'A'
from de_published_ui_control  d (nolock)
where d.customer_name   = a.customer_name
and  d.project_name   = a.project_name
and  d.ecrno     = a.ecrno
and  d.process_name   = a.process_name
and  d.component_name  = a.component_name
and  d.activity_name   = a.activity_name
and  d.ui_name    = a.ui_name
and  d.page_bt_synonym  = a.page_bt_synonym
and  d.section_bt_synonym = a.section_bt_synonym))
and    @enablefiller <> 'Yes' --condition modified for the Bug ID:PLF2.0_00708
begin 
set @buttonSection = 'Y'
end

if exists(select 'X'
from	de_published_ui_section  sec (nolock)
where	sec.customer_name		= @engg_customer_name
and		sec.project_name		= @engg_project_name
and		sec.ecrno				= @engg_req_no
and		sec.process_name		= @process_name
and		sec.component_name		= @engg_component
and		sec.activity_name		= @activity_name
and		sec.ui_name				= @ui_name_tmp
and		sec.page_bt_synonym		= @page_bt_synonym_tmp
and		sec.section_bt_synonym	= @section_bt_synonym_tmp

and  exists( select 'X'
from	de_published_ui_control  ctl (nolock),
		es_comp_ctrl_type_mst  typ (nolock)
where	ctl.customer_name		= sec.customer_name
and		ctl.project_name		= sec.project_name
and		ctl.ecrno				= sec.ecrno
and		ctl.process_name		= sec.process_name
and		ctl.component_name		= sec.component_name
and		ctl.activity_name		= sec.activity_name
and		ctl.ui_name				= sec.ui_name
and		ctl.page_bt_synonym		= sec.page_bt_synonym
and		ctl.section_bt_synonym	= sec.section_bt_synonym

and		typ.customer_name		= ctl.customer_name
and		typ.project_name		= ctl.project_name
and		typ.process_name		= ctl.process_name
and		typ.component_name		= ctl.component_name
and		typ.ctrl_type_name		= ctl.control_type
and		typ.base_ctrl_type		= 'TreeGrid'
and		typ.renderAs			= 'Gantt'
and		ctl.control_type		not in('Filler', 'Filler2'))
)
begin 
	set @SectionRenderAs = 'Gantt' --Code Modified for Defect ID : TECH-39534
end
--Code added for Defect ID : TECH-39534 Starts
if exists(select 'X'
from	de_published_ui_section  sec (nolock)
where	sec.customer_name		= @engg_customer_name
and		sec.project_name		= @engg_project_name
and		sec.ecrno				= @engg_req_no
and		sec.process_name		= @process_name
and		sec.component_name		= @engg_component
and		sec.activity_name		= @activity_name
and		sec.ui_name				= @ui_name_tmp
and		sec.page_bt_synonym		= @page_bt_synonym_tmp
and		sec.section_bt_synonym	= @section_bt_synonym_tmp

and  exists( select 'X'
from	de_published_ui_control  ctl (nolock),
		es_comp_ctrl_type_mst  typ (nolock)
where	ctl.customer_name		= sec.customer_name
and		ctl.project_name		= sec.project_name
and		ctl.ecrno				= sec.ecrno
and		ctl.process_name		= sec.process_name
and		ctl.component_name		= sec.component_name
and		ctl.activity_name		= sec.activity_name
and		ctl.ui_name				= sec.ui_name
and		ctl.page_bt_synonym		= sec.page_bt_synonym
and		ctl.section_bt_synonym	= sec.section_bt_synonym

and		typ.customer_name		= ctl.customer_name
and		typ.project_name		= ctl.project_name
and		typ.process_name		= ctl.process_name
and		typ.component_name		= ctl.component_name
and		typ.ctrl_type_name		= ctl.control_type
and		typ.base_ctrl_type		= 'Grid'
and		typ.renderAs			= 'CALENDAR_EVENT'
and		ctl.control_type		not in('Filler', 'Filler2'))
)
begin 
	set @SectionRenderAs = 'Calendar'

	SELECT	@AssociatedControl	= UPPER(ISNULL(Control_id,''))
	FROM	de_published_ui_control (nolock)
	where	customer_name		= @engg_customer_name
	and		project_name		= @engg_project_name
	and		ecrno				= @engg_req_no
	and		process_name		= @process_name
	and		component_name		= @engg_component
	and		activity_name		= @activity_name
	and		ui_name				= @ui_name_tmp
	and		page_bt_synonym		= @page_bt_synonym_tmp
	and		section_bt_synonym	= @section_bt_synonym_tmp
	and		control_type		= 'HiddenEdit'
end
--Code added for Defect ID : TECH-39534 Ends

-- Added By Feroz For Dynamic Section
select @mapped_sec_controlid = '',
@mapped_sec_viewname = ''
if @section_type_tmp = 'Dynamic'
begin
select @mapped_sec_controlid = controlid,
@mapped_sec_viewname = viewname
from de_published_dynamic_sec_control_map (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno       = @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  =  @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
end
-- Added By Feroz For Dynamic Section
--code Added for the Bug ID: PNR2.0_31780 starts
if @section_type_tmp = 'Tree Grid'
begin 
		select	@mapped_sec_controlid	= b.control_id,
				@mapped_sec_viewname	= b.view_name
		from	de_published_ui_section a(nolock),
				de_published_ui_control b(nolock)
		where	a.customer_name			=  	@engg_customer_name
		and		a.project_name			=	@engg_project_name
		and		a.ecrno					=	@engg_req_no
		and		a.process_name			=	@process_name
		and		a.component_name		=	@engg_component
		and		a.activity_name			= 	@activity_name
		and		a.ui_name				=	@ui_name_tmp
		and		a.page_bt_synonym		=	@page_bt_synonym_tmp		
		and 	a.section_bt_synonym	= 	@section_bt_synonym_tmp		
		and		a.customer_name			=	b.customer_name			
		and		a.project_name			=	b.project_name
		and		a.req_no				=	b.req_no
		and		a.process_name			=	b.process_name		
		and		a.component_name		=	b.component_name	
		and		a.activity_name			=	b.activity_name		
		and		a.ui_name				=	b.ui_name
		and		b.page_bt_synonym		=	'[mainscreen]'		
		and 	b.section_bt_synonym	=	'PrjhdnSection'
		and		b.control_bt_synonym	=	a.Associated_control	
		
end

-- Insert UI Entry
IF EXISTS ( SELECT 'X'
FROM	de_published_ui a (nolock)
WHERE	a.customer_name			=  	@engg_customer_name
and		a.project_name			=	@engg_project_name
and		a.ecrno					=	@engg_req_no
and		a.process_name			=	@process_name
and		a.component_name		=	@engg_component
and		a.activity_name			= 	@activity_name
and		a.ui_name				=	@ui_name_tmp
and		a.devicetype			IN ('P', 'B', 'T'))
AND isnull(@AssociatedControl,'') <>'' -- 11537
begin
	select @AssociatedControl ='ML'+@AssociatedControl
--code Added for Defect ID : TECH-39534 Ends
end
else
if isnull(@AssociatedControl,'') <>'' -- 11537
	select @AssociatedControl =@AssociatedControl

-- Added for TECH-46646 Starts
select  @section_prefix	=	section_prefix,
		@forresponsive	=	CASE WHEN @section_bt_synonym_tmp = '[TABCONTROL]' THEN 'none'	--TECH-69624
								ELSE ISNULL(Convert(VARCHAR(10), ForResponsive), 'none')      
							END
from  de_published_ui_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp

IF	ISNULL(@sectionprefixclass,'') = 'Dynamic'
	SELECT @DynamicStyleControlName = 'hdn' + ISNULL(@section_prefix, '') + 'ds'
--Added for TECH-46646 Ends
	
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,   @guid,
'<Section Name="'  + ltrim(rtrim(@section_bt_synonym_tmp))   + '" ' +
'SectionCaption="' + ltrim(rtrim(@section_descr_tmp))     + '" ' +
'PageName="'  + ltrim(rtrim(@page_bt_synonym_tmp))   + '" ' +
'ILBOName="'   + ltrim(rtrim(@ui_name_tmp))     + '" ' +
'ActivityName="'  + ltrim(rtrim(@activity_name))    + '" ' +
'ComponentName="' + ltrim(rtrim(@engg_component))    + '" ' +
'ParentSection="' + ltrim(rtrim(@parent_section_tmp))    + '" ' +
'VisibleFlag="'  + ltrim(rtrim(@visible_flag_tmp))    + '" ' +
'TitleRequired="' + ltrim(rtrim(@title_required_tmp))    + '" ' +
'BorderRequired="' + ltrim(rtrim(@border_required_tmp))   + '" ' +
'TitleAlignment="' + ltrim(rtrim(@sectitle_align_tmp ))   + '" ' +
'SectionType="'  + ltrim(rtrim(isnull(@section_type_tmp,'')))  + '" ' +
--Code Modified For BugId : PNR2.0_7273
'Height="'     + ltrim(rtrim(isnull(@section_height_tmp,'')))  + '" ' +
'Width="'     + ltrim(rtrim(isnull(@section_width_tmp,'')))  + '" ' +
'HeightScaleMode="' + ltrim(rtrim(isnull(@section_heightscalemode_tmp,'px')))    + '" ' +
'WidthScaleMode="'  + ltrim(rtrim(isnull(@section_widthscalemode_tmp,'px')))    + '" ' +
'SectionLevel="'   + ltrim(rtrim(isnull(dbo.ep_padzero(CONVERT(VARCHAR(5),@section_level),3),''))) + '" ' + -- Code Modified for Bug_id PNR2.0_19082
'SectionPrefixClass="'   + ltrim(rtrim(isnull(lower(@SectionPrefixClass),''))) + '" ' +--Code Added For BugId PNR2.0_18564,PNR2.0_18645,PNR2.0_18692
'IsLinkSection="'   + @linkSection + '" ' +
'IsButtonSection="'   + @buttonSection + '" ' +
--'IsGanttSection="'   + @GanttSection + '" ' +
'RenderAs="'   + @SectionRenderAs + '" ' + --code Added for Defect ID : TECH-39534
'HOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@horder_tmp),3)))   + '" ' +
'VOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@vorder_tmp),3)))   + '" ' +
'MappedControlId="' + ltrim(rtrim(isnull(@mapped_sec_controlid, '')))  + '" ' +
'MappedViewName="'  + ltrim(rtrim(isnull(@mapped_sec_viewname, '')))  + '" ' +
--'Colspan="'+ltrim(rtrim(isnull(convert(varchar(5),@colspan),'')))+ '" ' +		--TECH-75956
'AlignBtn="'        + ltrim(rtrim(isnull(@alignbtn, '')))                   + '" ' +--Code added for Bug ID:PLF2.0_00961
'Position="'+ltrim(rtrim(isnull(@Section_Position,'')))+'" '+
'AssociatedControl="'+ltrim(rtrim(isnull(@AssociatedControl,''))) +'" '+ -- 11537
'ColSpan="'+CONVERT(VARCHAR,isnull(@NColSpan,''),4)+'" '+ --TECH-75956
'RowSpan="'+CONVERT(VARCHAR,isnull(@NRowSpan,''),4)+'" '+ --TECH-75956
--'IsStatic="'+ltrim(rtrim(isnull(@isstatic,'N')))+'" />',@xml_seq_tmp) -- code modified for the caseid : PNR2.0_28642 ,PNR2.0_35383 --PLF2.0_03715
'SectionCollapseMode="'  + ltrim(rtrim(isnull(@section_collapse_mode,'')))    + '" ' +
'SectionCollapseable="'+ltrim(rtrim(isnull(@section_collapseable,'')))+ '" ' +
'CellSpacing="'+isnull(cast(@cell_spacing as varchar(20)),0)    + '" ' +
'CellPadding="'+isnull(cast(@cell_padding as varchar(20)),0)		+ '" ' +
'Region="'+isnull(cast(@Region	as varchar(20)),0)		+ '" ' +
'TitlePosition="'+isnull(cast(@TitlePosition as varchar(20)),0)		+ '" ' +
'CollapseDir="'+isnull(cast(@CollapseDir as varchar(20)),0)		+ '" ' +
'SectionLayout="'+isnull(cast(@SectionLayout as varchar(20)),0)		+ '" ' +
'XYCoordinates="'+isnull(cast(@XYCoordinates as varchar(20)),0)		+ '" ' +
'ColumnLayWidth="'+isnull(cast(@ColumnLayWidth	as varchar(20)),0)		+ '" ' +
'SlidingBarHeight="'     + ltrim(rtrim(isnull(@SlidingBarHeight_tmp,'')))  + '" ' +
'IsResponsive="'     + ltrim(rtrim(isnull(@IsResponsive,'N')))  + '" ' +
'ResponsiveCol="'	+ ISNULL(@forresponsive, 'none')		+ '" ' +				--TECH-69624
'FullView="'     + ltrim(rtrim(isnull(@FullView,'N')))  + '" ' +
'TitleIcon="'     + ltrim(rtrim(isnull(@TitleIcon,'')))  + '" ' +  --TECH-72114
'DynamicStyleControlName="'     + ltrim(rtrim(isnull(@DynamicStyleControlName,'')))  + '" ' +
'Orientation="'     + ltrim(rtrim(isnull(@SecOrientation,'')))  + '" ' +  --TECH-75230	
'CarouselNavigation="'		+ ltrim(rtrim(isnull(@CarouselNavigation,'N')))+'"/>',@xml_seq_tmp)
end
close seccurs
deallocate seccurs


-- In case of help ui add a new section
if @ui_type_tmp = 'HELP'
begin
select  @xml_seq_tmp  = @xml_seq_tmp+1,
@oksectionname_tmp = 'OKSECTION'

--code starts -- Added by chanheetha N A -- border req for OKsection in help screen'-- PNR2.0_17707
declare @oksecbor_req  engg_flag
select  @oksecbor_req = case
when isnull(default_value,'YES') = 'YES' then 'Y'
else 'N'
end
from    es_comp_param_mst   (nolock)
where   param_category  =   'OKSECBORD'
and     component_name      = @engg_component

if isnull(@oksecbor_req,'')= ''
select @oksecbor_req = 'Y'
--code end -- Added by chanheetha N A -- border req for OKsection in help screen' -- PNR2.0_17707

Select  @section_height_tmp  = '', -- code added for BugID:PNR2.0_26450
@section_width_tmp = ''
set @section_collapseable ='N' -- code added for help section collapse issue by Ganesh Prabhu S
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Section Name="'  + @oksectionname_tmp       + '" ' +
'SectionCaption="' + @oksectionname_tmp       + '" ' +
'PageName="'  + ltrim(rtrim(@mainpage_tmp))     + '" ' +
'ILBOName="'   + ltrim(rtrim(@ui_name_tmp))     + '" ' +
'ActivityName="'  + ltrim(rtrim(@activity_name))     + '" ' +
'ComponentName="' + ltrim(rtrim(@engg_component))     + '" ' +
'ParentSection="" ' +
'VisibleFlag="Y"  ' +
'TitleRequired="N" ' +
--code starts -- Added by chanheetha N A -- border req for OKsection in help screen'
'BorderRequired="'  + ltrim(rtrim(@oksecbor_req))     + '" ' +
--code end -- Added by chanheetha N A -- border req for OKsection in help screen'
'TitleAlignment="' + ltrim(rtrim('LEFT'))             + '" ' +
'SectionType="'  + ltrim(rtrim('MAIN'))  + '" ' +
--Code Modified For BugId : PNR2.0_7273
'Height="'     + ltrim(rtrim(isnull(@section_height_tmp,'')))  + '" ' +
'Width="' + ltrim(rtrim(isnull(@section_width_tmp,'')))  + '" ' +
'HeightScaleMode="' + ltrim(rtrim(isnull(@section_heightscalemode_tmp,'px')))  + '" ' +
'WidthScaleMode="'  + ltrim(rtrim(isnull(@section_widthscalemode_tmp,'px')))  + '" ' +
'SectionPrefixClass="'   + ltrim(rtrim(isnull(lower(@SectionPrefixClass),''))) + '" ' +--Code Added For BugId PNR2.0_18564,PNR2.0_18645,PNR2.0_18692
'IsButtonSection="'  + 'Y' + '" ' +
'IsLinkSection="'  + 'N'  + '" ' +
'HOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@oksectionrow_tmp),3))) + '" ' +
'VOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,1),3))) + '" ' +
'MappedControlId="' + ltrim(rtrim(isnull(@mapped_sec_controlid, '')))  + '" ' +
'MappedViewName="'  + ltrim(rtrim(isnull(@mapped_sec_viewname, '')))  + '" ' +
--'Colspan="'+ltrim(rtrim(isnull(convert(varchar(5),@colspan),'')))+ '" ' +	--TECH-75956
'AlignBtn="'        + ltrim(rtrim(isnull(@alignbtn, '')))		 + '" ' +	--Code added for Bug ID:PLF2.0_00961 
'Position="'+ltrim(rtrim(isnull(@Section_Position,''))) + '" ' +
'ColSpan="'+CONVERT(VARCHAR,isnull(@NColSpan,''),4)+'" '+	--TECH-75956
'RowSpan="'+CONVERT(VARCHAR,isnull(@NRowSpan,''),4)+'" '+	--TECH-75956
--'IsStatic="'+ltrim(rtrim(isnull(@isstatic,'N')))+'" />',@xml_seq_tmp) -- code modified for the caseid : PNR2.0_28642 ,PNR2.0_35383
--'SectionCollapseMode="'  + ltrim(rtrim(isnull(@section_collapse_mode,'')))    + '" ' +
'SectionCollapseMode="'  + ltrim(rtrim(isnull(@section_collapse_mode,'N')))    + '" ' +--11536 for the case id TECH-19895
'SectionCollapseable="'+ltrim(rtrim(isnull(@section_collapseable,'')))+ '" ' +
'Region="'+isnull(cast(@Region	as varchar(20)),0)		+ '" ' +
'TitlePosition="'+isnull(cast(@TitlePosition as varchar(20)),0)		+ '" ' +
'CollapseDir="'+isnull(cast(@CollapseDir as varchar(20)),0)		+ '" ' +
'SectionLayout="'+isnull(cast(@SectionLayout as varchar(20)),0)		+ '" ' +
'XYCoordinates="'+isnull(cast(@XYCoordinates as varchar(20)),0)		+ '" ' +
'ColumnLayWidth="'+isnull(cast(@ColumnLayWidth	as varchar(20)),0)		+ '" ' +
'SlidingBarHeight="'  + '0' + '" ' + ---11742
'IsResponsive="'     + ltrim(rtrim(isnull(@IsResponsive,'N')))  + '" ' +
'FullView="'     + ltrim(rtrim(isnull(@FullView,'N')))  + '" ' +
'TitleIcon="'     + ltrim(rtrim(isnull(@TitleIcon,'')))  + '" ' +  --TECH-72114
'DynamicStyleControlName="'     + ltrim(rtrim(isnull(@DynamicStyleControlName,'N')))  + '" ' +
'Orientation="'     + ltrim(rtrim(isnull(@SecOrientation,'')))  + '" ' +  --TECH-75230
'CarouselNavigation="'		+ ltrim(rtrim(isnull(@CarouselNavigation,'N')))+'"/>',@xml_seq_tmp)
end


-- For Hidden Section in each page
declare secpagecurs cursor FAST_FORWARD  for
select upper(page_bt_synonym),  isnull(bt_synonym_caption,page_bt_synonym), horder, vorder
from de_published_ui_page pg (nolock),
@de_published_glossary_lng_extn gls --(nolock)
where pg.customer_name  = gls.customer_name
and  pg.project_name   = gls.project_name
--and  pg.ecrno    =  gls.ecrno
and  pg.process_name   =  gls.process_name
and  pg.component_name  =  gls.component_name
and  pg.page_bt_synonym  = gls.bt_synonym_name
--code modified by kiruthika for bugid:PNR2.0_9189
and  pg.activity_name  =  @activity_name
and  pg.ui_name    =  @ui_name_tmp
and  gls.customer_name  =   @engg_customer_name
and  gls.project_name  = @engg_project_name
--and  gls.ecrno    =  @engg_req_no
and  gls.component_name  = @engg_component
--and  gls.languageid   =  @language_code
union
select '[MAINSCREEN]',    '[MAINSCREEN]',        horder, vorder
from de_published_ui_page pg (nolock)
where pg.customer_name  =   @engg_customer_name
and  pg.project_name   = @engg_project_name
and  pg.ecrno    =  @engg_req_no
and  pg.component_name  = @engg_component
and  pg.activity_name  =  @activity_name
and  pg.ui_name    =  @ui_name_tmp
and  pg.page_bt_synonym  =  '[MAINSCREEN]'
order by horder, vorder

open secpagecurs
while (1=1)
begin
fetch next from secpagecurs into @page_bt_synonym_tmp, @page_descr_tmp, @horder_tmp, @vorder_tmp

if @@fetch_status <> 0
break

select @prjsecrow  = 0

select @NColSpan=''
select @NRowSpan=''


--Code Modified for BugId : PNR2.0_9320
select @prjsecrow    = isnull(max(horder),0)
from de_published_ui_section sec (nolock)
where sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  sec.page_bt_synonym  =  @page_bt_synonym_tmp
and  sec.section_bt_synonym <>  'PRJHDNSECTION'
and     sec.visisble_flag       = 'Y'-- Added For Removing Space BUG_ID : PNR2.0_17856


select @horder_tmp = @prjsecrow + 1

select @section_descr_tmp = replace(@section_descr_tmp,'&','&amp;')
select @section_descr_tmp = replace(@section_descr_tmp,'<','&lt;')
select @section_descr_tmp = replace(@section_descr_tmp,'>','&gt;')
select @section_descr_tmp = replace(@section_descr_tmp,'"','&quot;')

if exists  (select 'x'
from de_published_ui_control  ctrl  (nolock),
es_comp_ctrl_type_mst_vw  ctype (nolock),
de_published_ui_section  sec  (nolock)
where ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  =   @engg_customer_name
and  ctrl.project_name  = @engg_project_name
and  ctrl.process_name  = @process_name
and  ctrl.ecrno    =  @engg_req_no
and  ctrl.component_name  = @engg_component
and  ctrl.activity_name  =  @activity_name
and  ctrl.ui_name   =  @ui_name_tmp
and  ctrl.page_bt_synonym =  @page_bt_synonym_tmp
and  (	(ctype.visisble_flag = 'N'
and  ctrl.control_type  <> 'Filler')
or  (sec.visisble_flag  = 'N'
and  ctype.visisble_flag  = 'Y')))  or (@itk_flag=1)
 
begin

select @section_bt_synonym_tmp = 'PRJHDNSECTION',
@section_descr_tmp  = 'PRJHDNSECTION',
@parent_section_tmp  = '',
@visible_flag_tmp  = 'N',
@title_required_tmp  = 'N',
@border_required_tmp = 'N',
@sectitle_align_tmp  = 'LEFT',
--Code Modified for bugId : PNR2.0_9025
@section_widthscalemode_tmp = 'px',
-- code modified by shriram for the bugid:PNR2.0_9777
--@section_width_tmp   = 10
@section_width_tmp   = 0
-- code modified by shriram for the bugid:PNR2.0_9777

-- Insert UI Entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Section Name="'  + ltrim(rtrim(@section_bt_synonym_tmp))   + '" ' +
'SectionCaption="' + ltrim(rtrim(@section_descr_tmp))     + '" ' +
'PageName="'  + ltrim(rtrim(@page_bt_synonym_tmp))   + '" ' +
'ILBOName="'   + ltrim(rtrim(@ui_name_tmp))     + '" ' +
'ActivityName="'  + ltrim(rtrim(@activity_name))    + '" ' +
'ComponentName="' + ltrim(rtrim(@engg_component))    + '" ' +
'ParentSection="' + ltrim(rtrim(@parent_section_tmp))    + '" ' +
'VisibleFlag="'  + ltrim(rtrim(@visible_flag_tmp))    + '" ' +
'TitleRequired="' + ltrim(rtrim(@title_required_tmp))    + '" ' +
'BorderRequired="' + ltrim(rtrim(@border_required_tmp))   + '" ' +
'TitleAlignment="' + ltrim(rtrim(@sectitle_align_tmp ))   + '" ' +
--Code Modified For BugId : PNR2.0_7925
'SectionType="Main" ' +
--Code Modified For BugId : PNR2.0_7273
'Height="'     + ltrim(rtrim(isnull(@section_height_tmp,'')))  + '" ' +
'Width="'     + ltrim(rtrim(isnull(@section_width_tmp,'')))  + '" ' +
'HeightScaleMode="' + ltrim(rtrim(isnull(@section_heightscalemode_tmp,'px')))  + '" ' +
'WidthScaleMode="'  + ltrim(rtrim(isnull(@section_widthscalemode_tmp,'px')))  + '" ' +
'SectionPrefixClass="'   + ltrim(rtrim(isnull(lower(@SectionPrefixClass),''))) + '" ' +--Code Added For BugId PNR2.0_18564,PNR2.0_18645,PNR2.0_18692
'IsButtonSection="'  + 'N' + '" ' +
'IsLinkSection="'  + 'N'  + '" ' +
--Code Modified for BugId : PNR2.0_12676
'HOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@hiddensectrow_tmp),3))) + '" ' +
'VOrder="'    + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,1),3)))  + '" ' +
'MappedControlId="' + ltrim(rtrim(isnull(@mapped_sec_controlid, '')))  + '" ' +
'MappedViewName="'  + ltrim(rtrim(isnull(@mapped_sec_viewname, ''))) + '" ' +
'ColSpan="'  + CONVERT(VARCHAR,isnull(@NColSpan,''),4) + '" ' +	--TECH-75956
'RowSpan="'+CONVERT(VARCHAR,isnull(@NRowSpan,''),4)+'" '+ --TECH-75956
--'IsStatic="'+ltrim(rtrim(isnull(@isstatic,'N')))+'" />',@xml_seq_tmp)
'SectionCollapseMode="'  + ltrim(rtrim(isnull(@section_collapse_mode,'')))    + '" ' +
'Region="'+isnull(cast(@Region	as varchar(20)),0)		+ '" ' +
'TitlePosition="'+isnull(cast(@TitlePosition as varchar(20)),0)		+ '" ' +
'CollapseDir="'+isnull(cast(@CollapseDir as varchar(20)),0)		+ '" ' +
'SectionLayout="'+isnull(cast(@SectionLayout as varchar(20)),0)		+ '" ' +
'XYCoordinates="'+isnull(cast(@XYCoordinates as varchar(20)),0)		+ '" ' +
'ColumnLayWidth="'+isnull(cast(@ColumnLayWidth	as varchar(20)),0)		+ '" ' +
'SlidingBarHeight="'  + '0' + '" ' + ---11742
'IsResponsive="'     + ltrim(rtrim(isnull(@IsResponsive,'N')))  + '" ' +
'FullView="'     + ltrim(rtrim(isnull(@FullView,'N')))  + '" ' +
'TitleIcon="'     + ltrim(rtrim(isnull(@TitleIcon,'')))  + '" ' +  --TECH-72114
'DynamicStyleControlName="'     + ltrim(rtrim(isnull(@DynamicStyleControlName,'N')))  + '" ' +
'Orientation="'     + ltrim(rtrim(isnull(@SecOrientation,'')))  + '" ' +  --TECH-75230
'SectionCollapseable="'+ltrim(rtrim(isnull(@section_collapseable,'')))+'"/>',@xml_seq_tmp)
end
end
close secpagecurs
deallocate secpagecurs


-- Insert Closing entry for Sections
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name, component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</Sections>',@xml_seq_tmp)

-- Added by feroz for list edit
--   declare @maplist table    -- code modified by gopinath S for the call ID PNR2.0_24034
create table #maplist    -- code modified by gopinath S for the call ID PNR2.0_24034
( activityname varchar(60),ilbocode varchar(60),controlid varchar(60),viewname varchar(60),listedit varchar(60), instance int
)

insert
into #maplist   -- code modified by gopinath S for the call ID PNR2.0_24034
exec de_listedit_ctrl_map @engg_customer_name, @engg_project_name, @engg_req_no, @process_name, @engg_component, @pubflag, 'Design'

-- Added by feroz for list edit

-- Insert Base Entry for Controls
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<Controls>',@xml_seq_tmp)

-- Fetch Controls
if @ui_format_tmp = 'BES'
begin
declare ctrlcurs cursor FAST_FORWARD  for
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
--code modified for bugId : PNR2.0_10693
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''), -- Inplace Calendar and Edit Mask Feature added by Feroz
isnull(AccessKey,''), -- Added By Jeya
isnull(ctrl.Set_User_Pref,'Y'),--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'), isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26872
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'), -- PNR2.0_28319 
isnull(timezone,'N'), isnull(autoexpand,'N'), isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'),--Code Added for PN2.0_30869 , Bug ID PNR2.0_32053 ,Bug ID PNR2.0_32770 ,--PNR2.0_33378,PNR2.0_36309 
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') --Code added for Bug ID:PLF2.0_00961
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,'')
,isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),
isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.
spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls, --(nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
--and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  (ctype.visisble_flag = 'Y'
or  ctrl.control_type  = 'Filler')
and  sec.visisble_flag  = 'Y'
and	 sec.section_type <> 'MOBILECALENDAR'
--and  gls.languageid   =  @language_code

union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,     ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym),
upper(ctrl.section_bt_synonym),    upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1),      upper(isnull(ctrl_position,'LEFT')),
'',    '',
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
--code modified for bugId : PNR2.0_10693
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N'), isnull(EditMask, ''), -- Inplace Calendar and Edit Mask Feature added by Feroz
'', -- Added By Jeya Access Key
'Y',--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),0,'N','N','N',-- code added for the caseid:PNR2.0_26872
0,0,0,'N','','N','N', 'N','N','N','N', --PNR2.0_28319   --Code modified for PNR2.0_30869, Bug ID PNR2.0_32053,Bug ID PNR2.0_32770  --PNR2.0_33378,PNR2.0_36309 
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
'','','' --Code added for Bug ID:PLF2.0_00961
,'','','','','','','','','','','','','','','','','','','N','N','N','','N','N','Horizontal',ctype.Orientation,--'N',
'','','','','','',''
,'','','','','','','','','','',0 --TECH-77097
from de_published_non_ui_control  ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls, --(nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  (ctype.visisble_flag = 'Y'
or  ctrl.control_type  = 'Filler')
and  sec.visisble_flag  = 'Y'
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),         isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),       isnull(length,20),
isnull(control_type,''),          upper(base_ctrl_type),
ctrl.horder,             ctrl.vorder,
isnull(visisble_length,0),        isnull(proto_tooltip,''),
isnull(sample_data,''),          upper(ctrl.page_bt_synonym) as 'page_bt_synonym',
upper(ctrl.section_bt_synonym)  as 'section_bt_synonym', 'Y',
'Y',               'Y',
'Y',               'N',
'N',               'N',
'N',               '0',
isnull(data_column_width,0),        isnull(label_column_width,0),
'Y',              'LEFT',
'LEFT',              isnull(control_doc,''),
isnull(ctrl.order_seq,1) as order_seq,      'LEFT',
'',               '',
'N',              'N',
'',               '',
upper(isnull(data_column_scalemode,'%')),     upper(isnull(label_column_scalemode,'%')),
sec.horder,             sec.vorder,
'N',              'N',
'',               '',
--code modified for bugId : PNR2.0_10693
'N', 'N', '', isnull(AccessKey,''), -- Added By jeya For Accesskey
isnull(ctrl.Set_User_Pref,'Y'),--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
'','','',
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'N',  'N', 'N',
'N', 'N', 'N',
0, 'N', 'N',
'N', 0, 'N',
'', '', '',
'N', 'N', 'N',
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
'',isnull(freezecount,0),'N','N','N',-- code added for the caseid:PNR2.0_26872
0,0,0,'N','','N','N', 'N','N' ,'N','N',--PNR2.0_28319   --Code modified for PNR2.0_30869, Bug ID PNR2.0_32053,PNR2.0_32770--PNR2.0_33378,,PNR2.0_36309 
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
'','','' --Code added for Bug ID:PLF2.0_00961
,'','','','','','','','','','','','','','','','','','','N','N','N','','N','N','Horizontal','N','','','','','','',''
,'','','','','','','','','','',0 --TECH-77097
from de_published_ui_control  ctrl (nolock),
de_published_ui_section  sec (nolock),
@de_published_glossary_lng_extn gls, --(nolock),
es_comp_stat_ctrl_type_mst  ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') = 'MAIN'
--and  gls.languageid   =  @language_code
-- Added by Feroz For extjs Start --PNR2.0_1790

union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),
isnull(AccessKey,''), isnull(ctrl.Set_User_Pref,'Y'),
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26872
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone,'N'), isnull(autoexpand,'N'), isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'), --Code Added for PNR2.0_30869,PNR2.0_32053,PNR2.0_32770 --PNR2.0_33378,PNR2.0_36309 
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') --Code added for Bug ID:PLF2.0_00961
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls, --(nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') not in ('MAIN', 'TREE', 'CHART', 'Popup') --TECH-76600
and  ctype.visisble_flag = 'N'
and  sec.visisble_flag  = 'Y'
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),
isnull(AccessKey,''), isnull(ctrl.Set_User_Pref,'Y'),
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26872
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone,'N'),isnull(autoexpand,'N'),isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'), --Code Added for PNR2.0_30869 , PNR2.0_32053,PNR2.0_32770--PNR2.0_33378,PNR2.0_36309  -- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') --Code added for Bug ID:PLF2.0_00961
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls, --(nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') = 'MAIN'
and  ctype.visisble_flag  = 'N'
and  sec.visisble_flag   = 'Y'
and  ctype.is_extjs_control  =  'y'
--and  gls.languageid   =  @language_code
--Code added for Bug ID:PLF2.0_00961 starts
Union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),isnull(AccessKey,''), isnull(ctrl.Set_User_Pref,'Y'),
convert(varchar,NoofLinesPerRow),isnull(convert(varchar,RowHeight),''),isnull(Vscrollbar_Req,'N'),
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),
isnull(timezone,'N'),isnull(autoexpand,'N'),isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'),
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') 
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') = 'PopUp'
and  ISNULL(ctype.visisble_flag,'N') = 'Y' --TECH-76600
--and  gls.languageid   =  @language_code
--Code added for Bug ID:PLF2.0_00961 ends
-- Added by Feroz For extjs end --PNR2.0_1790
order by page, sec.horder, sec.vorder, section, ctrl.horder, ctrl.vorder, order_seq
end
else
begin
declare ctrlcurs cursor FAST_FORWARD  for
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
--code modified for bugId : PNR2.0_10693
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''), -- Inplace Calendar and Edit Mask Feature added by Feroz
isnull(AccessKey,''), -- Added By jeya For Accesskey
isnull(ctrl.Set_User_Pref,'Y'),--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26872
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone,'N'),isnull(autoexpand,'N'),isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'),--Code Added for PNR2.0_30869 , PNR2.0_32053,PNR2.0_32770--PNR2.0_33378,PNR2.0_36309
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') --Code added for Bug ID:PLF2.0_00961
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  (ctype.visisble_flag = 'Y'
or  ctrl.control_type  = 'Filler')
and  sec.visisble_flag  = 'Y'
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),        isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym),
upper(ctrl.section_bt_synonym),    upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1),      upper(isnull(ctrl_position,'LEFT')),
'',    '',
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
--code modified for bugId : PNR2.0_10693
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),  -- Inplace Calendar and Edit Mask Feature added by Feroz
'', -- Added by Jeya For Accesskey
'Y',--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
/*Modification made by Sangeetha G for Bug id : PNR2.0_33378 Starts*/
isnull(gridlite_req,'N'),0,'N','N','N',0,-- code added for the caseid:PNR2.0_26872		--Code modified for PNR2.0_30869
0,0,'N','','N','N','N','N',isnull(editcombo_req,'N'),isnull(Label_Link,'N'),--PNR2.0_28319 , Bug ID PNR2.0_32053,PNR2.0_32770 --PNR2.0_33378,PNR2.0_36309
/*Modification made by Sangeetha G for Bug id : PNR2.0_33378 Ends*/
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
'','','' --Code added for Bug ID:PLF2.0_00961
,'',isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),'','','','','','','','','','','',''--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
,'N','N','N','','N','N','Horizontal','N','','','','','',''
,'','','','','','','' ,'', 0 --TECH-77097
from de_published_non_ui_control  ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls, --(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  (ctype.visisble_flag = 'Y'
or  ctrl.control_type  = 'Filler')
and  sec.visisble_flag  = 'Y'
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),         isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),       isnull(length,20),
isnull(control_type,''),          upper(base_ctrl_type),
ctrl.horder,             ctrl.vorder,
isnull(visisble_length,0),         isnull(proto_tooltip,''),
isnull(sample_data,''),          upper(ctrl.page_bt_synonym) as 'page_bt_synonym',
upper(ctrl.section_bt_synonym)  as 'section_bt_synonym', 'Y',
'Y',               'Y',
'Y',               'N',
'N',               'N',
'N',               '0',
isnull(data_column_width,0),        isnull(label_column_width,0),
'Y',              'LEFT',
'LEFT',              isnull(control_doc,''),
isnull(ctrl.order_seq,1) as order_seq,      'LEFT',
'',               '',
'N',              'N',
'',               '',
upper(isnull(data_column_scalemode,'%')),     upper(isnull(label_column_scalemode,'%')),
sec.horder,             sec.vorder,
'N',              'N',
'',               '',
--code modified for bugId : PNR2.0_10693
'N', 'N', '',
isnull(AccessKey,''),
isnull(ctrl.Set_User_Pref,'Y'),--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
'','','',
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'N',  'N', 'N',
'N', 'N', 'N',
0, 'N', 'N',
'N', 0, 'N',
'', '', '',
'N', 'N', 'N',
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
'',isnull(freezecount,0),'N','N','N',-- code added for the caseid:PNR2.0_26872
0,0,0,'N','','N', 'N', 'N','N','N','N',--PNR2.0_28319			--Code modified for PNR2.0_30869, Bug ID PNR2.0_32053,PNR2.0_32770 --PNR2.0_33378,PNR2.0_36309
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
'','','' --Code added for Bug ID:PLF2.0_00961
,'','','','','','','','','','','','','','','','','','','N','N','N','','N','N','Horizontal',
'N','','','','','','',''--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
,'','','','','','','','','','', ctrl.Height --TECH-77097
from de_published_ui_control  ctrl (nolock),
de_published_ui_section  sec (nolock),
@de_published_glossary_lng_extn gls ,--(nolock),
es_comp_stat_ctrl_type_mst  ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') = 'MAIN'
--and  gls.languageid   =  @language_code
-- code added by feroz for extjs start --PNR2.0_1790
union
select upper(control_bt_synonym), isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,      ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),
isnull(AccessKey,''), isnull(ctrl.Set_User_Pref,'Y'),
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26872
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone,'N') , isnull(autoexpand,'N'),isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'),  --Code Added for PNR2.0_30869, PNR2.0_32053,PNR2.0_32770--PNR2.0_33378,PNR2.0_36309
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') --Code added for Bug ID:PLF2.0_00961
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(Tooltip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') not in ('MAIN', 'TREE', 'CHART')
and  ctype.visisble_flag = 'N'
and  sec.visisble_flag  = 'Y'
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder,
upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),
isnull(AccessKey,''), isnull(ctrl.Set_User_Pref,'Y'),
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26872
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone,'N'), isnull(autoexpand,'N'),isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'), --Code Added for PNR2.0_30869, PNR2.0_32053,PNR2.0_32770--PNR2.0_33378,PNR2.0_36309
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'') --Code added for Bug ID:PLF2.0_00961
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls, --(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and isnull(sec.section_type,'MAIN') = 'MAIN'
and ctype.visisble_flag  = 'N'
and sec.visisble_flag  = 'Y'
and ctype.is_extjs_control  =  'y'
--and gls.languageid   =  @language_code
-- code added By feroz for extjs end --PNR2.0_1790
--Code added for Bug ID:PLF2.0_00961 starts
Union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
upper(isnull(data_type,'char')),   isnull(length,20),
isnull(control_type,''),      upper(base_ctrl_type),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym) 'page',
upper(ctrl.section_bt_synonym) 'section', upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
isnull(data_column_width,0),    isnull(label_column_width,0),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  isnull(control_doc,''),
isnull(order_seq,1) 'order_seq',   upper(isnull(ctrl_position,'LEFT')),
upper(isnull(LabelClass,'')),    upper(isnull(ControlClass,'')),
upper(isnull(delete_req,'N')),    upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),    upper(isnull(hlpimg_class,'')),
upper(isnull(data_column_scalemode,'%')), upper(isnull(label_column_scalemode,'%')),
sec.horder,         sec.vorder, upper(isnull(html_txt_area,'N')),   upper(isnull(Spin_required,'N')),
upper(isnull(spin_up_image,'spinup.gif')), isnull(spin_down_image,'spindown.gif'),
isnull(report_req,'N'), isnull(InPlace_Calendar, 'N') , isnull(EditMask, ''),
isnull(AccessKey,''), isnull(ctrl.Set_User_Pref,'Y'),convert(varchar,NoofLinesPerRow),isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption, 'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),
isnull(timezone,'N'), isnull(autoexpand,'N'),isnull(Disp_Only_Apply_Len,'N'),isnull(editcombo_req,'N'),isnull(Label_Link,'N'),
isnull(captiontype,'Text'),isnull(controlstyle,'Default'),isnull(controlimage,'')
,isnull(IsListBox,''),isnull(Toolbar_Not_Req,'N'),isnull(ColumnBorder_Not_Req,'N'),isnull(RowBorder_Not_Req,'N'),isnull(PagenavigationOnly,'N'),isnull(RowNO_Not_Req,'N'),isnull(norowstodisplay_notreq,'N'),
isnull(ButtonHome_Req,'N'),isnull(ButtonPrevious_Req,'N'),isnull(colspan,''),isnull(rowspan,''),isnull(ToolTip_Not_Req,'N'),isnull(columncaption_Not_Req,'N'),isnull(Border_Not_Req,'N'),isnull(IsModal,'N'),isnull(Alternate_Color_Req,'N'),--modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
isnull(Map_In_Req,'N'),isnull(Map_Out_Req,'N'),isnull(Filesize,''),isnull(ISDeviceInfo,'N'),isnull(Datagrid,'N'),isnull(Email,'N'),isnull(TemplateID,''),isnull(Phone,'N'),isnull(StaticCaption,'N'),isnull(ctype.Orientation,''),isnull(Listcontrol,'N'),isnull(ctype.col_caption_align,''),
isnull(ctype.Gridheaderstyle,''),isnull(ctype.Gridtoolbarstyle,''),isnull(ctype.preevent,''),isnull(ctype.postevent,''),isnull(ctype.avn_download,''),isnull(ctype.spin_system_task,'')
,isnull(IsPivot,''),isnull(TemplateCategory,''),isnull(TemplateSpecific,''),isnull(Control_class_ext6,''), upper(isnull(renderas,'')),isnull(icon_class,''),isnull(icon_position,''),
isnull(preserve_gridposition,''),SystemClass, ctrl.Height --TECH-77097
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    =   gls.ecrno
and  ctrl.process_name  =  gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name
and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
--and isnull(sec.section_type,'MAIN') = 'MAIN' 
and isnull(sec.section_type,'MAIN') = 'PopUp'  -- modified for bugID:PLF2.0_03057
AND ISNULL(ctype.visisble_flag, 'N') = 'Y'	--TECH-76600
--and gls.languageid   =  @language_code
--Code added for Bug ID:PLF2.0_00961 ends
order by page, sec.horder, sec.vorder, section, ctrl.horder, ctrl.vorder, order_seq
end

-- Set Previous Section Name as blank
select  @previous_section_tmp  = '',
@position_vindex_tmp  = 0,
@position_hindex_tmp = 0,
@position_sindex_tmp = 0

-- For each Control generate entries
open ctrlcurs
while (1=1)
begin
fetch next from ctrlcurs into
@control_bt_synonym_tmp, @ctrl_descr_tmp,  @controlid_tmp,
@datatype_tmp,    @datalength_tmp,  @control_type_tmp,
@base_ctrl_type_tmp,   @horder_tmp,    @vorder_tmp,
@visible_length_tmp,   @proto_tooltip_tmp,  @sample_data_tmp,
@page_bt_synonym_tmp,   @section_bt_synonym_tmp,@mandatory_flag_tmp,
@visible_flag_tmp,    @editable_flag_tmp,  @caption_req_tmp,
@select_flag_tmp,    @zoom_req_tmp,    @help_req_tmp,
@ellipses_req_tmp,    @visible_rows_tmp,  @data_column_width_tmp,
@label_column_width_tmp, @caption_wrap_tmp,  @caption_alignment_tmp,
@caption_position_tmp,  @controldoc_tmp,  @order_seq_tmp,
@ctrl_position_tmp,   @label_class_tmp,  @ctrl_class_tmp,
@delete_flag_tmp,   @password_char_tmp,  @task_img_tmp,
@help_img_tmp,    @data_column_scalemode, @label_column_scalemode,
@tab_sec_horder,   @tab_sec_vorder,  @html_text_area,
@spin_required,    @spin_up_image,   @spin_down_image,
--code modified for bugId : PNR2.0_10693
@report_reqd,  @InPlaceCalendar, @EditMaskPattern, -- Inplace Calendar and Edit Mask Feature added by Feroz
@AccessKey,@Set_User_Pref,--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
@NoofLinesPerRow,@RowHeight,@Vscrollbar_Req,
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
@bulletlink_req,   @buttoncombo_req,  @associatedlist_req,
@onfocustask_req,   @listrefilltask_req, @dataascaption,
@listedit_NoofColumns,  @attach_document,  @image_upload,
@inplace_image,    @image_row_height,  @image_icon,
@relative_url_path,   @relative_document_path, @relative_image_path,
@save_doc_content_to_db, @save_image_content_to_db, @Date_highlight_req,
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
@gridlite,@freezecount,@Lite_Attach,@BrowseButton,@DeleteButton,-- code added for the caseid:PNR2.0_26872
@image_row_width,@image_preview_height,@image_preview_width,@image_preview_req,@Accept_Type,@Lite_Attach_Image,--PNR2.0_28319 
@timezone, @autoexpand ,@Disp_Only_Apply_Len,@editcombo_req,@LabelLink,--Code Added for PNR2.0_30869 , PNR2.0_32053 ,PNR2.0_32770--PNR2.0_33378,PNR2.0_36309
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
@captiontype,@controlstyle,@controlimage,@IsListBox,@Toolbar_Not_Req,@ColumnBorder_Not_Req,@RowBorder_Not_Req,@PagenavigationOnly,@RowNo_Not_Req,@norowdisplay,@ButtonHome_Req,
@ButtonPrevious_Req,@ControlColSpan,@ControlRowSpan,@ToolTip_Not_Req,@columncaption_Not_Req,@Border_Not_Req,@IsModal,@Alternate_Color_Req,@Map_In_Req,@Map_Out_Req --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
,@fileSize,@iSDeviceInfo,@Datagrid,@Email,@TemplateID,@Phone,@StaticCaption,@orientation,@listControl,@ctrl_col_caption_align,@Gridheaderstyle,@Gridtoolbarstyle
,@preevent,@postevent,@avn_download,@systemspin,@ispivot,@TemplateCat,@TemplateSpecific,@Control_class_ext6, @renderas,@icon_class,@icon_position,
@preserveposition,@systemclass, @ButtonHeight --TECH-77097

--Code added for TECH-72114 starts
IF EXISTS (SELECT 'x'
FROM de_published_ui_section_Titleaction a (NOLOCK)
WHERE a.customer_name				= @engg_customer_name
AND  a.project_name					= @engg_project_name
AND  a.ecrno						= @engg_req_no
AND  a.process_name					= @process_name
AND  a.component_name				= @engg_component
AND  a.activity_name				= @activity_name
AND  a.ui_name						= @ui_name_tmp
AND  a.page_bt_synonym				= @page_bt_synonym_tmp
AND  a.section_bt_synonym			= @section_bt_synonym_tmp
AND	 a.TitleControlBTSynonym		= @control_bt_synonym_tmp )
BEGIN
SELECT @visible_flag_tmp = 'N'
END
--Code added for TECH-72114 ends

if @@fetch_status <> 0
break

If isnull(@base_ctrl_type_tmp,'') = 'Slider'
Begin
	select @renderas = 'RSSlider'
	Select @base_ctrl_type_tmp = 'RSSlider'
End

-- Added for the Defect ID: TECH-37471 Starts for Set & LEave Focus Events
set @setfocusevent			= ''
set @leavefocusevent		= ''
set @setfocuseventoccur		= ''
set @leavefocuseventoccur	= ''
set @SpellCheckRequired		= ''
set	@UPEEnabled				= ''
set @MoreEventName			= ''

select	@setfocusevent		= upper(isnull(task_name,''))
from	de_published_action (nolock)
where	customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		ecrno				= @engg_req_no
and		process_name		= @process_name
and		component_name		= @engg_component
and		activity_name		= @activity_name
and		ui_name				= @ui_name_tmp
and		page_bt_synonym		= @page_bt_synonym_tmp
and		primary_control_bts	= @control_bt_synonym_tmp
and		task_descr			like 'Set Focus Event For%'

select	@leavefocusevent	= upper(isnull(task_name,''))
from	de_published_action (nolock)
where	customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		ecrno				= @engg_req_no
and		process_name		= @process_name
and		component_name		= @engg_component
and		activity_name		= @activity_name
and		ui_name				= @ui_name_tmp
and		page_bt_synonym		= @page_bt_synonym_tmp
and		primary_control_bts	= @control_bt_synonym_tmp
and		task_descr			like 'Leave Focus Event For%'
-- Added for the Defect ID: TECH-37471 Ends for Set & LEave Focus Events

SELECT	@setfocuseventoccur		= isnull(SetFocusEventOccurence, ''),
		@leavefocuseventoccur	= isnull(LeaveFocusEventOccurence, ''),	
		@SpellCheckRequired		= ISNULL(IsSpellcheck, 'N'),
		@IsMobile				= ISNULL(IsMobile, 'N'),
		@PaginationRequired		= ISNULL(PaginationReqd, 'N'),
		@UpdateTaskReqd			= ISNULL(UpdateTaskReqd, 'N'),
		@DeleteTaskReqd			= ISNULL(DeleteTaskReqd, 'N'),
		@RowAlwaysExpanded		= ISNULL(RowAlwaysExpanded, 'N') --Added for TECH-46646
FROM	es_comp_ctrl_type_mst_extn (NOLOCK)
where	customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		process_name		= @process_name
and		component_name		= @engg_component
and		ctrl_type_name		= @control_type_tmp

--Added for TECH-46646 Starts
SELECT @AssociatedUpdateTask = ''
SELECT @AssociatedDeleteTask = ''

IF ISNULL(@UpdateTaskReqd, 'N') = 'Y'
BEGIN
	SELECT	@AssociatedUpdateTask= upper(isnull(task_name,''))
	FROM	de_published_Action (nolock)
	where	customer_name		= @engg_customer_name
	and		project_name		= @engg_project_name
	and		ecrno				= @engg_req_no
	and		process_name		= @process_name
	and		component_name		= @engg_component
	and		activity_name		= @activity_name
	and		ui_name				= @ui_name_tmp
	and		page_bt_synonym		= @page_bt_synonym_tmp
	and		primary_control_bts	= @control_bt_synonym_tmp
	and		task_descr			= 'AssociatedUpdateTask'
END
IF ISNULL(@DeleteTaskReqd, 'N') = 'Y'
BEGIN
	SELECT	@AssociatedDeleteTask= upper(isnull(task_name,''))
	FROM	de_published_Action (nolock)
	where	customer_name		= @engg_customer_name
	and		project_name		= @engg_project_name
	and		ecrno				= @engg_req_no
	and		process_name		= @process_name
	and		component_name		= @engg_component
	and		activity_name		= @activity_name
	and		ui_name				= @ui_name_tmp
	and		page_bt_synonym		= @page_bt_synonym_tmp
	and		primary_control_bts	= @control_bt_synonym_tmp
	and		task_descr			= 'AssociatedDeleteTask'
END
--Added for TECH-46646 Ends

	--11536
	IF	ISNULL (@UPEEnabled_Comp,'')	= 'y'
	BEGIN
		SELECT	@MoreEventName		= UPPER(ISNULL(MoreEvent,''))
		FROM	de_published_upe_control (NOLOCK)
		WHERE	customername		=	@engg_customer_name
		AND		projectname			=	@engg_project_name
		AND		ECRNumber			=	@engg_req_no
		AND		processname			=	@process_name
		AND		componentname		=	@engg_component
		AND		activityname		=	@activity_name
		AND		uiname				=	@ui_name_tmp
		AND		PageName			=	@page_bt_synonym_tmp
		AND		BTSynonymName		=	@control_bt_synonym_tmp
		AND		ISNULL(MoreEvent,'') <> ''

		IF EXISTS ( SELECT 'X'
					FROM	de_published_upe_control (NOLOCK)
					WHERE	customername		=	@engg_customer_name
					AND		projectname			=	@engg_project_name
					AND		ECRNumber			=	@engg_req_no
					AND		processname			=	@process_name
					AND		componentname		=	@engg_component
					AND		activityname		=	@activity_name
					AND		uiname				=	@ui_name_tmp
					AND		PageName			=	@page_bt_synonym_tmp
					AND		BTSynonymName		=	@control_bt_synonym_tmp	)
					BEGIN
						SELECT	@UPEEnabled		=	'Y'
					END
	
		IF ISNULL(@UPEEnabled,'N') = 'Y'
		BEGIN
			
			SELECT	@setfocusevent	=	UPPER(ISNULL(SetFocusEvent,''))
			FROM	de_published_upe_control (NOLOCK)
			WHERE	customername		=	@engg_customer_name
			AND		projectname			=	@engg_project_name
			AND		ECRNumber			=	@engg_req_no
			AND		processname			=	@process_name
			AND		componentname		=	@engg_component
			AND		activityname		=	@activity_name
			AND		uiname				=	@ui_name_tmp
			AND		PageName			=	@page_bt_synonym_tmp
			AND		BTSynonymName		=	@control_bt_synonym_tmp
			AND		ISNULL(IsSetFocus,'') = 'Y'
		
		END
	END


--select	@scan			= isnull(scan,'N')
--from    es_comp_ctrl_type_mst_extn (nolock)
--where   customer_name   = @engg_customer_name
--and		project_name    = @engg_project_name
--and		process_name    = @process_name
--and		component_name  = @engg_component
--and		ctrl_type_name	= @control_type_tmp

--If isnull(@scan,'N')	= 'Y'
--	select @renderas = 'SCAN'

Declare @editmask	engg_flag
Declare @IsToggle	engg_flag

SET @editmask = ''
SET @IsToggle = ''

select	@editmask		= isnull(EditMask,'N')
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and		project_name    = @engg_project_name
and		process_name    = @process_name
and		component_name  = @engg_component
and		ctrl_type_name	= @control_type_tmp

-- Code Added for the Defect ID TECH-27286 Starts
select	@IsToggle		= isnull(IsToggle,'N')
from    es_comp_ctrl_type_mst_Extn (nolock)
where   customer_name   = @engg_customer_name
and		project_name    = @engg_project_name
and		process_name    = @process_name
and		component_name  = @engg_component
and		ctrl_type_name	= @control_type_tmp
and		base_ctrl_type	= 'CheckBox'

If isnull(@editmask,'N')	= 'Y'
	select @renderas = 'EDITMASK'
If isnull(@IsToggle,'N')	= 'Y'
	select @renderas = 'Toggle'
Else 
	select @renderas = @renderas
-- Code Added for the Defect ID TECH-27286 Ends

--TECH-72114

SELECT @BadgeText = ''

SELECT	@BadgeText		= ISNULL(BadgeText,'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'DataHyperLink'

IF ISNULL(@BadgeText,'')	= ''
	SELECT @BadgeText = 'N'

SELECT @AutoHeight = ''

SELECT	@AutoHeight		= ISNULL(AutoHeight,'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'Grid'

IF ISNULL(@AutoHeight,'')	= ''
	SELECT @AutoHeight = 'N'

--TECH-72114

--TECH-73996
SELECT @EyeIconforPassword = ''

SELECT	@EyeIconforPassword		= ISNULL(EyeIconforPassword,'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'Edit'

IF ISNULL(@EyeIconforPassword,'')	= ''
	SELECT @EyeIconforPassword = 'N'

SELECT @PreviousCount = 0

SELECT	@PreviousCount		= ISNULL(PreviousCount,0) 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'Button'

SELECT	@Signature		= ''

SELECT	@Signature		= ISNULL([Signature],'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'Edit'

IF @Signature	=	'Y'
BEGIN
SELECT @renderas	=	'Signature'
END

SELECT	@Stepper		= ''

SELECT	@Stepper		= ISNULL(Stepper,'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'Edit'

IF @Stepper	=	'Y'
BEGIN
SELECT @renderas	=	'Stepper'
END
--TECH-73996

--TECH-76231
SELECT @IconRequired = ''

SELECT	@IconRequired		= ISNULL(IconRequired,'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @control_type_tmp
AND		base_ctrl_type	= 'Button'

IF ISNULL(@IconRequired,'')	= ''
	SELECT @IconRequired = 'N'

--TECH-76231

-- Code Added for the Defect ID TECH-27286 Starts

if @base_ctrl_type_tmp in ('grid') and @section_bt_synonym_tmp not in ('PRJHDNSECTION')
begin
if exists (
select 'x'
from de_published_ui_control a(nolock) , de_published_calendar_configure b(nolock)
where	a.customer_name  =   @engg_customer_name
and		a.project_name  = @engg_project_name
and		a.ecrno    =  @engg_req_no
and		a.process_name  = @process_name
and		a.component_name  = @engg_component
and		a.activity_name =  @activity_name
and		a.ui_name   =  @ui_name_tmp
and		a.section_bt_synonym  =  @section_bt_synonym_tmp
and		a.control_type ='CalGrid'
and		a.section_bt_synonym <> 'PRJHDNSECTION'
and  a.customer_name		=  b.customer_name	  
and  a.project_name			=  b.project_name		
and  a.process_name			=  b.process_name		
and  a.component_name		=  b.component_name	
and  a.activity_name		=  b.activity_name	
and  a.ui_name				=  b.ui_name			
and  a.section_bt_synonym	=  b.section_name 
and	 a.ecrno				=  b.ecrno)
begin 
select @renderas ='CALENDAR'
end
end

--- MetaDataBasedLink Starts --	
--Declare @MetaDataBasedLink	engg_flag

--select	@MetaDataBasedLink		= isnull(MetaDataBasedLink,'N')
--from    es_comp_ctrl_type_mst_extn (nolock)
--where   customer_name   = @engg_customer_name
--and		project_name    = @engg_project_name
--and		process_name    = @process_name
--and		component_name  = @engg_component
--and		ctrl_type_name	= @control_type_tmp


--if isnull(@MetaDataBasedLink,'N') ='y'
--select @renderas = 'MetaDataBasedLink'



--- MetaDataBasedLink Ends --

--Code Added by Kanagavel A line control handling for control class 
if isnull(@renderas,'') = ''
	select @renderas = @base_ctrl_type_tmp

if @base_ctrl_type_tmp = 'line' and @ctrl_class_tmp = ''
begin 

select @ctrl_class_tmp = a.ControlClass
from ep_ui_control_dtl  a (nolock)
where a.customer_name  =   @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym =  @page_bt_synonym_tmp
and  a.control_bt_synonym=  @control_bt_synonym_tmp

end

/*set  @Control_cls_ext6 = ''
set  @Icon_Class = ''*/

if exists (Select 'x'
from ep_ui_section_dtl a (nolock)
where a.customer_name  =   @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym =  @page_bt_synonym_tmp
and  a.section_bt_synonym=  @section_bt_synonym_tmp
and	 a.section_type = 'MobileCalendar' )

select @visible_flag_tmp = 'N'

	

	set  @Control_cls_ext6 = ''

	--For Control Class implementation ext6
If @Control_class_ext6 <> '' and   charindex('~',@Control_class_ext6) <> 0 
	begin 
		Set  @Control_cls_ext6   = substring(@Control_class_ext6,1,charindex('~',@Control_class_ext6)-1)
		Set  @Icon_Class 		 = substring(@Control_class_ext6,charindex('~',@Control_class_ext6)+1,len(@Control_class_ext6))
	end

If @Control_class_ext6 <> '' and   charindex('~',@Control_cls_ext6) = 0 
			Set  @Control_cls_ext6   = @Control_class_ext6

-- @Icon_Class case sensitive has been done here
If @base_ctrl_type_tmp in ('button','link', 'Edit') --code Modified for Defect ID : TECH-39534
	Set @Classprops  = 'IconClass="'		+ isnull((@Icon_Class),'')  +'" ' +''
						--	  'IconPosition="'		+ isnull(@Icon_Position,'')  +'" ' +''
else 
	Set @Classprops  = ''

IF @Set_User_Pref = 'Y'
Select @Set_User_Pref = 'Yes'
Else if @Set_User_Pref = 'N'
Select @Set_User_Pref = 'No'

--Added for TECH-46646
IF isnull(@Icon_Class,'') NOT IN ('', 'Dynamic') AND ISNULL(@Image_Icon , 'N')  = 'N'
	SELECT @ImageType = 'Static'
ELSE IF isnull(@Icon_Class,'') = 'Dynamic' AND ISNULL(@Image_Icon , 'N')  = 'N'
	SELECT @ImageType = 'Dynamic'

If @ButtonHome_Req	='Y'
	Select @extjs_values = ' ExtType="Home" ', @exttype =  'Home'
Else If @ButtonPrevious_Req	='Y'
	Select @extjs_values =  ' ExtType="Previous" ', @exttype =  'Previous'
Else
	Select @exttype = '',@extjs_values = ''

If @datatype_tmp not in('Numeric','Integer') --code modified for Bugid - PNR2.0_19581
Select @Set_User_Pref = 'Yes'
--Code Added For BugId : PNR2.0_18436 Ends Here

-- Start For Inplace Calender added by Feroz
if isnull(@InPlaceCalendar,'N') = 'Y' and @datatype_tmp = 'Date'
select @InPlaceCalendar = 'y'
else
select @InPlaceCalendar = 'n'

if isnull(@InPlaceCalendar,'N') = 'Y' and isnull(@editable_flag_tmp,'N') = 'Y'
select @InPlaceCal_Display = 'y'
else
select @InPlaceCal_Display = 'n'

 ----11742

if isnull(@renderas,'') = ''
	select @renderas = @base_ctrl_type_tmp

	
	--11742
-- end For Inplace Calender added by Feroz

--Code added for Bug ID:PLF2.0_00961
select @captiontype = replace(@captiontype,'&','&amp;')
select @captiontype = replace(@captiontype,'<','&lt;')
select @captiontype = replace(@captiontype,'>','&gt;')
select @captiontype = replace(@captiontype,'"','&quot;')
select @captiontype = case isnull(@controlstyle,'') when 'Image' then ''
                                                    else    @captiontype end

-- Added By feroz For Edit mask pattern -- start
select @EditMaskPattern = replace(@EditMaskPattern,'&','&amp;')
select @EditMaskPattern = replace(@EditMaskPattern,'<','&lt;')
select @EditMaskPattern = replace(@EditMaskPattern,'>','&gt;')
select @EditMaskPattern = replace(@EditMaskPattern,'"','&quot;')
-- Added By feroz For Edit mask pattern -- end

-- code added by gopinath S for the Bug ID PNR2.0_19995 starts
select @help_tabstop = Auto_tab_stop
from   es_comp_ctrl_type_mst_vw a(nolock)
where  a.customer_name  = @engg_customer_name
and  a.project_name     = @engg_project_name
and  a.process_name     = @process_name
and  a.component_name   = @engg_component
and  a.ctrl_type_name   = @control_type_tmp
-- code added by gopinath S for the Bug ID PNR2.0_19995 ends

-- For Spin Control
select  @associated_spin_ctrl = '',
@associated_spin_task = ''

if @spin_required = 'Y'
begin

--Code Modified for bugid : PNR2.0_11183
if @spin_up_image = ''
select @spin_up_image = 'spinup.gif'
if @spin_down_image = ''
select @spin_down_image = 'spindown.gif'

select  @spin_up_image   = '../Themes/' + @engg_stylesheet + '/images/' + @spin_up_image,
@spin_down_image = '../Themes/' + @engg_stylesheet + '/images/' + @spin_down_image

select @associated_spin_ctrl = b.control_id,
@associated_primary_ctrl = b.control_bt_synonym
from de_published_spin_control   a (nolock),
de_published_ui_control  b (nolock)
where a.customer_name  =   @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.ecrno    =  @engg_req_no
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym =  @page_bt_synonym_tmp
and  a.control_bt_synonym=  @control_bt_synonym_tmp
and  a.customer_name  =  b.customer_name
and  a.project_name  =   b.project_name
and  a.ecrno    =  b.ecrno
and  a.process_name  =  b.process_name
and  a.component_name =  b.component_name
and  a.activity_name  =  b.activity_name
and  a.ui_name    =  b.ui_name
and  a.page_bt_synonym  =  b.page_bt_synonym
and  a.spin_control_bt_synonym = b.control_bt_synonym

select  @associated_spin_task = task_name
from de_published_action (nolock)
where customer_name  =   @engg_customer_name
and  project_name = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  primary_control_bts = @associated_primary_ctrl
end

--print task and control associated for spin only if system spin task is checked
IF @systemspin = 'y'
	BEGIN 
			SET @associated_spin_ctrl = ''
			SET @associated_spin_task = ''	
	END


--Code added for Bug ID:PLF2.0_00961 starts
select 	@popup_page = PopUp_page_bt_synonym ,@popup_section = PopUp_section,@popup_close = PopUp_close,
@sectionlaunchtype = sectionlaunchtype  	-- added for SectionLaunch Type TECH-12776 
--@iscallout =  Case iscallout when 1 then 'Y' 
--									Else 'N' End
from	de_published_action (nolock)
where	customer_name		=  	@engg_customer_name
and		project_name		=	@engg_project_name
and		ecrno				= 	@engg_req_no
and		process_name		=	@process_name
and		component_name		=	@engg_component
and		activity_name		=	@activity_name
and		ui_name				=	@ui_name_tmp
and		page_bt_synonym		= 	@page_bt_synonym_tmp
and		primary_control_bts	=	@control_bt_synonym_tmp

If isnull(@sectionlaunchtype,'') = 'Callout'
	select @iscallout = 'Y'
Else if isnull(@sectionlaunchtype,'') = 'SmartView'
	select @smartviewsection = 'Y'
Else if isnull(@sectionlaunchtype,'') = 'SideDrawer'
	select @IsSideDrawer = 'Y'
	
Else If isnull(@sectionlaunchtype,'') = ''
Begin
	select @iscallout = 'N'
	select @smartviewsection = 'N'
	select @IsSideDrawer = 'N'
End

if not exists(select 'X' from	de_published_action (nolock)
where	customer_name		=  	@engg_customer_name
and		project_name		=	@engg_project_name
and		ecrno				= 	@engg_req_no
and		process_name		=	@process_name
and		component_name		=	@engg_component
and		activity_name		=	@activity_name
and		ui_name				=	@ui_name_tmp
and		page_bt_synonym		= 	@page_bt_synonym_tmp
and		primary_control_bts	=	@control_bt_synonym_tmp)
begin 
select 	@popup_page = '' ,@popup_section = '',@popup_close = 0,
@iscallout =  'N', @smartviewsection = 'N', @IsSideDrawer = 'N'
end

select	@algnbtn_h_tmp  = 0	
select	@algnbtn_v_tmp  = 0	

select  @algnbtn_h_tmp	=	algnbtn_h,
        @algnbtn_v_tmp	=	algnbtn_v
 from   #AlignBtn (nolock)
where   pagename	 =	@page_bt_synonym_tmp
and     sectionname	 =	@section_bt_synonym_tmp
and     control_name =	@control_bt_synonym_tmp

--Code added for Bug ID:PLF2.0_00961 ends

select @tab_seq_tmp = ''

select @tab_seq_tmp  = tab_index
from @temp_tab_index
where ui_name    = @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  control_bt_synonym = @control_bt_synonym_tmp

if isnull ( @tab_seq_tmp , '' ) = ''
begin
select @tab_seq = ''
end
else
begin
select @tab_seq = @tab_seq_tmp
end

--code Modified for bugId : de_generate_uixml
if exists ( select 'x'
from @de_published_glossary_lng_extn  gls ,--(nolock),
de_published_business_term  bts  (nolock)
where gls.customer_name  = bts.customer_name
and gls.project_name  = bts.project_name
and gls.process_name  =  bts.process_name
and gls.component_name  =  bts.component_name
and gls.ecrno   =  bts.ecrno
and gls.bt_name   = bts.bt_name
and gls.customer_name  =   @engg_customer_name
and gls.project_name  = @engg_project_name
and gls.process_name  = @process_name
and gls.component_name  = @engg_component
and gls.ecrno   =  @engg_req_no
and gls.bt_synonym_name  =  @control_bt_synonym_tmp
--and gls.languageid   =  @language_code
)
begin
select @datalength_tmp = bts.length
from @de_published_glossary_lng_extn  gls ,--(nolock),
de_published_business_term  bts  (nolock)
where gls.customer_name  = bts.customer_name
and gls.project_name  = bts.project_name
and gls.process_name  =  bts.process_name
and gls.component_name  =  bts.component_name
and gls.ecrno   =  bts.ecrno
and gls.bt_name   = bts.bt_name
and gls.customer_name  =   @engg_customer_name
and gls.project_name  = @engg_project_name
and gls.process_name  = @process_name
and gls.component_name  = @engg_component
and gls.ecrno   =  @engg_req_no
and gls.bt_synonym_name  =  @control_bt_synonym_tmp
--and gls.languageid   =  @language_code
end





if @datatype_tmp = 'Numeric'
begin
select @decimal_length_ctrl   =  decimal_length
from @de_published_glossary_lng_extn  gls ,--(nolock),
de_published_business_term   bts (nolock),
de_published_precision_type  pt  (nolock)
where gls.customer_name  = bts.customer_name
and  gls.project_name  = bts.project_name
and  gls.process_name  =  bts.process_name
and  gls.component_name  =  bts.component_name
and  gls.ecrno    =  bts.ecrno
and  gls.bt_name    = bts.bt_name

and  bts.customer_name  = pt.customer_name
and  bts.project_name  = pt.project_name
and  bts.process_name  =  pt.process_name
and  bts.component_name  =  pt.component_name
and  bts.ecrno    =  pt.ecrno
and  bts.precision_type  = pt.pt_name

and  gls.customer_name  =   @engg_customer_name
and  gls.project_name  = @engg_project_name
and  gls.process_name  = @process_name
and  gls.component_name  = @engg_component
--and  gls.ecrno    =  @engg_req_no
and  gls.bt_synonym_name  =  @control_bt_synonym_tmp
--and  gls.languageid   =  @language_code

if isnull(@decimal_length_ctrl, -915) = -915
begin
select @decimal_length_ctrl = 3
end
end
else
begin
select @decimal_length_ctrl = 0
end

select @default_sample_data_tmp    = ''

if @sample_data_from = 'Layout' and @sample_data_tmp = ''
begin
if @base_ctrl_type_tmp in ('Edit','Button','Link','RadioButton','CheckBox','DataHyperLink')
begin
select @sample_data_tmp  =  isnull(singleinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @control_bt_synonym_tmp
--and  languageid   =  @language_code
end
else
begin
select @sample_data_tmp  =  isnull(multiinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @control_bt_synonym_tmp
--and  languageid   =  @language_code
end
end

if @sample_data_from = 'Glossary'
begin
if @base_ctrl_type_tmp in ('Edit','Button','Links','RadioButton','CheckBox','DataHyperLink')
begin
select @sample_data_tmp  = isnull(singleinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name =  @control_bt_synonym_tmp
--and  languageid   =  @language_code
end
else
begin
select @sample_data_tmp  =  isnull(multiinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @control_bt_synonym_tmp
--and  languageid   =  @language_code
end
end

select @default_sample_data_tmp = isnull(enum_caption,'')
from de_published_enum_value (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
and  default_flag  = 'Y'


---For Tooltip

Select	@proto_tooltip_tmp = isnull(tooltip,'')
from	de_published_ui_tooltip_lng_extn
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
and  languageid   =  @language_code


-- For Static Control Types Sample Data Starts
if exists  (select 'x'
from es_comp_stat_ctrl_type_mst (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ctrl_type_name  = @control_type_tmp)
begin
select @sample_data_tmp = dbo.engg_get_static_ctrl_values(
@engg_customer_name,
@engg_project_name,
@engg_req_no,
@process_name,
@engg_component,
@language_code,
@control_type_tmp,
'C')

select @default_sample_data_tmp = dbo.engg_get_static_ctrl_def_value(
@engg_customer_name,
@engg_project_name,
@engg_req_no,
@process_name,
@engg_component,
@language_code,
@control_type_tmp,
'C')
end
-- For Static Control Types Sample Data Ends


select @default_sample_data_tmp = replace(@default_sample_data_tmp,'&','&amp;')
select @default_sample_data_tmp = replace(@default_sample_data_tmp,'<','&lt;')
select @default_sample_data_tmp = replace(@default_sample_data_tmp,'>','&gt;')
select @default_sample_data_tmp = replace(@default_sample_data_tmp,'"','&quot;')

select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'&','&amp;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'<','&lt;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'>','&gt;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'"','&quot;')
--select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'--nocaption--','')

select @sample_data_tmp = replace(@sample_data_tmp,'&','&amp;')
select @sample_data_tmp = replace(@sample_data_tmp,'<','&lt;')
select @sample_data_tmp = replace(@sample_data_tmp,'>','&gt;')
select @sample_data_tmp = replace(@sample_data_tmp,'"','&quot;')

select @controldoc_tmp = replace(@controldoc_tmp,'&','&amp;')
select @controldoc_tmp = replace(@controldoc_tmp,'<','&lt;')
select @controldoc_tmp = replace(@controldoc_tmp,'>','&gt;')
select @controldoc_tmp = replace(@controldoc_tmp,'"','&quot;')



-- Addition  for  PNR2.0_23402 starts
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'&','&amp;')
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'<','&lt;')
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'>','&gt;')
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'"','&quot;')
-- Addition  for  PNR2.0_23402 ends

-- Check whether it is a new section
if @previous_section_tmp <> @section_bt_synonym_tmp
begin
select  @position_vindex_tmp = 0,
@position_hindex_tmp = 0,
@position_sindex_tmp = 0
end

if  @ui_format_tmp = 'BES' and @previous_horder_tmp <> @horder_tmp--(Coming Horder)
begin
select  @position_vindex_tmp = 0,
@position_sindex_tmp = 0
end

if  @ui_format_tmp = 'BES' and @previous_vorder_tmp <> @vorder_tmp--(Coming Vorder)
begin
select  @position_sindex_tmp = 0
end

if  @ui_format_tmp = 'UND' and @previous_horder_tmp  <> @horder_tmp
begin
select  @position_hindex_tmp  = 0
end

--code modified for bugId : PNR2.0_10693
if @report_reqd = ''  or isnull(@report_reqd,'') = ''
select @report_reqd = 'N'

if @base_ctrl_type_tmp in ('Edit','Combo','CheckBox','RadioButton') /*PNR2.0_29361*/
select @default_for_tmp = 'UI'
else if @base_ctrl_type_tmp in ('Button') and @report_reqd = 'N'
select @default_for_tmp = 'Trans'
else if @base_ctrl_type_tmp in ('Button') and @report_reqd = 'Y'
select @default_for_tmp = 'Report'
else if @base_ctrl_type_tmp in ('Link')  and @report_reqd = 'N'
-- Code modified by Anuradha on 08-Nov-2006 for the Bug ID :: PNR2.0_10874
select @default_for_tmp = 'Link'
else if @base_ctrl_type_tmp in ('Link')  and @report_reqd = 'Y'
select @default_for_tmp = 'Report'
-- Code modified on 18-Feb-2009 for the Bug ID :: PNR2.0_21118 - Begins
else if @base_ctrl_type_tmp in ('Datahyperlink')  and @report_reqd = 'N'
select @default_for_tmp = 'Datahyperlink'
else if @base_ctrl_type_tmp in ('Datahyperlink')  and @report_reqd = 'Y'
select @default_for_tmp = 'Report'
-- Code modified on 18-Feb-2009 for the Bug ID :: PNR2.0_21118 - Ends

--Code addition  for  PNR2.0_20049  starts

select @data_type   =  bts.data_type
from @de_published_glossary_lng_extn gls ,--(nolock),
de_business_term    bts (nolock)
where gls.customer_name   = bts.customer_name
and   gls.project_name    = bts.project_name
and   gls.process_name    = bts.process_name
and   gls.component_name  = bts.component_name
and   gls.bt_name       = bts.bt_name
and   gls.customer_name   = @engg_customer_name
and   gls.project_name    = @engg_project_name
and   gls.process_name    = @process_name
and   gls.component_name  = @engg_component
and   gls.bt_synonym_name = @control_bt_synonym_tmp
--and   gls.languageid      = @language_code
and   gls.ecrno    = @engg_req_no

If @data_type  <> 'char'
select @ellipses_req_tmp = 'N'

--Code addition  for  PNR2.0_20049  ends

-- For Associated Task
if exists  (select 'x'
from de_published_action a (nolock),
es_comp_task_type_mst b (nolock)
where  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.component_name  = b.component_name
and  a.task_pattern   = b.task_type_name
and  a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.primary_control_bts = @control_bt_synonym_tmp
and  a.task_pattern   = b.task_type_name
and  a.task_type    = @default_for_tmp)
begin -- 11536
	IF ISNULL(@UPEEnabled_Comp,'N')	=	'N'
	BEGIN
		SELECT	@uitaskname_tmp		=	upper(task_name)
		FROM	de_published_action a (NOLOCK),
				es_comp_task_type_mst b (NOLOCK)
		WHERE	a.customer_name			=	b.customer_name
		AND		a.project_name			=	b.project_name
		AND		a.component_name		=	b.component_name
		AND		a.task_pattern			=	b.task_type_name
		AND		a.customer_name			=	@engg_customer_name
		AND		a.project_name			=	@engg_project_name
		AND		a.ecrno					=	@engg_req_no
		AND		a.process_name			=	@process_name
		AND		a.component_name		=	@engg_component
		AND		a.activity_name			=	@activity_name
		AND		a.ui_name				=	@ui_name_tmp
		AND		a.page_bt_synonym		=	@page_bt_synonym_tmp
		AND		a.primary_control_bts	=	@control_bt_synonym_tmp
		AND		a.task_pattern			=	b.task_type_name
		AND		a.task_type				=	@default_for_tmp
		AND		a.task_descr	not like '%System Task%' -- 11537
		AND		ISNULL(a.SystemGenerated,'N') <> 'Y'	 -- TECH-73216
	END
	ELSE
	BEGIN
		SELECT	@uitaskname_tmp		=	UPPER(task_name)
		FROM	de_published_action a (NOLOCK),
				es_comp_task_type_mst b (NOLOCK)
		WHERE	a.customer_name			=	b.customer_name
		AND		a.project_name			=	b.project_name
		AND		a.component_name		=	b.component_name
		AND		a.task_pattern			=	b.task_type_name
		AND		a.customer_name			=	@engg_customer_name
		AND		a.project_name			=	@engg_project_name
		AND		a.ecrno					=	@engg_req_no
		AND		a.process_name			=	@process_name
		AND		a.component_name		=	@engg_component
		AND		a.activity_name			=	@activity_name
		AND		a.ui_name				=	@ui_name_tmp
		AND		a.page_bt_synonym		=	@page_bt_synonym_tmp
		AND		a.primary_control_bts	=	@control_bt_synonym_tmp
		AND		a.task_pattern			=	b.task_type_name
		AND		a.task_type				=	@default_for_tmp
		AND		a.task_descr	not like '%System Task%' -- 11537
		AND		ISNULL(a.SystemGenerated,'N') <> 'Y'	 -- TECH-73216
		AND NOT EXISTS ( SELECT 'X'
						 FROM	de_upe_control c(NOLOCK)
						 WHERE	c.CustomerName		=	a.Customer_Name
						 AND	c.ProjectName		=	a.Project_Name
						 AND	c.ProcessName		=	a.Process_Name
						 AND	c.ComponentName		=	a.Component_Name
						 --AND	c.EcrNumber			=	a.ecrno
						 AND	c.ActivityName		=	a.Activity_Name
						 AND	c.UIName			=	a.UI_Name
						 AND	c.BTSynonymName		=	a.Primary_Control_bts
						 AND	c.MoreEvent			=	a.Task_Name	)
	END
end
else
begin
select @uitaskname_tmp  = ''
end

select @filler_seq_no_control_tmp = isnull(max(order_seq), '1')
-- code added by Ganesh for the callid :: PNR2.0_4445 on 31/10/05
from de_published_ui_control a (nolock),
de_published_ui_section b (nolock)
where a.customer_name  = @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.process_name  = @process_name
and  a.ecrno    = @engg_req_no
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym = @page_bt_synonym_tmp
and a.section_bt_synonym = @section_bt_synonym_tmp -- code added for the bug id PNR2.0_18194

and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.ecrno    = b.ecrno
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   = b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.section_bt_synonym= b.section_bt_synonym   -- code added for the bug id PNR2.0_18194
and  a.horder   = @horder_tmp
and  a.vorder   = @vorder_tmp
and  b.horder   = @tab_sec_horder
and  b.vorder   = @tab_sec_vorder


select @filler_seq_no_filler_tmp = isnull(max(order_seq), '1')
-- code added by Ganesh for the callid :: PNR2.0_4445 on 31/10/05
from de_published_non_ui_control a (nolock),
de_published_ui_section b (nolock)
where a.customer_name  = @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.process_name  = @process_name
and  a.ecrno    = @engg_req_no
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym = @page_bt_synonym_tmp
and a.section_bt_synonym = @section_bt_synonym_tmp -- code added for the bug id PNR2.0_18194

and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.process_name  = b.process_name
and  a.ecrno    = b.ecrno
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   = b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.section_bt_synonym= b.section_bt_synonym  -- code added for the bug id PNR2.0_18194
and  a.horder   = @horder_tmp
and  a.vorder   = @vorder_tmp
and  b.horder   = @tab_sec_horder
and  b.vorder   = @tab_sec_vorder

if @filler_seq_no_control_tmp > @filler_seq_no_filler_tmp
select @filler_seq_no = @filler_seq_no_control_tmp
else
select @filler_seq_no = @filler_seq_no_filler_tmp


-- Code added by feroz for extjs -- start  --PNR2.0_1790
select  @extjs_base_ctrl = ''


if exists ( select  'x'
from  de_published_ui_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  section_type   in ('Text Scroller', 'Formatted Text','Report List', 'Property Window', 'Pivot', 'Tree Grid', 'IFrame', 'RSS Feed'))
begin  -- 1

select  @section_type   =  section_type
from  de_published_ui_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp

select  @extjs_values = ' ExtJs="Y" ExtType="' + Upper(@section_type) + '" ScrollDelay="' +  convert(varchar, isnull(Scroll_Delay,0)) + '" ScrollBehaviour="' + isnull(Scroll_Behaviour, 0) + '" Direction="' + isnull(Direction,'') + '" FadeDelay="' + convert(varchar, isnull(Fade_Delay,0)) + '" SectionHeight="' + convert(varchar, isnull(Section_Height,0)) + '" SectionWidth="' + convert(varchar, isnull(Section_Width,0)) + '" SectionClass="' + isnull(Section_Class,'') +  '" ReportItemClass="' + isnull(Report_Item_Class,'') + '" PropertyClass="' + isnull(Property_Class,'') + '"  ValueClass="' + isnull(Value_Class,'')  + '"',@section_bt_synonym_tmp  = upper(section_bt_synonym),@sample_data_tmp   = ''
from  de_published_ext_js_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp


select  @uitaskname_tmp  = upper(isnull(RVW_Task,'')),
@extjs_values  = ' CalloutTask="' + case when isnull(callout_task,0) = 0 then 'N' else 'Y' end  + '"' + @extjs_values, -- code moodified by feroz for bug id: PNR2.0_21040
@sample_data_tmp = sample_data
from  de_published_ext_js_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  section_type  in ('IFrame', 'RSS Feed')

end  -- 1

if exists ( select 'x'
from    es_comp_ctrl_type_mst_vw (nolock)
where   customer_name   = @engg_customer_name
and    project_name    = @engg_project_name
and    process_name    = @process_name
and    component_name  = @engg_component
and    ctrl_type_name  = @control_type_tmp
and  Is_Extjs_Control = 'y')

begin  -- 1

select  @extjs_ctrl_type = Extjs_Ctrl_type
from    es_comp_ctrl_type_mst_vw (nolock)
where   customer_name   = @engg_customer_name
and    project_name    = @engg_project_name
and    process_name    = @process_name
and    component_name  = @engg_component
and    ctrl_type_name  = @control_type_tmp
and  is_extjs_control = 'y'


if @extjs_ctrl_type in ('TextType Writer', 'Marquee Ticker', 'EMail')
begin -- For Lable contrl for Grid

if @caption_req_tmp = 'y'
select @extjs_base_ctrl = 'Edit'

end -- For Lable contrl for Grid

if @extjs_ctrl_type in ('TextType Writer', 'Marquee Ticker', 'EMail', 'Bar Code')
begin -- 2

select  @extjs_values   = ' ExtJs="Y" ExtType="' + Upper(@extjs_ctrl_type) + '" TypeDelay="' +  convert(varchar, isnull(Type_Delay,0)) + '" FadeDelay="' + convert(varchar, isnull(Fade_Delay, 0)) + '" TypeDirection="' + isnull(Type_Direction,'') + '" FadeD
irection="' + isnull(Fade_Direction,'') + '" Height="' +  convert(varchar, isnull(ctrl_height,0)) + '" Width="' + convert(varchar, isnull(ctrl_width,0)) + '" LoopCount="' + convert(varchar, isnull(Loop_Count,0))  + '"', -- Code modification for PNR2.0_23208
@ctrl_class_tmp   = isnull(Control_Class,''),
@section_bt_synonym_tmp = Upper(section_bt_synonym),
@sample_data_tmp   = ''
from  de_published_ext_js_control (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp


select  @uitaskname_tmp  = upper(isnull(RVW_Task,'')),
@extjs_values  = ' CalloutTask="' + case when isnull(callout_task,0) = 0 then 'N' else 'Y' end  + '"' + @extjs_values, -- code moodified by feroz for bug id: PNR2.0_21040
@sample_data_tmp = sample_data
from  de_published_ext_js_control (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp  -- Added By feroz for bug id : PNR2.0_20844
and  feature_name  =   'Bar Code'
end -- 2
end -- 1
-- Code added by feroz for extjs -- end --PNR2.0_1790

-- Code Added By Feroz For List edit
select @associatedlist_name = '',
@onfocus_taskname  = '',
@listrefill_taskname = '',
@hidden_view_name  = '',
@hidden_view_name1  = '',
@mapped_list_controlid = '',
@mapped_list_viewname = ''



if isnull(@date_highlight_req, 'N') = 'Y'
begin
select top 1 @associatedlist_name = upper(a.listedit_controlid)
from de_published_date_highlight_control_map a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  a.control_bt_synonym = @control_bt_synonym_tmp

select @mapped_list_controlid  = Upper(controlid),
@mapped_list_viewname  = Upper(viewname)
from #maplist  -- code modified by gopinath S for the call ID PNR2.0_24034
where activityname = @activity_name
and  ilbocode  = @ui_name_tmp
and  listedit  = @associatedlist_name
end

-- Modified By feroz for bug id :PNR2.0_23463
if exists ( select 'x'
from de_published_date_highlight_control_map a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.listedit_synonym  = @control_bt_synonym_tmp)
begin
select @base_ctrl_type_tmp = 'LISTEDIT'
end
-- Modified By feroz for bug id :PNR2.0_23463

if isnull(@associatedlist_req, 'N') = 'Y'
begin

select top 1 @associatedlist_name = Upper(b.listedit_controlid)
from de_published_listedit_control_map a (nolock),
de_published_listedit_column  b (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  a.mapped_bt_synonym  = @control_bt_synonym_tmp
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.ecrno     = b.ecrno
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.listedit_synonym  = b.listedit_synonym

select @mapped_list_controlid  = Upper(controlid),
@mapped_list_viewname  = Upper(viewname)
from #maplist  -- code modified by gopinath S for the call ID PNR2.0_24034
where activityname = @activity_name
and  ilbocode  = @ui_name_tmp
and  listedit  = @associatedlist_name


if  isnull(@onfocustask_req, 'N') = 'Y'
select @onfocus_taskname = task_name
from de_published_action (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  task_descr   = 'List Edit Onfocus Task'
and  primary_control_bts = @control_bt_synonym_tmp

if isnull(@listrefilltask_req, 'N') = 'Y'
select @listrefill_taskname = task_name
from de_published_action (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  task_descr   = 'List Edit Refill Task'
and  primary_control_bts = @control_bt_synonym_tmp

end

-- Modified By feroz for bug id :PNR2.0_23463
if exists ( select 'x'
from de_published_listedit_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    = @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  listedit_synonym = @control_bt_synonym_tmp)
begin
select @base_ctrl_type_tmp = 'LISTEDIT'
end
-- Modified By feroz for bug id :PNR2.0_23463

if exists ( select  'x'
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @control_type_tmp
and  (isnull(attach_document, 'N') = 'Y'
or  isnull(image_upload, 'N') = 'Y')
and	 (isnull(save_doc_content_to_db,'N')='Y' -- Code modified for bugID: PLF2.0_04457
or	isnull(save_image_content_to_db,'N')='Y'))
begin

select @hidden_view_name = Upper(view_name)
from de_hidden_view (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_name   =  @page_bt_synonym_tmp
and  section_name  =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
end
-- Code Added for Attachment With Desc starts
if exists ( select  'x'
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @control_type_tmp
and   (isnull(attach_document, 'N') = 'Y'
and	  isnull(AttachmentWithDesc,'') = 'Y') )
begin
	select @hidden_view_name1 = Upper(view_name)
	from de_hidden_view (nolock)
	where customer_name  =   @engg_customer_name
	and  project_name  = @engg_project_name
	and  process_name  = @process_name
	and  component_name  = @engg_component
	and  activity_name  = @activity_name
	and  ui_name    = @ui_name_tmp
	and  page_name   =  @page_bt_synonym_tmp
	and  section_name  =  @section_bt_synonym_tmp
	and  control_bt_synonym =  @control_bt_synonym_tmp
end
-- Code Added for Attachment With Desc End
-- Modified By feroz for bug id :PNR2.0_23654
select  @visible_rows_tmp = visisble_rows
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @control_type_tmp
-- Modified By feroz for bug id :PNR2.0_23654


/* code commented for  TECH-57347
--if @control_type_tmp = 'DataHyperLink'
--select @ctrl_descr_tmp = @sample_data_tmp
code commented for TECH-57347 */

--code Modified for bugId : PNR2.0_15338
if (@base_ctrl_type_tmp in ('Edit','Combo','Checkbox','Radiobutton','listview') and @caption_req_tmp = 'Y')
and (@control_type_tmp not in ('Filler','Filler2')) or (@base_ctrl_type_tmp = 'DataHyperLink' and @caption_req_tmp = 'Y')
or (@extjs_base_ctrl = 'Edit') -- Added by Feroz For Extjs --PNR2.0_1790
OR (@base_ctrl_type_tmp = 'Grid' AND @renderas = 'Tag') --TECH-75609 (Tag control needs caption since it behaves like a Header control)
begin
if  @ui_format_tmp = 'BES'
begin
select @transformed_horder_tmp  = @horder_tmp
select @transformed_vorder_tmp  = @vorder_tmp + @position_vindex_tmp

if @order_seq_tmp > 1
begin
select @transformed_seqno_tmp = @order_seq_tmp + @position_sindex_tmp
select @position_sindex_tmp = @position_sindex_tmp + 1
end
else
begin
select @transformed_seqno_tmp = @order_seq_tmp
end
end
else
begin
select @transformed_horder_tmp = (@horder_tmp * 2) - 1
select @transformed_vorder_tmp = @vorder_tmp
select @transformed_seqno_tmp = @order_seq_tmp  --Code Added For Bugid PNR2.0_20169
end

--code added for bugid:PNR2.0_19031 starts --
if @help_tabstop = 'Y' -- code modified by gopinath S for the bug id  PNR2.0_19995
begin
select @tab_seq_lbl = ''
end
else
begin
select @tab_seq_lbl = @tab_seq
end
--code added for bugid:PNR2.0_19031 ends --

select @xml_seq_tmp=@xml_seq_tmp+1

select @helptext = @ctrl_descr_tmp + ' - Datatype : ' + ltrim(rtrim(isnull(@datatype_tmp,'')))
+ ' - MaxLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))

-- code added for bugid : PNR2.0_17974  starts     --
--code added for the bugid : PNR2.0_25954 starts
IF (@extjs_ctrl_type = 'email' and @caption_req_tmp = 'N' )
begin
select @is_email = 'Y'
end
else
begin
select @is_email = 'N'
end

-- Added for TECH-46646 Starts
select  @DynamicFileUpload	= ISNULL(Dynamicfileupload, 'N')
from    es_comp_ctrl_type_mst_extn (nolock)
where   customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		process_name		= @process_name
and		component_name		= @engg_component
and		ctrl_type_name		= @control_type_tmp

IF ISNULL(@image_icon, 'N') = 'Y' AND ISNULL(@DynamicFileUpload,'N') = 'Y'
	SELECT @ImageType = 'Dynamic'
ELSE IF ISNULL(@image_icon, 'N') = 'Y' AND ISNULL(@relative_image_path,'') <> ''AND ISNULL(@DynamicFileUpload,'N') = 'N'
	SELECT @ImageType = 'Static'
ELSE IF ISNULL(@image_icon, 'N') = 'Y'
	SELECT @ImageType = ''
-- Added for TECH-46646 Ends

---- Code added for TECH-69624 starts

SELECT @forresponsive	=   ''

SELECT @forresponsive	=	ISNULL(Convert(VARCHAR(10), ForResponsive), 'none')
FROM	de_published_ui_control (NOLOCK)
WHERE  customer_name		=  @engg_customer_name
and    project_name			=  @engg_project_name
and    ecrno				=  @engg_req_no
and    process_name			=  @process_name
and    component_name		=  @engg_component
and    activity_name		=  @activity_name
and    ui_name				=  @ui_name_tmp
and    page_bt_synonym		=  @page_bt_synonym_tmp
and    control_bt_synonym	=  @control_bt_synonym_tmp

---- Code added for TECH-69624 Ends

--TECH-72114
--IF @ui_format_tmp = 'top'
--SELECT @labelname = +'LabelName="' + 'LBL'+ @controlid_tmp + '" '
--ELSE
--SELECT @labelname = ''
--TECH-72114

--code added for the bugid : PNR2.0_25954 ends
IF (@base_ctrl_type_tmp = 'Checkbox' and @caption_req_tmp = 'Y' and @ctrl_position_tmp = 'Right')
begin
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name, guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'    + ltrim(rtrim(isnull(@controlid_tmp,'')))              + '" ' +
-- +ltrim(rtrim(isnull(@labelname,''))) +  +' '+ --TECH-72114  
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'   + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))              + '" ' +
'SectionName="'    + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))          + '" ' +
'PageName="'     + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))            + '" ' +
'ILBOName="'      + ltrim(rtrim(isnull(@ui_name_tmp,'')))               + '" ' +
'ActivityName="'    + ltrim(rtrim(isnull(@activity_name,'')))             + '" ' +
'ComponentName="'   + ltrim(rtrim(isnull(@engg_component,'')))              + '" ' +
'ControlType="'    + ltrim(rtrim(isnull(upper(@control_type_tmp),'')))            + '" ' +
--'BaseControlType="'   + ltrim(rtrim(isnull(@base_ctrl_type_tmp,'')))            + '" ' + -- Code modification  for  PNR2.0_23635
'BaseControlType="'  + ltrim(rtrim(isnull(upper(@base_ctrl_type_tmp),'')))        + '" ' +   -- Code modification  for  PNR2.0_23635
'DataType="'     + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'     + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
'BTSynonym="'     + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))          + '" ' +
'VisibleLength="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))     + '" ' +
'ProtoTooltip="'   + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))            + '" ' +
'SampleData="'     + ltrim(rtrim(isnull(@sample_data_tmp,'')))             + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))          + '" ' +
--'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3)))+ '" ' + 
--'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3))) + '" ' +
'HOrder="'     +CASE WHEN @ui_format_tmp = 'Top' THEN  ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@horder_tmp,0)),3)))     --TECH-72114
				ELSE  + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3))) END  + '" ' + 
'VOrder="'     +CASE WHEN @ui_format_tmp = 'Top' THEN  ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@vorder_tmp,0)),3)))  --TECH-72114
				ELSE  + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3))) END  + '" ' +
'Mandatory="'     + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))            + '" ' +
'Visible="'      + ltrim(rtrim(isnull(@visible_flag_tmp,'')))       + '" ' +
'Editable="'     + ltrim(rtrim(isnull(@editable_flag_tmp,'')))            + '" ' +
'CaptionRequired="'   + ltrim(rtrim(isnull(@caption_req_tmp,'')))             + '" ' +
'SelectFlag="'     + ltrim(rtrim(isnull(@select_flag_tmp,'')))             + '" ' +
'DeleteFlag="'     + ltrim(rtrim(isnull(@delete_flag_tmp,'')))             + '" ' +
'ZoomRequired="'   + ltrim(rtrim(isnull(@zoom_req_tmp,'')))              + '" ' +
'HelpRequired="'   + ltrim(rtrim(isnull(@help_req_tmp,'')))              + '" ' +
'EllipsesRequired="'  + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))            + '" ' +
'AssociatedTask="'    + ltrim(rtrim(isnull(@uitaskname_tmp,'')))              + '" ' +
'DataColumnWidth="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))   + '" ' +
'LabelColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))  + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))          + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))         + '" ' +
'CaptionWrap="'      + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))            + '" ' +
'CaptionAlignment="'    + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))        + '" ' +
'CaptionPosition="'     + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))   + '" ' +
'ControlPosition="'     + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT'))) + '" ' +
'LabelClass="'       + ltrim(rtrim(isnull(@label_class_tmp,'')))             + '" ' +
'ControlClass="'     + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))  + '" ' +
'PasswordChar="'     + ltrim(rtrim(isnull(@password_char_tmp,'N')))           + '" ' +
'TaskImageClass="'     + ltrim(rtrim(isnull(@task_img_tmp,'')))              + '" ' +
'HelpImageClass="'   + ltrim(rtrim(isnull(@help_img_tmp,'')))              + '" ' +
'Documentation="'   + ltrim(rtrim(isnull(@controldoc_tmp,'')))              + '" ' +
'OrderSequence="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@transformed_seqno_tmp,0))))   + '" ' +
'VisibleRows="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))     + '" ' +
'HTMLTextArea="'   + ltrim(rtrim(isnull(@html_text_area,'N')))             + '" ' +
'SpinRequired="'   + ltrim(rtrim(isnull(@spin_required,'N')))              + '" ' +
'SpinUpImage="'    + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))          + '" ' +
'SpinDownImage="'   + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))        + '" ' +
'AssociatedSpinControl="' + ltrim(rtrim(isnull(@associated_spin_ctrl,'')))          + '" ' +
'AssociatedSpinTask="'  + ltrim(rtrim(isnull(@associated_spin_task,'')))          + '" ' +
'HelpText="'      + ltrim(rtrim(isnull(@helptext,'')))               + '" ' +
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'    + ltrim(rtrim(isnull(@report_reqd,'')))              + '" ' +
'ModelSectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))         + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))      + '" ' +  --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
-- Code Modifed for the BugID PNR2.0_18629 Starts (XML Attribute name has been changed as EditMask from EditMaskPattern Since Preview20dll is having as 'EditMask')
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Code Modifed for the BugID PNR2.0_18629 Ends (XML Attribute name has been changed as EditMask from EditMaskPattern Since Preview20dll is having as 'EditMask')
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(CONVERT(VARCHAR,@NoofLinesPerRow),''))) + '" ' +
'RowHeight="'   + ltrim(rtrim(isnull(CONVERT(VARCHAR,@RowHeight),''))) + '" ' +
'Vscrollbar_Req="'   + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))        + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))     + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+   -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')			+'" ' + --Code Added for PNR2.0_30869  
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' + -- Added for PLF2.0_00961 
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')								+'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')             +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')   +'" ' +	
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +			
'ExtType="'         +   isnull(@ExtType,'')  +'" ' +
--'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)  + '" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4)  + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)   + '" ' + 
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)  +'" ' +
'IsCallout="'		+ isnull(@iscallout,'')  +'" ' +
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +	
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'IsMobile="'					+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'			+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +	
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +			--TECH-69624
'BadgeText="'				+ isnull(@BadgeText,'N')  +'" ' +			--TECH-72114
'AutoHeight="'				+ isnull(@AutoHeight,'N')  +'" ' +			--TECH-72114
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'ShowEyeIcon="'				+ isnull(@EyeIconforPassword,'N')  +'" ' +			--TECH-73996
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'PreviousCount="'			+	CONVERT(VARCHAR,isnull(@PreviousCount,0),4)	+'" ' +		--TECH-73996
'FileSize="'		+ isnull(@filesize,'') +'"/>' ,@xml_seq_tmp)
 --modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676
--code added for the caseid : PNR2.0_28319 ends
--Code Modified For BUGID PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
end
else
begin--For 'Edit','Combo','Checkbox','Radiobutton','datahyperlink' Controls Label generation for which caption req='y'
-- code added for bugid : PNR2.0_17974  ends     --
if (@is_email = 'N') --PNR2.0_25954
AND  @ui_format_tmp <> 'top' --TECH-72114
begin--PNR2.0_25954
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + 'LBL'+ ltrim(rtrim(isnull(@controlid_tmp,'')))       + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))          + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))   + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))         + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))          + '" ' +
'ControlType="'   + ltrim(rtrim(isnull(upper(@control_type_tmp),'')))        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--       'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))         + '" ' +
--       'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))         + '" ' +
--       'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))      + '" ' +
'BaseControlType="'  + 'LABEL'                 + '" ' +  -- Code modification  for  PNR2.0_23635
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))    + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))        + '" ' +
'SampleData="'   + ltrim(rtrim(isnull(@sample_data_tmp,'')))         + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))       + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3)))  + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3)))   + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))        + '" ' +
'Visible="'    + ltrim(rtrim(isnull(@visible_flag_tmp,'')))        + '" ' +
'Editable="'   + ltrim(rtrim(isnull(@editable_flag_tmp,'')))        + '" ' +
'CaptionRequired="'  + ltrim(rtrim(isnull(@caption_req_tmp,'')))         + '" ' +
'SelectFlag="'   + ltrim(rtrim(isnull(@select_flag_tmp,'')))         + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))         + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull(@zoom_req_tmp,'')))         + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull(@help_req_tmp,'')))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))        + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))         + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))   + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))   + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))       + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))       + '" ' +
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))        + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))      + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))      + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))       + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="' + ltrim(rtrim(isnull(@controldoc_tmp,'')))         + '" ' +
-- code added for bugid : PNR2.0_17974  starts     --
'OrderSequence="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@transformed_seqno_tmp,0))))     + '" ' +
--'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@order_seq_tmp,0))))     + '" ' +
-- code added for bugid : PNR2.0_17974  ends     --
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))    + '" ' +
-- code modified by Ganesh for the callid :: PNR2.0_3812 on 09/09/05
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))         + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))       + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
--code modified for bugId : PNR2.0_10693
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'  + ltrim(rtrim(isnull(@report_reqd,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))      + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
--'TabIndex="'   + ltrim(rtrim(@tab_seq))  + '" ' +
'TabIndex="'   + ltrim(rtrim(@tab_seq_lbl))             + '" ' + --code added for bugid : PNR2.0_19031
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+ --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'  +  	isnull(@autoexpand,'N') +'" '+ --Code Added for the Bug ID PNR2.0_32053 
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +   --Code Added for the Bug ID PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' + 
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="' +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'IsListBox="'         +   isnull(@IsListBox,'')               +'" ' +--modified for bugID:PLF2.0_03057
 'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')   +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'') +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
--'ExtType="'         +   isnull(@ExtType,'')		+'" ' +
 --'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)+'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4)  +'" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4) + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)  + '" ' +
'IsCallout="'		+ isnull(@iscallout,'')+ '" ' +  -- added by feroz for bug id PNR2.0_18385 -- modified by feroz for extjs --PNR2.0_1790 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996  --code added for bugid: PLF2.0_07676
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'SetScrollPosition="'		+ isnull(@preserveposition,'')  +'" ' +
'FileSize="'		+ isnull(@filesize,'')  +'" ' +
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' +
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' +  -- Added for TECH-37471 
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' +  -- Added for TECH-37471 
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' + --TECH-45828
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +	--TECH-69624
'BadgeText="'				+ isnull(@BadgeText,'N')  +'" ' +   --TECH-72114
'AutoHeight="'				+ isnull(@AutoHeight,'N')  +'" ' +   --TECH-72114
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'ShowEyeIcon="'				+ isnull(@EyeIconforPassword,'N')  +'" ' +   --TECH-73996
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'PreviousCount="'			+	CONVERT(VARCHAR,isnull(@PreviousCount,0),4)	+'" ' +		--TECH-73996
 isnull(@extjs_values,'N')	     + '/>',@xml_seq_tmp) 

--code added for the caseid : PNR2.0_28319 ends
--Code Modified For BUGID PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- code added for bugid : PNR2.0_17974  starts     --
end
end --PNR2.0_25954
-- code added for bugid : PNR2.0_17974  ends     --
if @ui_format_tmp = 'BES'
begin
select @position_vindex_tmp = @position_vindex_tmp + 1
end
end

--For BES button , link caption req is not considered
--For UND button , Link caption req is considered and Filler is generated

--Code Modified For BugId : PNR2.0_9131
if (@caption_req_tmp = 'Y' and @base_ctrl_type_tmp in ('Button','Link')) and @control_type_tmp <> 'Label' and @base_ctrl_type_tmp <> 'label'
begin

if  @ui_format_tmp = 'BES'
begin
select @position_vindex_tmp = @position_vindex_tmp + 1
end
else if @ui_format_tmp = 'UND'
begin
select @transformed_horder_tmp = (@horder_tmp * 2) - 1   --horder duplication issue
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim(isnull('filler_' + @controlid_tmp,'')))         + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))          + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))        + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))         + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))          + '" ' +
'ControlType="'   + ltrim(rtrim(isnull(upper('Filler'),'')))           + '" ' +
'BaseControlType="'  + ltrim(rtrim(isnull('FILLER','')))           + '" ' +  -- Code modification  for  PNR2.0_23635
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--        'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))         + '" ' +
--        'DataLength="' + ltrim(rtrim(isnull(@datalength_tmp,'')))         + '" ' +
--        'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,''))) + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))    + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))        + '" ' +
'SampleData="'   + ltrim(rtrim(isnull(@sample_data_tmp,'')))         + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))       + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3)))+ '" ' + --Kanagavel for buttoncap = 'y' filler seq change 
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@vorder_tmp,0)),3)))   + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))        + '" ' +
'Visible="'    + ltrim(rtrim(isnull(@visible_flag_tmp,'')))        + '" ' +
'Editable="'   + ltrim(rtrim(isnull(@editable_flag_tmp,'')))        + '" ' +
'CaptionRequired="' + ltrim(rtrim(isnull(@caption_req_tmp,'')))         + '" ' +
'SelectFlag="'   + ltrim(rtrim(isnull(@select_flag_tmp,'')))         + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))    + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull(@zoom_req_tmp,'')))         + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull(@help_req_tmp,'')))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))        + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))         + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))   + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))   + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))       + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))       + '" ' +
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))        + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))      + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))      + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))       + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))         + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@order_seq_tmp,0))))     + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))    + '" ' +
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))         + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))       + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))     + '" ' +
--code modified for bugId : PNR2.0_10693
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'  + ltrim(rtrim(isnull(@report_reqd,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))      + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+   --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +     --Code Added for the Bug ID PLF2.0_00961   
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +--modified for bugID:PLF2.0_03057
'IsListBox="'   + isnull(@IsListBox,'')								 +'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')            +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')   +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
--'ExtType="'         +   isnull(@ExtType,'') +'" ' +
-- 'ColSpan="'         +  CONVERT(VARCHAR,isnull(@ControlColSpan,''),4)+'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)+'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) +'" ' + 
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)   + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4) + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)  + '" ' +
 --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
--Code Modified For BUGID PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
--code added for the caseid : PNR2.0_28319 ends
'IsCallout="'		+ isnull(@iscallout,'')+ '" ' +
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'FileSize="'		+ isnull(@filesize,'')+ '" ' +
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' +
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +	--TECH-69624
'BadgeText="'				+ isnull(@BadgeText,'N')  +'" ' +			--TECH-72114
'AutoHeight="'				+ isnull(@AutoHeight,'N')  +'" ' +			--TECH-72114
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'ShowEyeIcon="'				+ isnull(@EyeIconforPassword,'N')  +'" ' +			--TECH-73996
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'PreviousCount="'			+	CONVERT(VARCHAR,isnull(@PreviousCount,0),4)	+'" ' +		--TECH-73996
isnull(@extjs_values,'N')	 	 +'/>' ,@xml_seq_tmp) 
select @position_hindex_tmp = @position_hindex_tmp + 1
end
end

if  @ui_format_tmp = 'BES'
begin
select @transformed_horder_tmp = @horder_tmp
if @order_seq_tmp <= 1
begin
select @transformed_vorder_tmp = @vorder_tmp + @position_vindex_tmp
end
end
else
begin
if @control_type_tmp in ('Filler2') or (@base_ctrl_type_tmp='line' and @caption_req_tmp = 'Y')
begin
select @transformed_horder_tmp = (@horder_tmp * 2) - 1
select @transformed_vorder_tmp = @vorder_tmp
end
else if @control_type_tmp in ('Filler') or (@caption_req_tmp = 'N') or (@base_ctrl_type_tmp = 'Label') or (@control_type_tmp = 'Label')
begin
select @transformed_horder_tmp = @horder_tmp 
select @transformed_vorder_tmp = @vorder_tmp
end
else
begin
select @transformed_horder_tmp = @horder_tmp * 2
select @transformed_vorder_tmp = @vorder_tmp
end
end

if @base_ctrl_type_tmp = 'Label'
select @control_type_tmp = 'LBL' + @controlid_tmp

/* code Modified For BugId : PNR2.0_6193 */
/* Code Modified for BugId : PNR2.0_9588 */
if @control_type_tmp <> 'Label'  --and @base_ctrl_type_tmp <> 'Label' --and @control_type_tmp not in ('Filler2','Filler')
begin
if @order_seq_tmp > 1 and @ui_format_tmp = 'BES'
begin
select @transformed_seqno_tmp = @order_seq_tmp + @position_sindex_tmp
end
else
begin
select @transformed_seqno_tmp = @order_seq_tmp
end


-- Insert Control Entry
-- code added for bugid : PNR2.0_19031  starts

if @help_tabstop = 'Y' -- code modified by gopinath S for the bug id  PNR2.0_19995
begin
select @tab_seq_lbl = ''
end
else
begin
select @tab_seq_lbl = @tab_seq
end
-- code added for bugid : PNR2.0_19031  ends

select @xml_seq_tmp=@xml_seq_tmp+1

-- code added for bugid : PNR2.0_17974  starts     --

IF (@base_ctrl_type_tmp = 'Checkbox' and @caption_req_tmp = 'Y' and @ctrl_position_tmp = 'Right')
AND  @ui_format_tmp <> 'top' --TECH-72114
begin
--code modified for bugId :PNR2.0_31505
--select @caption_alignment_tmp = 'left' --grid Loop
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'     + 'LBL'+ ltrim(rtrim(isnull(@controlid_tmp,'')))                 + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'    + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))                 + '" ' +
'SectionName="'     + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))             + '" ' +
'PageName="'      + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))               + '" ' +
'ILBOName="'       + ltrim(rtrim(isnull(@ui_name_tmp,'')))                  + '" ' +
'ActivityName="'     + ltrim(rtrim(isnull(@activity_name,'')))                 + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))                   + '" ' +
'ControlType="'     + ltrim(rtrim(isnull(upper(@control_type_tmp),'')))               + '" ' +
'DataType="'      + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'      + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end        + '" ' +
'DecimalLength="'    + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
'BTSynonym="'      + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))             + '" ' +
'BaseControlType="'    + 'LABEL'                               + '" ' +   -- Code modification  for  PNR2.0_23635
'VisibleLength="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))        + '" ' +
'ProtoTooltip="'    + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))               + '" ' +
'SampleData="'      + ltrim(rtrim(isnull(@sample_data_tmp,'')))                + '" ' +
'DefaultSampleData="'  + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))             + '" ' +
'HOrder="'        + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3)))   + '" ' +
'VOrder="'        + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3)))   + '" ' +
'Mandatory="'      + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))               + '" ' +
'Visible="'       + ltrim(rtrim(isnull(@visible_flag_tmp,'')))               + '" ' +
'Editable="'      + ltrim(rtrim(isnull(@editable_flag_tmp,'')))               + '" ' +
'CaptionRequired="'    + ltrim(rtrim(isnull(@caption_req_tmp,'')))                + '" ' +
'SelectFlag="'      + ltrim(rtrim(isnull(@select_flag_tmp,'')))                + '" ' +
'DeleteFlag="'      + ltrim(rtrim(isnull(@delete_flag_tmp,'')))                + '" ' +
'ZoomRequired="'    + ltrim(rtrim(isnull(@zoom_req_tmp,'')))                 + '" ' +
'HelpRequired="'    + ltrim(rtrim(isnull(@help_req_tmp,'')))                 + '" ' +
'EllipsesRequired="'   + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))               + '" ' +
'AssociatedTask="'    + ltrim(rtrim(isnull(@uitaskname_tmp,'')))                 + '" ' +
'DataColumnWidth="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))      + '" ' +
'LabelColumnWidth="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))      + '" ' +
'DataColumnScaleMode="'  + ltrim(rtrim(isnull(@data_column_scalemode,'%')))             + '" ' +
'LabelColumnScaleMode="' + ltrim(rtrim(isnull(@label_column_scalemode,'%')))             + '" ' +
'CaptionWrap="'     + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))               + '" ' +
'CaptionAlignment="'   + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))            + '" ' +
'CaptionPosition="'    + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))               + '" ' +
'ControlPosition="'    + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))             + '" ' +
'LabelClass="'      + ltrim(rtrim(isnull(@label_class_tmp,'')))                + '" ' +
'ControlClass="'    + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))                 + '" ' +
'PasswordChar="'    + ltrim(rtrim(isnull(@password_char_tmp,'N')))               + '" ' +
'TaskImageClass="'    + ltrim(rtrim(isnull(@task_img_tmp,'')))                 + '" ' +
'HelpImageClass="'    + ltrim(rtrim(isnull(@help_img_tmp,'')))                 + '" ' +
'Documentation="'    + ltrim(rtrim(isnull(@controldoc_tmp,'')))                 + '" ' +
'OrderSequence="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@transformed_seqno_tmp,0))))        + '" ' +
'VisibleRows="'     + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))        + '" ' +
'HTMLTextArea="'    + ltrim(rtrim(isnull(@html_text_area,'N')))                + '" ' +
'SpinRequired="'    + ltrim(rtrim(isnull(@spin_required,'N')))                 + '" ' +
'SpinUpImage="'     + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))             + '" ' +
'SpinDownImage="'    + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))           + '" ' +
'AssociatedSpinControl="' + ltrim(rtrim(isnull(@associated_spin_ctrl,'')))         + '" ' +
'AssociatedSpinTask="'  + ltrim(rtrim(isnull(@associated_spin_task,'')))              + '" ' +
'HelpText="'      + ltrim(rtrim(isnull(@helptext,'')))                   + '" ' +
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'    + ltrim(rtrim(isnull(@report_reqd,'')))                  + '" ' +
'ModelSectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))             + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))              + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
--     'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'TabIndex="'      + ltrim(rtrim(@tab_seq_lbl))       + '" ' + --code added for bugid : PNR2.0_19031
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+   --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +   --Code Added for the Bug ID PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')							 +'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')        +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')     +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
'ExtType="'         +   isnull(@ExtType,'')		+'" ' +
--'ColSpan="'         +  CONVERT(VARCHAR,isnull(@ControlColSpan,''),4)+'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +  CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)+'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4)  + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)  + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4) +'" ' + --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends 
'IsCallout="'		+ isnull(@iscallout,'') +'" ' +
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +	--TECH-69624
'BadgeText="'				+ isnull(@BadgeText,'N')  +'" ' +			--TECH-72114
'AutoHeight="'				+ isnull(@AutoHeight,'N')  +'" ' +			--TECH-72114
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'ShowEyeIcon="'				+ isnull(@EyeIconforPassword,'N')  +'" ' +			--TECH-73996
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'PreviousCount="'			+	CONVERT(VARCHAR,isnull(@PreviousCount,0),4)	+'" ' +		--TECH-73996
'FileSize="'		+ isnull(@filesize,'') +'"/>' ,@xml_seq_tmp)
end
else
begin
if isnull(@renderas,'') = ''
	select @renderas = @base_ctrl_type_tmp
	-- Added on 29th MAr 2022 for the defect id -TECH-67705 starts

IF EXISTS (SELECT 'X'
FROM	de_published_ui_control ctrl (nolock)
WHERE   ctrl.customer_name		= @engg_customer_name
and		ctrl.project_name		= @engg_project_name
and		ctrl.ecrno				= @engg_req_no
and		ctrl.process_name		= @process_name
and		ctrl.component_name		= @engg_component
and		ctrl.activity_name		= @activity_name
and		ctrl.ui_name			= @ui_name_tmp
AND		ctrl.page_bt_synonym	= @page_bt_synonym_tmp
AND		ctrl.section_bt_synonym	= @section_bt_synonym_tmp
AND		ctrl.control_bt_synonym LIKE '%_FILTER'
AND		@controlid_tmp			LIKE '%_FILTER'
)
BEGIN

	SELECT	@IsFilter	= 'Y'
END
ELSE 
	SELECT @IsFilter	= 'N'
-- Added on 29th MAr 2022 for the defect id -TECH-67705 ends		

--TECH-69624 starts

--TECH-72114
--SELECT @labelname = ''

--IF @ui_format_tmp = 'top'
--SELECT @labelname = +'LabelName="' + 'LBL'+ @controlid_tmp + '" '
--ELSE
--SELECT @labelname = ''
--TECH-72114

-- code added for bugid : PNR2.0_17974  starts     --
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim(isnull(@controlid_tmp,'')))         + '" ' +
 --+ltrim(rtrim(isnull(@labelname,'')))  + +' '+ --TECH-72114
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))          + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))        + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))        + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))         + '" ' +
'ControlType="'    + ltrim(rtrim(isnull(upper(@control_type_tmp),'')))            + '" ' + -- Code modification  for  PNR2.0_23635
'BaseControlType="'  + ltrim(rtrim(isnull(upper(@base_ctrl_type_tmp),'')))        + '" ' +  -- Code modification  for  PNR2.0_23635
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--       'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))         + '" ' +
--       'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))         + '" ' +
--       'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')        + '" ' +

'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))       + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))    + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))        + '" ' +
'SampleData="'   + ltrim(rtrim(isnull(@sample_data_tmp,'')))         + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))       + '" ' +
--'HOrder="' + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3))) + '" ' +
--'VOrder="'  + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3))) + '" ' +
'HOrder="' +CASE WHEN @ui_format_tmp = 'top' THEN  ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@horder_tmp,0)),3)))    --TECH-72114
			ELSE + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3))) END + '" ' +
'VOrder="'  +CASE WHEN @ui_format_tmp = 'top' THEN  ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@vorder_tmp,0)),3)))    --TECH-72114
			ELSE + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3)))  END  + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))        + '" ' +
'Visible="'    + ltrim(rtrim(isnull(@visible_flag_tmp,'')))        + '" ' +
'Editable="'   + ltrim(rtrim(isnull(@editable_flag_tmp,'')))        + '" ' +
'CaptionRequired="'  + case @extjs_ctrl_type   when 'email' then 'Y' else ltrim(rtrim(isnull(@caption_req_tmp,'')))         end+ '" ' + --PNR2.0_25954
'SelectFlag="'   + ltrim(rtrim(isnull(@select_flag_tmp,'')))         + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))         + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull(@zoom_req_tmp,'')))         + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull(@help_req_tmp,'')))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))        + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))         + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))   + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))   + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))       + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))       + '" ' +
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))        + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))      + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))      + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))       + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="' + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))         + '" ' +
-- code added for bugid : PNR2.0_17974  starts     --
'OrderSequence="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@transformed_seqno_tmp,0))))    + '" ' +
--'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@order_seq_tmp,0))))     + '" ' +
-- code added for bugid : PNR2.0_17974  starts     --
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))    + '" ' +
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))         + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))       + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
--code modified for bugId : PNR2.0_10693
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'  + ltrim(rtrim(isnull(@report_reqd,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))          + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))       + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+ 
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +   --Code added for PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'IsListBox="'   +   isnull(@IsListBox,'')               +'" ' + --modified for bugID:PLF2.0_03057
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')    +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')    +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
--'ExtType="'         +   isnull(@ExtType,'')			 +'" ' +
--'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4)+'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +  CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4) +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4)  +'" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)   + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4) + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)  + '" ' +
		 -- added by feroz for bug id PNR2.0_18385 -- modified by ferozx for extjs --PNR2.0_1790 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996 --code added for bugid: PLF2.0_07676
 'IsCallout="'		+ isnull(@iscallout,'') + '" ' +
 'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' + 
 'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'FileSize="'		+ isnull(@filesize,'')+ '" ' +
 'IsDeviceInfo="'		+ isnull(@iSDeviceInfo,'N') +'" ' +
'DataGrid="'		+ isnull(@Datagrid,'N') +'" ' +
'Email="'		+ isnull(@email,'N') +'" ' +
'TemplateID="'		+ isnull(@TemplateID,'') +'" ' +
'Phone="'		+ isnull(@Phone,'N') +'" ' +
'ListControl="'		+ isnull(@listcontrol,'N') +'" ' +
'ColHdrAlign="'		+ isnull(@ctrl_col_caption_align,'') +'" ' +
'Gridheaderstyle="'		+ isnull(@Gridheaderstyle,'') +'" ' +
'Gridtoolbarstyle="'	+ isnull(@Gridtoolbarstyle,'') +'" ' +
'preevent="'		+ isnull(@preevent,'') +'" ' +
'postevent="'	+ isnull(@postevent,'') +'" ' +
'AvnFileDownload="'	+ isnull(@avn_download,'') +'" ' +
'StaticCaption="'		+ isnull(@StaticCaption,'N') +'" ' +
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' +
'ControlClassExt6="'		+ isnull(lower(@Control_Cls_Ext6),'')  +'" ' +
'SetScrollPosition="'		+ isnull(lower(@preserveposition),'')  +'" ' +
'Orientation="'		+ isnull(@Orientation,'')  +'" ' + 
--'IconClass="'		+ isnull(@Icon_Class,'')  +'" ' +	
'IconPosition="'		+ isnull(@Icon_Position,'')  +'" ' +  --TECH-75230
case when @Classprops <> '' then  @Classprops else '' end +
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' +  -- Added for TECH-37471 
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' +  -- Added for TECH-37471 
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' +  --TECH-45828
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'IsFilter="'					+ isnull(@IsFilter,'')  +'" ' +		--TECH-67705
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'ResponsiveCol="'	+ ISNULL(@forresponsive, 'none')		+ '" ' +		-- TECH-69624
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +				-- TECH-69624
'BadgeText="'				+ isnull(@BadgeText,'N')  +'" ' +			--TECH-72114
'AutoHeight="'				+ isnull(@AutoHeight,'N')  +'" ' +			--TECH-72114
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'ShowEyeIcon="'				+ isnull(@EyeIconforPassword,'N')  +'" ' +			--TECH-73996
'PreviousCount="'			+	CONVERT(VARCHAR,isnull(@PreviousCount,0),4)	+'" ' +		--TECH-73996
isnull(@extjs_values,'N')						  + '/>'  ,@xml_seq_tmp)  -- added by feroz for bug id PNR2.0_18385 -- modified by ferozx for extjs --PNR2.0_1790 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996 --code added for bugid: PLF2.0_07676
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
--code added for the caseid : PNR2.0_28319 ends

-- code added for bugid : PNR2.0_17974  starts     --
end
-- code added for bugid : PNR2.0_17974  starts     --
end

-- Insert Duplicate Filler Control
--if @control_type_tmp in ('Filler2','Filler') and @filler_seq_no = 1
if @control_type_tmp in ('Filler2') and @filler_seq_no = 1
begin
if @ui_format_tmp = 'BES' and @control_type_tmp in ('Filler2')
begin
select @position_vindex_tmp  = @position_vindex_tmp + 1
select @transformed_horder_tmp  = @horder_tmp
select @transformed_vorder_tmp  = @vorder_tmp + @position_vindex_tmp
end
else if @ui_format_tmp = 'UND' 
begin
select @transformed_horder_tmp = @horder_tmp * 2
select @transformed_vorder_tmp  = @vorder_tmp
end
--Code Modfied For BugId : PNR2.0_7314
if @ui_format_tmp = 'BES' and @control_type_tmp in ('Filler2') --@control_type_tmp in ( 'Filler2','Filler')
begin
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim(isnull(@controlid_tmp,'')))         + '_2" ' + --MODIFIED BY GIRI ON 17-SEP-2007 FOR CONTROL NAME DUPLICATION
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))          + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))        + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))        + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))         + '" ' +
'ControlType="'   + ltrim(rtrim(isnull(upper(@control_type_tmp),'')))        + '" ' +
'BaseControlType="'  + ltrim(rtrim(isnull(upper(@base_ctrl_type_tmp),'')))        + '" ' +  -- Code modification  for  PNR2.0_23635
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--        'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))         + '" ' +
--        'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))         + '" ' +
--        'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))       + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))    + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))        + '" ' +
'SampleData="'   + ltrim(rtrim(isnull(@sample_data_tmp,'')))         + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))       + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3)))  + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3)))   + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))        + '" ' +
'Visible="'    + ltrim(rtrim(isnull(@visible_flag_tmp,'')))        + '" ' +
'Editable="'   + ltrim(rtrim(isnull(@editable_flag_tmp,'')))        + '" ' +
'CaptionRequired="'  + ltrim(rtrim(isnull(@caption_req_tmp,'')))         + '" ' +
'SelectFlag="'   + ltrim(rtrim(isnull(@select_flag_tmp,'')))         + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))         + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull(@zoom_req_tmp,'')))         + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull(@help_req_tmp,'')))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))        + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))         + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))   + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))   + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))       + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))       + '" ' +
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))        + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))      + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT'))) + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))       + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))         + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@order_seq_tmp,0))))     + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))    + '" ' +
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))         + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))       + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))      + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))          + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +		 -- code added for PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')								 +'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')    +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')          +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')      +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')				+'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
'ExtType="'         +   isnull(@ExtType,'')	    +'" ' +
--'ColSpan="'         +  CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4) +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)    + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)  +'" ' + --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
--code added for the caseid : PNR2.0_28319 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' + 
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +	--TECH-69624
'BadgeText="'				+ isnull(@BadgeText,'N')  +'" ' +	--TECH-72114
'AutoHeight="'				+ isnull(@AutoHeight,'N')  +'" ' +	--TECH-72114
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'ShowEyeIcon="'				+ isnull(@EyeIconforPassword,'N')  +'" ' +	--TECH-73996
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'PreviousCount="'			+	CONVERT(VARCHAR,isnull(@PreviousCount,0),4)	+'" ' +		--TECH-73996
'FileSize="'		+ isnull(@filesize,'') +'"/>' ,@xml_seq_tmp)
end
else if @ui_format_tmp = 'UND'
begin
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim(isnull(@controlid_tmp,'')))         + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(isnull(@ctrl_descr_tmp,'')))          + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))        + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))        + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))         + '" ' +
'ControlType="'   + ltrim(rtrim(isnull(upper(@control_type_tmp),'')))        + '" ' +
'BaseControlType="'  + ltrim(rtrim(isnull(upper(@base_ctrl_type_tmp),'')))        + '" ' + -- Code modification  for  PNR2.0_23635
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--        'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))         + '" ' +
--        'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))         + '" ' +
--        'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))       + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_length_tmp,0))))    + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull(@proto_tooltip_tmp,'')))        + '" ' +
'SampleData="'   + ltrim(rtrim(isnull(@sample_data_tmp,'')))         + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,'')))       + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_horder_tmp,0)),3)))  + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(@transformed_vorder_tmp,0)),3)))   + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull(@mandatory_flag_tmp,'')))        + '" ' +
'Visible="'    + ltrim(rtrim(isnull(@visible_flag_tmp,'')))        + '" ' +
'Editable="'   + ltrim(rtrim(isnull(@editable_flag_tmp,'')))        + '" ' +
'CaptionRequired="'  + case @extjs_ctrl_type   when 'email' then 'Y' else ltrim(rtrim(isnull(@caption_req_tmp,'')))         end + '" ' + --PNR2.0_25954
'SelectFlag="'   + ltrim(rtrim(isnull(@select_flag_tmp,'')))         + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))         + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull(@zoom_req_tmp,'')))         + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull(@help_req_tmp,'')))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull(@ellipses_req_tmp,'')))   + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))         + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0))))   + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0))))   + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))       + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))       + '" ' +
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))        + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))      + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))      + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))       + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))         + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@order_seq_tmp,0))))     + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))    + '" ' +
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))     + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))       + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))          + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +   -- code added for PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')						 +'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')		 +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')    +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
'ExtType="'         +   isnull(@ExtType,'')	 +'" ' +
--'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +  CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4) +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4) + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' +   --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
--code added for the caseid : PNR2.0_28319 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' +
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
--'ControlClassExt6="'		+ isnull(lower(@Control_Class_Ext6),'')  +'" ' +
--'IconClass="'		+ isnull(@Icon_Class,'')  +'" ' + 
case when @Classprops <> '' then  @Classprops else '' end +
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' +  -- Added for TECH-37471 
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' +  -- Added for TECH-37471 
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' +  --TECH-45828
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'ShowAsToggle="'			+ isnull(@IsToggle,'N')  +'" ' +		--TECH-69624
'BadgeText="'				+ ISNULL(@BadgeText,'N')  +'" ' +			--TECH-72114
'AutoHeight="'				+ ISNULL(@AutoHeight,'N')  +'" ' +			--TECH-72114
'IconRequired="'			+ isnull(@IconRequired,'N')  +'" ' +			--TECH-76231
'SystemClass="'			+ isnull(@SystemClass,'N')  +'" ' +			--TECH-77097
'ShowEyeIcon="'				+ ISNULL(@EyeIconforPassword,'N')  +'" ' +			--TECH-73996
'ButtonHeight="'			+ isnull(@ButtonHeight,0)  +'" ' +			--TECH-77097
'PreviousCount="'			+	CONVERT(VARCHAR,ISNULL(@PreviousCount,0),4)	+'" ' +		--TECH-73996
'FileSize="'		+ isnull(@filesize,'') +'"/>' ,@xml_seq_tmp)
end
end

select  @previous_section_tmp  = @section_bt_synonym_tmp,
@previous_horder_tmp  = @horder_tmp,
@previous_vorder_tmp = @vorder_tmp
end
close ctrlcurs
deallocate ctrlcurs

if @ui_type_tmp = 'HELP'
begin
--Code Added For Bug_id PNR2.0_17856 Starts Here
if not exists ( select 'x'
from es_comp_param_mst
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  process_name = @process_name
and  component_name = @engg_component
and  param_type  = 'UIFORMAT'
and  param_category = 'OKLINES'
and  current_value = 'Yes' )
Begin
--Code Added For Bug_id PNR2.0_17856 Ends Here
--code modified for bugId : PNR2.0_10535
-- code modification  for  PNR2.0_22560 starts
if @tab_seq is null
select @tab_seq = 1
else
select @tab_seq = @tab_seq + 1
-- code modification  for PNR2.0_22560 ends
--code modified for bugId : PNR2.0_10535
select @xml_seq_tmp=@xml_seq_tmp+1
--Code Added For Bug_id PNR2.0_17856 Starts Here
select @helptext = @ctrl_descr_tmp + ' - Datatype : ' + ltrim(rtrim(isnull(@datatype_tmp,'')))
+ ' - MaxLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))
if upper(isnull(@datatype_tmp,'')) = 'NUMERIC'
select @helptext = @helptext + ' - DecimalLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))
--Code Added For Bug_id PNR2.0_17856 Ends Here
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim('TRANSFER'))             + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(@ok_caption))+ '" ' + -- code modified by kiruthika for bugid :PNR2.0_28767 on 21-oct-2010
'SectionName="'   + ltrim(rtrim(isnull(@oksectionname_tmp,'')))        + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@mainpage_tmp,'')))         + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))        + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))         + '" ' +
-- Code modified on 18-Feb-2009 for the Bug ID :: PNR2.0_21118 - Begins
'ControlType="'   + ltrim(rtrim('BUTTON'))             + '" ' +
-- Code modified on 18-Feb-2009 for the Bug ID :: PNR2.0_21118 - Ends
'BaseControlType="'  + ltrim(rtrim('BUTTON'))             + '" ' +
'DataType="'   + ltrim(rtrim('char'))              + '" ' +
'DataLength="'   + ltrim(rtrim('20'))              + '" ' +
'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'BTSynonym="'   + ltrim(rtrim(isnull('OK','')))            + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,10)))           + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull('OK','')))            + '" ' +
'SampleData="'   + ''                  + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(1,0)),3)))    + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(1,0)),3)))     + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull('N','')))            + '" ' +
'Visible="'    + ltrim(rtrim(isnull('Y','')))            + '" ' +
'Editable="'   + ltrim(rtrim(isnull('Y','')))            + '" ' +
'CaptionRequired="'  + ltrim(rtrim(isnull('N','')))      + '" ' +
'SelectFlag="'   + ltrim(rtrim(isnull('N','')))            + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull('N','')))            + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull('N','')))            + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull('N','')))            + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull('N','')))            + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull('TRANSFER','')))          + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(50,0))))        + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(50,0))))        + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull('%','')))            + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull('%','')))            + '" ' +
'CaptionWrap="'   + ltrim(rtrim('N'))               + '" ' +
'CaptionAlignment="' + ltrim(rtrim('CENTER'))             + '" ' +
'CaptionPosition="'  + ltrim(rtrim('CENTER'))             + '" ' +
'ControlPosition="'  + ltrim(rtrim('CENTER'))             + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="'  + ltrim(rtrim(isnull('','')))            + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))         + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))     + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@oksectionname_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))          + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+   --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +     --Code Added for the Bug ID PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961 
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')			+'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')     +'" ' +
 'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')   +'" ' +
 'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
 'ExtType="'         +   isnull(@ExtType,'')	+'" ' +
 -- 'ColSpan="'         +  CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4) +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)  + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' +  --modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
--code added for the caseid : PNR2.0_28319 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' + 
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' +
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'FileSize="'		+ isnull(@filesize,'')+'"/>' ,@xml_seq_tmp)
End
--Code Added For Bug_id PNR2.0_17856 Starts Here
else
Begin

--code modified for bugId : PNR2.0_10535
-- code modification  for  PNR2.0_22560 starts
if @tab_seq is null
select @tab_seq = 1
else
select @tab_seq =  @tab_seq  + 1
-- code modification  for  PNR2.0_22560 ends
--code modified for bugId : PNR2.0_10535

select @xml_seq_tmp=@xml_seq_tmp+1
select @helptext = @ctrl_descr_tmp + ' - Datatype : ' + ltrim(rtrim(isnull(@datatype_tmp,'')))
+ ' - MaxLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))
if upper(isnull(@datatype_tmp,'')) = 'NUMERIC'
select @helptext = @helptext + ' - DecimalLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + 'OKLINE1'                 + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + 'OKLINE1'                  + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@oksectionname_tmp,'')))        + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@mainpage_tmp,'')))         + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))         + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))          + '" ' +
'ControlType="'   + upper('Line')                 + '" ' +
'BaseControlType="'  + 'LINE'                 + '" ' +
'DataType="'   + 'char'                 + '" ' +
'DataLength="'   + '20'                  + '" ' +
'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'BTSynonym="'   + 'OKLINE1'                 + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,0)))           + '" ' +
'ProtoTooltip="'  + ''            + '" ' +
'SampleData="'   + ''                  + '" ' +
'DefaultSampleData="' + ''                  + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(1,0)),3)))    + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(1,0)),3)))     + '" ' +
'Mandatory="'   + 'N'                  + '" ' +
'Visible="'    + 'Y'                  + '" ' +
'Editable="'   + 'N'                  + '" ' +
'CaptionRequired="'  + 'N'                  + '" ' +
'SelectFlag="'   + 'N'                  + '" ' +
'ZoomRequired="'  + 'N'                  + '" ' +
'DeleteFlag="'   + 'N'                  + '" ' +
'HelpRequired="'  + 'N'                  + '" ' +
'EllipsesRequired="' + 'N'                  + '" ' +
'AssociatedTask="'  + ''                  + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(0,0))))        + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(0,0))))        + '" ' +
'DataColumnScaleMode="' + '%'                  + '" ' +
'LabelColumnScaleMode="'+ '%'                  + '" ' +
'CaptionWrap="'   + 'N'                  + '" ' +
'CaptionAlignment="' + 'RIGHT'                 + '" ' +
'CaptionPosition="'  + 'LEFT'                 + '" ' +
'ControlPosition="'  + 'LEFT'      + '" ' +
'LabelClass="'   + ''                  + '" ' +
'ControlClass="'  + ''                  + '" ' +
'PasswordChar="'  + 'N'                  + '" ' +
'TaskImageClass="'  + ''                  + '" ' +
'HelpImageClass="'  + ''                  + '" ' +
'Documentation="'  + ''                  + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'HTMLTextArea="'  + ''                  + '" ' +
'SpinRequired="'  + 'N'                  + '" ' +
'SpinUpImage="'   + ''           + '" ' +
'SpinDownImage="'  + ''                  + '" ' +
'AssociatedSpinControl="'+ ''                  + '" ' +
'AssociatedSpinTask="' + ''                  + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'  + 'N'                  + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@oksectionname_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))          + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ''                                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'		+  	isnull(@Disp_Only_Apply_Len,'N')	+'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	+  	isnull(@editcombo_req,'N')	+'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	+  	isnull(@autoexpand,'N')	+'" ' +	         --Code Added for the Bug ID PNR2.0_32053   
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +
'AlignBtnH="'         +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +  --code added for  PLF2.0_00961
'AlignBtnV="'         +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'         +   isnull(@controlstyle,'')               +'" ' +
--'ControlImage="'         +   isnull(@controlimage,'')               +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')					+'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')     +'" ' +
 'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')  +'" ' +
 'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
 'ExtType="'         +   isnull(@ExtType,'')	 +'" ' +
-- 'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4)+'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +  CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)  +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)		 + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' + --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' + 
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'SetScrollPosition="'		+ isnull(@preserveposition,'')  +'" ' +
'FileSize="'		+ isnull(@filesize,'') +'" ' +
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' +
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' + -- Added for TECH-37471 
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' + -- Added for TECH-37471 
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' + --TECH-45828
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'Orientation="'		+ isnull(@Orientation,'')  +'"/>' ,@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim('TRANSFER'))             + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(@ok_caption)) + '" ' + -- code modified by kiruthika for bugid :PNR2.0_28767 on 21-oct-2010
'SectionName="'   + ltrim(rtrim(isnull(@oksectionname_tmp,'')))        + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@mainpage_tmp,'')))         + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))        + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))         + '" ' +
-- Code modified on 18-Feb-2009 for the Bug ID :: PNR2.0_21118 - Begins
'ControlType="'   + ltrim(rtrim('BUTTON'))             + '" ' +
-- Code modified on 18-Feb-2009 for the Bug ID :: PNR2.0_21118 - Ends
'BaseControlType="'  + ltrim(rtrim('BUTTON'))             + '" ' +
'DataType="'   + ltrim(rtrim('char'))              + '" ' +
'DataLength="'   + ltrim(rtrim('20'))              + '" ' +
'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'BTSynonym="'   + ltrim(rtrim(isnull('OK','')))            + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,10)))           + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(isnull('OK','')))            + '" ' +
'SampleData="'   + ''                  + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(2,0)),3)))    + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(1,0)),3)))     + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull('N','')))            + '" ' +
'Visible="'    + ltrim(rtrim(isnull('Y','')))           + '" ' +
'Editable="'   + ltrim(rtrim(isnull('Y','')))            + '" ' +
'CaptionRequired="'  + ltrim(rtrim(isnull('N','')))  + '" ' +
'SelectFlag="'   + ltrim(rtrim(isnull('N','')))            + '" ' +
'ZoomRequired="'  + ltrim(rtrim(isnull('N','')))            + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull('N','')))            + '" ' +
'HelpRequired="'  + ltrim(rtrim(isnull('N','')))            + '" ' +
'EllipsesRequired="' + ltrim(rtrim(isnull('N','')))            + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull('TRANSFER','')))          + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(50,0))))        + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(50,0))))        + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull('%','')))            + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull('%','')))            + '" ' +
'CaptionWrap="'   + ltrim(rtrim('N'))               + '" ' +
'CaptionAlignment="' + ltrim(rtrim('CENTER'))             + '" ' +
'CaptionPosition="'  + ltrim(rtrim('CENTER'))             + '" ' +
'ControlPosition="'  + ltrim(rtrim('CENTER'))             + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))         + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))         + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))        + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))         + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))         + '" ' +
'Documentation="'  + ltrim(rtrim(isnull('','')))            + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))         + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))         + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))       + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))      + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@oksectionname_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))           + '" ' + --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))     + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))                + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+ --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'	+  	isnull(@Disp_Only_Apply_Len,'N')	    +'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	        +  	isnull(@editcombo_req,'N')	            +'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	        +  	isnull(@autoexpand,'N')	                +'" ' +	         --Code Added for the Bug ID PNR2.0_32053 
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +  --Code Added for the Bug ID PNR2.0_36309  
'AlignBtnH="'           +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +  --code added for  PLF2.0_00961
'AlignBtnV="'           +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')       +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'        +   isnull(@controlstyle,'')                +'" ' +
--'ControlImage="'        +   isnull(@controlimage,'')                +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')				+'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'') +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')		 +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')  +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
'ExtType="'         +   isnull(@ExtType,'')	 +'" ' +
--'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)  +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)   + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' + --modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676

--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' + 
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'SetScrollPosition="'		+ isnull(@preserveposition,'')  +'" ' +
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' +
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' + -- Added for TECH-37471 
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' + -- Added for TECH-37471 
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' + --TECH-45828
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'FileSize="'		+ isnull(@filesize,'') +'"/>' ,@xml_seq_tmp)
select @xml_seq_tmp=@xml_seq_tmp+1

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + 'OKLINE2'                 + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + 'OKLINE2'                  + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@oksectionname_tmp,'')))        + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@mainpage_tmp,'')))         + '" ' +
'ILBOName="'    + ltrim(rtrim(isnull(@ui_name_tmp,'')))          + '" ' +
'ActivityName="'   + ltrim(rtrim(isnull(@activity_name,'')))         + '" ' +
'ComponentName="'  + ltrim(rtrim(isnull(@engg_component,'')))          + '" ' +
'ControlType="'   + upper('Line')                 + '" ' +
'BaseControlType="'  + 'LINE'                 + '" ' +
'DataType="'   + 'char'                 + '" ' +
'DataLength="'   + '20'                  + '" ' +
'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')       + '" ' +
'BTSynonym="'   + 'OKLINE2'                 + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,0)))           + '" ' +
'ProtoTooltip="'  + ''                  + '" ' +
'SampleData="'   + ''                  + '" ' +
'DefaultSampleData="' + ''                  + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(3,0)),3)))    + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,isnull(1,0)),3)))     + '" ' +
'Mandatory="'   + 'N'                  + '" ' +
'Visible="'    + 'Y'                  + '" ' +
'Editable="'   + 'N'                  + '" ' +
'CaptionRequired="'  + 'N'                  + '" ' +
'SelectFlag="'   + 'N'                  + '" ' +
'ZoomRequired="'  + 'N'                  + '" ' +
'DeleteFlag="'   + 'N'                  + '" ' +
'HelpRequired="'  + 'N'      + '" ' +
'EllipsesRequired="' + 'N'                  + '" ' +
'AssociatedTask="'  + ''                  + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(0,0))))        + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(0,0))))        + '" ' +
'DataColumnScaleMode="' + '%'                  + '" ' +
'LabelColumnScaleMode="'+ '%'                  + '" ' +
'CaptionWrap="'   + 'N'                  + '" ' +
'CaptionAlignment="' + 'RIGHT'                 + '" ' +
'CaptionPosition="'  + 'LEFT'                 + '" ' +
'ControlPosition="'  + 'LEFT'                 + '" ' +
'LabelClass="'   + ''                  + '" ' +
'ControlClass="'  + ''                  + '" ' +
'PasswordChar="'  + 'N'                  + '" ' +
'TaskImageClass="'  + ''                  + '" ' +
'HelpImageClass="'  + ''                  + '" ' +
'Documentation="'  + ''                  + '" ' +
'OrderSequence="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'VisibleRows="'   + ltrim(rtrim(CONVERT(VARCHAR,isnull(1,0))))        + '" ' +
'HTMLTextArea="'  + ''                  + '" ' +
'SpinRequired="'  + 'N'                  + '" ' +
'SpinUpImage="'   + ''                  + '" ' +
'SpinDownImage="'  + ''                  + '" ' +
'AssociatedSpinControl="'+ ''                  + '" ' +
'AssociatedSpinTask="' + ''                  + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))          + '" ' +
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'')))              + '" ' +
'ReportRequired="'  + 'N'                  + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@oksectionname_tmp,'')))       + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))   + '" ' +  --Code Added For BugId : PNR2.0_18436
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ''                        + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'	+  	isnull(@Disp_Only_Apply_Len,'N')	    +'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	        +  	isnull(@editcombo_req,'N')	            +'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	        +  	isnull(@autoexpand,'N')	                +'" ' +	         --Code Added for the Bug ID PNR2.0_32053 
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +  --Code Added for the Bug ID PNR2.0_36309  
'AlignBtnH="'           +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +  -- code added for PLF2.0_00961
'AlignBtnV="'           +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'        +   isnull(@controlstyle,'')                +'" ' +
--'ControlImage="'        +   isnull(@controlimage,'')                +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')				 +'" ' +
'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')   +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')  +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'')   +'" ' +		
'ExtType="'         +   isnull(@ExtType,'')	 +'" ' +
--'ColSpan="'         +  CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +  CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)  +'" ' +
 'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4) + '" ' +
 'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)  + '" ' + 
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' +  --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' + 
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'SetScrollPosition="'		+ isnull(@preserveposition,'')  +'" ' +
'FileSize="'		+ isnull(@filesize,'') +'" ' +
'IsPivot="'		+ isnull(@ispivot,'N')  +'" ' +-- PLF2.0_16291 
'TemplateCategory="'		+ isnull(@TemplateCat,'')  +'" ' +
'TemplateSpecification="'		+ isnull(@TemplateSpecific,'')  +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'RowAlwaysExpanded="'			+ isnull(@RowAlwaysExpanded,'')  +'" ' +
'Orientation="'		+ isnull(@Orientation,'')  +'"/>' ,@xml_seq_tmp)
End

end
--Code Added For Bug_id PNR2.0_17856 Ends Here

--CHANGES BY GIRI ON 14/NOV/2007 STARTS HERE

-- select customer_name,     project_name,     ecrno,
-- process_name,     component_name,     activity_name,
-- ui_name,     page_bt_synonym,    control_bt_synonym,
-- control_type,     data_column_width,    label_column_width,
-- control_id,     view_name,     visisble_length,
-- control_prefix,     label_column_scalemode,    data_column_scalemode,
-- LabelClass,     ControlClass,     LabelImageClass,
-- ControlImageClass,    timestamp,     createdby,
-- createddate,     modifiedby,     modifieddate,
-- ref_bt_synonym
-- into #de_published_LogicExt_ui_control_dtl_main
-- from de_published_LogicExt_ui_control_dtl (nolock)
-- where 1=2

Create table #tree_ui_task
(task_name  varchar(60) collate database_default,
task_desc  varchar(60) collate database_default)

Create table #de_published_LogicExt_ui_control_dtl_main(
customer_name      varchar(60) collate database_default,
project_name      varchar(60) collate database_default,
ecrno        varchar(60) collate database_default,
process_name      varchar(60) collate database_default,
component_name      varchar(60) collate database_default,
activity_name      varchar(60) collate database_default,
ui_name        varchar(60) collate database_default,
page_bt_synonym      varchar(60) collate database_default,
control_bt_synonym     varchar(60) collate database_default,
control_type      varchar(60) collate database_default,
data_column_width     int,
label_column_width     int,
control_id       varchar(60) collate database_default,
view_name       varchar(60) collate database_default,
visisble_length      numeric,
control_prefix      varchar(6) collate database_default,
label_column_scalemode    varchar(6) collate database_default,
data_column_scalemode    varchar(6) collate database_default,
LabelClass       varchar(60) collate database_default,
ControlClass      varchar(60) collate database_default,
LabelImageClass      varchar(60) collate database_default,
ControlImageClass     varchar(60) collate database_default,
timestamp       int,
createdby       varchar(30) collate database_default,
createddate       datetime,
modifiedby       varchar(30) collate database_default,
modifieddate      datetime,
ref_bt_synonym      varchar(60) collate database_default,
AccessKey       varchar(5) collate database_default)

create table #de_published_LogicExt_ui_grid_dtl_main(
customer_name    varchar(60) collate database_default,
project_name    varchar(60) collate database_default,
ecrno      varchar(60) collate database_default,
process_name    varchar(60) collate database_default,
component_name    varchar(60) collate database_default,
activity_name    varchar(60) collate database_default,
ui_name      varchar(60) collate database_default,
page_bt_synonym    varchar(60) collate database_default,
control_bt_synonym   varchar(60) collate database_default,
column_bt_synonym   varchar(60) collate database_default,
column_type     varchar(60) collate database_default,
column_no     int,
control_id     varchar(60) collate database_default,
view_name     varchar(60) collate database_default,
visible_length    numeric,
column_prefix    varchar(6) collate database_default,
timestamp     int,
createdby     varchar(30) collate database_default,
createddate     datetime,
modifiedby     varchar(30) collate database_default,
modifieddate    datetime,
section_bt_synonym   varchar(60) collate database_default,
ref_bt_synonym    varchar(60) collate database_default,
col_seq     int,
default_required  varchar(20)  collate database_default )    --Code Modified for PNR2.0_30869 

create   clustered index  de_published_LogicExt_ui_grid_dtl_main_idx on #de_published_LogicExt_ui_grid_dtl_main(customer_name, project_name, ecrno, process_name, component_name, activity_name, ui_name, page_bt_synonym, col_seq)

if @itk_flag=1
begin
exec le_populate_ctrl_grid_dtl_html @engg_customer_name, @engg_project_name, @engg_req_no, @process_name, @engg_component, @activity_name, @ui_name_tmp
end

--CHANGES BY GIRI ON 14/NOV/2007 ENDS HERE

-- For Hidden controls
--Code added by 11742
select @renderas = ''
--Code ends by 11742

Set @le_ref_column_bt_synonym_tmp = ''
declare ctrlcurs cursor FAST_FORWARD  for
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
control_type,         upper(base_ctrl_type),
upper(isnull(data_type,'char')),   isnull(length,20),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym),
upper(ctrl.section_bt_synonym),    upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
upper(isnull(ctrl_position,'LEFT')),  upper(isnull(LabelClass,'')),
upper(isnull(ControlClass,'')),    isnull(data_column_width,0),
isnull(label_column_width,0),    isnull(control_doc,''),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  upper(isnull(delete_req,'N')),
upper(isnull(password_char,'N')),   upper(isnull(tskimg_class,'')),
upper(isnull(hlpimg_class,'')),    upper(isnull(data_column_scalemode,'%')),
upper(isnull(label_column_scalemode,'%')), sec.horder,
sec.vorder,         upper(isnull(html_txt_area,'N')),
upper(isnull(Spin_required,'N')),   upper(isnull(spin_up_image,'spinup.gif')),
isnull(spin_down_image,'spindown.gif'),
--Code Modified for bugId : PNR2.0_11293
isnull(report_req,'N'),    '', isnull(InPlace_Calendar, 'N'), isnull(EditMask,''), -- Inplace Calendar and Edit Mask Feature added by Feroz
isnull(AccessKey,''), 'N', -- added by feroz for bug id PNR2.0_18385
isnull(ctrl.set_user_pref,'Y'),--Code Added For BugId : PNR2.0_18436
--Code modification for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
--Code modification for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption,'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'), isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26996
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone, 'N') ,isnull(editcombo_req,'N'),isnull(filesize,''), isnull(renderas,'')
	--Code modified for PNR2.0_30869 --Code modified for PNR2.0_33378
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym

and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    = gls.ecrno
and  ctrl.process_name  =   gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name

and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name

and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
--    --Code Modified For BugId : PNR2.0_4149
/* Code Modified for BugId : PNR2.0_9588 */
--    and  sec.visisble_flag  = 'Y'
and  (ctype.visisble_flag =  'N'
and  ctrl.control_type  <> 'Filler')
and  isnull(ctype.Is_Extjs_Control,'N')  =  'N'  -- Added By Feroz for extjs --PNR2.0_1790
--   or  ctype.base_ctrl_type = 'Label')
--Code commneted for bugID : PNR2.0_9878
-- and  isnull(sec.section_type,'MAIN') = 'MAIN'
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),     isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
control_type,         upper(base_ctrl_type),
upper(isnull(data_type,'char')),   isnull(length,20),
ctrl.horder,         ctrl.vorder,
isnull(visisble_length,0),     isnull(proto_tooltip,''),
isnull(sample_data,''),      upper(ctrl.page_bt_synonym),
upper(ctrl.section_bt_synonym),    upper(ltrim(rtrim(mandatory_flag))),
upper(ltrim(rtrim(ctype.visisble_flag))),  upper(ltrim(rtrim(editable_flag))),
upper(ltrim(rtrim(caption_req))),    upper(ltrim(rtrim(select_flag))),
upper(ltrim(rtrim(zoom_req))),     upper(ltrim(rtrim(help_req))),
upper(ltrim(rtrim(ellipses_req))),    isnull(visisble_rows,0),
upper(isnull(ctrl_position,'LEFT')),  upper(isnull(LabelClass,'')),
upper(isnull(ControlClass,'')),    isnull(data_column_width,0),
isnull(label_column_width,0),    isnull(control_doc,''),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  upper(isnull(delete_req,'N')),
upper(isnull(password_char,'N')),   upper(isnull(tskimg_class,'')),
upper(isnull(hlpimg_class,'')),    upper(isnull(data_column_scalemode,'%')),
upper(isnull(label_column_scalemode,'%')), sec.horder,
sec.vorder,         upper(isnull(html_txt_area,'N')),
upper(isnull(Spin_required,'N')),   upper(isnull(spin_up_image,'spinup.gif')),
isnull(spin_down_image,'spindown.gif'),
--Code Modified for bugId : PNR2.0_11293
isnull(report_req,'N'),    '', isnull(InPlace_Calendar, 'N'), isnull(EditMask,''), -- Inplace Calendar and Edit Mask Feature added by Feroz
isnull(AccessKey,''), 'N', -- added by feroz for bug id PNR2.0_18385
isnull(ctrl.set_user_pref,'Y'),--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption,'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26996
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone, 'N'),isnull(editcombo_req,'N'),isnull(filesize,''), isnull(renderas,'')
 --Code modified for PNR2.0_30869  --Code modified for PNR2.0_33378
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
from de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym

and  ctrl.customer_name  = gls.customer_name
and  ctrl.project_name  = gls.project_name
and  ctrl.ecrno    = gls.ecrno
and  ctrl.process_name  =   gls.process_name
and  ctrl.component_name  =  gls.component_name
and  ctrl.control_bt_synonym = gls.bt_synonym_name

and  ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name

and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  sec.visisble_flag  =  'N'
and  ctype.visisble_flag  =  'Y'
and  isnull(ctype.Is_Extjs_Control,'N')  =  'N'  -- Added By Feroz for extjs --PNR2.0_1790
--and  gls.languageid   =  @language_code
union
select upper(control_bt_synonym),   isnull(bt_synonym_caption,control_bt_synonym),
upper(control_id),
control_type,       upper(base_ctrl_type),
upper(isnull(data_type,'char')), isnull(length,20),
ctrl_new.horder,       ctrl_new.vorder,
isnull(visisble_length,0),   isnull(proto_tooltip,''),
isnull(sample_data,''),    upper(ctrl_new.page_bt_synonym),
upper(ctrl_new.section_bt_synonym),  upper(rtrim(mandatory_flag)),
upper(rtrim(ctype.visisble_flag)),  upper(rtrim(editable_flag)),
upper(rtrim(caption_req)),    upper(rtrim(select_flag)),
upper(rtrim(zoom_req)),    upper(rtrim(help_req)),
upper(rtrim(ellipses_req)),   isnull(visisble_rows,0),
upper(isnull(ctrl_position,'LEFT')),upper(isnull(LabelClass,'')),
upper(isnull(ControlClass,'')),  isnull(data_column_width,0),
isnull(label_column_width,0),  isnull(control_doc,''),
upper(isnull(caption_wrap,'Y')), upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')), upper(isnull(delete_req,'N')),
upper(isnull(password_char,'N')), upper(isnull(tskimg_class,'')),
upper(isnull(hlpimg_class,'')),  upper(isnull(data_column_scalemode,'%')),
upper(isnull(label_column_scalemode,'%')), sec.horder,
sec.vorder,         upper(isnull(html_txt_area,'N')),
upper(isnull(Spin_required,'N')),   upper(isnull(spin_up_image,'spinup.gif')),
isnull(spin_down_image,'spindown.gif'),
--Code Modified for bugId : PNR2.0_11293
isnull(report_req,'N'),    '', isnull(InPlace_Calendar, 'N'), isnull(EditMask,''), -- Inplace Calendar and Edit Mask Feature added by Feroz
isnull(AccessKey,''), 'N', -- added by feroz for bug id PNR2.0_18385
isnull(ctrl_new.set_user_pref,'Y'),--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption,'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),isnull(freezecount,0),isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),-- code added for the caseid:PNR2.0_26996
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone, 'N') ,isnull(editcombo_req,'N') ,isnull(filesize,''), isnull(renderas,'')
--Code modified for PNR2.0_30869   --Code modified for PNR2.0_33378
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
from de_published_ui_control   ctrl_new  (nolock),
de_published_ui_section   sec   (nolock),
@de_published_glossary_lng_extn  gls ,
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl_new.customer_name  = sec.customer_name
and  ctrl_new.project_name  = sec.project_name
and  ctrl_new.ecrno    = sec.ecrno
and  ctrl_new.process_name  = sec.process_name
and  ctrl_new.component_name  = sec.component_name
and  ctrl_new.activity_name = sec.activity_name
and  ctrl_new.ui_name   = sec.ui_name
and  ctrl_new.page_bt_synonym = sec.page_bt_synonym
and  ctrl_new.section_bt_synonym = sec.section_bt_synonym

and  ctrl_new.customer_name  = gls.customer_name
and  ctrl_new.project_name  = gls.project_name
and  ctrl_new.ecrno   = gls.ecrno
and  ctrl_new.process_name =   gls.process_name
and  ctrl_new.component_name  =  gls.component_name
and  ctrl_new.control_bt_synonym = gls.bt_synonym_name

and  ctrl_new.customer_name  = ctype.customer_name
and  ctrl_new.project_name  = ctype.project_name
and  ctrl_new.process_name  = ctype.process_name
and  ctrl_new.component_name  = ctype.component_name
and  ctrl_new.control_type = ctype.ctrl_type_name

and  sec.customer_name =   @engg_customer_name
and  sec.project_name = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  ((sec.section_bt_synonym =  'PRJHDNSECTION') or (sec.section_type ='MOBILECALENDAR')) --11537
--and  gls.languageid   =  @language_code
union
-- For Logic Extension Static Controls
select    upper(control_bt_synonym),       control_bt_synonym,
upper(control_id),      control_type,
upper(base_ctrl_type),     upper(isnull(le_data_type,'char')),
isnull(le_data_length,20),     1,
1,          isnull(gls.visisble_length,20),
IsNull(gls.proto_tooltip, ''),         '',
upper(ctrl.page_bt_synonym),    'PRJHDNSECTION',
upper(rtrim(IsNull(gls.mandatory_flag, 'N'))),    upper(rtrim(ctype.visisble_flag)),
upper(rtrim(IsNull(gls.editable_flag, 'Y'))),    upper(rtrim(IsNull(gls.caption_req, 'Y'))),
upper(rtrim(IsNull(gls.select_flag, 'n'))),    upper(rtrim(IsNull(gls.zoom_req, 'n'))),
upper(rtrim(help_req)),     upper(rtrim(IsNull(gls.ellipses_req, 'n'))),
isnull(gls.visisble_rows, IsNull(ctype.visisble_rows, 0)),    upper(isnull(gls.ctrl_position,'LEFT')),
upper(isnull(gls.labelclass,'')),   upper(isnull(gls.controlclass,'')),
isnull(gls.data_column_width,0),    isnull(gls.label_column_width,0),  '',
upper(isnull(gls.caption_wrap,'Y')), upper(isnull(gls.caption_alignment,'LEFT')),
upper(isnull(gls.caption_position,'LEFT')), upper(isnull(gls.delete_req,'N')),
upper(isnull(gls.password_char,'N')), upper(isnull(gls.tskimg_class,'')),
upper(isnull(gls.hlpimg_class,'')),    upper(isnull(gls.data_column_scalemode,'%')),
upper(isnull(gls.label_column_scalemode,'%')), @prjsecrow as 'horder' ,
1 as 'vorder',              upper(isnull(gls.html_txt_area,'')),
upper(isnull(gls.Spin_required,'N')),     upper(isnull(gls.spin_up_image,'spinup.gif')),
isnull(gls.spin_down_image,'spindown.gif'), --Code Modified for bugId : PNR2.0_11293
isnull(gls.report_req,'N'),   ctrl.ref_bt_synonym, isnull(InPlace_Calendar, 'N'), isnull(EditMask,''), -- Inplace Calendar and Edit Mask Feature added by Feroz
isnull(AccessKey,''), 'Y', -- added by feroz for bug id PNR2.0_18385
'Y',--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
convert(varchar,NoofLinesPerRow),
isnull(convert(varchar,RowHeight),''),
isnull(Vscrollbar_Req,'N'),
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption,'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0),  isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
isnull(gridlite_req,'N'),0,'N','N','N',-- code added for the caseid:PNR2.0_26996
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone, 'N'), isnull(editcombo_req,'N'),isnull(filesize,'') , isnull(renderas,'')
--Code modified for PNR2.0_30869   --Code modified for PNR2.0_33378
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends
from     #de_published_LogicExt_ui_control_dtl_main     ctrl  (nolock),
de_log_ext_ctrl_met_vw           gls   (nolock),
es_comp_ctrl_type_mst_vw         ctype (nolock)
where    ctrl.customer_name   collate database_default = gls.le_customer_name
and      ctrl.project_name   collate database_default = gls.le_project_name
and      ctrl.ref_bt_synonym collate database_default = gls.le_control
and      ctrl.customer_name   collate database_default = ctype.customer_name
and      ctrl.project_name   collate database_default = ctype.project_name
and      ctrl.process_name   collate database_default = ctype.process_name
and      ctrl.component_name  collate database_default = ctype.component_name
and      ctrl.control_type   collate database_default = ctype.ctrl_type_name

and      ctrl.customer_name    collate database_default =  @engg_customer_name
and      ctrl.project_name    collate database_default = @engg_project_name
and      ctrl.ecrno       collate database_default =  @engg_req_no
and      ctrl.process_name    collate database_default =  @process_name
and      ctrl.component_name    collate database_default =  @engg_component
and    ctrl.activity_name    collate database_default =  @activity_name
and      ctrl.ui_name      collate database_default =  @ui_name_tmp
and    @itk_flag     =  1


-- Set Previous Section Name as blank
select  @previous_section_tmp  = '',
@position_vindex_tmp  = 0,
@transformed_horder_tmp = 1,
@transformed_vorder_tmp = 0

-- For each Control generate entries
open ctrlcurs
while (1=1)
begin
fetch next from ctrlcurs into
@control_bt_synonym_tmp, @ctrl_descr_tmp,  @controlid_tmp,
@control_type_tmp,    @base_ctrl_type_tmp,  @datatype_tmp,
@datalength_tmp,   @horder_tmp,    @vorder_tmp,
@visible_length_tmp,   @proto_tooltip_tmp,
@sample_data_tmp,    @page_bt_synonym_tmp,  @section_bt_synonym_tmp,
@mandatory_flag_tmp,   @visible_flag_tmp,   @editable_flag_tmp,
@caption_req_tmp,    @select_flag_tmp,   @zoom_req_tmp,
@help_req_tmp,     @ellipses_req_tmp,   @visible_rows_tmp,
@ctrl_position_tmp,   @label_class_tmp,  @ctrl_class_tmp,
@data_column_width_tmp,  @label_column_width_tmp,@controldoc_tmp,
@caption_wrap_tmp,   @caption_alignment_tmp,
@caption_position_tmp,  @delete_flag_tmp,  @password_char_tmp,
@task_img_tmp, @help_img_tmp,   @data_column_scalemode,
@label_column_scalemode, @tab_sec_horder,  @tab_sec_vorder ,
@html_text_area,   @spin_required,   @spin_up_image,
--Code Modified for bugId : PNR2.0_11293
@spin_down_image,   @report_reqd,  @le_ref_column_bt_synonym_tmp, @InPlaceCalendar, @EditMaskPattern,
@AccessKey, @itk_req, -- added by feroz for bug id PNR2.0_18385
@Set_User_Pref ,--Code Added For BugId : PNR2.0_18436
-- Code addition for PNR2.0_20849 starts
@NoofLinesPerRow,@RowHeight,@Vscrollbar_Req,
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
@bulletlink_req,   @buttoncombo_req,  @associatedlist_req,
@onfocustask_req,   @listrefilltask_req, @dataascaption,
@listedit_NoofColumns,  @attach_document,  @image_upload,
@inplace_image,    @image_row_height,  @image_icon,
@relative_url_path,   @relative_document_path, @relative_image_path,
@save_doc_content_to_db, @save_image_content_to_db, @Date_highlight_req,
-- Code addition for PNR2.0_21576 starts
-- Code modified for the Bud ID: PNR2.0_27796 starts
@gridlite,@freezecount,@Lite_Attach,@BrowseButton,@DeleteButton-- code added for the caseid:PNR2.0_26996
,@image_row_width,@image_preview_height,@image_preview_width,@image_preview_req,@Accept_Type,@Lite_Attach_Image,--PNR2.0_28319 
@timezone,@editcombo_req,@filesize, @renderas --Code Added for PNR2.0_30869	--Code added for PNR2.0_33378
-- Code modified for the Bud ID: PNR2.0_27796 ends
-- Code addition for PNR2.0_21576 ends


if @@fetch_status <> 0
break

select @Toolbar_Not_Req='N'    
select @ColumnBorder_Not_Req='N'
select @RowBorder_Not_Req='N'
select @PagenavigationOnly='N'
select @RowNo_Not_Req='N'
select @norowdisplay='N'
select @ExtType	='N'
select @ControlColSpan =''
select @ControlRowSpan	=''
select @ToolTip_Not_Req='N'  
select @columncaption_Not_Req='N' 
select @Border_Not_Req='N' 
select @IsModal='N' 
select @Alternate_Color_Req='N' 
select @Map_In_Req='N' 
select @Map_Out_Req='N' 



select  @spin_up_image   = '../Themes/' + @engg_stylesheet + '/images/' + @spin_up_image,
@spin_down_image = '../Themes/' + @engg_stylesheet + '/images/' + @spin_down_image

select @tab_seq = ''

--Code Modified for bugId : PNR2.0_11293
if @report_reqd = '' or @report_reqd is null
select @report_reqd = 'N'

--Code Added For BugId : PNR2.0_18436 Starts Here
IF @Set_User_Pref = 'Y'
Select @Set_User_Pref = 'Yes'
Else if @Set_User_Pref = 'N'
Select @Set_User_Pref = 'No'

If @datatype_tmp not in('Numeric','Integer') --code modified for bugid : PNR2.0_19581
Select @Set_User_Pref = 'YES'
--Code Added For BugId : PNR2.0_18436 Ends Here


-- Start For Inplace Calender added by Feroz
if isnull(@InPlaceCalendar,'N') = 'Y' and @datatype_tmp = 'Date'
select @InPlaceCalendar = 'y'
else
select @InPlaceCalendar = 'n'

if isnull(@InPlaceCalendar,'N') = 'Y' and isnull(@editable_flag_tmp,'N') = 'Y'
select @InPlaceCal_Display = 'y'
else
select @InPlaceCal_Display = 'n'
-- end For Inplace Calender added by Feroz
--Code added by 11742 
if isnull(@renderas,'') = ''
	select @renderas = @base_ctrl_type_tmp
--Code added by 11742 
-- Code Added By Feroz For List edit
select @associatedlist_name = '',
@onfocus_taskname  = '',
@listrefill_taskname = '',
@hidden_view_name  = '',
@mapped_list_controlid = '',
@mapped_list_viewname = ''


if isnull(@date_highlight_req, 'N') = 'Y'
begin
select top 1 @associatedlist_name = upper(a.listedit_controlid)
from de_published_date_highlight_control_map a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  a.control_bt_synonym = @control_bt_synonym_tmp

select @mapped_list_controlid  = Upper(controlid),
@mapped_list_viewname  = Upper(viewname)
from #maplist  -- code modified by gopinath S for the call ID PNR2.0_24034
where activityname = @activity_name
and  ilbocode  = @ui_name_tmp
and  listedit  = @associatedlist_name

end

if exists ( select 'x'
from de_published_date_highlight_control_map a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.listedit_synonym  = @control_bt_synonym_tmp)
begin
select @base_ctrl_type_tmp = 'LISTEDIT'
end


if isnull(@associatedlist_req, 'N') = 'Y'
begin
select top 1 @associatedlist_name = Upper(b.listedit_controlid)
from de_published_listedit_control_map a (nolock),
de_published_listedit_column  b (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  a.mapped_bt_synonym  = @control_bt_synonym_tmp
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.ecrno     = b.ecrno
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.listedit_synonym  = b.listedit_synonym

select @mapped_list_controlid  = Upper(controlid),
@mapped_list_viewname  = Upper(viewname)
from #maplist -- code modified by gopinath S for the call ID PNR2.0_24034
where activityname = @activity_name
and  ilbocode  = @ui_name_tmp
and  listedit  = @associatedlist_name



if  isnull(@onfocustask_req, 'N') = 'Y'
select @onfocus_taskname = task_name
from de_published_action (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  task_descr   = 'List Edit Onfocus Task'
and  primary_control_bts = @control_bt_synonym_tmp

if isnull(@listrefilltask_req, 'N') = 'Y'
select @listrefill_taskname = task_name
from de_published_action (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  task_descr   = 'List Edit Refill Task'
and  primary_control_bts = @control_bt_synonym_tmp
end

if exists ( select 'x'
from de_published_listedit_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    = @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  listedit_synonym = @control_bt_synonym_tmp)
begin
select @base_ctrl_type_tmp = 'LISTEDIT'
end

if exists ( select  'x'
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @control_type_tmp
and  (isnull(attach_document, 'N') = 'Y'
or  isnull(image_upload, 'N') = 'Y')
and	 (isnull(save_doc_content_to_db,'N')='Y' --Code modified for BugID : PLF2.0_04457
or	isnull(save_image_content_to_db,'N')='Y'))
begin

select @hidden_view_name = Upper(view_name)
from de_hidden_view (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_name   =  @page_bt_synonym_tmp
and  section_name  =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
end
-- Code Added By Feroz For List edit
-- Modified By feroz for bug id :PNR2.0_23654
select  @visible_rows_tmp = visisble_rows
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @control_type_tmp
-- Modified By feroz for bug id :PNR2.0_23654

--Code added for Bug ID:PLF2.0_00961 starts
select @captiontype = replace(@captiontype,'&','&amp;')
select @captiontype = replace(@captiontype,'<','&lt;')
select @captiontype = replace(@captiontype,'>','&gt;')
select @captiontype = replace(@captiontype,'"','&quot;')
select @captiontype = case isnull(@controlstyle,'') when 'Image' then ''
                        else    @captiontype end
--Code added for Bug ID:PLF2.0_00961 ends

-- Added By feroz For Edit mask pattern -- start
select @EditMaskPattern = replace(@EditMaskPattern,'&','&amp;')
select @EditMaskPattern = replace(@EditMaskPattern,'<','&lt;')
select @EditMaskPattern = replace(@EditMaskPattern,'>','&gt;')
select @EditMaskPattern = replace(@EditMaskPattern,'"','&quot;')
-- Added By feroz For Edit mask pattern -- end

if @datatype_tmp = 'Numeric'
begin
if @le_ref_column_bt_synonym_tmp <> ''
begin
select  @decimal_length_ctrl =  le_decimallength
from  de_log_ext_ctrl_met_vw   gls(nolock)
where  gls.le_customer_name   = @engg_customer_name
and   gls.le_project_name   = @engg_project_name
and   gls.le_control   = @le_ref_column_bt_synonym_tmp
end
else
begin
select  @decimal_length_ctrl   =  decimal_length
from  @de_published_glossary_lng_extn  gls ,--(nolock),  --modified for bugid PNR2.0_4617 on 14th Nov 2005
de_published_business_term   bts (nolock),
de_published_precision_type  pt  (nolock)
where  gls.customer_name   = bts.customer_name
and   gls.project_name   = bts.project_name
and   gls.process_name   = bts.process_name
and   gls.component_name   = bts.component_name
and   gls.ecrno      = bts.ecrno
and   gls.bt_name      = bts.bt_name

and   bts.customer_name   = pt.customer_name
and   bts.project_name   = pt.project_name
and   bts.process_name   = pt.process_name
and   bts.component_name   = pt.component_name
and   bts.ecrno      = pt.ecrno
and   bts.precision_type   = pt.pt_name

and   gls.customer_name   = @engg_customer_name
and   gls.project_name   = @engg_project_name
and   gls.ecrno      = @engg_req_no
and   gls.process_name   = @process_name
and   gls.component_name   = @engg_component
and   gls.bt_synonym_name   = @control_bt_synonym_tmp
--and   gls.languageid    = @language_code
end

if isnull(@decimal_length_ctrl, -915) = -915
begin
select @decimal_length_ctrl = 3
end
end
else
begin
select @decimal_length_ctrl = 0
end
--PNR2.0_15700
select @sample_data_tmp = replace(@sample_data_tmp,'&','&amp;')
select @sample_data_tmp = replace(@sample_data_tmp,'<','&lt;')
select @sample_data_tmp = replace(@sample_data_tmp,'>','&gt;')
select @sample_data_tmp = replace(@sample_data_tmp,'"','&quot;')

select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'&','&amp;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'<','&lt;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'>','&gt;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'"','&quot;')
select @ctrl_descr_tmp = replace(@ctrl_descr_tmp,'--nocaption--','')

--Code Modified for bugid : PNR2.0_11183
select @modelsectioname_tmp = @section_bt_synonym_tmp


select  @section_bt_synonym_tmp = 'PRJHDNSECTION',
@uitaskname_tmp   = ''
-- TECH-76600
	SELECT	@uitaskname_tmp		=	upper(task_name)
		FROM	de_published_action a (NOLOCK)
		WHERE	a.customer_name			=	@engg_customer_name
		AND		a.project_name			=	@engg_project_name
		AND		a.ecrno					=	@engg_req_no
		AND		a.process_name			=	@process_name
		AND		a.component_name		=	@engg_component
		AND		a.activity_name			=	@activity_name
		AND		a.ui_name				=	@ui_name_tmp
		AND		a.page_bt_synonym		=	@page_bt_synonym_tmp
		AND		a.primary_control_bts	=	@control_bt_synonym_tmp

-- TECH-76600

if @transformed_vorder_tmp  >= 6
begin
select  @transformed_vorder_tmp = 0,
@transformed_horder_tmp = @transformed_horder_tmp + 1
end

-- Check whether it is a new section
if @previous_section_tmp <> @section_bt_synonym_tmp
select @position_vindex_tmp = 0

if @previous_horder_tmp <> @horder_tmp
select @position_vindex_tmp = 0

select @helptext = @ctrl_descr_tmp + ' - Datatype : ' + ltrim(rtrim(isnull(@datatype_tmp,'')))
+ ' - MaxLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))


-- Insert Label Entry
--code added for bugid : PNR2.0_19031 starts

if @help_tabstop = 'Y' -- code modified by gopinath S for the bug id  PNR2.0_19995
begin
select @tab_seq_lbl = ''
end
else
begin
select @tab_seq_lbl = @tab_seq
end
--code added for bugid : PNR2.0_19031 ends

--Code addition  for  PNR2.0_20049  starts

select @data_type_ctrl =  bts.data_type
from @de_published_glossary_lng_extn gls ,--(nolock),
de_business_term    bts (nolock)
where gls.customer_name   = bts.customer_name
and   gls.project_name    = bts.project_name
and   gls.process_name    = bts.process_name
and   gls.component_name  = bts.component_name
and   gls.bt_name       = bts.bt_name
and   gls.customer_name   = @engg_customer_name
and   gls.project_name    = @engg_project_name
and   gls.process_name    = @process_name
and   gls.component_name  = @engg_component
and   gls.bt_synonym_name = @control_bt_synonym_tmp
--and   gls.languageid      = @language_code
and   gls.ecrno    = @engg_req_no


If @data_type_ctrl  <> 'char'
select @ellipses_req_tmp = 'N'

--Code addition  for  PNR2.0_20049  ends

if @base_ctrl_type_tmp in ('Edit','Combo','Checkbox','DataHyperLink','grid','LISTVIEW') and @caption_req_tmp = 'Y'
AND  @ui_format_tmp <> 'top' --TECH-72114 
begin
select @transformed_vorder_tmp = @transformed_vorder_tmp + 1

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,   @guid,
'<Control Name="'   + 'LBL'+ ltrim(rtrim(@controlid_tmp))       + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(@ctrl_descr_tmp))         + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'PRJHDNSECTION'))) + '" ' +
'PageName="'   + ltrim(rtrim(@page_bt_synonym_tmp))       + '" ' +
'ILBOName="'    + ltrim(rtrim(@ui_name_tmp))         + '" ' +
'ActivityName="'   + ltrim(rtrim(@activity_name))        + '" ' +
'ComponentName="'  + ltrim(rtrim(@engg_component))        + '" ' +
'ControlType="'   + ltrim(rtrim(upper(@control_type_tmp)))        + '" ' +
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))    + '" ' +
'BaseControlType="'  + 'LABEL'              + '" ' +  -- Code modification  for  PNR2.0_23635
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--       'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))      + '" ' +
--       'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))      + '" ' +
--       'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')    + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end        + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,@visible_length_tmp)))   + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(@proto_tooltip_tmp))        + '" ' +
'DefaultSampleData="' + ltrim(rtrim(@sample_data_tmp))        + '" ' +
'SampleData="'   + ltrim(rtrim(@sample_data_tmp))        + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@transformed_horder_tmp),3)))  + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@transformed_vorder_tmp),3)))   + '" ' +
'Mandatory="'   + ltrim(rtrim(@mandatory_flag_tmp))        + '" ' +
'Visible="'    + ltrim(rtrim(@visible_flag_tmp))        + '" ' +
'Editable="'   + ltrim(rtrim(@editable_flag_tmp))        + '" ' +
'CaptionRequired="'  + ltrim(rtrim(@caption_req_tmp))        + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))    + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))      + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))  + '" ' +
'SelectFlag="'   + ltrim(rtrim(@select_flag_tmp))        + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))      + '" ' +
'ZoomRequired="'  + ltrim(rtrim(@zoom_req_tmp))       + '" ' +
'HelpRequired="'  + ltrim(rtrim(@help_req_tmp))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(@ellipses_req_tmp))        + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))      + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0)))) + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0)))) + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))     + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))     + '" ' +
'CaptionWrap="' + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))      + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))    + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))    + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))      + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))       + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))       + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))       + '" ' +
'OrderSequence="'  + '1' + '" ' +
'VisibleRows="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))     + '" ' + -- Code Modified by Gopinath S for the Call ID PNR2.0_23885
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))       + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))       + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))     + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))    + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))        + '" ' +
--Code Modified for bugId : PNR2.0_11293
'ReportRequired="' + ltrim(rtrim(isnull(@report_reqd,'')))          + '" ' +
--Code Modified for bugid : PNR2.0_11183
'ModelSectionName="' + ltrim(rtrim(isnull(@modelsectioname_tmp,'')))       + '" ' +
'UserFormat="' + Ltrim(Rtrim(@Set_User_Pref))           + '" ' + --Code Added For BugId : PNR2.0_18436 -- Code Modified For Bugid PNR2.0_20169
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
--'TabIndex="'   + ltrim(rtrim(@tab_seq))            + '" ' +
'TabIndex="'   + ltrim(rtrim(@tab_seq_lbl))           + '" ' + --code added for bugid : PNR2.0_19031
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'        + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'	+  	isnull(@Disp_Only_Apply_Len,'N')	    +'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	        +  	isnull(@editcombo_req,'N')	            +'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	        +  	isnull(@autoexpand,'N')	                +'" ' +	     --Code Added for the Bug ID PNR2.0_32053
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +  --Code Added for the Bug ID PNR2.0_36309  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'        +   isnull(@controlstyle,'')                +'" ' +
--'ControlImage="'        +   isnull(@controlimage,'')                +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')							+'" ' +
 'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')            +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')	+'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'') +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'') +'" ' +
'ExtType="'         +   isnull(@ExtType,'')	+'" ' +
--	'ColSpan="'         +   CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +   CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4) +'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4)  + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'         +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4) + '" ' + 
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' + --modified for bugID:PLF2.0_03057 --code added for bugid: PLF2.0_07676
--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' + 
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'SetScrollPosition="'		+ isnull(@preserveposition,'')  +'" ' +
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' +
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' +
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' + 
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' +   
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'FileSize="'		+ isnull(@filesize,'')+'"/>' ,@xml_seq_tmp)

select @position_vindex_tmp = @position_vindex_tmp + 1
end

select @transformed_vorder_tmp = @transformed_vorder_tmp + 1

if @base_ctrl_type_tmp = 'Label'
select @control_type_tmp = 'Edit',
@base_ctrl_type_tmp = 'Edit',
@editable_flag_tmp = 'Y',
@visible_flag_tmp = 'N'

-- Insert Control Entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim(@controlid_tmp))         + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@renderas,'')))          + '" ' +
'ControlCaption="'  + ltrim(rtrim(@ctrl_descr_tmp))         + '" ' +
'SectionName="'   + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'PRJHDNSECTION'))) + '" ' +
'PageName="'   + ltrim(rtrim(@page_bt_synonym_tmp))       + '" ' +
'ILBOName="'    + ltrim(rtrim(@ui_name_tmp))         + '" ' +
'ActivityName="'   + ltrim(rtrim(@activity_name))         + '" ' +
'ComponentName="'  + ltrim(rtrim(@engg_component))         + '" ' +
'ControlType="'   + ltrim(rtrim(upper(@control_type_tmp)))    + '" ' +
'BaseControlType="'  + ltrim(rtrim(isnull(upper(@base_ctrl_type_tmp),'')))        + '" ' + -- Code modification  for  PNR2.0_23635
'BTSynonym="'   + ltrim(rtrim(isnull(@control_bt_synonym_tmp,'')))    + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
--      'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))      + '" ' +
--      'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))      + '" ' +
--      'DecimalLength="'  + isnull(convert(varchar, @decimal_length_ctrl),'')    + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_ctrl),'') end  + '" ' +
-- Code modified by Anuradha for the Bug ID :: PNR2.0_7393
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,@visible_length_tmp)))   + '" ' +
'ProtoTooltip="'  + ltrim(rtrim(@proto_tooltip_tmp))        + '" ' +
'DefaultSampleData="' + ltrim(rtrim(@sample_data_tmp))        + '" ' +
'SampleData="'   + ltrim(rtrim(@sample_data_tmp))        + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@transformed_horder_tmp),3)))  + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@transformed_vorder_tmp),3)))   + '" ' +
'Mandatory="'   + ltrim(rtrim(@mandatory_flag_tmp))        + '" ' +
'Visible="'    + ltrim(rtrim(@visible_flag_tmp))        + '" ' +
'Editable="'   + ltrim(rtrim(@editable_flag_tmp))        + '" ' +
'CaptionRequired="'  + ltrim(rtrim(@caption_req_tmp))        + '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT')))    + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))      + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))      + '" ' +
'SelectFlag="'   + ltrim(rtrim(@select_flag_tmp))        + '" ' +
'DeleteFlag="'   + ltrim(rtrim(isnull(@delete_flag_tmp,'')))  + '" ' +
'ZoomRequired="'  + ltrim(rtrim(@zoom_req_tmp))         + '" ' +
'HelpRequired="'  + ltrim(rtrim(@help_req_tmp))         + '" ' +
'EllipsesRequired="' + ltrim(rtrim(@ellipses_req_tmp))        + '" ' +
'AssociatedTask="'  + ltrim(rtrim(isnull(@uitaskname_tmp,'')))      + '" ' +
'DataColumnWidth="'  + ltrim(rtrim(CONVERT(VARCHAR,isnull(@data_column_width_tmp,0)))) + '" ' +
'LabelColumnWidth="' + ltrim(rtrim(CONVERT(VARCHAR,isnull(@label_column_width_tmp,0)))) + '" ' +
'DataColumnScaleMode="' + ltrim(rtrim(isnull(@data_column_scalemode,'%')))     + '" ' +
'LabelColumnScaleMode="'+ ltrim(rtrim(isnull(@label_column_scalemode,'%')))     + '" ' +
--Code Modified For BugId :PNR2.0_7314
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))        + '" ' +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))      + '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))    + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))      + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))       + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))       + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))       + '" ' +
'OrderSequence="'  + '1' + '" ' +
'VisibleRows="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))     + '" ' + -- Code Modified by Gopinath S for the Call ID PNR2.0_23885
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))       + '" ' +
'SpinRequired="'  + ltrim(rtrim(isnull(@spin_required,'N')))       + '" ' +
'SpinUpImage="'   + ltrim(rtrim(isnull(@spin_up_image,'spinup.gif')))     + '" ' +
'SpinDownImage="'  + ltrim(rtrim(isnull(@spin_down_image,'spindown.gif')))    + '" ' +
'AssociatedSpinControl="'+ ltrim(rtrim(isnull(@associated_spin_ctrl,'')))       + '" ' +
'AssociatedSpinTask="' + ltrim(rtrim(isnull(@associated_spin_task,'')))       + '" ' +
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))        + '" ' +
--Code Modified for bugId : PNR2.0_11293
'ReportRequired="'  + ltrim(rtrim(isnull(@report_reqd,'')))          + '" ' +
'ModelSectionName="' + ltrim(rtrim(isnull(@modelsectioname_tmp,'')))       + '" ' +
'UserFormat="' + Ltrim(Rtrim(@Set_User_Pref))           + '" ' + --Code Added For BugId : PNR2.0_18436 -- Code Modified For Bugid PNR2.0_20169
--Code Modified for bugid : PNR2.0_11183
-- Inplace Calendar and Edit Mask Feature added by Feroz -- strat
'InPlaceCalendar="' + ltrim(rtrim(isnull(@InPlaceCalendar,'N')))       + '" ' +
-- Code modification for  PNR2.0_19426  starts
'InCalDisplay="' + ltrim(rtrim(isnull(@InPlaceCal_Display,'')))       + '" ' +
--'EditMask="' + ltrim(rtrim(isnull(@EditMaskPattern,'')))       + '" ' +
-- Inplace Calendar and Edit Mask Feature added by Feroz -- End
'TabIndex="'   + ltrim(rtrim(@tab_seq))           + '" ' +
'AccessKey="'   + ltrim(rtrim(isnull(@AccessKey,'')))             + '" ' + -- Added By Jeya for Access Key
-- Code modification for  PNR2.0_19426  ends
-- Code addition for PNR2.0_21576 starts
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 starts
'GridLite="'   + ltrim(rtrim(isnull(@gridlite,'N'))) + '" ' +  
--Code modified by Balaji D for Bug ID PNR2.0_28889 on 01-Nov-2010 end
-- Code addition for PNR2.0_21576 ends
-- Code addition for PNR2.0_20849 starts
'NoofLinesPerRow="'   + ltrim(rtrim(isnull(@NoofLinesPerRow,''))) + '" ' +
'RowHeight="'         + ltrim(rtrim(isnull(@RowHeight,''))) + '" ' +
'Vscrollbar_Req="'    + ltrim(rtrim(isnull(@Vscrollbar_Req,'N'))) + '" ' +
-- Code addition for PNR2.0_20849 ends
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))     + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))   + '" ' +
'OnFocusTask="'    + ltrim(rtrim(isnull(@onfocus_taskname,'')))            + '" ' +
'ListRefillTask="'  + ltrim(rtrim(isnull(@listrefill_taskname,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'   + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'IsITK="N"  FC="'	+	CONVERT(VARCHAR,isnull(@freezecount,0),4)	+'" '+
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+  -- added by feroz for bug id PNR2.0_18385 -- code added for the caseid:PNR2.0_26872-- code added for the caseid:PNR2.0_26996
'TimeZone="'			+  	isnull(@timezone,'N')					+'" '+  --Code Added for PNR2.0_30869 
'ApplyVisibleLength="'	+  	isnull(@Disp_Only_Apply_Len,'N')	    +'" ' + --Code Added for the Bug ID	PNR2.0_32770
'EditCombo="'	        +  	isnull(@editcombo_req,'N')	            +'" ' +		--Code Added for the Bug ID	PNR2.0_33378
'AutoExpand="'	        +  	isnull(@autoexpand,'N')	                +'" ' +	         --Code Added for the Bug ID PNR2.0_32053
'LabelLink="'           +  	isnull(@LabelLink,'N')                  +'" ' +  --Code Added for the Bug ID PNR2.0_36309    
'AlignBtnH="'           +  CONVERT(VARCHAR,isnull(@algnbtn_h_tmp,0),4)+'" ' +  --code added for PLF2.0_00961
'AlignBtnV="'           +  CONVERT(VARCHAR,isnull(@algnbtn_v_tmp,0),4)+'" ' +  
--'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'CaptionType="'         +   isnull(@captiontype,'')                 +'" ' +
'ControlStyle="'        +   isnull(@controlstyle,'')                +'" ' +
--'ControlImage="'        +   isnull(@controlimage,'')                +'" />' ,@xml_seq_tmp)   --Code Added for the Bug ID PNR2.0_36309,PLF2.0_00961
'ControlImage="'         +   isnull(@controlimage,'')               +'" ' +
'IsListBox="'   + isnull(@IsListBox,'')						 +'" ' +
 'Toolbar_Not_Req="'         +   isnull(@Toolbar_Not_Req,'')               +'" ' +
'ColumnBorder_Not_Req="'         +   isnull(@ColumnBorder_Not_Req,'')               +'" ' +
'RowBorder_Not_Req="'         +   isnull(@RowBorder_Not_Req,'')               +'" ' +
'PageNavigation_Only="'         +   isnull(@PagenavigationOnly,'')   +'" ' +
'RowNo_Not_Req="'         +   isnull(@RowNo_Not_Req,'')    +'" ' +
'NoRowDisplay="'         +   isnull(@norowdisplay,'') +'" ' +
'ExtType="'         +   isnull(@ExtType,'')	 +'" ' +
--	'ColSpan="'         +  CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) +'" ' +
'ColSpan="'         +  CASE WHEN ISNULL(@ControlColSpan,0)<> 0 THEN CONVERT(VARCHAR,ISNULL((@ControlColSpan*2)-1,''),4) ELSE CONVERT(VARCHAR,isnull(@ControlColSpan,''),4) END +'" ' +		--TECH-75956
'RowSpan="'         +  CONVERT(VARCHAR,isnull(@ControlRowSpan,''),4)+'" ' +
'Tooltip_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Tooltip_Not_Req,''),4)    + '" ' +
'GridHeader_Not_Req="'         +   CONVERT(VARCHAR,isnull(@columncaption_Not_Req,''),4)  + '" ' +
'Border_Not_Req="'         +   CONVERT(VARCHAR,isnull(@Border_Not_Req,''),4)  + '" ' +
'IsModal="'     +   CONVERT(VARCHAR,isnull(@IsModal,''),4)  + '" ' +
'Alternate_Color_Req="'         +   CONVERT(VARCHAR,isnull(@Alternate_Color_Req,''),4)  + '" ' +
'Map_In_Req="'         +   CONVERT(VARCHAR,isnull(@Map_In_Req,''),4)  + '" ' +
'Map_Out_Req="'         +   CONVERT(VARCHAR,isnull(@Map_Out_Req,''),4)   +'" ' + --modified for bugID:PLF2.0_03057  --code added for bugid: PLF2.0_07676
--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
'IsCallout="'		+ isnull(@iscallout,'') +'" ' +
'IsSmartView="'		+ isnull(@smartviewsection,'')  +'" ' +
'IsSideDrawer="'		+ isnull(@IsSideDrawer,'')  +'" ' +	
'SetScrollPosition="'		+ isnull(@preserveposition,'')  +'" ' +
'FileSize="'		+ isnull(@filesize,'') +'" ' + 
'IsMobile="'		+ isnull(@IsMobile,'')  +'" ' +	
'PaginationRequired="'		+ isnull(@PaginationRequired,'')  +'" ' +	
'AssociatedUpdateTask="'		+ isnull(@AssociatedUpdateTask,'')  +'" ' +	
'AssociatedDeleteTask="'		+ isnull(@AssociatedDeleteTask,'')  +'" ' +	
'TemplateID="'		+ isnull(@TemplateID,'')+'"/>' ,@xml_seq_tmp)
end
close ctrlcurs
deallocate ctrlcurs

-- Insert Closing entry for Controls
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '</Controls>',@xml_seq_tmp)

-- Insert Base Entry for Grid Columns
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<GridColumns>',@xml_seq_tmp)


--code modified by kiruthika for bugid:PNR2.0_14487
create table #visible_length_details (customer_name varchar(60) collate database_default,project_name varchar(60) collate database_default,ecrno varchar(60) collate database_default,
process_name varchar(60) collate database_default,component_name varchar(60) collate database_default,activity_name varchar(60) collate database_default,
ui_name varchar(60) collate database_default,page_bt_synonym varchar(60) collate database_default,control_bt_synonym varchar(60) collate database_default,column_bt_synonym varchar(60) collate database_default)
insert into #visible_length_details
select a.customer_name,a.project_name,a.ecrno,a.process_name,a.component_name,a.activity_name,a.ui_name,a.page_bt_synonym,
a.control_bt_synonym,a.column_bt_synonym
from de_published_ui_grid  a (nolock)
where a.customer_name =   @engg_customer_name
and  a.project_name = @engg_project_name
and  a.ecrno   =  @engg_req_no
and  a.process_name = @process_name
and  a.component_name= @engg_component
and  a.activity_name = @activity_name
and  a.ui_name  =  @ui_name_tmp
and  isnull(a.visible_length, 0 ) = 0
group by a.customer_name, a.project_name,a.ecrno, a.process_name, a.component_name, activity_name, ui_name, page_bt_synonym, control_bt_synonym, column_bt_synonym
having count( distinct isnull(a.visible_length, 0 )) = 1

update a
set  a.visible_length  =  isnull(len(b.bt_synonym_caption), 30)
from de_published_ui_grid    a (nolock),
de_published_glossary b (nolock),
#visible_length_details     c(nolock)
where a.customer_name  =   c.customer_name
and  a.project_name  = c.project_name
and  a.ecrno    =  c.ecrno
and  a.process_name  = c.process_name
and  a.component_name = c.component_name
and  a.activity_name  = c.activity_name
and  a.ui_name   =  c.ui_name
and  a.page_bt_synonym =  c.page_bt_synonym
and  a.control_bt_synonym= c.control_bt_synonym
and  a.column_bt_synonym = c.column_bt_synonym
and  a.customer_name  =   b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.column_bt_synonym = b.bt_synonym_name

DECLARE vis_cursor CURSOR FOR

select distinct page_bt_synonym,control_bt_synonym
from #visible_length_details

OPEN vis_cursor

WHILE (1=1)
BEGIN
FETCH NEXT FROM vis_cursor
INTO @vis_page, @vis_ctrl

if (@@FETCH_STATUS <> 0)
break
select @vis_leng = 0
select  @Sum_vis_leng = 0


select  @Sum_vis_leng   = sum(isnull(a.visible_length,0))
from de_published_ui_grid           a(nolock)
where a.customer_name  =   @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.ecrno    = @engg_req_no
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   =  @ui_name_tmp
and  a.page_bt_synonym =  @vis_page
and  a.control_bt_synonym= @vis_ctrl
group by a.process_name, a.component_name, a.activity_name, a.ui_name, a.page_bt_synonym, a.control_bt_synonym
having sum(isnull(visible_length,0)) < 75

if isnull(@Sum_vis_leng, 0) <> 0
begin

select  @vis_leng   =  (75 - @Sum_vis_leng)/count(*)
from #visible_length_details           a(nolock)
where a.customer_name  =   @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.ecrno    =  @engg_req_no
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym =  @vis_page
and  a.control_bt_synonym= @vis_ctrl
group by a.process_name, a.component_name, a.activity_name, a.ui_name, a.page_bt_synonym, a.control_bt_synonym

update b
set  b.visible_length  = isnull(b.visible_length, 30) + @vis_leng
from #visible_length_details  a (nolock),
de_published_ui_grid           b(nolock)
where a.customer_name  =   @engg_customer_name
and  a.project_name = @engg_project_name
and  a.ecrno    =  @engg_req_no
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   =  @ui_name_tmp
and  a.page_bt_synonym =  @vis_page
and  a.control_bt_synonym= @vis_ctrl
and     a.customer_name  =   b.customer_name
and  a.project_name  = b.project_name
and     a.ecrno    =   b.ecrno
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   =  b.ui_name
and  a.page_bt_synonym =  b.page_bt_synonym
and  a.control_bt_synonym= b.control_bt_synonym
and     a.column_bt_synonym =   b.column_bt_synonym


end
end
CLOSE vis_cursor
DEALLOCATE vis_cursor

drop table #visible_length_details

-- For ITK Flag


select a.customer_name   'customer_name', a.project_name 'project_name',
a.column_bt_synonym  'btsynonym',  a.control_id 'control_id',    'T'   'displayflag',
a.visible_length  'displaylength', a.ui_name  'ui_name',     a.view_name 'view_name',
'LExt_User'    'upduser',   getdate()  'updtime',     a.view_name 'old_viewname',
a.process_name,        a.component_name,       a.activity_name,
a.ecrno,         a.page_bt_synonym,       a.section_bt_synonym,
a.control_bt_synonym,      a.column_bt_synonym,      a.column_type,
a.column_no,        a.visible_length,     a.column_prefix,
a.timestamp,        a.createdby,        a.createddate,
a.modifiedby,        a.modifieddate, a.ref_bt_synonym, --CODE MODIFIED BY GIRI ON 18-SEP-2007 FOR LE
a.default_required					--Code Modified for PNR2.0_30869 
into #de_published_LogicExt_ui_grid_dtl_vw_tmp
from #de_published_LogicExt_ui_grid_dtl_main a (nolock), --CODE MODIFIED BY GIRI ON 18-SEP-2007 FOR LE
es_comp_ctrl_type_mst        b (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and   a.activity_name    = @activity_name
and   a.ui_name   = @ui_name_tmp
and  b.customer_name   collate database_default = a.customer_name
and  b.project_name   collate database_default = a.project_name
and  b.process_name   collate database_default = a.process_name
and  b.component_name  collate database_default = a.component_name
and  b.ctrl_type_name  collate database_default = a.column_type
and    b.base_ctrl_type not in ('button')
and     a.column_type  not in ('label')
and    a.column_type  not in ('filler' , 'filler2')

update  a
set   column_no  = convert(int, a.column_no) + convert(int, c.view_name)
from  #de_published_LogicExt_ui_grid_dtl_vw_tmp a,
( select  b.process_name, b.component_name, b.activity_name, b.ui_name, b.control_id, max(convert(int, b.column_no)) 'view_name'
from  de_published_ui_grid  b (nolock)
where  b.customer_name   = @engg_customer_name
and   b.project_name   = @engg_project_name
and   b.ecrno      = @engg_req_no
and    b.activity_name    = @activity_name
and    b.ui_name        = @ui_name_tmp
group by b.process_name, b.component_name, b.activity_name, b.ui_name, b.control_id) c
where  c.process_name   = a.process_name
and   c.component_name  = a.component_name
and   c.activity_name   = a.activity_name
and   c.ui_name     = a.ui_name
and   c.control_id    = a.control_id

update a
set  a.view_name  = convert(int, a.view_name) + convert(int, c.view_name)
from #de_published_LogicExt_ui_grid_dtl_vw_tmp a,
( select b.ilbocode, b.controlid,  max(convert(int, b.viewname)) 'view_name'
from de_fw_req_publish_ilbo_view  b (nolock)
where IsNumeric(viewname) = 1
--    and  displayflag   = 'T'
--     where b.ilbocode   = a.ilbocode
--     and  b.controlid  = a.controlid
and  b.customername = @engg_customer_name
and  b.projectname = @engg_project_name
and  b.ecrno   = @engg_req_no
and   b.ilbocode  = @ui_name_tmp
group by ilbocode, controlid) c
where c.ilbocode   collate database_default = a.ui_name
and  c.controlid  collate database_default = a.control_id

-- select * from #de_published_LogicExt_ui_grid_dtl_vw_tmp (nolock)
select @renderas = ''

-- Fetch Grid Controls
declare gridcurs cursor FAST_FORWARD  for
select upper(column_bt_synonym),   isnull(bt_synonym_caption,column_bt_synonym),
upper(grid.control_id),    isnull(column_type,''),
upper(base_ctrl_type),     column_no,
isnull(visible_length,0),   isnull(grid.proto_tooltip,''),
isnull(grid.sample_data,''),  upper(grid.page_bt_synonym) as 'page_bt_synonym',
upper(grid.section_bt_synonym) as 'section_bt_synonym',  upper(grid.control_bt_synonym) as 'control_bt_synonym',
upper(rtrim(mandatory_flag)),   case when isnull(upper(rtrim(grid.visible)),'Yes')='Yes' then 'Y'
else 'N'
end ,
upper(rtrim(editable_flag)),   upper(rtrim(caption_req)),
upper(rtrim(select_flag)),    upper(rtrim(zoom_req)),
upper(rtrim(help_req)),    upper(rtrim(ellipses_req)),
isnull(visisble_rows,0),   upper(isnull(data_type,'char')),
isnull(length,0),     isnull(col_doc,''),
upper(isnull(caption_wrap,'Y')), upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')), isnull(grid.view_name,''),
upper(isnull(ctrl_position,'LEFT')),upper(isnull(LabelClass,'')),
upper(isnull(ControlClass,'')),  upper(isnull(password_char,'N')),
upper(isnull(tskimg_class,'')),  upper(isnull(hlpimg_class,'')),
sec.horder,       sec.vorder,
upper(isnull(html_txt_area,'N')),  '', isnull(report_req,'N'), 'N', -- added by feroz for bug id PNR2.0_18385
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption,'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'), isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
Isnull(grid.Set_User_Pref,'Y') ,isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),--Code Added For BugId : PNR2.0_18436
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone, 'N'), isnull(Default_required,'N') ,isnull(editcombo_req,'N'),isnull(ColumnClass,''),isnull(controlstyle,''),isnull(grid.Forcefit,'')--Code Modified for PNR2.0_30869  --Code modified for PNR2.0_33378
/*,isnull(ColumnHdrClass,'')*/,isnull(ctype.ismodal,''),isnull(filesize,''),isnull(grid.TemplateId,''),isnull(ctype.col_caption_align,'Left'),isnull(Email,''),isnull(Phone,''),isnull(col_data_align,'LEFT'),
isnull(avn_download,''),isnull(grid.TemplateCategory,''),isnull(grid.TemplateSpecific,''),isnull(grid.Column_class_ext6,''),
isnull(grid.RowExpander,'N'), isnull(grid.GridToForm,'N'),isnull(grid.icon_class,''), ISNULL(grid.CompactView, 'NA'),
isnull(grid.IsExtension,'N'), isnull(grid.ExtensionOrder,0), 
ISNULL(grid.Icon_position,''),isnull(grid.SystemClass,'N')	--TECH-75230 --TECH-77097
from de_published_ui_grid    grid (nolock),
de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
@de_published_glossary_lng_extn  gls ,--(nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where grid.customer_name  = ctrl.customer_name
and  grid.project_name  = ctrl.project_name
and  grid.ecrno    = ctrl.ecrno
and  grid.process_name  = ctrl.process_name
and  grid.component_name  = ctrl.component_name
and  grid.activity_name  = ctrl.activity_name
and  grid.ui_name   = ctrl.ui_name
and  grid.page_bt_synonym = ctrl.page_bt_synonym
and  grid.section_bt_synonym = ctrl.section_bt_synonym
and  grid.control_bt_synonym = ctrl.control_bt_synonym

and  ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym

and  grid.customer_name  = gls.customer_name
and  grid.project_name  = gls.project_name
and  grid.ecrno    = gls.ecrno
and  grid.process_name  =  gls.process_name
and  grid.component_name  =  gls.component_name
and  grid.column_bt_synonym = gls.bt_synonym_name

and  grid.customer_name  = ctype.customer_name
and  grid.project_name  = ctype.project_name
and  grid.process_name  = ctype.process_name
and  grid.component_name  = ctype.component_name
and  grid.column_type  = ctype.ctrl_type_name

and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  = @activity_name
and  sec.ui_name    =  @ui_name_tmp
--and  gls.languageid   =  @language_code
and grid.view_name not in ('__nodeexpand','__nodeid','__parentnodeid','__icon','__icls')
union
select upper(column_bt_synonym),        isnull(bt_synonym_caption,column_bt_synonym),
upper(grid.control_id),         isnull(column_type,''),
upper(base_ctrl_type),          column_no,
isnull(visible_length,0),         isnull(grid.proto_tooltip,''),
isnull(grid.sample_data,''),       upper(grid.page_bt_synonym) as 'page_bt_synonym',
upper(grid.section_bt_synonym)as 'section_bt_synonym', upper(grid.control_bt_synonym) as 'control_bt_synonym',
'Y',              'Y',
'Y',              'Y',
'N',              'N',
'N',              'N',
'0',             upper(isnull(data_type,'char')),
isnull(length,0),          isnull(col_doc,''),
'Y',             'LEFT',
'LEFT',             isnull(grid.view_name,''),
'LEFT',             '',
'',              'N',
'',              '',
sec.horder,            sec.vorder,
'N',          '', 'N', 'N', -- added by feroz for bug id PNR2.0_18385
-- Added By Feroz
'N',  'N', 'N',
'N', 'N', 'N',
0, 'N', 'N',
'N', 0, 'N',
'', '', '',
'N', 'N', 'N',
-- Code modified for the Bud ID: PNR2.0_27796 starts
Isnull(grid.Set_User_Pref,'Y'),'N','N','N',--Code Added For BugId : PNR2.0_18436
0,0,0,'N','','N', 'N', isnull(Default_required,'N'),'N',isnull(ColumnClass,''),'','','','','','','','','',''--,''--Code Modified for PNR2.0_30869   --Code modified for PNR2.0_33378 
,'','','','','','', ISNULL(grid.CompactView,'NA'), '', 0,'',ISNULL(grid.SystemClass,'N') --TECH-75230 --TECH-77097
-- Code modified for the Bud ID: PNR2.0_27796 ends
from de_published_ui_grid grid (nolock),
de_published_ui_control ctrl (nolock),
de_published_ui_section sec (nolock),
@de_published_glossary_lng_extn gls ,--(nolock),
es_comp_stat_ctrl_type_mst ctype (nolock)
where grid.customer_name  = ctrl.customer_name
and  grid.project_name  = ctrl.project_name
and  grid.ecrno    = ctrl.ecrno
and  grid.process_name  = ctrl.process_name
and  grid.component_name  = ctrl.component_name
and  grid.activity_name  = ctrl.activity_name
and  grid.ui_name   = ctrl.ui_name
and  grid.page_bt_synonym = ctrl.page_bt_synonym
and  grid.section_bt_synonym = ctrl.section_bt_synonym
and  grid.control_bt_synonym = ctrl.control_bt_synonym
and  ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  grid.customer_name  = gls.customer_name
and  grid.project_name  = gls.project_name
and  grid.ecrno    = gls.ecrno
and  grid.process_name  =  gls.process_name
and  grid.component_name  =  gls.component_name
and  grid.column_bt_synonym = gls.bt_synonym_name
and  grid.customer_name = ctype.customer_name
and  grid.project_name  = ctype.project_name
and  grid.process_name  = ctype.process_name
and  grid.component_name  = ctype.component_name
and  grid.column_type  = ctype.ctrl_type_name
and  sec.customer_name  =   @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    =  @engg_req_no
and  sec.process_name  = @process_name
and  sec.component_name  = @engg_component
and  sec.activity_name  = @activity_name
and  sec.ui_name    =  @ui_name_tmp
and  isnull(sec.section_type,'MAIN') = 'MAIN'
--and  gls.languageid   =  @language_code
and grid.view_name not in ('__nodeexpand','__nodeid','__parentnodeid','__icon','__icls')
union
-- For Logic Extension Static Controls
select    upper(column_bt_synonym),          column_bt_synonym,
upper(grid.control_id),            isnull(column_type,''),
upper(base_ctrl_type),             column_no,
isnull(gls.visisble_length,20),           IsNull(gls.proto_tooltip, ''),
'',               upper(grid.page_bt_synonym) as 'page_bt_synonym',
upper(grid.section_bt_synonym) as 'section_bt_synonym', upper(grid.control_bt_synonym) as 'control_bt_synonym',
upper(rtrim(IsNull(gls.mandatory_flag, 'N'))),        'N' ,
upper(rtrim(isnull(gls.editable_flag, 'Y'))),          upper(rtrim(isnull(gls.caption_req, 'Y'))),
upper(rtrim(isnull(gls.select_flag, 'N'))),           upper(rtrim(isnull(gls.zoom_req, 'n'))),
upper(rtrim(help_req)),            upper(rtrim(isnull(gls.ellipses_req, 'n'))),
isnull(gls.visisble_rows, IsNull(ctype.visisble_rows, 0)),           upper(isnull(le_data_type,'char')),
isnull(le_data_length,0),             'N',
upper(isnull(gls.caption_wrap,'N')),       upper(isnull(gls.caption_alignment,'LEFT')),
upper(isnull(gls.caption_position,'LEFT')),     isnull(grid.view_name,''),
upper(isnull(gls.ctrl_position,'LEFT')),      upper(isnull(gls.labelclass,'')),
upper(isnull(gls.controlclass,'')),         upper(isnull(gls.password_char,'N')),
upper(isnull(gls.tskimg_class,'')),        upper(isnull(gls.hlpimg_class,'')),
sec.horder,                 sec.vorder,
upper(isnull(gls.html_txt_area,'')),      grid.ref_bt_synonym, isnull(ctype.report_req,'N'),
'Y', -- added by feroz for bug id PNR2.0_18385
-- Added By Feroz
isnull(bulletlink_req,'N'), isnull(buttoncombo_req,'N'), isnull(associatedlist_req,'N'),
isnull(onfocustask_req,'N'), isnull(listrefilltask_req,'N'), isnull(dataascaption,'N'),
isnull(ListEdit_NoofColumns,0), isnull(attach_document, 'N'),isnull(image_upload, 'N'),
isnull(inplace_image, 'N'), isnull(image_row_height, 0), isnull(image_icon, 'N'),
isnull(relative_url_path, ''), isnull(relative_document_path, ''), isnull(relative_image_path, ''),
isnull(save_doc_content_to_db, 'N') , isnull(save_image_content_to_db, 'N'), isnull(Date_highlight, 'N'),
-- Code modified for the Bud ID: PNR2.0_27796 starts
'Y' ,isnull(Lite_Attach_Document,'N'),isnull(Browse_Button_Enable,'N'),isnull(Delete_Button_Enable,'N'),--Code Added For BugId : PNR2.0_18436
isnull(image_row_width,0),isnull(image_preview_height,0),isnull(image_preview_width,0),isnull(image_preview_req,'N'),isnull(Accpet_Type,''),isnull(Lite_Attach_Image,'N'),--PNR2.0_28319 
isnull(timezone, 'N'), isnull(Default_required,'N'),isnull(editcombo_req,'N'),'N',isnull(controlstyle,''),''--Code Modified for PNR2.0_30869 --Code modified for PNR2.0_33378 
-- Code modified for the Bud ID: PNR2.0_27796 ends
,/*'',*/isnull(ctype.ismodal,''),isnull(filesize,''),isnull(TemplateId,''),'',isnull(Email,''),isnull(Phone,''),'','',isnull(TemplateCategory,''),isnull(TemplateSpecific,''),'',
'','','', 'NA', '', 0,'','N'	--TECH-75230 --TECH-77097
from     #de_published_LogicExt_ui_grid_dtl_vw_tmp      grid (nolock),
de_published_ui_control         ctrl (nolock),
de_published_ui_section         sec (nolock),
de_log_ext_ctrl_met_vw        gls (nolock),
es_comp_ctrl_type_mst_vw         ctype (nolock)
where   grid.customer_name    = ctrl.customer_name
and    grid.project_name    = ctrl.project_name
and    grid.ecrno       = ctrl.ecrno
and    grid.process_name    = ctrl.process_name
and    grid.component_name    = ctrl.component_name
and    grid.activity_name    = ctrl.activity_name
and    grid.ui_name      = ctrl.ui_name
and    grid.page_bt_synonym   = ctrl.page_bt_synonym
and    grid.section_bt_synonym = ctrl.section_bt_synonym
and    grid.control_bt_synonym = ctrl.control_bt_synonym

and    ctrl.customer_name    = sec.customer_name
and    ctrl.project_name    = sec.project_name
and    ctrl.ecrno       = sec.ecrno
and    ctrl.process_name    = sec.process_name
and    ctrl.component_name    = sec.component_name
and    ctrl.activity_name    = sec.activity_name
and    ctrl.ui_name      = sec.ui_name
and    ctrl.page_bt_synonym   = sec.page_bt_synonym
and    ctrl.section_bt_synonym = sec.section_bt_synonym

and    grid.customer_name    = gls.le_customer_name
and    grid.project_name    = gls.le_project_name
--   and   grid.column_bt_synonym  *= gls.bt_synonym_name
and    grid.ref_bt_synonym   = gls.le_control --CODE MODIFIED BY GIRI FOR LOGICAL EXTENSION FIX

and   grid.customer_name    = ctype.customer_name
and   grid.project_name    = ctype.project_name
and   grid.process_name    = ctype.process_name
and   grid.component_name    = ctype.component_name
and   grid.column_type    = ctype.ctrl_type_name

and   sec.customer_name    = @engg_customer_name
and   sec.project_name    = @engg_project_name
and   sec.ecrno        = @engg_req_no
and   sec.process_name    = @process_name
and   sec.component_name    = @engg_component
and   sec.activity_name    = @activity_name
and   sec.ui_name        = @ui_name_tmp
and   @itk_flag   = 1
and grid.view_name not in ('__nodeexpand','__nodeid','__parentnodeid','__icon','__icls')
order by page_bt_synonym, section_bt_synonym, control_bt_synonym, column_no
-- For each Grid Column generate entries
open gridcurs
while (1=1)
begin
fetch next from gridcurs into
@column_bt_synonym_tmp,  @col_descr_tmp,    @controlid_tmp,
@column_type_tmp,    @base_ctrl_type_tmp,   @column_no_tmp,
@visible_length_tmp,   @proto_tooltip_tmp,   @sample_data_tmp,
@page_bt_synonym_tmp,   @section_bt_synonym_tmp, @control_bt_synonym_tmp,
@mandatory_flag_tmp,   @visible_flag_tmp,    @editable_flag_tmp,
@caption_req_tmp,    @select_flag_tmp,    @zoom_req_tmp,
@help_req_tmp,     @ellipses_req_tmp,    @visible_rows_tmp,
@datatype_tmp,    @datalength_tmp,   @controldoc_tmp,
@caption_wrap_tmp,   @caption_alignment_tmp,  @caption_position_tmp,
@viewname_tmp,    @ctrl_position_tmp,   @label_class_tmp,
@ctrl_class_tmp,   @password_char_tmp,   @task_img_tmp,
@help_img_tmp,    @tab_sec_horder,   @tab_sec_vorder,
@html_text_area,   @le_ref_column_bt_synonym_tmp, @report_reqd,
@itk_req, -- added by feroz for bug id PNR2.0_18385
-- Added By Feroz
@bulletlink_req,   @buttoncombo_req,   @associatedlist_req,
@onfocustask_req,   @listrefilltask_req,  @dataascaption,
@listedit_NoofColumns,  @attach_document,   @image_upload,
@inplace_image,    @image_row_height,   @image_icon,
@relative_url_path,   @relative_document_path, @relative_image_path,
@save_doc_content_to_db, @save_image_content_to_db,  @Date_highlight_req,
-- Code modified for the Bud ID: PNR2.0_27796 starts
@Set_User_Pref,@Lite_Attach,@BrowseButton,@DeleteButton,--Code Added For BugId : PNR2.0_18436
@image_row_width,@image_preview_height,@image_preview_width,@image_preview_req,@Accept_Type,@Lite_Attach_Image,--PNR2.0_28319 
@timezone, @default_required ,@editcombo_req,@ColumnClass,@ColumnStyle,@Forcefit  --Code Modified for PNR2.0_30869  --Code modified for PNR2.0_33378
-- Code modified for the Bud ID: PNR2.0_27796 ends
,/*@columnhdrclass,*/@ismodal,@filesize,@TemplateId,@col_caption_align,@Email,@Phone,@col_data_align,@avn_download
,@TemplateCat,@TemplateSpecific,@Control_class_ext6, @rowexpander, @gridtoform,@icon_class, @CompactView,
@IsExtension, @ExtensionOrder, @ColIconPosition, @Colsystemclass	--TECH-75230 --TECH-77097

if @@fetch_status <> 0
break

select @tab_seq_tmp  = ''

set  @Control_cls_ext6 = ''
--set  @Icon_Class = '' 
--if isnull(@rowexpander,'') = 'Y'
--	select @renderas = 'RowExpander'
--Else if isnull(@gridtoform,'') = 'Y'
--	select @renderas = 'GridtoForm'
--Else
 --select @renderas = @column_type_tmp
 -- Added for the Defect ID: TECH-37471 Starts for Set & LEave Focus Events
set @setfocusevent			= ''
set @leavefocusevent		= ''
set @setfocuseventoccur		= ''
set @leavefocuseventoccur	= ''
set @DirectPrint			= ''
set @SpellCheckRequired		= ''
set	@UPEEnabled				= ''
set @MoreEventName			= ''

select	@setfocusevent		= upper(isnull(task_name,''))
from	de_published_action (nolock)
where	customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		ecrno				= @engg_req_no
and		process_name		= @process_name
and		component_name		= @engg_component
and		activity_name		= @activity_name
and		ui_name				= @ui_name_tmp
and		page_bt_synonym		= @page_bt_synonym_tmp
and		primary_control_bts	= @column_bt_synonym_tmp
and		task_descr			like 'Set Focus Event For%'

select	@leavefocusevent	= upper(isnull(task_name,''))
from	de_published_action (nolock)
where	customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		ecrno				= @engg_req_no
and		process_name		= @process_name
and		component_name		= @engg_component
and		activity_name		= @activity_name
and		ui_name				= @ui_name_tmp
and		page_bt_synonym		= @page_bt_synonym_tmp
and		primary_control_bts	= @column_bt_synonym_tmp
and		task_descr			like 'Leave Focus Event For%'
-- Added for the Defect ID: TECH-37471 Ends for Set & LEave Focus Events

SELECT	@setfocuseventoccur		= isnull(SetFocusEventOccurence, ''),
		@leavefocuseventoccur	= isnull(LeaveFocusEventOccurence, ''),
		@DirectPrint			= ISNULL(DirectPrint,''),
		@SpellCheckRequired		= ISNULL(IsSpellCheck,'')
FROM	es_comp_ctrl_type_mst_extn (NOLOCK)
where	customer_name		= @engg_customer_name
and		project_name		= @engg_project_name
and		process_name		= @process_name
and		component_name		= @engg_component
and		ctrl_type_name		= @column_type_tmp

	--11536
	IF	ISNULL (@UPEEnabled_Comp,'')	= 'y'
	BEGIN

		SELECT	@MoreEventName		= UPPER(ISNULL(MoreEvent,''))
		FROM	de_published_upe_control (NOLOCK)
		WHERE	customername		=	@engg_customer_name
		AND		projectname			=	@engg_project_name
		AND		ECRNumber			=	@engg_req_no
		AND		processname			=	@process_name
		AND		componentname		=	@engg_component
		AND		activityname		=	@activity_name
		AND		uiname				=	@ui_name_tmp
		AND		PageName			=	@page_bt_synonym_tmp
		AND		BTSynonymName		=	@control_bt_synonym_tmp
		AND		ISNULL(MoreEvent,'') <> ''

		IF EXISTS ( SELECT 'X'
					FROM	de_published_upe_control (NOLOCK)
					WHERE	customername		=	@engg_customer_name
					AND		projectname			=	@engg_project_name
					AND		ECRNumber			=	@engg_req_no
					AND		processname			=	@process_name
					AND		componentname		=	@engg_component
					AND		activityname		=	@activity_name
					AND		uiname				=	@ui_name_tmp
					AND		PageName			=	@page_bt_synonym_tmp
					AND		BTSynonymName		=	@control_bt_synonym_tmp	)
					BEGIN
						SELECT	@UPEEnabled	=	'Y'
					END
		
		IF ISNULL(@UPEEnabled,'N') = 'Y'
		BEGIN
			
			SELECT		@setfocusevent	=	UPPER(ISNULL(SetFocusEvent,''))
			FROM	de_published_upe_control (NOLOCK)
			WHERE	customername		=	@engg_customer_name
			AND		projectname			=	@engg_project_name
			AND		ECRNumber			=	@engg_req_no
			AND		processname			=	@process_name
			AND		componentname		=	@engg_component
			AND		activityname		=	@activity_name
			AND		uiname				=	@ui_name_tmp
			AND		PageName			=	@page_bt_synonym_tmp
			AND		BTSynonymName		=	@control_bt_synonym_tmp
			AND		ISNULL(IsSetFocus,'') = 'Y'
		
		END
	END

select @renderas = @base_ctrl_type_tmp

select	@SparkChart			= isnull(SparkChartType,''),
		@DynamicFileUpload	= ISNULL(DynamicFileUpload, 'N')
from    es_comp_ctrl_type_mst_extn (nolock)
where   customer_name   = @engg_customer_name
and		project_name    = @engg_project_name
and		process_name     = @process_name
and		component_name   = @engg_component
and		ctrl_type_name   = @column_type_tmp

-- Added for TECH-46646 
IF ISNULL(@image_icon, 'N') = 'Y' AND ISNULL(@DynamicFileUpload,'N') = 'Y'
	SELECT @ImageType = 'Dynamic'
ELSE IF ISNULL(@image_icon, 'N') = 'Y' AND ISNULL(@relative_image_path,'') <> ''AND ISNULL(@DynamicFileUpload,'N') = 'N'
	SELECT @ImageType = 'Static'


If isnull(@SparkChart,'') <> ''
	select @renderas = 'Spark Chart'


--- MetaDataBasedLink Starts --	
--Declare @MetaDataBasedLink	engg_flag

--select	@MetaDataBasedLink		= isnull(MetaDataBasedLink,'')
--from    es_comp_ctrl_type_mst_extn (nolock)
--where   customer_name   = @engg_customer_name
--and		project_name    = @engg_project_name
--and		process_name    = @process_name
--and		component_name  = @engg_component
--and		ctrl_type_name	= @column_type_tmp


--if isnull(@MetaDataBasedLink,'') <> ''
--select @renderas = 'MetaDataBasedLink'

--- MetaDataBasedLink Ends--	


If @datatype_tmp in ('Integer','Numeric') and @col_data_align ='Left'
	Set @col_data_align = 'RIGHT'

--For Control Class implementation ext6
If @Control_class_ext6 <> '' and   charindex('~',@Control_class_ext6) <> 0 
	begin 
		Set  @Control_cls_ext6   = substring(@Control_class_ext6,1,charindex('~',@Control_class_ext6)-1)
		Set  @Icon_Class 		 = substring(@Control_class_ext6,charindex('~',@Control_class_ext6)+1,len(@Control_class_ext6))
	end

If @Control_class_ext6 <> '' and   charindex('~',@Control_class_ext6) = 0 
			Set  @Control_cls_ext6   = @Control_class_ext6

select @tab_seq_tmp  = tab_index
from @temp_tab_index
where ui_name    = @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  control_bt_synonym = @column_bt_synonym_tmp

--Code Added For BugId : PNR2.0_18436 Starts Here

IF @Set_User_Pref = 'Y'
Select @Set_User_Pref = 'Yes'
Else if @Set_User_Pref = 'N'
Select @Set_User_Pref = 'No'


	
If @datatype_tmp not in('Numeric','Integer') --code modified for bugid : PNR2.0_19581
Select @Set_User_Pref = 'YES'
--Code Added For BugId : PNR2.0_18436 Ends Here


if isnull ( @tab_seq_tmp , '' ) = ''
begin
select @tab_seq = ''
end
else
begin
select @tab_seq = @tab_seq_tmp
end

if @report_reqd = ''  or isnull(@report_reqd,'') = ''
select @report_reqd = 'N'


if @datatype_tmp = 'Numeric'
begin

if @itk_flag = 1 and @le_ref_column_bt_synonym_tmp <> ''
begin
select  @decimal_length_grid  = le_decimallength
from  de_log_ext_ctrl_met_vw  gls (nolock)
where  gls.le_customer_name   = @engg_customer_name
and   gls.le_project_name   = @engg_project_name
and   gls.le_control   = @le_ref_column_bt_synonym_tmp
end
else
begin

select @decimal_length_grid =  decimal_length
from @de_published_glossary_lng_extn  gls ,--(nolock),
de_published_business_term  bts (nolock),
de_published_precision_type  pt  (nolock)
where gls.customer_name  = bts.customer_name
and gls.project_name  = bts.project_name
and gls.ecrno   = bts.ecrno
and gls.process_name  =  bts.process_name
and gls.component_name  =  bts.component_name
and gls.bt_name   = bts.bt_name
and bts.customer_name  = pt.customer_name
and bts.project_name  = pt.project_name
and bts.ecrno   = pt.ecrno
and bts.process_name  =  pt.process_name
and bts.component_name  =  pt.component_name
and bts.precision_type  = pt.pt_name
and gls.customer_name  =   @engg_customer_name
and gls.project_name  = @engg_project_name
--Code modified for bugid : PNR2.0_9660
and gls.ecrno   =  @engg_req_no
and gls.process_name  = @process_name
and gls.component_name  = @engg_component
and gls.bt_synonym_name  =  @column_bt_synonym_tmp
--and gls.languageid   =  @language_code

end

if isnull(@decimal_length_grid, -915) = -915
begin
select @decimal_length_grid = 3
end

end
else
begin
select @decimal_length_grid = 0
end


select @default_sample_data_tmp    = ''

if @sample_data_from = 'Layout' and len(@sample_data_tmp) = 0
begin
if @base_ctrl_type_tmp in ('Edit','Button','Links','RadioButton','CheckBox','DataHyperLink')
begin
if @itk_flag = 1
begin

select @sample_data_tmp  =  isnull(singleinst_sample_data,'')
from  @de_published_glossary_lng_extn-- (nolock)
where  customer_name    = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name    = @process_name
and   component_name   = @engg_component
and   ecrno			= @engg_req_no
and   bt_synonym_name   = @le_ref_column_bt_synonym_tmp
--and   languageid     = @language_code
end
else
begin
select  @sample_data_tmp  =  isnull(singleinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and project_name  = @engg_project_name
and process_name  = @process_name
and component_name  = @engg_component
and ecrno   =  @engg_req_no
and bt_synonym_name  =  @column_bt_synonym_tmp
--and languageid  =  @language_code
end
end
else
begin
if @itk_flag = 1
begin
select @sample_data_tmp  =  isnull(multiinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @le_ref_column_bt_synonym_tmp
--and  languageid   =  @language_code
end
else
begin
select @sample_data_tmp  =  isnull(multiinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @column_bt_synonym_tmp
--and  languageid   =  @language_code
end
end
end

if @sample_data_from = 'Glossary'
begin
if @base_ctrl_type_tmp in ('Edit','Button','Links','RadioButton','CheckBox','DataHyperLink')
begin
if @itk_flag = 1
begin
select @sample_data_tmp  =  isnull(singleinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @le_ref_column_bt_synonym_tmp
--and  languageid   = @language_code
end
else
begin
select @sample_data_tmp  =  isnull(singleinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @control_bt_synonym_tmp
--and  languageid   =  @language_code
end
end
else
begin
if @itk_flag = 1
begin
select @sample_data_tmp  =  isnull(multiinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  = @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    =  @engg_req_no
and  bt_synonym_name  =  @le_ref_column_bt_synonym_tmp
--and  languageid   =  @language_code
end
else
begin
select @sample_data_tmp  =  isnull(multiinst_sample_data,'')
from @de_published_glossary_lng_extn-- (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  bt_synonym_name  =  @column_bt_synonym_tmp
--and  languageid   =  @language_code
end
end
end

select @default_sample_data_tmp = isnull(enum_caption,'')
from de_published_enum_value (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    = @engg_req_no
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @column_bt_synonym_tmp
and  default_flag  = 'Y'

if @base_ctrl_type_tmp = 'Combo'
begin
if @default_sample_data_tmp = ''
begin
if charindex('~',@sample_data_tmp,1)-1 > 0
select @default_sample_data_tmp = substring(@sample_data_tmp,1,charindex('~',@sample_data_tmp,1)-1)
else
select @default_sample_data_tmp = @sample_data_tmp
end
end
SELECT	@sectionlaunchtype = 'Y'

select 	@popup_page = PopUp_page_bt_synonym ,@popup_section = PopUp_section,@popup_close = upper(PopUp_close),
@sectionlaunchtype = sectionlaunchtype
from	de_published_action (nolock)
where	customer_name		=  	@engg_customer_name
and		project_name		=	@engg_project_name
and		ecrno				= 	@engg_req_no
and		process_name		=	@process_name
and		component_name		=	@engg_component
and		activity_name		=	@activity_name
and		ui_name				=	@ui_name_tmp
and		page_bt_synonym		= 	@page_bt_synonym_tmp
and		primary_control_bts	=	@control_bt_synonym_tmp

if isnull(@sectionlaunchtype,'') = 'SideDrawer'
	select @IsSideDrawer = 'Y'

---For Tooltip

Select	@proto_tooltip_tmp = isnull(tooltip,'')
from	de_published_ui_tooltip_lng_extn
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ecrno    = @engg_req_no
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
and	 column_bt_synonym = @column_bt_synonym_tmp
and  languageid   =  @language_code


-- For Static Control Types Sample Data Starts
if exists  (select 'x'
from es_comp_stat_ctrl_type_mst (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  ctrl_type_name  = @column_type_tmp)
begin
select @sample_data_tmp = dbo.engg_get_static_ctrl_values(
@engg_customer_name,
@engg_project_name,
@engg_req_no,
@process_name,
@engg_component,
@language_code,
@column_type_tmp,
'C')

select @default_sample_data_tmp = dbo.engg_get_static_ctrl_def_value(
@engg_customer_name,
@engg_project_name,
@engg_req_no,
@process_name,
@engg_component,
@language_code,
@column_type_tmp,
'C')
end
-- For Static Control Types Sample Data Ends


select @col_descr_tmp = replace(@col_descr_tmp,'&','&amp;')
select @col_descr_tmp = replace(@col_descr_tmp,'<','&lt;')
select @col_descr_tmp = replace(@col_descr_tmp,'>','&gt;')
select @col_descr_tmp = replace(@col_descr_tmp,'"','&quot;')
--select @col_descr_tmp = replace(@col_descr_tmp,'--nocaption--','')

select @sample_data_tmp = replace(@sample_data_tmp,'&','&amp;')
select @sample_data_tmp = replace(@sample_data_tmp,'<','&lt;')
select @sample_data_tmp = replace(@sample_data_tmp,'>','&gt;')
select @sample_data_tmp = replace(@sample_data_tmp,'"','&quot;')

select @default_sample_data_tmp = replace(@default_sample_data_tmp,'&','&amp;')
select @default_sample_data_tmp = replace(@default_sample_data_tmp,'<','&lt;')
select @default_sample_data_tmp = replace(@default_sample_data_tmp,'>','&gt;')
select @default_sample_data_tmp = replace(@default_sample_data_tmp,'"','&quot;')

select @controldoc_tmp = replace(@controldoc_tmp,'&','&amp;')
select @controldoc_tmp = replace(@controldoc_tmp,'<','&lt;')
select @controldoc_tmp = replace(@controldoc_tmp,'>','&gt;')
select @controldoc_tmp = replace(@controldoc_tmp,'"','&quot;')

if @base_ctrl_type_tmp in ('Edit','Combo','CheckBox','RadioButton') /*PNR2.0_29361*/
select @default_for_tmp = 'UI'
else if @base_ctrl_type_tmp in ('Button')
select @default_for_tmp = 'Trans'
else if @base_ctrl_type_tmp in ('Link')
select @default_for_tmp = 'Trans'

if @base_ctrl_type_tmp in ('Link')  and @report_reqd = 'N'
select @default_for_tmp = 'Link'
else if @base_ctrl_type_tmp in ('Link')  and @report_reqd = 'Y'
select @default_for_tmp = 'Report'

-- associated ml for hub issue starts

if @base_ctrl_type_tmp in ('Datahyperlink')  and @report_reqd = 'N'
select @default_for_tmp = 'Link'
else if @base_ctrl_type_tmp in ('Datahyperlink')  and @report_reqd = 'Y'
select @default_for_tmp = 'Report'

-- associated ml for hub issue Ends 

--Code addition  for  PNR2.0_20049  starts

select @data_type_grid   =  bts.data_type
from @de_published_glossary_lng_extn gls ,--(nolock),
de_business_term    bts (nolock)
where gls.customer_name   = bts.customer_name
and   gls.project_name    = bts.project_name
and   gls.process_name    = bts.process_name
and   gls.component_name  = bts.component_name
and   gls.bt_name       = bts.bt_name
and   gls.customer_name   = @engg_customer_name
and   gls.project_name    = @engg_project_name
and   gls.process_name    = @process_name
and   gls.component_name  = @engg_component
and   gls.bt_synonym_name = @column_bt_synonym_tmp
--and   gls.languageid      = @language_code
and   gls.ecrno    = @engg_req_no

if @data_type_grid <> 'char'
select @ellipses_req_tmp  = 'N'

--Code addition  for  PNR2.0_20049  ends


select @helptext = @col_descr_tmp + ' - Datatype : ' + ltrim(rtrim(isnull(@datatype_tmp,'')))
+ ' - MaxLength : ' + ltrim(rtrim(isnull(@datalength_tmp,'')))

-- For Associated Task
if exists  (select 'x'
from de_published_action  a (nolock),
es_comp_task_type_mst  b (nolock)
where  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.component_name  = b.component_name
and  a.task_pattern   = b.task_type_name
and  a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.primary_control_bts = @column_bt_synonym_tmp
and  a.task_pattern   = b.task_type_name
and  a.task_type    = @default_for_tmp)
begin
	IF ISNULL(@UPEEnabled_Comp,'N')	=	'N'
	BEGIN
		select	@uitaskname_tmp		 = upper(task_name)
		from	de_published_action  a (nolock),
				es_comp_task_type_mst  b (nolock)
		where	a.customer_name			=	b.customer_name
		and		a.project_name			=	b.project_name
		and		a.component_name		=	b.component_name
		and		a.task_pattern			=	b.task_type_name
		and		a.customer_name			=	@engg_customer_name
		and		a.project_name			=	@engg_project_name
		and		a.ecrno					=	@engg_req_no
		and		a.process_name			=	@process_name
		and		a.component_name		=	@engg_component
		and		a.activity_name			=	@activity_name
		and		a.ui_name				=	@ui_name_tmp
		and		a.page_bt_synonym		=	@page_bt_synonym_tmp
		and		a.primary_control_bts	=	@column_bt_synonym_tmp
		and		a.task_pattern			=	b.task_type_name
		and		a.task_type				=	@default_for_tmp
		AND		ISNULL(a.SystemGenerated,'N') <> 'Y'	 -- TECH-73216
	END
	ELSE
	BEGIN
		SELECT	@uitaskname_tmp		 = UPPER(task_name)
		FROM	de_published_action  a (NOLOCK),
				es_comp_task_type_mst  b (NOLOCK)
		WHERE	a.customer_name			=	b.customer_name
		AND		a.project_name			=	b.project_name
		AND		a.component_name		=	b.component_name
		AND		a.task_pattern			=	b.task_type_name
		AND		a.customer_name			=	@engg_customer_name
		AND		a.project_name			=	@engg_project_name
		AND		a.ecrno					=	@engg_req_no
		AND		a.process_name			=	@process_name
		AND		a.component_name		=	@engg_component
		AND		a.activity_name			=	@activity_name
		AND		a.ui_name				=	@ui_name_tmp
		AND		a.page_bt_synonym		=	@page_bt_synonym_tmp
		AND		a.primary_control_bts	=	@column_bt_synonym_tmp
		AND		a.task_pattern			=	b.task_type_name
		AND		a.task_type				=	@default_for_tmp
		AND		ISNULL(a.SystemGenerated,'N') <> 'Y'	 -- TECH-73216
		AND NOT EXISTS ( SELECT 'X'
				 FROM	de_upe_control c(NOLOCK)
				 WHERE	c.CustomerName		=	a.Customer_Name
				 AND	c.ProjectName		=	a.Project_Name
				 AND	c.ProcessName		=	a.Process_Name
				 AND	c.ComponentName		=	a.Component_Name
				 --AND	c.EcrNumber			=	a.ecrno
				 AND	c.ActivityName		=	a.Activity_Name
				 AND	c.UIName			=	a.UI_Name
				 AND	c.BTSynonymName		=	a.Primary_Control_bts
				 AND	c.MoreEvent			=	a.Task_Name	)
	END
end
else
begin
select @uitaskname_tmp  = ''
end


-- Code added by feroz for extjs -- start  --PNR2.0_1790
select @extjs_values = '',
@type_prefix = '',
@callout_task_tmp = 'N',
@pivot_prop_tmp = ''
,@treeGrdNew	= ''

if exists ( select  'x'
from  de_published_ui_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno        =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  section_type   in ('Text Scroller', 'Formatted Text','Report List', 'Property Window', 'Pivot', 'Tree Grid'))
begin  -- 1

select  @section_type   =  section_type
from  de_published_ui_section (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno        =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp

select  @type_prefix = type_prefix
from  ep_extjs_metadata_dtl(nolock)
where  Extjs_type = @section_type
and  task_req  = 'y'


if  (@section_bt_synonym_tmp + '_' + @type_prefix = @column_bt_synonym_tmp)
begin  -- 2

select  @uitaskname_tmp  = upper(isnull(RVW_Task,'')),
@sample_data_tmp = isnull(sample_data, ''),
@callout_task_tmp = case when isnull(callout_task,0) = 0 then 'N' else 'Y' end -- code moodified by feroz for bug id: PNR2.0_21040
from  de_published_ext_js_section a (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
end -- 2


if exists ( select  'x'
from  de_published_ext_js_section_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
and  column_bt_synonym  =  @column_bt_synonym_tmp)
begin -- 4
select  @uitaskname_tmp  = upper(isnull(RVW_Task,'')),
@sample_data_tmp = isnull(sample_data, ''),
@callout_task_tmp = case when isnull(callout_task,0) = 0 then 'N' else 'Y' end, -- code moodified by feroz for bug id: PNR2.0_21040
@label_class_tmp = isnull(label_class,''),
@ctrl_class_tmp  = isnull(control_class,''),
@pivot_prop_tmp  = ' GroupingSynonym="' +  isnull(grouping_synonym,'') + '" GroupingFunction="'+ isnull(grouping_function,'') + '" PivotSeqno="' + (convert(varchar,isnull(pivot_sequence,0))) + '" FieldList="' + case when isnull(FieldList,0) = 0 then 'N'



else 'Y' end + '" DragOption="' + isnull(Default_Dragoption,'') + '" IsKey="' + case when isnull(IS_Key,0) = 0 then 'N' else 'Y' end + '" '

from  de_published_ext_js_section_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
and  column_bt_synonym  =  @column_bt_synonym_tmp
end -- 4

if exists ( select  'x'
from  de_published_ext_js_section_column (nolock)
where customer_name		= @engg_customer_name
and  project_name		= @engg_project_name
and  ecrno				= @engg_req_no
and  process_name		= @process_name
and  component_name		= @engg_component
and  activity_name		= @activity_name
and  ui_name			= @ui_name_tmp
and  page_bt_synonym	= @page_bt_synonym_tmp
and  section_bt_synonym = @section_bt_synonym_tmp
and  control_bt_synonym = @control_bt_synonym_tmp
and  column_bt_synonym  = @column_bt_synonym_tmp
and	 section_type		='Tree Grid')
begin -- 4
Select /*@visible_length_tmp	= ISNULL(visible_length,@visible_length_tmp)
--,@treeGrdNew		= 'ImageColumn="' +  isnull(image_column,'') + '" '
,*/@ColumnStyle		= ISNULL(image_column,'')
from  de_published_ext_js_section_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp
and  column_bt_synonym  =  @column_bt_synonym_tmp
end -- 4

end -- 1

if exists ( select 'x'
from    es_comp_ctrl_type_mst_vw ty (nolock),
de_published_ui_control  ct (nolock)
where   ty.customer_name     =  ct.customer_name
and    ty.project_name     =  ct.project_name
and    ty.process_name     =  ct.process_name
and    ty.component_name    =  ct.component_name
and    ty.ctrl_type_name    =  ct.control_type
and  ct.customer_name  =   @engg_customer_name
and  ct.project_name   = @engg_project_name
and  ct.ecrno    =  @engg_req_no
and  ct.process_name   = @process_name
and  ct.component_name  = @engg_component
and  ct.activity_name  = @activity_name
and  ct.ui_name    = @ui_name_tmp
and  ct.page_bt_synonym  =  @page_bt_synonym_tmp
and  ct.section_bt_synonym =  @section_bt_synonym_tmp
and  ct.control_bt_synonym =  @control_bt_synonym_tmp
and  ty.Is_Extjs_Control = 'y')
begin -- 1
select  @extjs_ctrl_type = ty.Extjs_Ctrl_type,
@control_type_tmp = ct.control_type
from    es_comp_ctrl_type_mst_vw ty (nolock),
de_published_ui_control   ct (nolock)
where   ty.customer_name     =  ct.customer_name
and    ty.project_name     =  ct.project_name
and    ty.process_name     =  ct.process_name
and    ty.component_name    =  ct.component_name
and    ty.ctrl_type_name    =  ct.control_type
and  ct.customer_name  =   @engg_customer_name
and  ct.project_name   = @engg_project_name
and  ct.ecrno    =  @engg_req_no
and  ct.process_name   = @process_name
and  ct.component_name  = @engg_component
and  ct.activity_name  = @activity_name
and  ct.ui_name    = @ui_name_tmp
and  ct.page_bt_synonym  =  @page_bt_synonym_tmp
and  ct.section_bt_synonym =  @section_bt_synonym_tmp
and  ct.control_bt_synonym =  @control_bt_synonym_tmp
and  ty.Is_Extjs_Control = 'y'

if @extjs_ctrl_type in ('TextType Writer', 'Marquee Ticker', 'EMail')
begin -- 2

select  @type_prefix = type_prefix
from  ep_extjs_metadata_dtl (nolock)
where  Extjs_type = @extjs_ctrl_type
and  task_req = 'y'

if (@control_bt_synonym_tmp + '_' + @type_prefix = @column_bt_synonym_tmp)
begin -- 3
select  @uitaskname_tmp  = upper(isnull(RVW_Task,'')),
@sample_data_tmp = isnull(sample_data, ''),
@callout_task_tmp = case when isnull(callout_task,0) = 0 then 'N' else 'Y' end -- code moodified by feroz for bug id: PNR2.0_21040
from  de_published_ext_js_control (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_bt_synonym  =  @page_bt_synonym_tmp
and  section_bt_synonym =  @section_bt_synonym_tmp
and  control_bt_synonym =  @control_bt_synonym_tmp

end -- 3
end -- 2
end -- 1

-- Code Added By Feroz For List edit
select @associatedlist_name = '',
@primary_search_column = '',
@list_index_search  = '',
@hidden_view_name  = '',
@mapped_list_controlid = '',
@mapped_list_viewname = ''


if isnull(@date_highlight_req, 'N') = 'Y'
begin
select top 1 @associatedlist_name = upper(a.listedit_controlid)
from de_published_date_highlight_control_map a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name  = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  a.control_bt_synonym = @column_bt_synonym_tmp

select @mapped_list_controlid = Upper(controlid),
@mapped_list_viewname  = Upper(viewname)
from #maplist -- code modified by gopinath S for the call ID PNR2.0_24034
where activityname = @activity_name
and  ilbocode  = @ui_name_tmp
and  listedit  = @associatedlist_name
end
-- Modified By feroz for bug id :PNR2.0_23463
if exists ( select 'x'
from de_published_date_highlight_control_map a (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.listedit_synonym  = @control_bt_synonym_tmp)
begin
select @base_ctrl_type_tmp = 'LISTEDIT'
end
-- Modified By feroz for bug id :PNR2.0_23463

if isnull(@associatedlist_req, 'N') = 'Y'
begin

select top 1 @associatedlist_name = Upper(b.listedit_controlid)
from de_published_listedit_control_map a (nolock),
de_published_listedit_column  b (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.page_bt_synonym  = @page_bt_synonym_tmp
and  a.section_bt_synonym = @section_bt_synonym_tmp
and  a.mapped_bt_synonym  = @column_bt_synonym_tmp
and  a.customer_name   = b.customer_name
and  a.project_name   = b.project_name
and  a.ecrno     = b.ecrno
and  a.process_name   = b.process_name
and  a.component_name  = b.component_name
and  a.activity_name   = b.activity_name
and  a.ui_name    = b.ui_name
and  a.listedit_synonym  = b.listedit_synonym

select @mapped_list_controlid  = Upper(controlid),
@mapped_list_viewname  = Upper(viewname)
from #maplist -- code modified by gopinath S for the call ID PNR2.0_24034
where activityname = @activity_name
and  ilbocode  = @ui_name_tmp
and  listedit  = @associatedlist_name

end
-- Modified By feroz for bug id :PNR2.0_23463
if exists ( select 'x'
from de_published_listedit_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    = @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  listedit_synonym = @control_bt_synonym_tmp)
begin
select @base_ctrl_type_tmp = 'LISTEDIT'
end
-- Modified By feroz for bug id :PNR2.0_23463
if exists ( select  'x'
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @column_type_tmp
and (isnull(attach_document, 'N') = 'Y'
or  isnull(image_upload, 'N') = 'Y')
and	 (isnull(save_doc_content_to_db,'N')='Y' --Code modified for the Bug ID:PLF2.0_04457
or	isnull(save_image_content_to_db,'N')='Y'))
begin
select @hidden_view_name = view_name
from de_hidden_view (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  page_name   =  @page_bt_synonym_tmp
and  section_name  =  @section_bt_synonym_tmp
and  control_bt_synonym =  @column_bt_synonym_tmp
end

if exists ( select 'x'
from de_published_listedit_column (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    = @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  listedit_synonym = @control_bt_synonym_tmp
and  listedit_column_synonym = @column_bt_synonym_tmp)
select @viewname_tmp =  lower(@controlid_tmp) + lower(@viewname_tmp)


-- Code Added By Feroz For List edit
-- Modified By feroz for bug id :PNR2.0_23654
select  @visible_rows_tmp = visisble_rows
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and   project_name    = @engg_project_name
and   process_name     = @process_name
and   component_name   = @engg_component
and   ctrl_type_name   = @column_type_tmp  -- Modified By Feroz for bug id : PNR2.0_23862
-- Modified By feroz for bug id :PNR2.0_23654

select @sample_data_tmp = replace(@sample_data_tmp,'&','&amp;')
select @sample_data_tmp = replace(@sample_data_tmp,'<','&lt;')
select @sample_data_tmp = replace(@sample_data_tmp,'>','&gt;')
select @sample_data_tmp = replace(@sample_data_tmp,'"','&quot;')

-- Code added by feroz for extjs -- end --PNR2.0_1790

--Code modified by Kanagavel A to allow values given in grid info
--code modified for PLF2.0_07135 starts
if @base_ctrl_type_tmp = 'LISTEDIT'
begin
	select @visible_length_tmp = 0
	if exists ( select 'x'
				from ep_listedit_column_dtl(nolock)
				where customer_name				= @engg_customer_name
				and  project_name				= @engg_project_name
				and  process_name				= @process_name
				and  component_name				= @engg_component
				and  activity_name				= @activity_name
				and  ui_name					= @ui_name_tmp
				and  listedit_controlid 		= @controlid_tmp
				and	 listedit_column_synonym	= @column_bt_synonym_tmp
				and		isnull(visible_length,0)<> 0)
				begin 
					select @visible_length_tmp = visible_length
					from ep_listedit_column_dtl(nolock)
					where customer_name				= @engg_customer_name
					and  project_name				= @engg_project_name
					and  process_name				= @process_name
					and  component_name				= @engg_component
					and  activity_name				= @activity_name
					and  ui_name					= @ui_name_tmp
					and  listedit_controlid 		= @controlid_tmp
					and	 listedit_column_synonym	= @column_bt_synonym_tmp
					and		isnull(visible_length,0)<> 0
				end
end
--code modified for PLF2.0_07135 End

--PLF2.0_07231 starts
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'&','&amp;')
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'<','&lt;')
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'>','&gt;')
select @proto_tooltip_tmp = replace(@proto_tooltip_tmp,'"','&quot;')

select @sample_data_tmp = replace(@sample_data_tmp,'&','&amp;')
select @sample_data_tmp = replace(@sample_data_tmp,'<','&lt;')
select @sample_data_tmp = replace(@sample_data_tmp,'>','&gt;')
select @sample_data_tmp = replace(@sample_data_tmp,'"','&quot;')
--PLF2.0_07231 

--if isnull(@viewname_tmp,'') in ( 'tagkeyfield','tagseqno','tagvalue')
--	select @viewname_tmp = CONVERT(VARCHAR,@column_no_tmp)

select	@editmask		= isnull(EditMask,'N')
from    es_comp_ctrl_type_mst (nolock)
where   customer_name   = @engg_customer_name
and		project_name    = @engg_project_name
and		process_name    = @process_name
and		component_name  = @engg_component
and		ctrl_type_name	= @column_type_tmp

If isnull(@editmask,'N')	= 'Y'	
BEGIN
		select @column_type_tmp = 'EDITMASK'
		SELECT @base_ctrl_type_tmp = 'EDITMASK' --TECH-77908
END
	else
	BEGIN
		select @column_type_tmp = @column_type_tmp
	END

--- TECH-23600 Starts
if @base_ctrl_type_tmp in ('Datahyperlink')  
select @base_ctrl_type_tmp = 'Link'

--- TECH-23600 Ends

-- Added for TECH-35368 For Calendar Starts
if exists ( select 'x'
from    es_comp_ctrl_type_mst_vw typ (nolock),
		de_published_ui_control  ctl (nolock)
where   typ.customer_name		= ctl.customer_name
and		typ.project_name		= ctl.project_name
and		typ.process_name		= ctl.process_name
and		typ.component_name		= ctl.component_name
and		typ.ctrl_type_name		= ctl.control_type

and		ctl.customer_name		= @engg_customer_name
and		ctl.project_name		= @engg_project_name
and		ctl.ecrno				= @engg_req_no
and		ctl.process_name		= @process_name
and		ctl.component_name		= @engg_component
and		ctl.activity_name		= @activity_name
and		ctl.ui_name				= @ui_name_tmp
and		ctl.page_bt_synonym		=  @page_bt_synonym_tmp
and		ctl.section_bt_synonym	=  @section_bt_synonym_tmp
and		ctl.control_bt_synonym	=  @control_bt_synonym_tmp
and		typ.RenderAs			LIKE 'CALENDAR_%')
	SELECT @viewname_tmp	= @viewname_tmp
ELSE
	SELECT @viewname_tmp	= LOWER(@viewname_tmp)
-- Added for TECH-35368 For Calendar Ends

--TECH-72114
SELECT @BadgeText = ''

SELECT	@BadgeText		= ISNULL(BadgeText,'N')
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @column_type_tmp
AND		base_ctrl_type	= 'DataHyperLink'

IF ISNULL(@BadgeText,'')	= ''
	SELECT @BadgeText = 'N'
--TECH-72114

--TECH-73996
SELECT @EyeIconforPassword = ''

SELECT	@EyeIconforPassword		= ISNULL(EyeIconforPassword,'N')
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @column_type_tmp
AND		base_ctrl_type	= 'Edit'

IF ISNULL(@EyeIconforPassword,'')	= ''
	SELECT @EyeIconforPassword = 'N'

SELECT @Signature = ''
SELECT	@Signature		= ISNULL([Signature],'N') 
FROM    es_comp_ctrl_type_mst_Extn WITH (NOLOCK)
WHERE   customer_name   = @engg_customer_name
AND		project_name    = @engg_project_name
AND		process_name    = @process_name
AND		component_name  = @engg_component
AND		ctrl_type_name	= @column_type_tmp
AND		base_ctrl_type	= 'Edit'

IF @Signature	=	'Y'
BEGIN
SELECT @base_ctrl_type_tmp	=	'Signature'
END

--TECH-73996

-- Insert Column  Entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Column Name="'   + ltrim(rtrim(@column_bt_synonym_tmp))    + '" ' +
'RenderAs="'  + ltrim(rtrim(isnull(@base_ctrl_type_tmp,'')))          + '" ' + -- Added for Defect ID: TECH-35368
--'RenderAs="'  + ltrim(rtrim(isnull(@column_type_tmp,'')))          + '" ' +
'ColumnCaption="'  + ltrim(rtrim(@col_descr_tmp))       + '" ' +
'ControlName="'   + ltrim(rtrim(@controlid_tmp))      + '" ' +
'SectionName="'   + ltrim(rtrim(@section_bt_synonym_tmp))    + '" ' +
'PageName="'   + ltrim(rtrim(@page_bt_synonym_tmp))    + '" ' +
'ILBOName="'    + ltrim(rtrim(@ui_name_tmp))      + '" ' +
'ActivityName="'   + ltrim(rtrim(@activity_name))     + '" ' +
'ComponentName="'  + ltrim(rtrim(@engg_component ))    + '" ' +
'ControlType="'   + ltrim(rtrim(upper(@column_type_tmp)))     + '" ' +
'BaseControlType="'  + ltrim(rtrim(isnull(upper(@base_ctrl_type_tmp),'')))        + '" ' + -- Code modification  for  PNR2.0_23635
'BTSynonym="'   + ltrim(rtrim(@column_bt_synonym_tmp))    + '" ' +
'ColumnNo="'   + ltrim(rtrim(CONVERT(VARCHAR,@column_no_tmp)))  + '" ' +
'VisibleLength="'  + ltrim(rtrim(CONVERT(VARCHAR,@visible_length_tmp)))+ '" ' +
'ProtoTooltip="'  + ltrim(rtrim(@proto_tooltip_tmp))     + '" ' +
'SampleData="'   + ltrim(rtrim(@sample_data_tmp))     + '" ' +
'DefaultSampleData="' + ltrim(rtrim(isnull(@default_sample_data_tmp,''))) + '" ' +
'Mandatory="'   + ltrim(rtrim(@mandatory_flag_tmp))     + '" ' +
'Visible="'    + ltrim(rtrim(@visible_flag_tmp))     + '" ' +
'Editable="'   + ltrim(rtrim(@editable_flag_tmp))     + '" ' +
'CaptionRequired="'  + ltrim(rtrim(@caption_req_tmp))     + '" ' +
'SelectFlag="'   + ltrim(rtrim(@select_flag_tmp))     + '" ' +
'ZoomRequired="'  + ltrim(rtrim(@zoom_req_tmp))      + '" ' +
'HelpRequired="'  + ltrim(rtrim(@help_req_tmp))      + '" ' +
'EllipsesRequired="' + ltrim(rtrim(@ellipses_req_tmp))     + '" ' +
'AssociatedTask="'  + ltrim(rtrim(@uitaskname_tmp))      + '" ' +
-- code modified by Anuradha on 24-Mar-2006 for the Bug ID :: PNR2.0_7393
--      'DataType="'   + ltrim(rtrim(isnull(@datatype_tmp,'')))   + '" ' +
--      'DataLength="'   + ltrim(rtrim(isnull(@datalength_tmp,'')))   + '" ' +
--      'DecimalLength="'  + isnull(convert(varchar, @decimal_length_grid),'')        + '" ' +
'DataType="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datatype_tmp,''))) end   + '" ' +
'DataLength="'   + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else ltrim(rtrim(isnull(@datalength_tmp,''))) end   + '" ' +
'DecimalLength="'  + case ltrim(rtrim(isnull(@base_ctrl_type_tmp, ''))) + '-'+  ltrim(rtrim(isnull(@datatype_tmp,'')))
when 'COMBO-INTEGER' then '' else isnull(convert(varchar, @decimal_length_grid),'') end        + '" ' +
'ColumnWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))  + '" ' +
'ColumnAlignment="'  + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))+ '" ' +
'ColumnPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))+ '" ' +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT'))) + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))   + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))   + '" ' +
'PasswordChar="'  + ltrim(rtrim(isnull(@password_char_tmp,'N')))  + '" ' +
'TaskImageClass="'  + ltrim(rtrim(isnull(@task_img_tmp,'')))   + '" ' +
'HelpImageClass="'  + ltrim(rtrim(isnull(@help_img_tmp,'')))   + '" ' +
'Documentation="'  + ltrim(rtrim(isnull(@controldoc_tmp,'')))   + '" ' +
'ViewName="'   + ltrim(rtrim(isnull(@viewname_tmp,'')))   + '" ' + --Modified for TECH-35368
'VisibleRows="'    + ltrim(rtrim(CONVERT(VARCHAR,isnull(@visible_rows_tmp,0))))     + '" ' +  -- Code Modified by Gopinath S for the Call ID PNR2.0_23885
'HTMLTextArea="'  + ltrim(rtrim(isnull(@html_text_area,'N')))   + '" ' +
--Code Added by Balaji S For BugId : PNR2.0_9295
'HelpText="'   + ltrim(rtrim(isnull(@helptext,'')))    + '" ' +
'SpellCheckRequired="'    + ltrim(rtrim(isnull(@SpellCheckRequired,'N')))              + '" ' +
'ReportRequired="'    + ltrim(rtrim(isnull(@report_reqd,'')))            + '" ' +
'UserFormat="'   + ltrim(rtrim(isnull(@Set_User_Pref,'')))             + '" ' + --Code Added For BugId : PNR2.0_18436
'TabIndex="'   + ltrim(rtrim(@tab_seq))       + '" ' +
'CalloutTask="'   + ltrim(rtrim(isnull(@callout_task_tmp,'')))  + '" ' +  -- added by Feroz for extjs --PNR2.0_1790
-- Added By Feroz
'BulletLink="'    + ltrim(rtrim(isnull(@bulletlink_req,'N')))            + '" ' +
'ButtonCombo="'    + ltrim(rtrim(isnull(@buttoncombo_req,'N')))            + '" ' +
'DataAsCaption="'    + ltrim(rtrim(isnull(@dataascaption,'N')))             + '" ' +
'AssociatedList="'  + ltrim(rtrim(isnull(@associatedlist_name,'')))           + '" ' +
'MappedListControlID="' + ltrim(rtrim(isnull(@mapped_list_controlid,'')))           + '" ' +
'MappedListViewName="' + ltrim(rtrim(isnull(@mapped_list_viewname,'')))           + '" ' +
'AttachDocument="'  + ltrim(rtrim(isnull(@attach_document,'N')))            + '" ' +
'ImageUpload="'   + ltrim(rtrim(isnull(@image_upload,'N')))             + '" ' +
'InplaceImage="'  + ltrim(rtrim(isnull(@inplace_image,'N')))             + '" ' +
'ImageIcon="'   + ltrim(rtrim(isnull(@image_icon,'N')))             + '" ' +
'ImageType="'   + ltrim(rtrim(isnull(@ImageType,'N')))             + '" ' +
'ImageRowHeight="'  + ltrim(rtrim(isnull(@image_row_height,'0')))            + '" ' +
'RelativeUrlPath="'  + ltrim(rtrim(isnull(@relative_url_path,'')))            + '" ' +
'RelativeDocumentPath="' + ltrim(rtrim(isnull(@relative_document_path,'')))          + '" ' +
'RelativeImagePath="'  + ltrim(rtrim(isnull(@relative_image_path,'')))           + '" ' +
'SaveDocContentToDb="'  + ltrim(rtrim(isnull(@save_doc_content_to_db,'N')))          + '" ' +
'SaveImageContentToDb="' + ltrim(rtrim(isnull(@save_image_content_to_db,'N')))          + '" ' +
'DateHighlight="'   + ltrim(rtrim(isnull(@date_highlight_req,'N')))           + '" ' +
'LinkedHiddenViewName="' + ltrim(rtrim(isnull(@hidden_view_name,'')))            + '" ' +
-- Code modified for the Bud ID: PNR2.0_27796 starts
'LiteAttach="'		+	isnull(@Lite_Attach,'N')			+'" '+
'Browse_Button="'	+	isnull(@BrowseButton,'N')			+'" '+
'Delete_Button="'	+	isnull(@DeleteButton,'N')			+'" '+
--code added for the caseid : PNR2.0_28319 starts
'image_row_width="'	+	CONVERT(VARCHAR,isnull(@image_row_width,0),4)	+'" '+
'image_preview_height="'+	CONVERT(VARCHAR,isnull(@image_preview_height,0),4) +'" '+
'image_preview_width="'	+	CONVERT(VARCHAR,isnull(@image_preview_width,0),4)+'" '+
'image_preview_req="'	+	isnull(@image_preview_req,'N')			+'" '+
'Accept_Type="'	+ 	isnull(@Accept_Type,'')			+'" '+
'Lite_Attach_Image="'	+  	isnull(@Lite_Attach_Image,'N')			+'" '+
'IsITK="' + isnull(@itk_req,'N')   + '" ' + 
 --Code Added for PNR2.0_30869 Starts
'TimeZone="' + isnull(@timezone,'N')	+ '" ' +  
'DefaultRequired="' + isnull(@default_required,'N')    
--Code Added for PNR2.0_30869 End
+'" ' +'EditCombo="'	+  	isnull(@editcombo_req,'N')	
+'" ' +'ColumnClass="'	+  	isnull(lower(@ColumnClass),'N')	
+'" ' +'ColumnStyle="'	+  	isnull(@ColumnStyle,'')	
+'" ' +'Forcefit="'	+  	isnull(@Forcefit,'')			--Code Added for the Bug ID	PNR2.0_33378
+ '" ' + isnull(@pivot_prop_tmp,'N')   -- added by feroz for bug id PNR2.0_18385
--+ @treeGrdNew -- added by feroz for bug id PNR2.0_18385
--code added for the caseid : PNR2.0_28319 ends
-- Code modified for the Bud ID: PNR2.0_27997
-- Code modified for the Bud ID: PNR2.0_27796 ends
--+ 'ColumnHdrClass="'	+  	isnull(@ColumnHdrClass,'')
+'IsModal="'     +   CONVERT(VARCHAR,isnull(@IsModal,''),4) +'" ' +
--'PopUpPage="'           +  	isnull(@popup_page,'')              +'" ' +
--'PopUpSection="'        +   isnull(@popup_section,'')				+'" ' +
--'PopUpClose="'          +   isnull(@popup_Close,'N')				+'" ' + 
'FileSize="'		+ isnull(@filesize,'')+'" ' + 
'Email="'		+ isnull(@Email,'N')+'" ' +
'Phone="'		+ isnull(@Phone,'N')+'" ' +
'TemplateID="'		+ isnull(@templateid,'')+'" ' +
'ColDataAlign="'		+ isnull(@col_data_align,'LEFT')+'" ' +
'AvnFileDownload="'	+ isnull(@avn_download,'') +'" ' +
'TemplateCategory="'	+ isnull(@TemplateCat,'') +'" ' +
'TemplateSpecification="'	+ isnull(@TemplateSpecific,'') +'" ' +
'ColumnClassExt6="'		+ isnull(lower(@Control_cls_ext6),'')  +'" ' +
'IconClass="'		+ isnull(@Icon_Class,'')  +'" ' + 
'RowExpander="'		+ isnull(@rowexpander,'N')  +'" ' + 
'GridToForm="'		+ isnull(@gridtoform,'N')  +'" ' + 
'Sparkchart="'		+ isnull(@SparkChart,'')  +'" ' + 
'SetFocusEvent="'	+ isnull(@setfocusevent,'')	 +'" ' +
'LeaveFocusEvent="'	+ isnull(@leavefocusevent,'')	 +'" ' +
'SetFocusEventOccurence="'	+ isnull(@setfocuseventoccur,'')	 +'" ' +  
'LeaveFocusEventOccurence="'	+ isnull(@leavefocuseventoccur,'')	 +'" ' +  
'MoreEvent="'	+ isnull(@MoreEventName,'')	 +'" ' + 
'UPEEnabled="'	+ isnull(@UPEEnabled,'N')	 +'" ' + 
'CompactView="'	+ isnull(@CompactView,'NA')	 +'" ' +
'IsExtension="'	+ isnull(@IsExtension,'N')	 +'" ' +
'ExtensionOrder="'	+ ltrim(rtrim(CONVERT(VARCHAR,@ExtensionOrder)))  + '" ' +
'BadgeText="'		+ isnull(@BadgeText,'N')  + '" ' +			--TECH-72114
'ShowEyeIcon="'		+ isnull(@EyeIconforPassword,'N')  + '" ' +		--TECH-73996
'IconPosition="'	+ isnull(@ColIconPosition,'')	 +'" ' +	--TECH-75230
'SystemClass="'		+ isnull(@ColSystemClass,'N')  +'" ' +			--TECH-77097
'ColHdrAlign="'		+ isnull(@col_caption_align,'')+'"/>' ,@xml_seq_tmp) 
end
close gridcurs
deallocate gridcurs

-- Insert Closing entry for Grid Columns
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,    req_no,   process_name,   component_name,
activity_name,    guid,      gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name,  @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,     '</GridColumns>',@xml_seq_tmp)

-- Insert Base Entry for Radio Buttons
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,    req_no,   process_name,   component_name,
activity_name,    guid,      gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name,  @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,     '<RadioButtons>',@xml_seq_tmp)

--Check For Existence

If exists ( select 'K'
		    from de_published_radio_button_lng_extn(nolock)
		    where  customer_name  =  @engg_customer_name
			and  project_name  =  @engg_project_name
			and  ecrno    =  @engg_req_no
			and  process_name  =  @process_name
			and  component_name  =  @engg_component
			and  activity_name  =  @activity_name
			and  ui_name    =  @ui_name_tmp )
begin    --radio check begin			

-- Fetch Radio Button Control Details
declare radiocurs cursor FAST_FORWARD  for
select upper(rad.button_code),       rad.seq_no,
rad.button_caption,        upper(rad.default_flag),
upper(rad.page_bt_synonym),     upper(rad.section_bt_synonym),
upper(rad.control_bt_synonym),    upper(control_id),
upper(isnull(caption_wrap,'Y')),   upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),  upper(isnull(mandatory_flag,'N')),
upper(isnull(ctrl_position,'LEFT')),  upper(isnull(LabelClass,'')),
upper(isnull(ControlClass,'')),    isnull(rad.horder,0),
isnull(rad.vorder,0),      rad1.button_caption
from de_published_radio_button_lng_extn  rad (nolock),
de_published_radio_button_lng_extn  rad1(nolock),
de_published_ui_control  ctrl (nolock),
de_published_ui_section  sec (nolock),
es_comp_ctrl_type_mst_vw ctype (nolock)
where rad.customer_name  = ctrl.customer_name
and  rad.project_name  = ctrl.project_name
and  rad.ecrno    = ctrl.ecrno
and  rad.process_name  = ctrl.process_name
and  rad.component_name  = ctrl.component_name
and  rad.activity_name  = ctrl.activity_name
and  rad.ui_name    = ctrl.ui_name
and  rad.page_bt_synonym  = ctrl.page_bt_synonym
and  rad.section_bt_synonym = ctrl.section_bt_synonym
and  rad.control_bt_synonym = ctrl.control_bt_synonym
--code modified for bugid:PNR2.0_8637
and  rad.customer_name  =   rad1.customer_name
and  rad.project_name  = rad1.project_name
--Code Modified for BugId : PNR2.0_9414
and  rad.ecrno    = rad1.ecrno
and  rad.process_name  = rad1.process_name
and  rad.component_name  = rad1.component_name
and  rad.activity_name  =  rad1.activity_name
and  rad.ui_name    =  rad1.ui_name
and  rad.page_bt_synonym  = rad1.page_bt_synonym
and  rad.section_bt_synonym = rad1.section_bt_synonym
and rad.control_bt_synonym = rad1.control_bt_synonym
and  rad.button_code   =  rad1.button_code

and  ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno    = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym = sec.page_bt_synonym
and  ctrl.section_bt_synonym = sec.section_bt_synonym
and  ctrl.customer_name  =  ctype.customer_name
and  ctrl.project_name  =  ctype.project_name
and  ctrl.process_name  =  ctype.process_name
and  ctrl.component_name  =  ctype.component_name
and  ctrl.control_type  =  ctype.ctrl_type_name
and  rad.customer_name  =  @engg_customer_name
and  rad.project_name  =  @engg_project_name
and  rad.ecrno    =  @engg_req_no
and  rad.process_name  =  @process_name
and  rad.component_name  =  @engg_component
and  rad.activity_name  =  @activity_name
and  rad.ui_name    =  @ui_name_tmp
/* code modified for BugId : PNR2.0_8351 */
and  rad.languageid =  @language_code
and  rad1.languageid   =  1
order by rad.page_bt_synonym, rad.section_bt_synonym, rad.control_bt_synonym, rad.seq_no, rad.horder, rad.vorder


-- For each Radio Button generate entries
open radiocurs
while (1=1)
begin
fetch next from radiocurs into
@button_code_tmp,   @seq_no_tmp,    @button_caption_tmp,
@default_flag_tmp,  @page_bt_synonym_tmp, @section_bt_synonym_tmp,
@control_bt_synonym_tmp,@controlid_tmp,   @caption_wrap_tmp,
@caption_alignment_tmp, @caption_position_tmp, @mandatory_flag_tmp,
@ctrl_position_tmp,  @label_class_tmp,  @ctrl_class_tmp,
@radhorder_tmp,   @radvorder_tmp,  @value_tmp

if @@fetch_status <> 0
break

/*PNR2.0_14287*/
select @button_caption_tmp = replace(@button_caption_tmp,'&','&amp;')
select @button_caption_tmp = replace(@button_caption_tmp,'<','&lt;')
select @button_caption_tmp = replace(@button_caption_tmp,'>','&gt;')
select @button_caption_tmp = replace(@button_caption_tmp,'"','&quot;')

select @value_tmp = replace(@value_tmp,'&','&amp;')
select @value_tmp = replace(@value_tmp,'<','&lt;')
select @value_tmp = replace(@value_tmp,'>','&gt;')
select @value_tmp = replace(@value_tmp,'"','&quot;')
-- Insert Column  Entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,  gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Button Name="'   + ltrim(rtrim(@button_code_tmp))   + '" ' +
'ButtonCaption="'  + ltrim(rtrim(@button_caption_tmp)) + '" ' +
'ControlName="'   + ltrim(rtrim(@controlid_tmp))    + '" ' +
'SectionName="'   + ltrim(rtrim(@section_bt_synonym_tmp))  + '" ' +
'PageName="'   + ltrim(rtrim(@page_bt_synonym_tmp))  + '" ' +
'ILBOName="'    + ltrim(rtrim(@ui_name_tmp))    + '" ' +
'ActivityName="'   + ltrim(rtrim(@activity_name))    + '" ' +
'ComponentName="'  + ltrim(rtrim(@engg_component))     + '" ' +
'SequenceNo="'   + ltrim(rtrim(CONVERT(VARCHAR,@seq_no_tmp)))+ '" ' +
'CaptionWrap="'   + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))  + '" '  +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))+ '" ' +
'CaptionPosition="'  + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))+ '" '  +
'ControlPosition="'  + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT'))) + '" ' +
'LabelClass="'   + ltrim(rtrim(isnull(@label_class_tmp,'')))   + '" ' +
'ControlClass="'  + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))   + '" ' +
'Mandatory="'   + ltrim(rtrim(isnull(@mandatory_flag_tmp,'N')))  + '" ' +
'HOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@radhorder_tmp),3))) + '" ' +
'VOrder="'     + ltrim(rtrim(dbo.ep_padzero(CONVERT(VARCHAR,@radvorder_tmp),3)))  + '" ' +
'Default="'    + ltrim(rtrim(@default_flag_tmp))   + '" ' +
'Value="'   + ltrim(rtrim(@value_tmp))     + '"/>',@xml_seq_tmp)
end
close radiocurs
deallocate radiocurs

End --radio check End
-- Insert Closing entry for Radio Buttons
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '</RadioButtons>',@xml_seq_tmp)

-- Insert Base Entry for Enumerated Values
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<EnumValues>',@xml_seq_tmp)

--Code Modified for BugId : PNR2.0_14936
-- Fetch Enum Button Control Details

If exists ( select 'K'
		    from de_published_enum_value_lng_extn(nolock)
		    where  customer_name  =  @engg_customer_name
			and  project_name  =  @engg_project_name
			and  ecrno    =  @engg_req_no
			and  process_name  =  @process_name
			and  component_name  =  @engg_component
			and  activity_name  =  @activity_name
			and  ui_name    =  @ui_name_tmp )
begin    --Enum check begin

declare  enumcurs cursor FAST_FORWARD  for
select  upper(enum.enum_code),       enum.seq_no,
enum.enum_caption,        upper(enum.default_flag),
upper(enum.page_bt_synonym),      upper(enum.section_bt_synonym),
upper(enum.control_bt_synonym),      upper(control_id),
upper(isnull(caption_wrap,'Y')),     upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),     upper(isnull(mandatory_flag,'N')),
upper(isnull(ctrl_position,'LEFT')),     upper(isnull(LabelClass,'')),
upper(isnull(ControlClass,'')), enum1.enum_caption
from  de_published_enum_value_lng_extn  enum (nolock),
de_published_enum_value_lng_extn  enum1(nolock), --code added by kiruthika for enum code value node
de_published_ui_control   ctrl (nolock),
de_published_ui_section   sec (nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where  enum.customer_name  = ctrl.customer_name
and  enum.project_name  = ctrl.project_name
and  enum.ecrno   = ctrl.ecrno
and  enum.process_name  = ctrl.process_name
and  enum.component_name  = ctrl.component_name
and  enum.activity_name  = ctrl.activity_name
and  enum.ui_name   = ctrl.ui_name
and  enum.page_bt_synonym  = ctrl.page_bt_synonym
and  enum.section_bt_synonym  = ctrl.section_bt_synonym
and  enum.control_bt_synonym  = ctrl.control_bt_synonym
--code added by kiruthika for enum code value node
and  enum.customer_name      = enum1.customer_name 
and  enum.project_name       = enum1.project_name
and  enum.ecrno              = enum1.ecrno
and  enum.process_name       = enum1.process_name
and  enum.component_name     = enum1.component_name
and  enum.activity_name      = enum1.activity_name
and  enum.ui_name            = enum1.ui_name
and  enum.page_bt_synonym    = enum1.page_bt_synonym
and  enum.section_bt_synonym = enum1.section_bt_synonym
and  enum.control_bt_synonym = enum1.control_bt_synonym
and  enum.enum_code          = enum1.enum_code
and  ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno   = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym  = sec.page_bt_synonym
and  ctrl.section_bt_synonym  = sec.section_bt_synonym
and  ctrl.customer_name  =  ctype.customer_name
and  ctrl.project_name  =  ctype.project_name
and  ctrl.process_name  =  ctype.process_name
and  ctrl.component_name  =  ctype.component_name
and  ctrl.control_type  =  ctype.ctrl_type_name
and  enum.customer_name  =  @engg_customer_name
and  enum.project_name   =  @engg_project_name
and  enum.ecrno          =  @engg_req_no
and  enum.process_name   =  @process_name
and  enum.component_name =  @engg_component
and  enum.activity_name =  @activity_name
and  enum.ui_name       =  @ui_name_tmp
and  enum.languageid    =  @language_code
and  enum1.languageid   =  1 --code added by kiruthika for enum code value node
union
select  upper(enum.enum_code),       enum.seq_no,
enum.enum_caption,        upper(enum.default_flag),
upper(enum.page_bt_synonym),      upper(enum.section_bt_synonym),
upper(enum.control_bt_synonym),      upper(control_id),
upper(isnull(caption_wrap,'Y')),     upper(isnull(caption_alignment,'LEFT')),
upper(isnull(caption_position,'LEFT')),     upper(isnull(mandatory_flag,'N')),
upper(isnull(ctrl_position,'LEFT')),     '',
'', enum1.enum_caption
from  de_published_enum_value_lng_extn  enum (nolock),
de_published_enum_value_lng_extn  enum1(nolock), --code added by kiruthika for enum code value node
de_published_ui_grid   ctrl (nolock),
de_published_ui_section   sec (nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where  enum.customer_name  = ctrl.customer_name
and  enum.project_name  = ctrl.project_name
and  enum.ecrno   = ctrl.ecrno
and  enum.process_name  = ctrl.process_name
and  enum.component_name = ctrl.component_name
and  enum.activity_name  = ctrl.activity_name
and  enum.ui_name   = ctrl.ui_name
and  enum.page_bt_synonym  = ctrl.page_bt_synonym
and  enum.section_bt_synonym  = ctrl.section_bt_synonym
and  enum.control_bt_synonym  = ctrl.column_bt_synonym
--code added by kiruthika for enum code value node
and  enum.customer_name      = enum1.customer_name
and  enum.project_name       = enum1.project_name
and  enum.ecrno              = enum1.ecrno
and  enum.process_name       = enum1.process_name
and  enum.component_name     = enum1.component_name
and  enum.activity_name      = enum1.activity_name
and  enum.ui_name            = enum1.ui_name
and  enum.page_bt_synonym    = enum1.page_bt_synonym
and  enum.section_bt_synonym = enum1.section_bt_synonym
and  enum.control_bt_synonym = enum1.control_bt_synonym
and  enum.enum_code          = enum1.enum_code
and  ctrl.customer_name  = sec.customer_name
and  ctrl.project_name  = sec.project_name
and  ctrl.ecrno   = sec.ecrno
and  ctrl.process_name  = sec.process_name
and  ctrl.component_name  = sec.component_name
and  ctrl.activity_name  = sec.activity_name
and  ctrl.ui_name   = sec.ui_name
and  ctrl.page_bt_synonym  = sec.page_bt_synonym
and  ctrl.section_bt_synonym  = sec.section_bt_synonym
and  ctrl.customer_name  =  ctype.customer_name
and  ctrl.project_name  =  ctype.project_name
and  ctrl.process_name  =  ctype.process_name
and  ctrl.component_name  =  ctype.component_name
and  ctrl.column_type  =  ctype.ctrl_type_name
and  enum.customer_name  =  @engg_customer_name
and   enum.project_name  =  @engg_project_name
and  enum.ecrno   =  @engg_req_no
and  enum.process_name  =  @process_name
and   enum.component_name  =  @engg_component
and   enum.activity_name  =  @activity_name
and   enum.ui_name   =  @ui_name_tmp
and  enum.languageid   =  @language_code
and  enum1.languageid   =  1 --code added by kiruthika for enum code value node
--   order by enum.page_bt_synonym, enum.section_bt_synonym, enum.control_bt_synonym, enum.seq_no


-- For each Radio Button generate entries
open enumcurs
while (1=1)
begin
fetch next from enumcurs into
@enum_code_tmp,   @seq_no_tmp,    @enum_caption_tmp,
@default_flag_tmp,  @page_bt_synonym_tmp,  @section_bt_synonym_tmp,
@control_bt_synonym_tmp, @controlid_tmp,   @caption_wrap_tmp,
@caption_alignment_tmp,  @caption_position_tmp,  @mandatory_flag_tmp,
@ctrl_position_tmp,  @label_class_tmp,  @ctrl_class_tmp,@value_tmp --code added by kiruthika for enum code value node

if @@fetch_status <> 0
break

select @enum_caption_tmp = replace(@enum_caption_tmp,'&','&amp;')
select @enum_caption_tmp = replace(@enum_caption_tmp,'<','&lt;')
select @enum_caption_tmp = replace(@enum_caption_tmp,'>','&gt;')
select @enum_caption_tmp = replace(@enum_caption_tmp,'"','&quot;')

select @value_tmp = replace(@value_tmp,'&','&amp;')
select @value_tmp = replace(@value_tmp,'<','&lt;')
select @value_tmp = replace(@value_tmp,'>','&gt;')
select @value_tmp = replace(@value_tmp,'"','&quot;')

-- Insert Column  Entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<ENum ENumCode="'  + ltrim(rtrim(@enum_code_tmp))   + '" ' +
'ENumCaption="'  + ltrim(rtrim(@enum_caption_tmp))   + '" ' +
'ControlName="'  + ltrim(rtrim(@controlid_tmp))    + '" ' +
'ControlBTSynonym="' + ltrim(rtrim(@control_bt_synonym_tmp))    + '" ' +
'SectionBTSynonym="' + ltrim(rtrim(@section_bt_synonym_tmp))  + '" ' +
'PageBTSynonym="' + ltrim(rtrim(@page_bt_synonym_tmp))  + '" ' +
'ILBOName="'   + ltrim(rtrim(@ui_name_tmp))    + '" ' +
'ActivityName="'  + ltrim(rtrim(@activity_name))    + '" ' +
'ComponentName="' + ltrim(rtrim(@engg_component))     + '" ' +
'ENumSeqNo="'  + ltrim(rtrim(CONVERT(VARCHAR,@seq_no_tmp)))+ '" ' +
'CaptionWrap="'  + ltrim(rtrim(isnull(@caption_wrap_tmp,'Y')))  + '" '  +
'CaptionAlignment="' + ltrim(rtrim(isnull(@caption_alignment_tmp,'LEFT')))+ '" ' +
'CaptionPosition="' + ltrim(rtrim(isnull(@caption_position_tmp,'LEFT')))+ '" '  +
'ControlPosition="' + ltrim(rtrim(isnull(@ctrl_position_tmp,'LEFT'))) + '" ' +
'LabelClass="'  + ltrim(rtrim(isnull(@label_class_tmp,'')))   + '" ' +
'ControlClass="' + ltrim(rtrim(isnull(lower(@ctrl_class_tmp),'')))   + '" ' +
'Mandatory="'  + ltrim(rtrim(isnull(@mandatory_flag_tmp,'N')))  + '" ' +
'Default="'    + ltrim(rtrim(@default_flag_tmp))   + '" ' +
'Value="'   + ltrim(rtrim(@value_tmp))     + '"/>',@xml_seq_tmp) --code added by kiruthika for enum code value node

end
close enumcurs
deallocate enumcurs

End  --Enum check End

-- Insert Closing entry for Enumerated Values
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</EnumValues>',@xml_seq_tmp)


-- Insert Base Entry for Combolink Values
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<ComboLinkValues>',@xml_seq_tmp)

If exists ( select 'K'
		    from de_published_ui_combolink(nolock)
		    where  customer_name  =  @engg_customer_name
			and  project_name  =  @engg_project_name
			and  ecrno    =  @engg_req_no
			and  process_name  =  @process_name
			and  component_name  =  @engg_component
			and  activity_name  =  @activity_name
			and  ui_name    =  @ui_name_tmp )
begin    --Combolink check begin

-- Fetch Combolink Button Control Details
declare  combolinkcurs cursor FAST_FORWARD  for
select  upper(ctrl.control_id),       upper(comb.link_control_bt_synonym),
comb.link_control_caption,     isnull(comb.display_seqno,0),   -- PLF2.0_18487 
comb.separatelink_req, comb.map,  upper( act.task_name),upper(ctype.base_ctrl_type)
from  de_published_ui_combolink  comb (nolock),
de_published_action  act (nolock),
de_published_ui_control ctrl(nolock),
es_comp_ctrl_type_mst ctype (nolock)
where  comb.customer_name  = act.customer_name
and  comb.project_name  = act.project_name
and  comb.ecrno   = act.ecrno
and  comb.process_name  = act.process_name
and  comb.component_name  = act.component_name
and  comb.activity_name  = act.activity_name
and  comb.ui_name   = act.ui_name
and comb.link_control_bt_synonym = act.primary_control_bts
and  comb.customer_name  =  @engg_customer_name
and  comb.project_name  =  @engg_project_name
and  comb.ecrno   =  @engg_req_no
and  comb.process_name  =  @process_name
and   comb.component_name  =  @engg_component
and   comb.activity_name  =  @activity_name
and   comb.ui_name   =  @ui_name_tmp
and ctrl.customer_name  = comb.customer_name
and  ctrl.project_name  = comb.project_name
and  ctrl.ecrno   = comb.ecrno
and  ctrl.process_name  = comb.process_name
and  ctrl.component_name  = comb.component_name
and  ctrl.activity_name  = comb.activity_name
and  ctrl.ui_name   = comb.ui_name
and ctrl.control_bt_synonym = comb.combo_control_bt_synonym
and ctype.customer_name  = ctrl.customer_name
and  ctype.project_name  = ctrl.project_name
and  ctype.process_name  = ctrl.process_name
and  ctype.component_name  = ctrl.component_name
and  ctype.req_no = ctrl.req_no
and ctype.ctrl_type_name = ctrl.control_type
and  comb.map='Y'                            -- code added for PLF2.0_18487 
order by ctrl.control_id,comb.Display_seqno  -- code added for PLF2.0_18487 

-- For each Radio Button generate entries
open combolinkcurs
while (1=1)
begin
fetch next from combolinkcurs into
@Combo_control_bt_synonym_tmp,       @link_control_bt_synonym_tmp,
@link_control_caption_tmp,      @display_seqno_tmp,
@separatelink_req_tmp,  @map_tmp,@associated_task_name_tmp,@control_task_type_tmp
if @display_seqno_tmp = 1
begin
set @combo_default = 'Y'
end
else
begin
set @combo_default = 'N'
end

if @@fetch_status <> 0
break

select @link_control_caption_tmp = replace(@link_control_caption_tmp,'&','&amp;')
select @link_control_caption_tmp = replace(@link_control_caption_tmp,'<','&lt;')
select @link_control_caption_tmp = replace(@link_control_caption_tmp,'>','&gt;')
select @link_control_caption_tmp = replace(@link_control_caption_tmp,'"','&quot;')

-- Insert Column  Entry

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'  + ltrim(rtrim(@combo_control_bt_synonym_tmp))   + '" ' +
'LinkcontrolName="'  + ltrim(rtrim(@link_control_bt_synonym_tmp))   + '" ' +
'ControlCaption="'  + ltrim(rtrim(@link_control_caption_tmp))    + '" ' +
'AssociatedTask="' + ltrim(rtrim(@associated_task_name_tmp))    + '" ' +
'SequenceNo ="' + ltrim(rtrim(@display_seqno_tmp))    + '" ' +
'Default="' +ltrim(rtrim(@combo_default))  + '" ' +
'SeparateLinkReq="' + ltrim(rtrim(@separatelink_req_tmp))  + '" ' +
'BaseControlType="' + ltrim(rtrim(@control_task_type_tmp)) 
 -- + '" ' +'Map="' + ltrim(rtrim(@map_tmp))   
  + '"/>',@xml_seq_tmp)
end
close combolinkcurs
deallocate combolinkcurs

End --Combolink check End

-- Insert Closing entry for Combolink Values
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</ComboLinkValues>',@xml_seq_tmp)
-----


-- Insert Base Entry for Links
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<Traversal>',@xml_seq_tmp)

-- For Traversal Details
declare linkcurs cursor FAST_FORWARD  for
select upper(control_bt_synonym), UPPER(trv.page_bt_synonym) , UPPER(link_type),
upper(isnull(linked_component,'')), upper(isnull(linked_activity,'')),
upper(isnull(linked_ui,'')),upper(trv.section_bt_synonym), upper(trv.LinkLaunchType)
from de_published_ui_traversal  trv (nolock),
de_published_ui_page   pg (nolock)
where trv.customer_name  = pg.customer_name
and  trv.project_name  = pg.project_name
and  trv.ecrno    = pg.ecrno
and  trv.process_name  = pg.process_name
and  trv.component_name  = pg.component_name
and  trv.activity_name  = pg.activity_name
and  trv.ui_name    = pg.ui_name
and  trv.page_bt_synonym  = pg.page_bt_synonym
and  trv.customer_name  =  @engg_customer_name
and  trv.project_name  =  @engg_project_name
and  trv.ecrno    =  @engg_req_no
and  trv.process_name  =  @process_name
and  trv.component_name  =  @engg_component
and  trv.activity_name  =  @activity_name
and  pg.customer_name =  @engg_customer_name
and  pg.project_name   =  @engg_project_name
and  pg.ecrno    =  @engg_req_no
and  pg.process_name   =  @process_name
and  pg.component_name  =  @engg_component
and  pg.activity_name  =  @activity_name
and  pg.ui_name    =  @ui_name_tmp

open linkcurs
while (1=1)
begin
fetch next from linkcurs into
@link_name_tmp,   @link_page_tmp,   @link_type_tmp,
@linked_component_tmp, @linked_activity_tmp, @linked_ui_tmp,
@link_section_tmp, @LinkLaunchType

if @@fetch_status <> 0
break

-- If Linked Component Name exists
if @ctxt_service_in in ('BulkGenerate')  and @pubflag = 'P'
begin
if exists  (select 'x'
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no  = @engg_req_no
and  process_name = @process_name
and  component_descr = @linked_component_tmp)
begin
select @linked_component_tmp = component_name
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_descr = @linked_component_tmp
end
end
else
begin
if exists  (select 'x'
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  process_name = @process_name
and  component_descr = @linked_component_tmp)
begin
select @linked_component_tmp = component_name
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  process_name = @process_name
and  component_descr = @linked_component_tmp
end
end --*/ latha

-- If Linked Activtiy Name exists
if @ctxt_service_in in ('BulkGenerate')  and @pubflag = 'P'
begin
if exists  (select 'x'
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_descr = @linked_component_tmp
and  activity_descr = @linked_activity_tmp)
begin
select @linked_activity_tmp = activity_name
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_descr = @linked_component_tmp
and  activity_descr = @linked_activity_tmp
end
else
begin
select @linked_activity_tmp = activity_name
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_name  = @linked_component_tmp
and  activity_descr = @linked_activity_tmp
end
end

-- if Linked UI Name Exists
if @ctxt_service_in in ('BulkGenerate')  and @pubflag = 'P'
begin
if exists  (select 'x'
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_descr = @linked_component_tmp
and  activity_descr = @linked_activity_tmp
and  ui_descr  = @linked_ui_tmp)
begin
select @linked_ui_tmp  = ui_name
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_descr = @linked_component_tmp
and  activity_descr = @linked_activity_tmp
and  ui_descr  = @linked_ui_tmp
end
begin
select @linked_ui_tmp  = ui_name
from de_ui_ico (nolock)
where customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ico_no   = @engg_req_no
and  process_name = @process_name
and  component_name  = @linked_component_tmp
and  activity_name = @linked_activity_tmp
and  ui_descr  = @linked_ui_tmp
end
end


--Code modified For PNR2.0_21234 on 25-Feb-2009 - Starts
select @associated_task = '', @task_descr_link_tmp = ''
--Code modified For PNR2.0_21234 on 25-Feb-2009 - Ends

-- For Associated Task
if exists
(select 'x'
from de_published_ui_control a (nolock)
where  a.customer_name  = @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.ecrno    =  @engg_req_no
and  a.process_name     =  @process_name
and  a.component_name   =  @engg_component
and  a.activity_name    =  @activity_name
and  a.ui_name      =  @ui_name_tmp
and  a.page_bt_synonym = @link_page_tmp
and  a.control_bt_synonym= @link_name_tmp)
begin
select @associated_task = upper(isnull(task_name,'')),
@task_descr_link_tmp= isnull(task_descr,'')
--Code modified For BugId : PNR2.0_8748
--       @task_descr_link_tmp= upper(isnull(task_descr,''))
from de_published_action_lng_extn a(nolock),
de_published_ui_control b(nolock),
es_comp_task_type_mst c(nolock)
where  a.customer_name  = @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.ecrno    =  @engg_req_no
and  a.process_name     =  @process_name
and  a.component_name   =  @engg_component
and  a.activity_name    =  @activity_name
and  a.ui_name      =  @ui_name_tmp
and  a.page_bt_synonym = @link_page_tmp
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name     =  b.process_name
and  a.component_name   =  b.component_name
and  a.activity_name    =  b.activity_name
and  a.ui_name      =  b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.primary_control_bts=  b.control_bt_synonym
and  a.customer_name  =  c.customer_name
and  a.project_name  =  c.project_name
and  a.component_name = c.component_name
and  a.task_pattern =  c.task_type_name
and  a.task_type   in  ('Link','Help','report')
and  b.control_bt_synonym= @link_name_tmp
and  languageid   =  @language_code
end
else
begin
select @associated_task = upper(isnull(task_name,'')),
@task_descr_link_tmp= isnull(task_descr,'')
--Code modified For BugId : PNR2.0_8748
--       @task_descr_link_tmp= upper(isnull(task_descr,''))
from de_published_action_lng_extn   a(nolock),
de_published_ui_grid   b(nolock),
es_comp_task_type_mst   c(nolock)
where  a.customer_name  = @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.ecrno    =  @engg_req_no
and  a.process_name     =  @process_name
and  a.component_name   =  @engg_component
and  a.activity_name    =  @activity_name
and  a.ui_name      =  @ui_name_tmp
and  a.page_bt_synonym = @link_page_tmp
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name     =  b.process_name
and  a.component_name   =  b.component_name
and  a.activity_name    =  b.activity_name
and  a.ui_name      =  b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.primary_control_bts= b.column_bt_synonym
and  a.customer_name  =  c.customer_name
and  a.project_name  =  c.project_name
and  a.component_name = c.component_name
and  a.task_pattern  =  c.task_type_name
and  a.task_type   in  ('Link','Help','report')
and  b.column_bt_synonym = @link_name_tmp
and  languageid   =  @language_code
end
select @task_descr_link_tmp = replace(@task_descr_link_tmp,'&','&amp;')
select @task_descr_link_tmp = replace(@task_descr_link_tmp,'<','&lt;')
select @task_descr_link_tmp = replace(@task_descr_link_tmp,'>','&gt;')
select @task_descr_link_tmp = replace(@task_descr_link_tmp,'"','&quot;')

Declare  @ezlink  engg_flag

If   Exists (select 'X'
from  de_published_ezeeview_sp (nolock)
where  customer_name = @engg_customer_name
and  project_name  = @engg_project_name
and  process_name = @process_name
and  component_name = @engg_component
and  activity_name = @activity_name
and  ui_name   = @ui_name_tmp
and  page_bt_synonym = @link_page_tmp
and  Link_ControlName= @link_name_tmp)
Begin
select @ezlink = 'Y'
End
Else
select @ezlink = 'N'

declare @postuitask engg_name
declare @postuitaskname engg_name

set @postuitask = ''
set @postuitaskname = ''

select @postuitask = sub.post_linktask
from de_published_ui_traversal  trv (nolock),
de_published_subscription   sub (nolock)
where trv.customer_name  = sub.customer_name
and  trv.project_name  = sub.project_name
and  trv.ecrno    = sub.ecrno
and  trv.process_name  = sub.process_name
and  trv.component_name  = sub.component_name
and  trv.activity_name  = sub.activity_name
and  trv.ui_name    = sub.ui_name
and  trv.page_bt_synonym  = sub.page_bt_synonym
and  trv.control_bt_synonym = sub.control_bt_synonym
and  sub.customer_name =  @engg_customer_name
and  sub.project_name   =  @engg_project_name
and  sub.ecrno    =  @engg_req_no
and  sub.process_name   =  @process_name
and  sub.component_name  =  @engg_component
and  sub.activity_name  =  @activity_name
and  sub.ui_name    =  @ui_name_tmp
and  sub.page_bt_synonym = @link_page_tmp
and  sub.control_bt_synonym	= @link_name_tmp

if isnull(@postuitask,'') <> ''
Begin
	set @postuitaskname = @postuitask
	set @postuitask = 'Y'
	End
else
Begin
	set @postuitask = 'N'
	set @postuitaskname = ''
End
-- Insert Column  Entry 
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Link Name="'   + ltrim(rtrim(isnull(@link_name_tmp,''))) + '" ' +
'LinkDescr="'  + ltrim(rtrim(isnull(@task_descr_link_tmp,'')))  + '" ' +
'LinkComp="'  + ltrim(rtrim(isnull(@linked_component_tmp,''))) + '" ' +
'LinkAct="'   + ltrim(rtrim(isnull(@linked_activity_tmp,'')))  + '" ' +
'LinkUI="'   + ltrim(rtrim(isnull(@linked_ui_tmp,'')))   + '" ' +
'LinkPage="'   + ltrim(rtrim(isnull(@link_page_tmp,'')))   + '" ' +
'AssociatedTask="' + ltrim(rtrim(isnull(@associated_task,'')))   + '" ' +
'LinkType="'  + ltrim(rtrim(isnull(@link_type_tmp,'')))     + '" ' +
'postuitask="'  + ltrim(rtrim(isnull(@postuitask,'')))     + '" ' +
'PostUITaskName="'  + ltrim(rtrim(isnull(upper(@postuitaskname),'')))    + '" ' +
'LinkLaunchType="'  + ltrim(rtrim(isnull(@LinkLaunchType,'')))     + '" ' +
'EzLink="'   + ltrim(rtrim(isnull(@ezlink,'N')))    + '"/>',@xml_seq_tmp)
end
close linkcurs
deallocate linkcurs

-- Insert Closing entry for Links
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</Traversal>',@xml_seq_tmp)

-- For Actions
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Tasks>',@xml_seq_tmp)

IF ISNULL(@UPEEnabled_Comp,'N')	=	'N'
BEGIN
	-- For List of Task
	declare act_cursor cursor for
	select	act.task_type,			upper(act.page_bt_synonym),			upper(task_name),			task_descr, task_seq, 
			upper(task_pattern),	upper(primary_control_bts),			PopUp_page_bt_synonym,		PopUp_section,
			case PopUp_close when '1' then 'Y' else 'N' end,
			upper(isnull(browse_control,'')),
			case when isnull(Popup_onclick_close,0)=1 then 'Y' else 'N' end
	from	de_published_action_lng_extn act (nolock),
			--de_published_ui_control ctrl (nolock),
			--ep_published_ui_control_dtl ctrl (nolock),
			es_comp_task_type_mst mst (nolock)
	where	act.customer_name	=	mst.customer_name
	and		act.project_name	=	mst.project_name
	and		act.process_name	=	mst.process_name
	and		act.component_name  =	mst.component_name
	and		act.task_pattern	=	mst.task_type_name
	and		act.customer_name	=   @engg_customer_name
	and		act.project_name	=	@engg_project_name
	and		act.ecrno			=	@engg_req_no
	and		act.process_name	=	@process_name
	and		act.component_name  =	@engg_component
	and		act.activity_name	=	@activity_name
	and		act.ui_name			=	@ui_name_tmp
	and		languageid			=	@language_code
	order by task_seq
END
ELSE
BEGIN
	-- For List of Task
	declare act_cursor cursor for
	select	act.task_type,			upper(act.page_bt_synonym),			upper(task_name),			task_descr, task_seq, 
			upper(task_pattern),	upper(primary_control_bts),			PopUp_page_bt_synonym,		PopUp_section,
			case PopUp_close when '1' then 'Y' else 'N' end,
			upper(isnull(browse_control,'')),
			case when isnull(Popup_onclick_close,0)=1 then 'Y' else 'N' end
	from	de_published_action_lng_extn act (nolock),
			--de_published_ui_control ctrl (nolock),
			--ep_published_ui_control_dtl ctrl (nolock),
			es_comp_task_type_mst mst (nolock)
	where	act.customer_name	=	mst.customer_name
	and		act.project_name	=	mst.project_name
	and		act.process_name	=	mst.process_name
	and		act.component_name  =	mst.component_name
	and		act.task_pattern	=	mst.task_type_name
	and		act.customer_name	=   @engg_customer_name
	and		act.project_name	=	@engg_project_name
	and		act.ecrno			=	@engg_req_no
	and		act.process_name	=	@process_name
	and		act.component_name  =	@engg_component
	and		act.activity_name	=	@activity_name
	and		act.ui_name			=	@ui_name_tmp
	and		languageid			=	@language_code
	--order by task_seq
	AND NOT EXISTS (	SELECT 'X'
						FROM	de_upe_control c(NOLOCK)
						WHERE	c.CustomerName		=	act.Customer_Name
						AND		c.ProjectName		=	act.Project_Name
						AND		c.ProcessName		=	act.Process_Name
						AND		c.ComponentName		=	act.Component_Name
						--AND	c.EcrNumber			=	act.ecrno
						AND		c.ActivityName		=	act.Activity_Name
						AND		c.UIName			=	act.UI_Name
						AND		c.BTSynonymName		=	act.Primary_Control_bts
						AND		c.MoreEvent			=	act.Task_Name
						and		act.languageid		=	@language_code	)
END

open act_cursor
while (1=1)
begin
fetch next from act_cursor into
@task_type_tmp,   @page_bt_synonym_tmp,  @task_name_tmp,    @task_descr_tmp,
@task_seq_tmp,   @task_pattern_tmp,  @primary_control_bts_tmp,@popup_page,@popup_section,@popup_Close,@browse_control,
@PopupCloseOnClick
if @@fetch_status <> 0
break

-- Code Added for Bug ID PNR2.0_19757 Starts
select @section_bt_synonym_tmp = '',
@ManualReport = '',
@StatusMessage = '',
@FullTree = '',
@ConfirmationMessage = '',
@CVS = '',
@ExcelReport = '',
@Chart = '',
@Tree = '',
-- Code modification for  PNR2.0_30127 starts
@ErrorLookup = '',
@FollowupTask = '',
@ProcessingMessage = ''		--Code Modified for PNR2.0_30869 

-- Code modification for  PNR2.0_30127 ends
-- Code Added for Bug ID PNR2.0_19757 Ends
,@SourceCtrl = '',
@TargetCtrl = '',
@controltype = '',
@width='',
@height='',
@Toolbar_notreq='',
@btype='',
@path_control=''
,@group_name = '',
@DirectPrint = ''

select @task_descr_tmp = replace(@task_descr_tmp,'&','&amp;')
select @task_descr_tmp = replace(@task_descr_tmp,'<','&lt;')
select @task_descr_tmp = replace(@task_descr_tmp,'>','&gt;')
select @task_descr_tmp = replace(@task_descr_tmp,'"','&quot;')

if @task_type_tmp in ('Help','Link')
begin 

select @width  = isnull(tra.Width,''),
		@height  = isnull(tra.height,''),
		@Toolbar_notreq =isnull(tra.Toolbar_notreq,'')
from de_published_action_lng_extn act(nolock),
	   de_published_ui_traversal       tra(nolock)
where  act.customer_name		=	tra.customer_name	
and  act.project_name			=	tra.project_name
and  act.ecrno						=	tra.ecrno
and  act.process_name			=	tra.process_name
and  act.component_name		=	tra.component_name
and  act.activity_name			=	tra.activity_name
and  act.ui_name					=	tra.ui_name
and  act.page_bt_synonym	=	tra.page_bt_synonym
and  act.primary_control_bts	=  tra.control_bt_synonym
and  act.project_name			=  @engg_project_name
and  act.ecrno						=  @engg_req_no
and  act.process_name			=  @process_name
and  act.component_name		=  @engg_component
and  act.activity_name			=  @activity_name
and  act.ui_name					=  @ui_name_tmp
and  act.task_name				=	@task_name_tmp
and  languageid					=  @language_code

end
---

if @task_type_tmp in ('Trans' ) and isnull(@browse_control,'')<>''
begin 

select  @path_control=@browse_control

select @btype= case when		(Browse_Button_Enable = 'Y' and upload	='Y')  then  'filebrowseupload'
							 when		 Browse_Button_Enable = 'Y'							then  'filebrowse'
							 when	     Delete_Button_Enable  = 'Y'							then  'filedelete'
							 when		 upload					    = 'Y'							then  'fileupload'
					  else null 
					  end 
from  de_published_ui_control   ctrl  (nolock),
		es_comp_ctrl_type_mst mst (nolock)
where ctrl.customer_name		=	 mst.customer_name
and  ctrl.project_name			=	 mst.project_name
and  ctrl.process_name			=	 mst.process_name
and  ctrl.component_name		=	 mst.component_name
and  ctrl.control_type			=	 mst.ctrl_type_name
and  ctrl.customer_name		=   @engg_customer_name
and  ctrl.project_name			=	 @engg_project_name
and  ctrl.ecrno						=  @engg_req_no
and  ctrl.process_name			=   @process_name
and  ctrl.component_name		=   @engg_component
and  ctrl.activity_name			=   @activity_name
and  ctrl.ui_name					=   @ui_name_tmp
and  ctrl.control_bt_synonym	=	 @primary_control_bts_tmp

end
--For ML Link Task file upload handling

if @task_type_tmp in ('Link' ) and isnull(@browse_control,'')<>''
begin 

select  @path_control=@browse_control

select @path_control = substring(@path_control,charindex('~',@path_control)+1,
				   (len(@path_control)-charindex(@path_control,'~')))

select @btype= case when		(Browse_Button_Enable = 'Y' and upload	='Y')  then  'filebrowseupload'
							 when		 Browse_Button_Enable = 'Y'							then  'filebrowse'
							 when	     Delete_Button_Enable  = 'Y'							then  'filedelete'
							 when		 upload					    = 'Y'							then  'fileupload'
					  else null 
					  end 
from  de_published_ui_grid   Grid  (nolock),
		es_comp_ctrl_type_mst mst (nolock)
where Grid.customer_name		=	 mst.customer_name
and  Grid.project_name			=	 mst.project_name
and  Grid.process_name			=	 mst.process_name
and  Grid.component_name		=	 mst.component_name
and  Grid.column_type			=	 mst.ctrl_type_name
and  Grid.customer_name			=    @engg_customer_name
and  Grid.project_name			=	 @engg_project_name
and  Grid.ecrno    				=    @engg_req_no
and  Grid.process_name			=    @process_name
and  Grid.component_name		=    @engg_component
and  Grid.activity_name			=    @activity_name
and  Grid.ui_name				=    @ui_name_tmp
and  Grid.column_bt_synonym		=	 @primary_control_bts_tmp

end

--For Button Previous Task Handling by Kanagavel A

--- Added on jan2020

if @task_type_tmp in ('report' ) 
begin 

select	@DirectPrint			= ISNULL(DirectPrint, 'N')
from  de_published_ui_control   Grid  (nolock),
		es_comp_ctrl_type_mst_extn mst (nolock)
where Grid.customer_name		=	 mst.customer_name
and  Grid.project_name			=	 mst.project_name
and  Grid.process_name			=	 mst.process_name
and  Grid.component_name		=	 mst.component_name
and  Grid.control_type			=	 mst.ctrl_type_name
and  Grid.customer_name			=    @engg_customer_name
and  Grid.project_name			=	 @engg_project_name
and  Grid.ecrno    				=    @engg_req_no
and  Grid.process_name			=    @process_name
and  Grid.component_name		=    @engg_component
and  Grid.activity_name			=    @activity_name
and  Grid.ui_name				=    @ui_name_tmp
and  Grid.control_bt_synonym	=	 @primary_control_bts_tmp

	If ISNULL(@DirectPrint, 'N')	= 'N'
	BEGIN
	select	@DirectPrint			= ISNULL(DirectPrint, 'N')
	from  de_published_ui_grid   Grid  (nolock),
			es_comp_ctrl_type_mst_extn mst (nolock)
	where Grid.customer_name		=	 mst.customer_name
	and  Grid.project_name			=	 mst.project_name
	and  Grid.process_name			=	 mst.process_name
	and  Grid.component_name		=	 mst.component_name
	and  Grid.column_type			=	 mst.ctrl_type_name
	and  Grid.customer_name			=    @engg_customer_name
	and  Grid.project_name			=	 @engg_project_name
	and  Grid.ecrno    				=    @engg_req_no
	and  Grid.process_name			=    @process_name
	and  Grid.component_name		=    @engg_component
	and  Grid.activity_name			=    @activity_name
	and  Grid.ui_name				=    @ui_name_tmp
	and  Grid.column_bt_synonym		=	 @primary_control_bts_tmp
	END
end
-- added for jan2020

If exists ( select 'K'
			from  de_published_ui_control   ctrl  (nolock),
					es_comp_ctrl_type_mst mst (nolock)
			where ctrl.customer_name		=	 mst.customer_name
			and  ctrl.project_name			=	 mst.project_name
			and  ctrl.process_name			=	 mst.process_name
			and  ctrl.component_name		=	 mst.component_name
			and  ctrl.control_type			=	 mst.ctrl_type_name
			and  ctrl.customer_name		=   @engg_customer_name
			and  ctrl.project_name			=	 @engg_project_name
			and  ctrl.ecrno    					=  	 @engg_req_no
			and  ctrl.process_name			=   @process_name
			and  ctrl.component_name		=   @engg_component
			and  ctrl.activity_name			=   @activity_name
			and  ctrl.ui_name					=   @ui_name_tmp
			and  ctrl.control_bt_synonym	=	 @primary_control_bts_tmp
			and  mst.ButtonPrevious_Req	=	 'Y')
			begin 
					select   @button_prev_service =  service_name
					from de_published_task_service_map task(nolock)
					where task.customer_name		=    @engg_customer_name
					and	 task.project_name			=	  @engg_project_name
					and    task.ecrno    					=  	  @engg_req_no
					and	 task.process_name			=    @process_name
					and	 task.component_name		=    @engg_component
					and	 task.activity_name			=    @activity_name
					and	 task.ui_name					=    @ui_name_tmp
					and	 task.task_name				=	  @task_name_tmp
			end 
--
select	@group_name		= group_name 
from de_published_action(nolock)
where  customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  primary_control_bts =  @primary_control_bts_tmp
		
 --Added for the TECH-29822 Starts

select	@QuickTask		= QuickTask,
		@OfflineTask	= autoupload,
		@SystemTaskType	= SystemTaskType,
		@sectionlaunchtype = ISNULL(sectionlaunchtype, '')
from de_published_action(nolock)
where  customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and	 task_name				=	  @task_name_tmp
and  primary_control_bts =  @primary_control_bts_tmp

	IF ISNULL(@task_descr_tmp, '') LIKE 'System Task%' --ISNULL(@SystemTaskType,'') <> ''
		SELECT @SystemTask = 'Y'
	ELSE
		SELECT @SystemTask = 'N'
 --Added for the TECH-29822 Ends
				
-- For Getting Section BT Synonym
if @task_type_tmp = 'Fetch'
select @section_bt_synonym_tmp = '[mainsection]'
else if @task_type_tmp = 'Init'
select @section_bt_synonym_tmp = '[mainsection]'
else
begin
if exists  (select 'x'
from de_published_ui_control (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  control_bt_synonym =  @primary_control_bts_tmp)
begin
select @section_bt_synonym_tmp = upper(section_bt_synonym)
from de_published_ui_control (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  control_bt_synonym =  @primary_control_bts_tmp
end
else
begin
if exists  (select 'x'
from de_published_ui_grid (nolock)
where customer_name  =   @engg_customer_name
and project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  column_bt_synonym =  @primary_control_bts_tmp)
begin
select @section_bt_synonym_tmp = upper(section_bt_synonym)
from de_published_ui_grid (nolock)
where customer_name  =   @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  column_bt_synonym =  @primary_control_bts_tmp
end
end
end


select		@SourceCtrl = upper(isnull(QR_sourceCtrl,'')),
			@TargetCtrl = upper(isnull(QR_targetCtrl,'')),
			@controltype = 'QRImage'	
from de_published_action    (nolock)
	where customer_name		=   @engg_customer_name
     and  project_name		= @engg_project_name
     and  ecrno				= @engg_req_no
     and  process_name		= @process_name
     and  component_name    = @engg_component
     and  activity_name		=  @activity_name
     and  ui_name			=  @ui_name_tmp
	 and  page_bt_synonym  = @page_bt_synonym_tmp
	 and  primary_control_bts =  @primary_control_bts_tmp
	 and  (isnull(QR_sourceCtrl,'')<>'' and isnull(QR_targetCtrl,'')<>'')

select		@SourceCtrl = upper(isnull(Barcode_sourceCtrl,'')),
			@TargetCtrl = upper(isnull(Barcode_targetCtrl,'')),
			@controltype = 'BarCode'	
from de_published_action    (nolock)
	where customer_name		=   @engg_customer_name
     and  project_name		= @engg_project_name
     and  ecrno				= @engg_req_no
     and  process_name		= @process_name
     and  component_name    = @engg_component
     and  activity_name		=  @activity_name
     and  ui_name			=  @ui_name_tmp
	 and  page_bt_synonym  = @page_bt_synonym_tmp
	 and  primary_control_bts =  @primary_control_bts_tmp
	 and  (isnull(Barcode_sourceCtrl,'')<>'' and isnull(Barcode_targetCtrl,'')<>'')


select  @xml_seq_tmp   = @xml_seq_tmp+1,
@section_bt_synonym_tmp = upper(@section_bt_synonym_tmp)

-- Code Added By Jeya for the Bug ID PNR2.0_19279 Starts

select @StatusMessage = taskstatusmsg
from de_fw_req_publish_task_status_msg_vw (nolock)
where customername  =   @engg_customer_name
and  projectname  = @engg_project_name
and  ecrno    =  @engg_req_no
and  processname  = @process_name
and  componentname  = @engg_component
and  activityname  = @activity_name
and  ilbocode    =  @ui_name_tmp
and  taskname    =  @task_name_tmp
and  languageid = @language_code

--code added for bugid : PNR2.0_19530 starts

select @StatusMessage = replace(@StatusMessage,'&','&amp;')
select @StatusMessage = replace(@StatusMessage,'<','&lt;')
select @StatusMessage = replace(@StatusMessage,'>','&gt;')
select @StatusMessage = replace(@StatusMessage,'"','&quot;')

--code added for bugid : PNR2.0_19530 ends

select @ConfirmationMessage = taskconfirmmsg
from de_fw_req_publish_tsk_confirm_msg_vw (nolock)
where customername  =   @engg_customer_name
and  projectname  = @engg_project_name
and  ecrno    =  @engg_req_no
and  processname  = @process_name
and  componentname  = @engg_component
and  activityname  = @activity_name
and  ilbocode    =  @ui_name_tmp
and  taskname    =  @task_name_tmp
and  languageid  = @language_code

--code added for bugid : PNR2.0_19530 starts

select @ConfirmationMessage = replace(@ConfirmationMessage,'&','&amp;')
select @ConfirmationMessage = replace(@ConfirmationMessage,'<','&lt;')
select @ConfirmationMessage = replace(@ConfirmationMessage,'>','&gt;')
select @ConfirmationMessage = replace(@ConfirmationMessage,'"','&quot;')

--code added for bugid : PNR2.0_19530 ends

--Code Modification for PNR2.0_30869 starts
select	@ProcessingMessage = taskprocessmsg
from	de_fw_req_publish_task_process_msg_vw (nolock)
where	customername= @engg_customer_name
and		projectname = @engg_project_name
and		ecrno		= @engg_req_no
and		processname = @process_name
and		componentname=@engg_component
and		activityname= @activity_name
and		ilbocode    = @ui_name_tmp
and		taskname    = @task_name_tmp
and		languageid	= @language_code


select @ProcessingMessage = replace(@ProcessingMessage,'&','&amp;')
select @ProcessingMessage = replace(@ProcessingMessage,'<','&lt;')
select @ProcessingMessage = replace(@ProcessingMessage,'>','&gt;')
select @ProcessingMessage = replace(@ProcessingMessage,'"','&quot;')
--Code Modification for PNR2.0_30869 ends


if exists  (select 'x'
from cvs_published_message (nolock)
where customer_name  =   @engg_customer_name
and project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_name  = @page_bt_synonym_tmp
and  task_name =  @task_name_tmp)
begin
select @CVS = 'Y'
End

-- Code modification for PNR2.0_23208 starts

select  @associated_control = ''

if exists  (select 'x'
from de_published_exrep_task_temp_map (nolock)
where customer_name  =   @engg_customer_name
and project_name  = @engg_project_name
and  ecrno    =  @engg_req_no
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_name  = @page_bt_synonym_tmp
and  task_name =  @task_name_tmp)

begin

select @ExcelReport = 'Y'

-- Code modification for PNR2.0_23175 starts



select @associated_control  = b.control_id
from    de_published_exrep_task_temp_map a (nolock),
de_published_ui_control b (nolock)
where a.customer_name  =   @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno     =  @engg_req_no
and   a.process_name   = @process_name
and   a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and   a.ui_name     =  @ui_name_tmp
and   a.page_name  = @page_bt_synonym_tmp
and   a.task_name =  @task_name_tmp

and  a.customer_name  = b.customer_name
and  a.project_name   = b.project_name
and  a.ecrno       = b.ecrno
and  a.process_name   = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name        = b.ui_name
and  a.page_name      = b.page_bt_synonym
and  a.associated_control = b.control_bt_synonym

-- Code modification for PNR2.0_23208 ends

-- Code modification for PNR2.0_23175 ends
End

insert into #tree_ui_task (task_name,  task_desc )
select distinct lower(d.task_name)   as  'Taskname',
lower(d.task_descr)  as 'TaskDescription'
from de_published_tree_dtl_vw   a (nolock),
de_fw_des_publish_service_segment  b (nolock),
de_published_task_service_map   c (nolock),
de_published_action     d (nolock),
de_published_ui_control    e (nolock)
where a.customer_name   = @engg_customer_name
and  a.project_name   = @engg_project_name
and  a.ecrno     = @engg_req_no
and  a.process_name   = @process_name
and  a.component_name  = @engg_component
and  a.activity_name   = @activity_name
and  a.ui_name    = @ui_name_tmp
and  b.customername    = a.customer_name
and  b.projectname   = a.Project_Name
and  b.ecrno     = a.EcrNo
and  b.processname   = a.Process_Name
and  b.componentname   = a.Component_Name
and  b.segmentname   in ('tree_data_segment', 'tree_config_segment')
and  c.customer_name   = b.customername
and  c.project_name   = b.projectname
and  c.ecrno     = b.ecrno
and  c.process_name   = b.processname
and  c.component_name  = b.componentname
and  c.activity_name   = a.Activity_Name
and  c.ui_name    = a.UI_Name
and  c.service_name   = b.servicename
and  d.customer_name   = c.customer_name
and  d.project_name   = c.project_name
and  d.ecrno     = c.ecrno
and  d.process_name   = c.process_name
and  d.component_name  = c.component_name
and  d.activity_name   = c.activity_name
and  d.ui_name    = c.ui_name
and  d.task_name    = c.task_name
and  d.task_type    = 'UI'
and  e.customer_name   = d.customer_name
and  e.project_name   = d.project_name
and  e.ecrno     = d.ecrno
and  e.process_name   = d.process_name
and  e.component_name  = d.component_name
and  e.activity_name   = d.Activity_Name
and  e.ui_name    = d.UI_Name
and  e.control_type    = 'HiddentreeEdit'
and  e.control_bt_synonym = d.primary_control_bts
Union

select distinct lower(d.task_name)   as  'Taskname',  
lower(d.task_descr)  as 'TaskDescription'  
from   
de_fw_des_publish_service_segment   b (nolock),  
de_published_task_service_map    c (nolock),  
de_published_action       d (nolock)  
where d.customer_name   = @engg_customer_name  
and   d.project_name    = @engg_project_name  
and   d.ecrno		    = @engg_req_no  
and   d.process_name    = @process_name  
and   d.component_name  = @engg_component  
and   d.activity_name   = @activity_name  
and   d.ui_name     = @ui_name_tmp  
  
and   c.customer_name   = d.customer_name  
and   c.project_name    = d.project_name  
and   c.ecrno			= d.ecrno  
and   c.process_name    = d.process_name  
and   c.component_name  = d.component_name  
and   c.activity_name   = d.activity_name  
and   c.ui_name			= d.ui_name  
and   c.task_name		= d.task_name  
  
and   b.customername    = c.customer_name  
and   b.projectname     = c.project_name  
and   b.ecrno			= c.ecrno  
and   b.processname     = c.process_name  
and   b.componentname   = c.component_name  
and   b.servicename		= c.service_name  
and   b.segmentname     in ('tree_data_segment', 'tree_config_segment')  
and   d.task_name     not in (select task_name from #tree_ui_task)  
--Code Modified For Bug ID : PNR2.0_31326		Ends

If Exists (select 'X' from #tree_ui_task (nolock)
where task_name = @task_name_tmp)
begin
select @Tree = 'Y'
End

If Exists (
select  'X'
from   de_published_task_service_map    A (nolock),
de_fw_des_publish_chart_service_segment_vw B (nolock),
de_fw_req_publish_task_vw    C (nolock)
where  A.customer_name  = @engg_customer_name
and  A.project_name   = @engg_project_name
and  A.ecrno    = @engg_req_no
and  A.component_name  = @engg_component
and  A.activity_name  = @activity_name
and   A.ui_name    = @ui_name_tmp
and  A.task_name   = @task_name_tmp
and  B.customer_name  = A.customer_name
and  B.project_name  = A.project_name
and  B.process_name  = A.process_name
and  B.component_name = A.component_name
and  B.ecrno    = A.ecrno
and  B.servicename  = A.service_name
and  C.customername  = B.customer_name
and  C.projectname  = B.project_name
and  C.processname  = B.process_name
and  C.componentname  = B.component_name
and  C.ecrno    = B.ecrno
and  C.taskname    = A.task_name)
Begin
select @Chart = 'Y'
End


select @FullTree = clear_tree_before_population
from re_published_flowbr_combo (nolock)
where customer_name  =   @engg_customer_name
and project_name  = @engg_project_name
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @page_bt_synonym_tmp
and  task_name =  @task_name_tmp

If isnull(@FullTree, '') = '' or @FullTree = '0'
select @FullTree = 'N'
Else
select @FullTree = 'Y'

Select @ManualReport = isnull(ReportName,'')
from engg_devcon_handcoded_reports_vw (nolock)
where customername  =   @engg_customer_name
and projectname  = @engg_project_name
and  processname  = @process_name
and  componentname  = @engg_component
and  ActivityName  = @activity_name
and  uiname    =  @ui_name_tmp
and  taskname =  @task_name_tmp

-- Code Added By Jeya for the Bug ID PNR2.0_19279 Ends

-- Code modification for  PNR2.0_30127 starts
If exists (select 'x' 
			from	de_fw_des_publish_error_lookup (nolock)
			where	customer_name	= @engg_customer_name
			and		project_name	= @engg_project_name
			and		ecrno    = @engg_req_no--modified by Kanagavel A
			and		process_name	= @process_name
			and		component_name  = @engg_component
			and		Activity_Name	= @activity_name
			and		ui_name			= @ui_name_tmp
			and		taskname		= @task_name_tmp
			)
Begin
	select	@ErrorLookup =	'Y'
End
Else
	select	@ErrorLookup =	'N'
	
If exists (select 'x' 
		from	de_fw_des_publish_followup_tasks (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		ecrno    = @engg_req_no  --modified by Kanagavel A
		and		process_name	= @process_name
		and		component_name  = @engg_component
		and		Activity_Name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_name		= @task_name_tmp
		)
Begin
	select	@FollowupTask =	'Y'
End
Else
	select	@FollowupTask =	'N'
	
-- Code modification for  PNR2.0_30127 ends	

-- Code Added for PNR2.0_31051 Starts

Declare @mlcontrol	engg_name
select	@mlcontrol		= ''
select	@AssociatedML	= '' 

Declare task_ml_fet	cursor FAST_FORWARD for	
select	Distinct a.controlid
from	de_fw_des_publish_ilbo_service_view_datamap a (nolock),  --modified by Kanagavel A
		de_published_ui_grid b (nolock),
		de_fw_des_publish_service_dataitem c(nolock)
where	a.customername		= b.customer_name
and		a.projectname		= b.project_name
and		a.ecrno					= b.ecrno
and		a.processname		= b.process_name
and		a.componentname	= b.component_name
and		a.activity_name		= b.Activity_Name
and		a.ilbocode			= b.UI_Name
and		a.page_bt_synonym	= b.page_bt_synonym
and		a.controlid			= b.control_id
and		a.viewname			= b.view_name

and		a.customername		= c.customername
and		a.projectname		= c.projectname
and		a.ecrno				= c.ecrno
and		a.processname		= c.processname
and		a.componentname	= c.componentname
and		a.servicename		= c.servicename
and		a.segmentname		= c.segmentname
and		a.dataitemname		= c.dataitemname
and		c.flowattribute		= 0

and		a.customername		= @engg_customer_name
and		a.projectname		= @engg_project_name
and		a.ecrno    = @engg_req_no
and		a.processname		= @process_name
and		a.componentname	= @engg_component
and		a.Activity_Name		= @activity_name
and		a.ilbocode			= @ui_name_tmp
and		a.taskname			= @task_name_tmp
order by 1

open task_ml_fet
while (1=1)
begin
	fetch next from task_ml_fet into @mlcontrol
	if @@fetch_status <> 0
	break

	If isnull(@mlcontrol,'') <> ''  and isnull(@AssociatedML,'') = ''
		select @AssociatedML = isnull(@AssociatedML,'') + isnull(@mlcontrol,'')  
	Else If isnull(@mlcontrol,'') <> ''  and isnull(@AssociatedML,'') <> ''
		select @AssociatedML = isnull(@AssociatedML,'')  + ', '  + isnull(@mlcontrol,'')  


end
close task_ml_fet
deallocate task_ml_fet
-- Code Added for PNR2.0_31051 End

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Task Name="'   + ltrim(rtrim(isnull(@task_name_tmp,'')))   + '" ' +
'TaskDescr="'  + ltrim(rtrim(isnull(@task_descr_tmp,'')))    + '" ' +
'TaskSeq="'   + ltrim(rtrim(isnull(str(@task_seq_tmp),'')))  + '" ' +
'TaskType="'  + ltrim(rtrim(isnull(@task_type_tmp,'')))   + '" ' +
'TaskPattern="'  + ltrim(rtrim(isnull(@task_pattern_tmp,'')))  + '" ' +
'PageName="'  + ltrim(rtrim(isnull(@page_bt_synonym_tmp,'')))  + '" ' +
'SectionName="'  + ltrim(rtrim(isnull(@section_bt_synonym_tmp,'')))  + '" ' +
'PrimaryControlBT="'+ ltrim(rtrim(isnull(@primary_control_bts_tmp,'')))  + '" ' +
-- Code Added By Jeya for the Bug ID PNR2.0_19279 Starts
'StatusMessage="'+ ltrim(rtrim(isnull(@StatusMessage,'')))   + '" ' +
'ConfirmationMessage="'+ ltrim(rtrim(isnull(@ConfirmationMessage,'')))   + '" ' +
'CVS="'+ ltrim(rtrim(isnull(@CVS,'')))   + '" ' +
'ExcelReport="'+ ltrim(rtrim(isnull(@ExcelReport,'')))   + '" ' +
'Tree="'+ ltrim(rtrim(isnull(@Tree,'N')))   + '" ' +
'Chart="'+ ltrim(rtrim(isnull(@Chart,'N')))   + '" ' +
'FullTree="'+ ltrim(rtrim(isnull(@FullTree,'N')))      + '" ' +
-- Code modification for PNR2.0_23175 starts
'ManualReport="'+ ltrim(rtrim(isnull(@ManualReport,'')))   + '" ' +
'DirectPrint="'+ ltrim(rtrim(isnull(@DirectPrint,'N')))   + '" ' +
'ExcelRepAsscCtrl="'+ ltrim(rtrim(isnull(@associated_control,'')))    + '" ' +
-- Code modification for  PNR2.0_30127 starts
'ErrorLookup="'+ ltrim(rtrim(isnull(@ErrorLookup,'')))      + '" ' +
'FollowupTask="'+ ltrim(rtrim(isnull(@FollowupTask,'')))      + '" ' +
'ProcessingMessage="'+ ltrim(rtrim(isnull(@ProcessingMessage,'')))    + '" ' +  --Code Modified for PNR2.0_30869
'PopUpPage="'           +  	isnull(@popup_page,'')                  +'" ' +
'PopUpSection="'        +   isnull(@popup_section,'')               +'" ' +
'PopUpClose="'          +   isnull(@popup_Close,'N')                +'" ' +
'AssociatedML="'+ ltrim(rtrim(isnull(@AssociatedML,'')))                +'" ' + -- Code Added for PNR2.0_31051 

-- Code modification for  PNR2.0_30127 ends
-- Code modification for PNR2.0_23175 ends

-- Code Added By Jeya for the Bug ID PNR2.0_19279 Ends
--'IsBrowse="'          +  ltrim(rtrim(isnull(@isbrowse,'')))                +'" ' +
'SourceCtrl="'          + ltrim(rtrim(isnull(@SourceCtrl,'')))                +'" ' +
'TargetCtrl="'          + ltrim(rtrim(isnull(@TargetCtrl,'')))                +'" ' +
'QRType="'+ ltrim(rtrim(isnull(@controltype,'')))							  +'" ' +
'ChildWidth="'          + ltrim(rtrim(isnull(@Width,'')))                +'" ' +
'ChildHeight="'          + ltrim(rtrim(isnull(@Height,'')))                +'" ' +
'Toolbarnotreq="'+ ltrim(rtrim(isnull(@Toolbar_notreq,'')))                +'" ' +
'btype="'          + ltrim(rtrim(isnull(@btype,'')))               +'" ' +
'AssociatedPathCtrl="'+ ltrim(rtrim(isnull(@path_control,'')))               +'" ' +
'button_prev_service="'+ ltrim(rtrim(isnull(@button_prev_service,'')))               +'" ' +
'PopupCloseOnClick="'+ ltrim(rtrim(@PopupCloseOnClick))               +'" ' +
-- Added for the TECH-29822 Starts
'QuickAction="'+ ltrim(rtrim(isnull(@QuickTask,'N')))               +'" ' +
'IsOffline="'+ ltrim(rtrim(isnull(@OfflineTask,'N')))               +'" ' +
'IsSystemTask="'+ ltrim(rtrim(isnull(@SystemTask,'N')))               +'" ' +
'SysTaskType="'+ ltrim(rtrim(isnull(@SystemTaskType,'')))               +'" ' +
-- Added for the TECH-29822 Ends
'DefaultGroup="'+ ltrim(rtrim(isnull(@group_name,'')))	 + '"/>',@xml_seq_tmp)
end
close act_cursor
deallocate act_cursor

-- Insert Closing entry for ILBO
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Tasks>',@xml_seq_tmp)

If Exists (	select 'K'
			from de_published_ui_toolbar  (nolock)
			where  customer_name   = @engg_customer_name
			and   project_name   = @engg_project_name
			and   ecrno      = @engg_req_no
			and   component_name   = @engg_component
			and   activity_name  = @activity_name
			and  ui_name    = @ui_name_tmp )
		
Begin  --Toolbar check begin
 
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<ToolBar>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<ToolBarItems>',@xml_seq_tmp)

declare uitoolbar_cur cursor FAST_FORWARD  for
select distinct toolbar_id, group_task_name, display_seqno, class_name, display_text, caption_req, control_req
from de_published_ui_toolbar_mapping  (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
order by display_seqno

open uitoolbar_cur
while (1=1)
begin

fetch next from uitoolbar_cur into @toolbar_id, @group_task_name, @tb_display_seqno, @tb_class_name, @tb_display_text, @tb_caption_req, @tb_control_req
if @@fetch_status <> 0
break

if @tb_caption_req = '1'
select @tb_caption_req = 'Y'
else
select @tb_caption_req = 'N'

if @tb_control_req = '1'
select @tb_control_req = 'Y'
else
select @tb_control_req = 'N'

select @tb_controlid = '',
@tb_viewname  = ''

if exists ( select 'x'
from de_published_ui_toolbar (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  group_name   = @group_task_name)

select @tb_type = 'Group'
else
begin
select @tb_type = 'Task'

select @tb_controlid = isnull(b.control_id,''),
@tb_viewname = isnull(b.view_name,'')
from de_published_action  a (nolock),
de_published_ui_control b (nolock)
where a.customer_name  = @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno      = @engg_req_no
and   a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.task_name   = @group_task_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name     = b.process_name
and  a.component_name   = b.component_name
and  a.activity_name    = b.activity_name
and  a.ui_name      = b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.primary_control_bts= b.control_bt_synonym

if isnull(@tb_controlid,'') = ''
select @tb_controlid = isnull(b.control_id,''),
@tb_viewname = isnull(b.view_name,'')
from de_published_action  a (nolock),
de_published_ui_grid b (nolock)
where a.customer_name  = @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno      = @engg_req_no
and   a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.task_name   = @group_task_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno = b.ecrno
and  a.process_name     = b.process_name
and  a.component_name   = b.component_name
and  a.activity_name    = b.activity_name
and  a.ui_name      = b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym

end

select @tb_display_text = display_text
from de_published_ui_displaytext_lang_extn (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  group_task_name  = @tbg_group_task_name
and  lang_id    = @language_code


select @tb_display_text = replace(@tb_display_text,'&','&amp;')
select @tb_display_text = replace(@tb_display_text,'<','&lt;')
select @tb_display_text = replace(@tb_display_text,'>','&gt;')
select @tb_display_text = replace(@tb_display_text,'"','&quot;')


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<ToolBarItem Id="' + Upper(@toolbar_id)  + '" ' +
'Name="' + Upper(isnull(@group_task_name,''))  + '" ' +
'Type="' + isnull(@tb_type,'') + '" ' +
'DisplayText="' + isnull(@tb_display_text,'') + '" '+
'Sequence="'  + ltrim(rtrim(CONVERT(VARCHAR(5), isnull(@tb_display_seqno,0)))) + '" '+
'CaptionRequired="' + isnull(@tb_caption_req,'Y') + '" '+
'ControlRequired="' + isnull(@tb_control_req,'Y') + '" '+
'ClassName="' + isnull(@tb_class_name,'') + '" '+
'ControlId="' + upper(isnull(@tb_controlid,'')) + '" '+
'ViewName="' + upper(isnull(@tb_viewname,'')) + '"/>' ,@xml_seq_tmp)
end
close uitoolbar_cur
deallocate uitoolbar_cur

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</ToolBarItems>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Groups>',@xml_seq_tmp)

-- Modified for adding orientation for the group (Mobility) Defect ID TECH-20897 
declare uitoolbar_cur_outer cursor FAST_FORWARD  for
select	distinct tool.group_name,	Orientation  -- Added for TECH-20897
from	de_published_ui_toolbar  tool (nolock),
		de_published_ui_toolbar_group grp (nolock)
where	tool.customer_name	= grp.customer_name
and		tool.project_name	= grp.project_name
and		tool.ecrno			= grp.ecrno
and		tool.process_name	= grp.process_name
and		tool.component_name	= grp.component_name
and		tool.activity_name	= grp.activity_name
and		tool.ui_name		= grp.ui_name
and		tool.group_name		= grp.group_name
and		tool.customer_name  = @engg_customer_name
and		tool.project_name	= @engg_project_name
and		tool.ecrno			= @engg_req_no
and		tool.component_name = @engg_component
and		tool.activity_name	= @activity_name
and		tool.ui_name			= @ui_name_tmp
order by tool.group_name
-- Commented for the Defect ID TECH-20897 
--select distinct group_name
--from de_published_ui_toolbar (nolock)
--where  customer_name   = @engg_customer_name
--and   project_name   = @engg_project_name
--and   ecrno      = @engg_req_no
--and   component_name   = @engg_component
--and   activity_name  = @activity_name
--and  ui_name    = @ui_name_tmp
--order by group_name

open uitoolbar_cur_outer
while (1=1)
begin

fetch next from uitoolbar_cur_outer into @group_name, @grporientation
if @@fetch_status <> 0
break

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Group Name="' + Upper(@group_name)  + '" Orientation="' + upper(@grporientation) + '">',@xml_seq_tmp)
--@activity_name,   @guid,    '<Group Name="' + Upper(@group_name)  + '">',@xml_seq_tmp) -- Commented for TECH-20897


declare uitoolbar_cur_inner cursor FAST_FORWARD  for
select distinct group_task_name, task_seqno, class_name, display_text, group_task_desc,upper(isnull(group_node_task,''))
from de_published_ui_toolbar (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  group_name   = @group_name
order by task_seqno

open uitoolbar_cur_inner
while (1=1)
begin

fetch next from uitoolbar_cur_inner into @tbg_group_task_name, @tbg_task_seqno, @tbg_class_name, @tbg_display_text, @group_task_desc,@group_node_task
if @@fetch_status <> 0
break

select @tbg_controlid = '',
@tbg_viewname = ''

if exists ( select 'x'
from de_published_ui_toolbar (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  group_name   = @tbg_group_task_name)

select @tbg_type = 'Group'
else
begin
select @tbg_type = 'Task'

select @tbg_controlid = isnull(b.control_id,''),
@tbg_viewname = isnull(b.view_name,'')
from de_published_action  a (nolock),
de_published_ui_control b (nolock)
where a.customer_name  = @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno      = @engg_req_no
and   a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.task_name   = @tbg_group_task_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name     = b.process_name
and  a.component_name   = b.component_name
and  a.activity_name    = b.activity_name
and  a.ui_name      = b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.primary_control_bts= b.control_bt_synonym

if isnull(@tbg_controlid,'') = ''
select @tbg_controlid = isnull(b.control_id,''),
@tbg_viewname = isnull(b.view_name,'')
from de_published_action  a (nolock),
de_published_ui_grid b (nolock)
where a.customer_name  = @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno      = @engg_req_no
and  a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and  a.ui_name    = @ui_name_tmp
and  a.task_name   = @tbg_group_task_name
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name     = b.process_name
and  a.component_name   = b.component_name
and  a.activity_name    = b.activity_name
and  a.ui_name      = b.ui_name
and  a.page_bt_synonym = b.page_bt_synonym
and  a.primary_control_bts= b.column_bt_synonym

end

select @tb_control_req = control_req
from de_published_ui_toolbar_mapping (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  group_task_name  = @group_name

if @tb_control_req = '1'
select @tb_control_req = 'Y'
else
select @tb_control_req = 'N'


if @tb_control_req = 'Y'
select @tbg_control_req = 'Y'
else
select @tbg_control_req  = 'N'

select @tbg_display_text = display_text
from de_published_ui_displaytext_lang_extn (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  group_task_name  = @tbg_group_task_name
and  lang_id    = @language_code
and  group_name = @group_name


select @tbg_display_text = replace(@tbg_display_text,'&','&amp;')
select @tbg_display_text = replace(@tbg_display_text,'<','&lt;')
select @tbg_display_text = replace(@tbg_display_text,'>','&gt;')
select @tbg_display_text = replace(@tbg_display_text,'"','&quot;')

select @group_task_desc = replace(@group_task_desc,'&','&amp;')
select @group_task_desc = replace(@group_task_desc,'<','&lt;')
select @group_task_desc = replace(@group_task_desc,'>','&gt;')
select @group_task_desc = replace(@group_task_desc,'"','&quot;')

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<GroupItem Name="' + Upper(@tbg_group_task_name)  + '" ' +
'Type="' + isnull(@tbg_type,'') + '" '+
'Desc="' + isnull(@group_task_desc,'') + '" '+
'DisplayText="' + isnull(@tbg_display_text,'') + '" '+
'Sequence="'  + ltrim(rtrim(CONVERT(VARCHAR(5), isnull(@tbg_task_seqno,0)))) + '" '+
'ControlRequired="' + isnull(@tbg_control_req,'Y') + '" '+
'ClassName="' + isnull(@tbg_class_name,'') + '" '+
'ControlId="' + upper(isnull(@tbg_controlid,'')) + '" '+
'ViewName="' + upper(isnull(@tbg_viewname,'')) + '" '+
'DefaultTask="' + upper(isnull(@group_node_task,'')) + '"/>' ,@xml_seq_tmp)
end
close uitoolbar_cur_inner
deallocate uitoolbar_cur_inner

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</Group>',@xml_seq_tmp)

end
close uitoolbar_cur_outer
deallocate uitoolbar_cur_outer

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</Groups>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</ToolBar>',@xml_seq_tmp)

End --Toolbar check End

-- Added by Feroz For UI Toolbar End

-- Start For the feature Context Menu (PNR2.0_1476)-- Added by Jeya
Delete from de_published_ui_contextmenu_task_dtl
where  customer_name = @engg_customer_name
and  project_name  = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
and  ui_name  = @ui_name_tmp

insert into de_published_ui_contextmenu_task_dtl ( customer_name, project_name, process_name, component_name, activity_name, ui_name, page_name,
section_name, control_bt_synonym, map_flag, task_name, task_descr, task_type, task_seq, timestamp, createdby, createddate,
modifiedby, modifieddate, ecrno, control_id)
select distinct customer_name, project_name, process_name, component_name, activity_name, ui_name, page_bt_synonym, section_name, control_bt_synonym, 1,
isnull(task_name,contextual_link_name), contextual_link_name, task_type, contextual_link_seq, 0, createdby, createddate, modifiedby, modifieddate, ecrno,
substring(control_Bt_synonym, charindex('(',control_Bt_synonym)+1, charindex('-', control_Bt_synonym)  - charindex('(',control_Bt_synonym)-1)
from de_published_contextual_links a (nolock)
where  customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
and  ui_name  = @ui_name_tmp

-- Code Modification added for PNR2.0_34596   starts  
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,  req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<DepState>',@xml_seq_tmp)

If @dep_state = 'Y'

Begin 
Declare depstate_cur cursor FAST_FORWARD 
for Select page_bt_synonym, section_bt_synonym 
from de_published_ui_section (nolock)
where customer_name				= @engg_customer_name
and   project_name 				= @engg_project_name
and   ecrno						= @engg_req_no
and   component_name			= @engg_component
and   activity_name				= @activity_name
and   ui_name					= @ui_name_tmp
and   page_bt_synonym           <> '[mainscreen]'
order by page_bt_synonym , section_bt_synonym

Select @depst_page_tmp = ''
open depstate_cur 

while 1=1
begin
                fetch next  from depstate_cur  into @depst_page , @depst_sec  
                                
                If @@fetch_Status <> 0
                break
			
			If @depst_page_tmp <> @depst_page 
			Begin
				if @depst_page_tmp <> '' 
				begin 
				select @xml_seq_tmp=@xml_seq_tmp+1
					insert into ep_genxml_tmp
					(customer_name,   project_name,   req_no,   process_name,   component_name,
					activity_name,    guid,     gen_xml,seq_no)
					values
					(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
					@activity_name,  @guid,
					'</Page>',@xml_seq_tmp)
				end 
				select @xml_seq_tmp=@xml_seq_tmp+1
					insert into ep_genxml_tmp
					(customer_name,   project_name,   req_no,   process_name,   component_name,
					activity_name,    guid,     gen_xml,seq_no)
					values
					(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
					@activity_name,  @guid,
					'<Page Name="'   + lower(ltrim(rtrim(isnull(@depst_page,''))))   + '">',@xml_seq_tmp)
			End 
			
				select @xml_seq_tmp=@xml_seq_tmp+1
					insert into ep_genxml_tmp
					(customer_name,   project_name,   req_no,   process_name,   component_name,
					activity_name,    guid,     gen_xml,seq_no)
					values
					(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
					@activity_name,  @guid,
					'<Section Name="'   + lower(ltrim(rtrim(isnull(@depst_sec,''))))   + '"/>',@xml_seq_tmp)
				
	select @depst_page_tmp	  = @depst_page
	
end
if exists (select '*'
from de_published_ui_section (nolock)
where customer_name				= @engg_customer_name
and   project_name 				= @engg_project_name
and   ecrno						= @engg_req_no
and   component_name			= @engg_component
and   activity_name				= @activity_name
and   ui_name					= @ui_name_tmp
and   page_bt_synonym           <> '[mainscreen]')
begin
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
					(customer_name,   project_name,   req_no,   process_name,   component_name,
					activity_name,    guid,     gen_xml,seq_no)
					values
					(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
					@activity_name,  @guid,
					'</Page>',@xml_seq_tmp)   
end 

close  depstate_cur
deallocate depstate_cur

End                            

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
					(customer_name,   project_name,   req_no,   process_name,   component_name,
					activity_name,    guid,     gen_xml,seq_no)
					values
					(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
					@activity_name,  @guid,
					'</DepState>',@xml_seq_tmp)      

-- Code Modification added for PNR2.0_34596   ends  


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<PreferredTasks>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Controls>',@xml_seq_tmp)


declare @ctrlchk engg_name
set @ctrlchk = ''

declare prefTasks cursor FAST_FORWARD  for

select distinct ui_name,  page_name, section_name, control_bt_synonym, control_id
from de_published_ui_contextmenu_task_dtl  (nolock)
where  customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
and ui_name = @ui_name_tmp

declare @ui_tmp engg_name
declare @control_tmp engg_name
declare @page_tmp engg_name
declare @section_tmp engg_name
declare @taskname_tmp engg_name
declare @taskdescr_tmp engg_name
declare @tasktype_tmp engg_name
declare @taskseq_tmp engg_name
declare @control_id_tmp engg_name
declare @TaskCaption_tmp engg_name

open prefTasks
-- For each control generate entries
while (1=1)
begin

fetch next from prefTasks into
@ui_tmp,@page_tmp, @section_tmp, @control_tmp, @control_id_tmp
if @@fetch_status <> 0
break
set @ctrlchk = ltrim(rtrim(isnull(@control_tmp,'')))

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + upper(ltrim(rtrim(isnull(@control_id_tmp,''))))   + '" ' +
'PageName="'  + upper(ltrim(rtrim(isnull(@page_tmp,''))))    + '" ' +
'SectionName="'   + upper(ltrim(rtrim(isnull(@section_tmp,''))))  + '">',@xml_seq_tmp)

select  @taskname_tmp = task_name,
@taskdescr_tmp = task_descr,
@tasktype_tmp = task_type,
@taskseq_tmp = task_seq
from de_published_ui_contextmenu_task_dtl (nolock)
where  customer_name  = @engg_customer_name
and   project_name  = @engg_project_name
and  ecrno   = @engg_req_no
and   component_name  = @engg_component
and   activity_name  = @activity_name
and ui_name  = @ui_tmp
and page_name = @page_tmp
and  section_name = @section_tmp
and control_bt_synonym = @control_tmp


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Tasks>',@xml_seq_tmp)


--  select  @taskname_tmp = task_name,
--   @taskdescr_tmp = task_descr,
--   @tasktype_tmp = task_type,
--   @taskseq_tmp = task_seq
declare TotTasks cursor FAST_FORWARD  for
-- Code Modified By Jeya for the Bug ID PNR2.0_19279 Starts
select distinct upper(context.task_name), context.task_descr,  context.task_type,  context.task_seq ,context.page_name,
syn.bt_synonym_caption
from de_published_ui_contextmenu_task_dtl context(nolock),
de_published_action_lng_extn task (nolock),
de_glossary syn (nolock)
where  context.customer_name  = task.customer_name
and  context.project_name  = task.project_name
and  context.component_name  = task.component_name
and  context.process_name  = task.process_name
and  context.activity_name  = task.activity_name
and  context.ui_name  = task.ui_name
and  context.ecrno    = task.ecrno
--and  context.page_name  = task.page_bt_synonym -- Commented for the Bug Id PNR2.0_26026
and  context.task_name  = task.task_name

and  task.customer_name  = syn.customer_name
and  task.project_name  = syn.project_name
and  task.component_name  = syn.component_name
and  task.process_name  = syn.process_name
and  task.primary_control_bts   = syn.bt_synonym_name

and  context.customer_name  = @engg_customer_name
and   context.project_name  = @engg_project_name
and  context.ecrno   = @engg_req_no
and   context.component_name  = @engg_component
and   context.activity_name  = @activity_name
and  context.ui_name  = @ui_tmp
and  context.page_name = @page_tmp
and  context.section_name = @section_tmp
and  context.control_bt_synonym = @control_tmp
order by context.task_seq
-- Code Modified By Jeya for the Bug ID PNR2.0_19279 Ends
open TotTasks
-- For each control generate entries
while (1=1)
begin

fetch next from TotTasks into
@taskname_tmp,@taskdescr_tmp, @tasktype_tmp, @taskseq_tmp, @pref_pagename, @TaskCaption_tmp
if @@fetch_status <> 0
break

-- Code modification for PNR2.0_21576 starts

select @taskdescr_tmp = replace(@taskdescr_tmp,'&','&amp;')
select @taskdescr_tmp = replace(@taskdescr_tmp,'<','&lt;')
select @taskdescr_tmp = replace(@taskdescr_tmp,'>','&gt;')
select @taskdescr_tmp = replace(@taskdescr_tmp,'"','&quot;')


select @TaskCaption_tmp = replace(@TaskCaption_tmp,'&','&amp;')
select @TaskCaption_tmp = replace(@TaskCaption_tmp,'<','&lt;')
select @TaskCaption_tmp = replace(@TaskCaption_tmp,'>','&gt;')
select @TaskCaption_tmp = replace(@TaskCaption_tmp,'"','&quot;')

-- Code modification for PNR2.0_21576 ends

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Task Name="'   + ltrim(rtrim(isnull(@taskname_tmp,'')))   + '" ' +
'TaskDesc="'  + ltrim(rtrim(isnull(@taskdescr_tmp,'')))    + '" ' +
'TaskSeq="'   + ltrim(rtrim(isnull(str(@taskseq_tmp),'')))  + '" ' +
'TaskType="'   + ltrim(rtrim(isnull(@tasktype_tmp,'')))  + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@pref_pagename,''))) + '" ' +
-- Code Modified By Jeya for the Bug ID PNR2.0_19279 Starts
'TaskCaption="'   + ltrim(rtrim(isnull(@TaskCaption_tmp,''))) + '"/>',@xml_seq_tmp)
-- Code Modified By Jeya for the Bug ID PNR2.0_19279 Ends
end
close TotTasks
deallocate TotTasks

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Tasks>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Control>',@xml_seq_tmp)

end
close prefTasks
deallocate prefTasks


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Controls>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</PreferredTasks>',@xml_seq_tmp)
-- End for the Feature Context Menu(PNR2.0_1476) --Added by Jeya

-- Code Added for the Feature Control Extensions Starts-- by Jeya Latha K
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<ControlExtensions>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Controls>',@xml_seq_tmp)


set @ctrlchk = ''

declare get_controlext cursor FAST_FORWARD  for

select distinct ui_name,  upper(page_bt_synonym), upper(section_name), upper(control_bt_synonym) from de_published_control_extensions  (nolock)
where  customer_name = @engg_customer_name
and  project_name = @engg_project_name
and  ecrno   = @engg_req_no
and  component_name = @engg_component
and  activity_name = @activity_name
and ui_name = @ui_name_tmp

declare @ce_ui_tmp engg_name
declare @ce_control_tmp engg_name
declare @ce_page_tmp engg_name
declare @ce_section_tmp engg_name
declare @ce_taskname_tmp engg_name
declare @ce_taskdescr_tmp engg_name
declare @ce_tasktype_tmp engg_name
declare @ce_taskseq_tmp engg_name
declare @ce_control_id_tmp engg_name
declare @ce_TaskCaption_tmp engg_name

open get_controlext
-- For each control generate entries
while (1=1)
begin

fetch next from get_controlext into
@ce_ui_tmp,@ce_page_tmp, @ce_section_tmp, @ce_control_tmp--, @control_id_tmp
if @@fetch_status <> 0
break


set @ctrlchk = ltrim(rtrim(isnull(@control_tmp,'')))

select @ce_control_id_tmp = substring(@ce_control_tmp, charindex('(', @ce_control_tmp)+1, charindex('-',@ce_control_tmp) -  charindex('(', @ce_control_tmp)-1 )

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name, component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + upper(ltrim(rtrim(isnull(@ce_control_id_tmp,''))))   + '" ' +
'PageName="'  + upper(ltrim(rtrim(isnull(@ce_page_tmp,''))))    + '" ' +
'SectionName="'   + upper(ltrim(rtrim(isnull(@ce_section_tmp,''))))  + '">',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Tasks>',@xml_seq_tmp)

declare TotTasks1 cursor FAST_FORWARD  for
select distinct upper(context.task_name), context.controlextension_name,  context.task_type,  context.controlextension_seq , upper(context.page_bt_synonym),
syn.bt_synonym_caption
from de_published_control_extensions context(nolock),
de_published_action_lng_extn task (nolock),
de_glossary syn (nolock)
where  context.customer_name  = task.customer_name
and  context.project_name  = task.project_name
and  context.component_name  = task.component_name
and  context.process_name  = task.process_name
and  context.activity_name  = task.activity_name
and  context.ui_name  = task.ui_name
and  context.ecrno    = task.ecrno
and  context.page_bt_synonym  = task.page_bt_synonym
and  context.task_name  = task.task_name

and  task.customer_name  = syn.customer_name
and  task.project_name  = syn.project_name
and  task.component_name  = syn.component_name
and  task.process_name  = syn.process_name
and  task.primary_control_bts   = syn.bt_synonym_name

and  context.customer_name  = @engg_customer_name
and   context.project_name  = @engg_project_name
and  context.ecrno   = @engg_req_no
and   context.component_name  = @engg_component
and   context.activity_name  = @activity_name
and  context.ui_name  = @ce_ui_tmp
and  context.page_bt_synonym = @ce_page_tmp
and  context.section_name = @ce_section_tmp
and  context.control_bt_synonym = @ce_control_tmp
order by context.controlextension_seq  -- PNR2.0_26118

open TotTasks1
-- For each control generate entries
while (1=1)
begin

fetch next from TotTasks1 into
@ce_taskname_tmp,@ce_taskdescr_tmp, @ce_tasktype_tmp, @ce_taskseq_tmp, @ce_page_tmp, @ce_TaskCaption_tmp
if @@fetch_status <> 0
break


select @ce_taskdescr_tmp = replace(@ce_taskdescr_tmp,'&','&amp;')
select @ce_taskdescr_tmp = replace(@ce_taskdescr_tmp,'<','&lt;')
select @ce_taskdescr_tmp = replace(@ce_taskdescr_tmp,'>','&gt;')
select @ce_taskdescr_tmp = replace(@ce_taskdescr_tmp,'"','&quot;')


select @ce_TaskCaption_tmp = replace(@ce_TaskCaption_tmp,'&','&amp;')
select @ce_TaskCaption_tmp = replace(@ce_TaskCaption_tmp,'<','&lt;')
select @ce_TaskCaption_tmp = replace(@ce_TaskCaption_tmp,'>','&gt;')
select @ce_TaskCaption_tmp = replace(@ce_TaskCaption_tmp,'"','&quot;')

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Task Name="'   + ltrim(rtrim(isnull(@ce_taskname_tmp,'')))   + '" ' +
'TaskDesc="'  + ltrim(rtrim(isnull(@ce_taskdescr_tmp,'')))    + '" ' +
'TaskSeq="'   + ltrim(rtrim(isnull(str(@ce_taskseq_tmp),'')))  + '" ' +
'TaskType="'   + ltrim(rtrim(isnull(@ce_tasktype_tmp,'')))  + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@ce_page_tmp,''))) + '" ' +
'TaskCaption="'   + ltrim(rtrim(isnull(@TaskCaption_tmp,''))) + '"/>',@xml_seq_tmp)
end
close TotTasks1
deallocate TotTasks1

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Tasks>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Control>',@xml_seq_tmp)

end
close get_controlext
deallocate get_controlext


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Controls>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</ControlExtensions>',@xml_seq_tmp)
-- Code Added for the Feature Control Extensions  End-- by Jeya Latha K


-- Added By Feroz For List Edit
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '<ListEdit>',@xml_seq_tmp)

declare @listedit_synonym  engg_name,
@listedit_controlid  engg_name,
@mapped_bt_synonym  engg_name,
@Mapped_control_id  engg_name,
@Mapped_view_name  engg_name,
@listedit_column_synonym engg_name,
@data_mapped_synonym engg_name,
@datamap_control_id  engg_name,
@datamap_view_name  engg_name,
@lst_controlid   engg_name,
@listedit_viewname  engg_name ,@visible_listcolumn engg_flag,@autolist_not_req       engg_flag,@controlname engg_name


--declare @page_bt_synonym  engg_name --Added for PNR2.0_26631

declare ListEditMainCur cursor FAST_FORWARD  for
select distinct listedit_synonym, listedit_controlid, listedit_viewname -- Modified By feroz for bug id :PNR2.0_23463
from de_published_listedit_control_map (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
order by listedit_synonym


open ListEditMainCur
while (1=1)
begin

fetch next from ListEditMainCur into @listedit_synonym, @lst_controlid, @listedit_viewname -- Modified By feroz for bug id :PNR2.0_23463
if @@fetch_status <> 0
break


-- Modified By feroz for bug id :PNR2.0_23463
select @listedit_controlid = Control_id
from de_published_ui_control (nolock)
where  customer_name  = @engg_customer_name
and   project_name  = @engg_project_name
and  ecrno   = @engg_req_no
and   component_name  = @engg_component
and   activity_name  = @activity_name
and  ui_name   = @ui_name_tmp
and  control_bt_synonym = @listedit_synonym
and  control_id   = @lst_controlid
and  view_name   = @listedit_viewname
-- Modified By feroz for bug id :PNR2.0_23463

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<ListControl Name="'   + upper(ltrim(rtrim(isnull(@listedit_controlid,''))))   + '">',@xml_seq_tmp)



declare ListEditCur cursor FAST_FORWARD  for
select mapped_bt_synonym, control_id, view_name ,page_bt_synonym   --Modified for PNR2.0_26631
from de_published_listedit_control_map  (nolock)
where  customer_name   = @engg_customer_name
and   project_name   = @engg_project_name
and   ecrno      = @engg_req_no
and   component_name   = @engg_component
and   activity_name  = @activity_name
and  ui_name    = @ui_name_tmp
and  listedit_synonym = @listedit_synonym
order by mapped_bt_synonym, control_id, view_name


open ListEditCur
while (1=1)
begin

fetch next from ListEditCur into @mapped_bt_synonym, @Mapped_control_id, @Mapped_view_name,@page_bt_synonym --Modified for PNR2.0_26631
if @@fetch_status <> 0
break

select @primary_search_column  =  Upper(b.listedit_controlid) + b.listedit_viewname,
@list_index_search  =  a.list_index_search
from de_published_resolvelist_data_map a (nolock),
de_published_listedit_column b (nolock)
where  a.customer_name  = @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno      = @engg_req_no
and   a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and  a.ui_name    = @ui_name_tmp
--and  a.page_bt_synonym	  =	@page_bt_synonym  --Modified for PNR2.0_26631  	--Commented for PNR2.0_26701
and  a.mapped_bt_syn_page =	@page_bt_synonym  --Modified for  PNR2.0_26701
and  a.listedit_synonym = @listedit_synonym
and  a.mapped_bt_synonym = @mapped_bt_synonym
and  a.primary_search_column = 1
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   = b.ui_name
and  a.listedit_synonym = b.listedit_synonym
and  a.listedit_column_synonym = b.listedit_column_synonym

--Kanagavel A
select @controlname = ''
	select @autolist_not_req = isnull(autolist_not_req,'N') , @controlname = isnull(control_bt_synonym,'')
	from de_published_ui_control  ctrl (nolock),
	es_comp_ctrl_type_mst_vw  ctype (nolock)
	where ctrl.customer_name  = ctype.customer_name
	and  ctrl.project_name  = ctype.project_name
	and  ctrl.process_name  = ctype.process_name
	and  ctrl.component_name  = ctype.component_name
	and  ctrl.control_type  = ctype.ctrl_type_name
	and  ctrl.customer_name  =   @engg_customer_name
	and  ctrl.project_name  = @engg_project_name
	and  ctrl.ecrno    = @engg_req_no
	and  ctrl.process_name  = @process_name
	and  ctrl.component_name  = @engg_component
	and  ctrl.activity_name  =  @activity_name
	and  ctrl.ui_name   =  @ui_name_tmp
	and  ctrl.control_bt_synonym = @mapped_bt_synonym

IF COALESCE (@controlname,'')=''

			select @autolist_not_req = isnull(autolist_not_req,'N') 
			from de_published_ui_grid  ctrl (nolock),
			es_comp_ctrl_type_mst_vw  ctype (nolock)
			where ctrl.customer_name  = ctype.customer_name
			and  ctrl.project_name  = ctype.project_name
			and  ctrl.process_name  = ctype.process_name
			and  ctrl.component_name  = ctype.component_name
			and  ctrl.column_type  = ctype.ctrl_type_name
			and  ctrl.customer_name  =   @engg_customer_name
			and  ctrl.project_name  = @engg_project_name
			and  ctrl.ecrno    = @engg_req_no
			and  ctrl.process_name  = @process_name
			and  ctrl.component_name  = @engg_component
			and  ctrl.activity_name  =  @activity_name
			and  ctrl.ui_name   =  @ui_name_tmp
			and  ctrl.column_bt_synonym = @mapped_bt_synonym
	

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<EditControl Name="'   + upper(ltrim(rtrim(isnull(@mapped_bt_synonym,''))))   +  '" ' +
'ControlId="'   + upper(ltrim(rtrim(isnull(@Mapped_control_id,''))))   + '" ' +
'ViewName="'   + upper(ltrim(rtrim(isnull(@Mapped_view_name,''))))  + '" ' +
'PrimarySearchColumn="' + ltrim(rtrim(isnull(@primary_search_column,'')))  + '" ' +
'Autolist_Not_Req="' + ltrim(rtrim(isnull(@autolist_not_req,'')))  + '" ' +
'ListIndexSearch="'  + ltrim(rtrim(isnull(@list_index_search,'0')))       + '">',@xml_seq_tmp)

declare ListEditInnerCur cursor FAST_FORWARD  for
-- Modified By feroz for bug id :PNR2.0_23463
select a.listedit_column_synonym, a.data_mapped_synonym, a.control_id, a.view_name,case when a.visible = 1 then 'Y'
																				   else 'N'
																				   end
from de_published_resolvelist_data_map  a (nolock),
de_published_ui_grid      b (nolock)
where  a.customer_name  = @engg_customer_name
and   a.project_name   = @engg_project_name
and   a.ecrno      = @engg_req_no
and   a.component_name  = @engg_component
and   a.activity_name  = @activity_name
and  a.ui_name    = @ui_name_tmp
--and  a.page_bt_synonym = 	@page_bt_synonym  --Modified for PNR2.0_26631 --Commented for PNR2.0_26701
and  a.mapped_bt_syn_page = 	@page_bt_synonym	--Modified for  PNR2.0_26701 
and  a.listedit_synonym = @listedit_synonym
and  a.mapped_bt_synonym = @mapped_bt_synonym
--and  a.visible   = 1
and  a.customer_name  = b.customer_name
and  a.project_name  = b.project_name
and  a.ecrno    = b.ecrno
and  a.process_name  = b.process_name
and  a.component_name = b.component_name
and  a.activity_name  = b.activity_name
and  a.ui_name   = b.ui_name
--and  a.page_bt_synonym = b.page_bt_synonym  --commented for PNR2.0_26631
and  a.listedit_synonym = b.control_bt_synonym
and  a.listedit_column_synonym = b.column_bt_synonym
order by  b.control_id, b.view_name
-- Modified By feroz for bug id :PNR2.0_23463


open ListEditInnerCur
-- For each control generate entries
while (1=1)
begin

fetch next from ListEditInnerCur into @listedit_column_synonym, @data_mapped_synonym, @datamap_control_id, @datamap_view_name,
@visible_listcolumn
if @@fetch_status <> 0
break

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Column Name="'   + upper(ltrim(rtrim(isnull(@listedit_column_synonym,''))))   + '" ' +
'MappedControlId="'   + upper(ltrim(rtrim(isnull(@datamap_control_id,''))))   + '" ' +
'MappedViewName="'   + upper(ltrim(rtrim(isnull(@datamap_view_name,''))))   + '" ' +
'Visible="'   + upper(ltrim(rtrim(isnull(@visible_listcolumn,''))))   + '"/>', @xml_seq_tmp)

end
close ListEditInnerCur
deallocate ListEditInnerCur

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</EditControl>',@xml_seq_tmp)

end
close ListEditCur
deallocate ListEditCur

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</ListControl>',@xml_seq_tmp)


end
close ListEditMainCur
deallocate ListEditMainCur


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</ListEdit>',@xml_seq_tmp)

		
		
		Declare	@tmp_listcontrolsyn		engg_name,
				@tmp_listcontrolid		engg_documentation,
				@tmp_listviewname		engg_name,
				@tmp_queryid			engg_name,
				@tmp_searchindex		engg_name,
				@tmp_pagesize			engg_name,
				@tmp_searchcontext		ngplf_nvarchar_max,
				@tmp_resultcolumn		ngplf_nvarchar_max,
				@tmp_selectcolumn		ngplf_nvarchar_max,
				@tmp_caption			engg_description,
				@tmp_width				engg_seqno,
				@Position				engg_seqno,
				@tmp_pagename			engg_name,
				@xml_seq_tmp_out		int ,
				@sql					nvarchar(max)


-- Added By Feroz For List Edit
			--code added by kiruthika for bugid:PLF2.0_03710
			select @xml_seq_tmp=@xml_seq_tmp+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,   component_name,
			activity_name,    guid,     gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
			@activity_name,  @guid,    '<CustomList>',@xml_seq_tmp)
			Declare @editcontrol			engg_name,					@list_search_id			engg_custom,					@list_search_context	engg_custom, 
					@list_recurrent_search  engg_seqno,				    @list_search_delay		engg_seqno, 				    @list_select_column		engg_custom, 
				    @list_result_column		engg_custom, 				    @list_width				engg_seqno,					@control_id			engg_name				    			    			   	
					
		--	if @ctxt_service_in in ('BulkGenerate')	 and @pubflag = 'P'
			--begin   Commented for PLF2.0_07231
			
				
	
				declare custom_cursor cursor for	
				select	distinct upper(page_bt_synonym), upper(listedit_synonym),list_search_id,list_search_context, list_index_search, list_recurrent_search,
					    list_search_delay, list_select_column, list_result_column, list_width 
				from	de_published_custom_listedit  (nolock)
				where	customer_name		=  	@engg_customer_name
				and		project_name		=	@engg_project_name
				and		ecrno				= 	@engg_req_no
				and		process_name		=	@process_name
				and		component_name		=	@engg_component
				and		activity_name		=	@activity_name
				and		ui_name				= 	@ui_name_tmp
			

			open custom_cursor
			while (1=1)
			begin
				fetch next from custom_cursor into 
					@page_bt_synonym_tmp	, @editcontrol			, @list_search_id		  ,
					@list_search_context	, @list_index_search    , @list_recurrent_search  ,
				    @list_search_delay		, @list_select_column	, @list_result_column	  ,@list_width			
			
				if @@fetch_status <> 0
					break

		
				select	@control_id	= upper(ctrl_id)
				from	de_ui_control_dtl_vw (nolock)
					where	customer_name		=	@engg_customer_name
					and		project_name		=	@engg_project_name
					and		process_name		=	@process_name
					and		component_name		=	@engg_component
					and		activity_name		=	@activity_name
					and		ui_name				=	@ui_name_tmp
					and		page_bt_synonym		=	@page_bt_synonym_tmp -- modified for TECH-56570
					--and		section_bt_synonym	=	@de_maint_callout_section
					and		((control_bt_synonym	= @editcontrol) or 	(column_bt_synonym	= @editcontrol))
					

				select @xml_seq_tmp=@xml_seq_tmp+1
				insert into ep_genxml_tmp 
					(customer_name, 		project_name, 		req_no, 		process_name, 		component_name, 
					activity_name, 			guid, 				gen_xml,		seq_no)		
				values 
					(@engg_customer_name,	@engg_project_name, @engg_req_no,  	@process_name,	@engg_component,
					@activity_name,		@guid,
					'<EditControl Name="' 		+ ltrim(rtrim(isnull(@editcontrol,'')))			+ '" ' +	
					'ControlName="'   			+ ltrim(rtrim(@control_id))      + '" ' +					
					'PageName="'		+ ltrim(rtrim(isnull(@page_bt_synonym_tmp,''))) 			+ '" ' +
					'IlboName="'			+ ltrim(rtrim(isnull(@ui_name_tmp,'')))		+ '" ' +
					'ActivityName="'		+ ltrim(rtrim(isnull(@activity_name,'')))			+ '" ' +
					'ComponentName="'		+ ltrim(rtrim(isnull(@engg_component,'')))		+ '" ' +
					'SearchId="'		+ ltrim(rtrim(isnull(@list_search_id,'')))		+ '" ' +
					'SearchContext="'		+ ltrim(rtrim(isnull(@list_search_context,'')))		+ '" ' +
					'ListIndexSearch="'+ ltrim(rtrim(isnull(str(@list_index_search),'')))		+ '" ' +
					'Position="'+ ltrim(rtrim(isnull(str(@list_recurrent_search),'')))   + '" ' +
					'Delay="'+ ltrim(rtrim(isnull(str(@list_search_delay),'')))   + '" ' +
					'SelectColumn="'+ ltrim(rtrim(isnull(@list_select_column,'')))   + '" ' +
					'ResultColumn="'+ ltrim(rtrim(isnull(@list_result_column,'')))   + '" ' +
					'ListWidth="'+ ltrim(rtrim(isnull(str(@list_width),'')))      + '"/>',@xml_seq_tmp)
					
					
			end
			close custom_cursor
			deallocate custom_cursor
			
			-- Added by JL elastic search TECH-45546 Starts
			Declare eslist_cur cursor Fast_forward for
		SELECT	DISTINCT 
				UPPER(ListControlSynonym),	UPPER(ListControlID),	UPPER(ListViewname),		LOWER(QueryID),
				SearchIndex,		Pagesize--,		UPPER(Page_bt_synonym)--
		FROM	de_published_els_query_listedit_map lst (nolock)--,
			--	de_published_ui_control ctl (nolock)
		WHERE	lst.customername	=	@engg_customer_name
		and		lst.projectname	=	@engg_project_name
		and		lst.ecrno			=	@engg_req_no
		and		lst.processname	=	@process_name
		and		lst.componentname	=	@engg_component
		and		lst.activityname	=	@activity_name
		and		lst.uiname      	=	@ui_name_tmp	
		
		--and		ctl.customer_name		= lst.customername
		--and		ctl.project_name		= lst.projectname			
		--and		ctl.process_name		= lst.processname
		--and		ctl.component_name		= lst.componentname
		--and		ctl.activity_name		= lst.activityname
		--and		ctl.ui_name				= lst.uiname
		--and		ctl.ecrno				= lst.ecrno
		----and		ctl.Control_bt_synonym	= lst.ListControlSynonym
		--and		ctl.control_id			= lst.ListControlID
		--and		ctl.view_name			= lst.ListViewName
		--UNION
		--SELECT	DISTINCT 
		--		UPPER(ListControlSynonym),	UPPER(ListControlID),	UPPER(ListViewname),		LOWER(QueryID),
		--		SearchIndex,		Pagesize,		UPPER(Page_bt_synonym)--, 'Column'
		--FROM	de_published_els_query_listedit_map lst (nolock),
		--		de_published_ui_grid ctl (nolock)
		--WHERE	lst.customername	=	@engg_customer_name
		--and		lst.projectname	=	@engg_project_name
		--and		lst.ecrno			=	@engg_req_no
		--and		lst.processname	=	@process_name
		--and		lst.componentname	=	@engg_component
		--and		lst.activityname	=	@activity_name
		--and		lst.uiname      	=	@ui_name_tmp	
		
		--and		ctl.customer_name		= lst.customername
		--and		ctl.project_name		= lst.projectname			
		--and		ctl.process_name		= lst.processname
		--and		ctl.component_name		= lst.componentname
		--and		ctl.activity_name		= lst.activityname
		--and		ctl.ui_name				= lst.uiname
		--and		ctl.ecrno				= lst.ecrno
		----and		ctl.Column_bt_synonym	= lst.ListControlSynonym
		--and		ctl.control_id			= lst.ListControlID
		--and		ctl.view_name			= lst.ListViewName
		
		
		open eslist_cur
		Fetch Next from eslist_cur into @tmp_listcontrolsyn,	@tmp_listcontrolid,	@tmp_listviewname,	@tmp_queryid,
							@tmp_searchindex,	@tmp_pagesize--,		@tmp_pagename--, @tmp_node
			
		While (1=1)
		begin		
		If @@fetch_status <> 0 
		 break
		 
		
			SELECT	@tmp_searchindex	=	1,
					@position			=	1,
					@tmp_searchcontext	=	'',
					@tmp_resultcolumn	=	'',
					@tmp_selectcolumn	=	''
					

			select	@tmp_pagename		=	page_bt_synonym,
					@tmp_node			=	'Control'
			from	de_ui_control (nolock)
			where	customer_name		=	@engg_customer_name
			and		project_name		=	@engg_project_name
			and		process_name		=	@process_name
			and		component_name		=	@engg_component
			and		activity_name		=	@activity_name
			and		ui_name				=	@ui_name_tmp
			and		control_bt_synonym	=	@tmp_listcontrolsyn 

			IF ISNULL(@tmp_pagename,'') = ''
			BEGIN
				select	@tmp_pagename		=	page_bt_synonym,
						@tmp_node			=	'Column'
				from	de_ui_grid (nolock)
				where	customer_name		=	@engg_customer_name
				and		project_name		=	@engg_project_name
				and		process_name		=	@process_name
				and		component_name		=	@engg_component
				and		activity_name		=	@activity_name
				and		ui_name				=	@ui_name_tmp
				and		column_bt_synonym	=	@tmp_listcontrolsyn 
			END

			SELECT	@tmp_searchcontext	=	STUFF((SELECT '~' + (ISNULL(MappedControlID,'') + '$$' + ISNULL(MappedViewName,''))
					FROM de_published_els_query_listedit_input lst (nolock)
					WHERE	lst.customername	=	inp.customername
					and		lst.projectname		=	inp.projectname
					and		lst.componentname	=	inp.componentname
					and		lst.activityname	=	inp.activityname
					and		lst.uiname			=	inp.uiname
					and		lst.Listcontrolid	=	inp.Listcontrolid
					and		lst.listviewname	=	inp.listviewname
					and		lst.QueryID			=	inp.QueryID
					and		lst.ecrno			=	@engg_req_no
					FOR XML PATH ('')), 1, 1, '') 
			FROM	de_published_els_query_listedit_input inp (nolock)
			WHERE 	inp.customername	=	@engg_customer_name
			and		inp.projectname	=	@engg_project_name
			and		inp.ecrno			=	@engg_req_no
			and		inp.processname	=	@process_name
			and		inp.componentname	=	@engg_component
			and		inp.activityname	=	@activity_name
			and		inp.uiname      	=	@ui_name_tmp	
			and		inp.Listcontrolid	=	@tmp_listcontrolid
			and		inp.listviewname	=	@tmp_listviewname
			and		inp.queryid			=	@tmp_queryid
			GROUP BY  inp.customername, inp.projectname, inp.componentname, inp.activityname, inp.uiname, inp.Listcontrolid, inp.listviewname, inp.QueryID
			--select 'tt1',@tmp_searchcontext, @tmp_listcontrolid,@tmp_listviewname, @tmp_queryid
		
			SELECT	@tmp_resultcolumn	=	STUFF((SELECT '#' + (ISNULL(ResultColumnName,'') + '~' + ISNULL(IsVisible,'N') + '~' + CAST(ISNULL(Width,'20') AS NVARCHAR(10))+ '~' + ISNULL(ParameterCaption,''))
					FROM de_published_els_query_listedit_result lst (nolock)
					WHERE	lst.customername	=	inp.customername
					and		lst.projectname		=	inp.projectname
					and		lst.componentname	=	inp.componentname
					and		lst.activityname	=	inp.activityname
					and		lst.uiname			=	inp.uiname
					and		lst.Listcontrolid	=	inp.Listcontrolid
					and		lst.listviewname	=	inp.listviewname
					and		lst.QueryID			=	inp.QueryID
					and		lst.ecrno			=	@engg_req_no
					ORDER BY  seqno
					FOR XML PATH ('')), 1, 1, '') 
			FROM	de_published_els_query_listedit_result inp (nolock)
			WHERE 	inp.customername	=	@engg_customer_name
			and		inp.projectname	=	@engg_project_name
			and		inp.ecrno			=	@engg_req_no
			and		inp.processname	=	@process_name
			and		inp.componentname	=	@engg_component
			and		inp.activityname	=	@activity_name
			and		inp.uiname      	=	@ui_name_tmp	
			and		inp.Listcontrolid	=	@tmp_listcontrolid
			and		inp.listviewname	=	@tmp_listviewname
			and		inp.queryid			=	@tmp_queryid
			GROUP BY  inp.customername, inp.projectname, inp.componentname, inp.activityname, inp.uiname, inp.Listcontrolid, inp.listviewname, inp.QueryID
			
			
			IF ISNULL(@tmp_node,'') = 'Control'		
			BEGIN
				SELECT	@tmp_selectcolumn	=	STUFF((SELECT '#' + (ISNULL(MappedViewName,'') + '~' + CAST(ISNULL(Seqno-1,0) AS NVARCHAR(10)))
						FROM de_published_els_query_listedit_result lst (nolock)
						WHERE	lst.customername	=	inp.customername
						and		lst.projectname		=	inp.projectname
						and		lst.componentname	=	inp.componentname
						and		lst.activityname	=	inp.activityname
						and		lst.uiname			=	inp.uiname
						and		lst.Listcontrolid	=	inp.Listcontrolid
						and		lst.listviewname	=	inp.listviewname
						and		lst.QueryID			=	inp.QueryID
						and		lst.ecrno			=	@engg_req_no
						and		ISNULL(lst.MappedViewName,'')  <> ''
						ORDER BY  seqno
						FOR XML PATH ('')), 1, 1, '') 
				FROM	de_published_els_query_listedit_result inp (nolock)
				WHERE 	inp.customername	=	@engg_customer_name
				and		inp.projectname	=	@engg_project_name
				and		inp.ecrno			=	@engg_req_no
				and		inp.processname	=	@process_name
				and		inp.componentname	=	@engg_component
				and		inp.activityname	=	@activity_name
				and		inp.uiname      	=	@ui_name_tmp	
				and		inp.Listcontrolid	=	@tmp_listcontrolid
				and		inp.listviewname	=	@tmp_listviewname
				and		inp.queryid			=	@tmp_queryid
				and		ISNULL(inp.MappedViewName,'')  <> ''
				GROUP BY  inp.customername, inp.projectname, inp.componentname, inp.activityname, inp.uiname, inp.Listcontrolid, inp.listviewname, inp.QueryID
			END

			IF ISNULL(@tmp_node,'') = 'Column'		
			BEGIN
				SELECT	@tmp_selectcolumn	=	STUFF((SELECT '#' + (ISNULL(MappedViewName,'') + '~' + CAST(ISNULL(Seqno-1,0) AS NVARCHAR(10)))
						FROM de_published_els_query_listedit_result lst (nolock)
						WHERE	lst.customername	=	inp.customername
						and		lst.projectname		=	inp.projectname
						and		lst.componentname	=	inp.componentname
						and		lst.activityname	=	inp.activityname
						and		lst.uiname			=	inp.uiname
						and		lst.Listcontrolid	=	inp.Listcontrolid
						and		lst.listviewname	=	inp.listviewname
						and		lst.QueryID			=	inp.QueryID
						and		lst.ecrno			=	@engg_req_no
						--and		ISNULL(lst.MappedViewName,'')  <> ''
						ORDER BY  seqno
						FOR XML PATH ('')), 1, 1, '') 
				FROM	de_published_els_query_listedit_result inp (nolock)
				WHERE 	inp.customername	=	@engg_customer_name
				and		inp.projectname	=	@engg_project_name
				and		inp.ecrno			=	@engg_req_no
				and		inp.processname	=	@process_name
				and		inp.componentname	=	@engg_component
				and		inp.activityname	=	@activity_name
				and		inp.uiname      	=	@ui_name_tmp	
				and		inp.Listcontrolid	=	@tmp_listcontrolid
				and		inp.listviewname	=	@tmp_listviewname
				and		inp.queryid			=	@tmp_queryid
				--and		ISNULL(inp.MappedViewName,'')  <> ''
				GROUP BY  inp.customername, inp.projectname, inp.componentname, inp.activityname, inp.uiname, inp.Listcontrolid, inp.listviewname, inp.QueryID
			END
			
				select @xml_seq_tmp=@xml_seq_tmp+1
				insert into ep_genxml_tmp 
					(customer_name, 		project_name, 		req_no, 		process_name, 		component_name, 
					activity_name, 			guid, 				gen_xml,		seq_no)		
				values 
					(@engg_customer_name,	@engg_project_name, @engg_req_no,  	@process_name,	@engg_component,
					@activity_name,		@guid,
					'<EditControl Name="' 		+ ltrim(rtrim(isnull(@tmp_listcontrolsyn,'')))			+ '" ' +	
							'ControlName="'		+ ltrim(rtrim(isnull(@tmp_listcontrolid,''))) 			+ '" ' +					
							'PageName="'		+ ltrim(rtrim(isnull(@tmp_pagename,''))) 			+ '" ' +	
							'IlboName="'		+ UPPER(ltrim(rtrim(isnull(@ui_name_tmp,'')))) 			+ '" ' +	
							'ActivityName="'		+ UPPER(ltrim(rtrim(isnull(@activity_name,'')))) 			+ '" ' +
							'ComponentName="'		+ ltrim(rtrim(isnull(@engg_component,''))) 			+ '" ' +
							'SearchId="'		+ ltrim(rtrim(isnull(@tmp_queryid,''))) 			+ '" ' +
							'SearchContext="'		+ LOWER(ltrim(rtrim(isnull(@tmp_searchcontext,'')))) 			+ '" ' +
							'ListIndexSearch="'		+ ltrim(rtrim(isnull(@tmp_searchindex,0))) 			+ '" ' +
							'Position="'		+ ltrim(rtrim(isnull(@Position,0))) 			+ '" ' +
							'SelectColumn="'		+ LOWER(ltrim(rtrim(isnull(@tmp_selectcolumn,'')))) 			+ '" ' +
							'ResultColumn="'		+ ltrim(rtrim(isnull(@tmp_resultcolumn,''))) 	+ '"/>',@xml_seq_tmp)
					

		Fetch Next from eslist_cur into @tmp_listcontrolsyn,	@tmp_listcontrolid,	@tmp_listviewname,	@tmp_queryid,
							@tmp_searchindex,	@tmp_pagesize--,		@tmp_pagename
		
		end
		close eslist_cur
		deallocate eslist_cur
-- Added by JL elastic search TECH-45546 Ends

			
			select @xml_seq_tmp=@xml_seq_tmp+1
			insert into ep_genxml_tmp 
				(customer_name, 		project_name, 		req_no, 		process_name, 		component_name, 
				activity_name, 			guid, 				gen_xml,		seq_no)		
			values 
				(@engg_customer_name,	@engg_project_name, @engg_req_no,  	@process_name, 	@engg_component,
				@activity_name,		@guid,				'</CustomList>',			@xml_seq_tmp)
--code added by kiruthika for bugid:PLF2.0_03710
--Code added for completion charts
--END
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<CompletionCharts>',@xml_seq_tmp)

If EXISTS (	select 'K'
			from de_published_ui_section sec (nolock)
			where	 sec.customer_name  = @engg_customer_name
			and  sec.project_name  = @engg_project_name
			and  sec.ecrno    = @engg_req_no
			and  sec.process_name  =  @process_name
			and  sec.component_name  =  @engg_component
			and  sec.activity_name  =  @activity_name
			and  sec.ui_name    =  @ui_name_tmp
			and	 sec.section_type = 'Completion Chart')

begin 		--Check For completion chart existence for the UI	
			
declare compchart_curs cursor FAST_FORWARD  for
select distinct upper(sec.section_bt_synonym),upper(val.control_id),upper(con.control_id),upper(fal.control_id)
from de_published_ui_section sec (nolock),
de_published_ui_control val(nolock),
de_published_ui_control fal(nolock),
de_published_ui_control con(nolock)
where sec.customer_name = val.customer_name
and	 sec.project_name	=	val.project_name
and  sec.ecrno	=	val.ecrno
and  sec.process_name	= val.process_name
and	 sec.component_name	 = val.component_name
and  sec.activity_name  = val.activity_name
and	 sec.ui_name	=	val.ui_name
and	 sec.page_bt_synonym = val.page_bt_synonym
and  sec.section_bt_synonym	=	val.section_bt_synonym
and	 val.customer_name	=	fal.customer_name
and  val.project_name	= fal.project_name
and  val.ecrno	=	fal.ecrno
and  val.process_name = fal.process_name
and  val.component_name = fal.component_name
and  val.component_name = fal.component_name
and	 val.ui_name	=	fal.ui_name
and  val.page_bt_synonym = fal.page_bt_synonym
and  val.section_bt_synonym = fal.section_bt_synonym
and	 val.customer_name	=	con.customer_name
and  val.project_name	= con.project_name
and  val.ecrno	=	con.ecrno
and  val.process_name = con.process_name
and  val.component_name = con.component_name
and  val.component_name = con.component_name
and	 val.ui_name	=	con.ui_name
and  val.page_bt_synonym = con.page_bt_synonym
and  val.section_bt_synonym = con.section_bt_synonym
and	 sec.customer_name  = @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    = @engg_req_no
and  sec.process_name  =  @process_name
and  sec.component_name  =  @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and	 sec.section_type = 'Completion Chart'
and  val.control_type in (select ctrl_type_name from es_comp_ctrl_type_mst(nolock)
						  where config_value = 'Y'
						  and editable_flag	= 'Y'
						  and customer_name = @engg_customer_name
						  and project_name	= @engg_project_name
						  and process_name	= @process_name
						  and component_name	 = @engg_component)
and  fal.control_type in (select ctrl_type_name from es_comp_ctrl_type_mst(nolock)
						  where isfallback = 'Y'
						  and editable_flag	= 'Y'
						  and customer_name = @engg_customer_name
						  and project_name	= @engg_project_name
						  and process_name	= @process_name
						  and component_name	 = @engg_component)
and  con.control_type in (select ctrl_type_name from es_comp_ctrl_type_mst(nolock)
						  where config_parameter = 'Y'
						  and editable_flag	= 'Y'
						  and customer_name = @engg_customer_name
						  and project_name	= @engg_project_name
						  and process_name	= @process_name
						  and component_name	 = @engg_component)						 

-- declare temporary variables
declare @section_bt_synonym_chart  engg_name, @chart_value	engg_values, @chart_configuration	engg_values, @chart_fallback	engg_values
 
open compchart_curs
while (1=1)
begin
fetch next from compchart_curs into
@section_bt_synonym_chart, @chart_value, @chart_configuration, @chart_fallback

if @@fetch_status <> 0
break

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Section Name="'   + ltrim(rtrim(isnull(@section_bt_synonym_chart,'')))   + '" ' +
'Values="'+ ltrim(rtrim(isnull(@chart_value,'')))   + '" ' +
'Configuration="'+ ltrim(rtrim(isnull(@chart_configuration,'')))   + '" ' +
'Fallback="'+ ltrim(rtrim(isnull(@chart_fallback,'')))      + '"/>',@xml_seq_tmp)
end
close compchart_curs
deallocate compchart_curs

end  --Check For completion chart existence for the UI end

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</CompletionCharts>',  @xml_seq_tmp)

--Code added for Inplace videos

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<InplaceVideos>',@xml_seq_tmp)

If EXISTS (	select 'K'
			from de_published_ui_section sec (nolock)
			where	 sec.customer_name  = @engg_customer_name
			and  sec.project_name  = @engg_project_name
			and  sec.ecrno    = @engg_req_no
			and  sec.process_name  =  @process_name
			and  sec.component_name  =  @engg_component
			and  sec.activity_name  =  @activity_name
			and  sec.ui_name    =  @ui_name_tmp
			and	 sec.section_type = 'Inplace Video')

begin 		--Check For completion chart existence for the UI	

declare inplacevid_curs cursor FAST_FORWARD  for
select distinct  upper(sec.section_bt_synonym),upper(con.control_id),upper(val.control_id),upper(fal.control_id)
from de_published_ui_section sec (nolock),
de_published_ui_control val(nolock),
de_published_ui_control fal(nolock),
de_published_ui_control con(nolock)
where sec.customer_name = val.customer_name
and	 sec.project_name	=	val.project_name
and  sec.ecrno	=	val.ecrno
and  sec.process_name	= val.process_name
and	 sec.component_name	 = val.component_name
and  sec.activity_name  = val.activity_name
and	 sec.ui_name	=	val.ui_name
and	 sec.page_bt_synonym = val.page_bt_synonym
and  sec.section_bt_synonym	=	val.section_bt_synonym
and	 val.customer_name	=	fal.customer_name
and  val.project_name	= fal.project_name
and  val.ecrno	=	fal.ecrno
and  val.process_name = fal.process_name
and  val.component_name = fal.component_name
and  val.component_name = fal.component_name
and	 val.ui_name	=	fal.ui_name
and  val.page_bt_synonym = fal.page_bt_synonym
and  val.section_bt_synonym = fal.section_bt_synonym
and	 val.customer_name	=	con.customer_name
and  val.project_name	= con.project_name
and  val.ecrno	=	con.ecrno
and  val.process_name = con.process_name
and  val.component_name = con.component_name
and  val.component_name = con.component_name
and	 val.ui_name	=	con.ui_name
and  val.page_bt_synonym = con.page_bt_synonym
and  val.section_bt_synonym = con.section_bt_synonym
and	 sec.customer_name  = @engg_customer_name
and  sec.project_name  = @engg_project_name
and  sec.ecrno    = @engg_req_no
and  sec.process_name  =  @process_name
and  sec.component_name  =  @engg_component
and  sec.activity_name  =  @activity_name
and  sec.ui_name    =  @ui_name_tmp
and	 sec.section_type = 'Inplace Video'
and  con.control_type in (select ctrl_type_name from es_comp_ctrl_type_mst(nolock)
						  where base_ctrl_type = 'Link'
						  and customer_name = @engg_customer_name
						  and project_name	= @engg_project_name
						  and process_name	= @process_name
						  and component_name	 = @engg_component)
and  val.control_type in (select ctrl_type_name from es_comp_ctrl_type_mst(nolock)
						  where config_parameter = 'Y'
						  and editable_flag	= 'Y'
						  and customer_name = @engg_customer_name
						  and project_name	= @engg_project_name
						  and process_name	= @process_name
						  and component_name	 = @engg_component)
and  fal.control_type in (select ctrl_type_name from es_comp_ctrl_type_mst(nolock)
						  where isfallback = 'Y'
						  and editable_flag	= 'Y' 
						  and customer_name = @engg_customer_name
						  and project_name	= @engg_project_name
						  and process_name	= @process_name
						  and component_name	 = @engg_component)

-- declare temporary variables
declare @section_bt_synonym_video  engg_name,@video_value	engg_values,@video_configuration	engg_values,@video_fallback	engg_values

open inplacevid_curs
while (1=1)
begin
fetch next from inplacevid_curs into
@section_bt_synonym_video, @video_value, @video_configuration, @video_fallback

if @@fetch_status <> 0
break

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Section Name="'   + ltrim(rtrim(isnull(@section_bt_synonym_video,'')))   + '" ' +
'Values="'+ ltrim(rtrim(isnull(@video_value,'')))   + '" ' +
'Configuration="'+ ltrim(rtrim(isnull(@video_configuration,'')))   + '" ' +
'Fallback="'+ ltrim(rtrim(isnull(@video_fallback,'')))      + '"/>',@xml_seq_tmp)
end
close inplacevid_curs
deallocate inplacevid_curs

end --check for existence of inplace videos

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</InplaceVideos>',  @xml_seq_tmp)

--Code added for Datagrid

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '<DataGrid>',@xml_seq_tmp)

If exists ( select 'K'
			from de_published_ui_control   ctrl (nolock),
			es_comp_ctrl_type_mst_vw   ctype (nolock)
			where ctrl.customer_name  = ctype.customer_name
			and  ctrl.project_name  = ctype.project_name
			and  ctrl.process_name  = ctype.process_name
			and  ctrl.component_name  = ctype.component_name
			and  ctrl.control_type  = ctype.ctrl_type_name
			and  ctrl.customer_name  =   @engg_customer_name
			and  ctrl.project_name  = @engg_project_name
			and  ctrl.ecrno    =  @engg_req_no
			and  ctrl.process_name  = @process_name
			and  ctrl.component_name  = @engg_component
			and  ctrl.activity_name  =  @activity_name
			and  ctrl.ui_name    =  @ui_name_tmp
			and  ctype.Datagrid = 'Y'			)

begin 			

declare datagrid_curs cursor FAST_FORWARD  for
select isnull(upper(ctrl.section_bt_synonym),''),isnull(upper(ctrl.control_id),''),isnull(upper(MoveFirst),'N'),isnull(upper(Move_PrevSet),'N'),isnull(upper(Move_Previous),'N'),isnull(upper(Move_Next),'N'),isnull(upper(Move_NextSet),'N'),isnull(upper(Move_Last),'N')
,isnull(upper(Carousel_Req),'N'),isnull(upper(ctype.Orientation),''),isnull(upper(WrapCount),''),isnull(upper(Box_Type),'')
from de_published_ui_control   ctrl (nolock),
es_comp_ctrl_type_mst_vw   ctype (nolock)
where ctrl.customer_name  = ctype.customer_name
and  ctrl.project_name  = ctype.project_name
and  ctrl.process_name  = ctype.process_name
and  ctrl.component_name  = ctype.component_name
and  ctrl.control_type  = ctype.ctrl_type_name
and  ctrl.customer_name  =   @engg_customer_name
and  ctrl.project_name  = @engg_project_name
and  ctrl.ecrno    =  @engg_req_no
and  ctrl.process_name  = @process_name
and  ctrl.component_name  = @engg_component
and  ctrl.activity_name  =  @activity_name
and  ctrl.ui_name    =  @ui_name_tmp
and  ctype.Datagrid = 'Y'


open datagrid_curs
while (1=1)
begin
fetch next from datagrid_curs into
@dg_section_bt_synonym,@controlid_tmp,@MoveFirst,@Move_PrevSet,@Move_Previous,@Move_Next,@Move_NextSet,@Move_Last,
@Carousel_Req,@Orientation,@Wrapcount,@Box_Type

if @@fetch_status <> 0
break

select @colname = ''

select @colname = isnull(upper(col.view_name),'')
from de_published_ui_grid col(nolock)
--de_published_ui_control ctrl(nolock)
where  col.customer_name  =   @engg_customer_name
and   col.project_name  = @engg_project_name
and  col.ecrno    =  @engg_req_no
and  col.process_name  = @process_name
and  col.component_name  = @engg_component
and  col.activity_name  =  @activity_name
and  col.ui_name    =  @ui_name_tmp
and  col.control_id	= @controlid_tmp
--and  col.TemplateID ='y'
and  col.visible	=  'yes'

select @RowIndicator = isnull(upper(ctrl.control_id),'')
from de_published_ui_control ctrl(nolock)
where  ctrl.customer_name  	=   @engg_customer_name
and  ctrl.project_name  	= @engg_project_name
and  ctrl.ecrno    			=  @engg_req_no
and  ctrl.process_name  	= @process_name
and  ctrl.component_name  	= @engg_component
and  ctrl.activity_name  	=  @activity_name
and  ctrl.ui_name    		=  @ui_name_tmp
and  ctrl.section_bt_synonym = @dg_section_bt_synonym
and  ctrl.control_id		<> @controlid_tmp

---Changes for  PLF2.0_18487 ends
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,  component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,
'<Control Name="'   + ltrim(rtrim(isnull(@controlid_tmp,'')))   + '" ' +
'DvOrientation="'		+ isnull(@Orientation,'') +'" ' +
'DvColname="'		+ isnull(cast(@colname as varchar(100)),'') +'" ' +
'DvWrapcount="'		+ isnull(cast(@wrapcount as varchar(100)),'') +'" ' +
'DvBoxtype="'		+ isnull(cast(@Box_Type as varchar(100)),'') +'" ' +
'IsMovefirst="'		+ isnull(@MoveFirst,'N') +'" ' +
'IsMoveprevset="'		+ isnull(@Move_PrevSet,'N') +'" ' +
'IsMoveprev="'		+ isnull(@Move_Previous,'N') +'" ' +
'IsMovenext="'		+ isnull(@Move_Next,'N') +'" ' +
'IsMovenextset="'		+ isnull(@Move_NextSet,'N') +'" ' +
'IsMovelast="'		+ isnull(@Move_Last,'N') +'" ' +
'IsCarouselreq="'		+ isnull(@Carousel_Req,'N') +'" ' +
'RowIndicator="'		+ isnull(@RowIndicator,'')+'"/>' ,@xml_seq_tmp)

end
close datagrid_curs
deallocate datagrid_curs

end 

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,  seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</DataGrid>',  @xml_seq_tmp)
 
-- Code modification for  PNR2.0_30127 starts

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '<TaskPanes>',@xml_seq_tmp)

If exists (select 'K'
from	de_published_ui_taskpane (nolock)
where	customer_name	= @engg_customer_name
and		project_name	= @engg_project_name
and		ecrno			= @engg_req_no
and		process_name	= @process_name
and		component_name  = @engg_component
and		activity_name	= @activity_name
and		ui_name			= @ui_name_tmp)

begin 

declare @taskname_temp	engg_name,
		@taskdesc_temp	engg_description,
		@tasktype_temp	engg_name,
		@configsp_tmp	engg_description,
		@datasp_tmp		engg_description,
		@calloutreq_tmp	engg_flag
		
		
declare TaskPaneCur cursor FAST_FORWARD  for
select	distinct upper(task_name), task_descr, task_type, configuration_sp, data_sp, callout_req
from	de_published_ui_taskpane (nolock)
where	customer_name	= @engg_customer_name
and		project_name	= @engg_project_name
and		ecrno			= @engg_req_no
and		process_name	= @process_name
and		component_name  = @engg_component
and		activity_name	= @activity_name
and		ui_name			= @ui_name_tmp
order by upper(task_name)


open TaskPaneCur
while (1=1)
begin

	fetch next from TaskPaneCur into @taskname_temp, @taskdesc_temp, @tasktype_temp, @configsp_tmp, @datasp_tmp, @calloutreq_tmp
	if @@fetch_status <> 0
	break

	select @xml_seq_tmp=@xml_seq_tmp+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,  process_name,   component_name,
	activity_name,    guid,     gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,
	'<TaskPane TaskName="'   + ltrim(rtrim(isnull(@taskname_temp,'')))   + '" ' +
	'TaskDescr="'  + ltrim(rtrim(isnull(@taskdesc_temp,'')))    + '" ' +
	'TaskType="'  + ltrim(rtrim(isnull(@tasktype_temp,'')))   + '" ' +
	'ConfigurationSP="'  + ltrim(rtrim(isnull(@configsp_tmp,'')))  + '" ' +
	'DataSP="'  + ltrim(rtrim(isnull(@datasp_tmp,'')))  + '" ' +
	'CallOutReq="'+ ltrim(rtrim(isnull(@calloutreq_tmp,'')))   + '"/>',@xml_seq_tmp)
	
End
Close TaskPaneCur
Deallocate TaskPaneCur

end 

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</TaskPanes>',@xml_seq_tmp)



select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '<ErrorLookups>',@xml_seq_tmp)

If exists ( select 'K'
			from	de_fw_des_publish_error_lookup (nolock)
			where	customer_name	= @engg_customer_name
			and		project_name	= @engg_project_name
			and		ecrno			= @engg_req_no
			and		process_name	= @process_name
			and		component_name  = @engg_component
			and		activity_name	= @activity_name
			and		ui_name			= @ui_name_tmp )

begin 			
			
declare @errorid_temp		engg_name,
		@pub_taskname_temp	engg_description,
		@eheight	engg_seqno,
		@ewidth	engg_seqno,
		@suppress_msg engg_name
		
select @taskname_temp = ''
		
declare ErrorLookupCur cursor FAST_FORWARD  for
select	distinct upper(taskname), errorid, uppeR(post_task),height,[width],suppress_msg
from	de_fw_des_publish_error_lookup (nolock)
where	customer_name	= @engg_customer_name
and		project_name	= @engg_project_name
and		ecrno			= @engg_req_no
and		process_name	= @process_name
and		component_name  = @engg_component
and		activity_name	= @activity_name
and		ui_name			= @ui_name_tmp
order by upper(taskname), errorid


open ErrorLookupCur
while (1=1)
begin

	fetch next from ErrorLookupCur into @taskname_temp, @errorid_temp, @pub_taskname_temp,@eheight,@ewidth,@suppress_msg
	if @@fetch_status <> 0
	break

	select @xml_seq_tmp=@xml_seq_tmp+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,   component_name,
	activity_name,    guid,     gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,
	'<ErrorLookup TaskName="'   + ltrim(rtrim(isnull(@taskname_temp,'')))   + '" ' +
	'ErrorID="'  + ltrim(rtrim(isnull(@errorid_temp,'')))    + '" ' +
	'PubTaskName="'  + ltrim(rtrim(isnull(@pub_taskname_temp,'')))    + '" ' + 
	'Height="'  + ltrim(rtrim(isnull(@eheight,'')))    + '" ' +
	'Width="'  + ltrim(rtrim(isnull(@ewidth,'')))    + '" ' +
	'SuppressMsg="'  + ltrim(rtrim(isnull(@suppress_msg,'')))    +	'"/>',@xml_seq_tmp)
	
End
Close ErrorLookupCur
Deallocate ErrorLookupCur

end 

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</ErrorLookups>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '<FollowupTasks>',@xml_seq_tmp)

If exists (select 'K'
from	de_fw_des_publish_followup_tasks (nolock)
where	customer_name	= @engg_customer_name
and		project_name	= @engg_project_name
and		ecrno			= @engg_req_no
and		process_name	= @process_name
and		component_name  = @engg_component
and		activity_name	= @activity_name
and		ui_name			= @ui_name_tmp)

begin 

declare @success_errorid	engg_name,
		@followuptask_temp	engg_description
		
select @taskname_temp = ''
		
declare FollowupTaskCur cursor FAST_FORWARD  for
select	distinct upper(task_name), success_errorid, upper(followup_taskname),height,[width],suppress_msg
from	de_fw_des_publish_followup_tasks (nolock)
where	customer_name	= @engg_customer_name
and		project_name	= @engg_project_name
and		ecrno			= @engg_req_no
and		process_name	= @process_name
and		component_name  = @engg_component
and		activity_name	= @activity_name
and		ui_name			= @ui_name_tmp
order by upper(task_name), success_errorid


open FollowupTaskCur
while (1=1)
begin

	fetch next from FollowupTaskCur into @taskname_temp, @success_errorid, @followuptask_temp,@eheight,@ewidth,@suppress_msg
	if @@fetch_status <> 0
	break

	select @xml_seq_tmp=@xml_seq_tmp+1	
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,   component_name,
	activity_name,    guid,     gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,
	'<FollowupTask TaskName="'   + ltrim(rtrim(isnull(@taskname_temp,'')))   + '" ' +
	'SuccessErrorID="'  + ltrim(rtrim(isnull(@success_errorid,'')))    + '" ' +
	'ErrorSeverity="'  + '6'    + '" ' +	
	'FollowupTaskName="'  + ltrim(rtrim(isnull(@followuptask_temp,'')))  + '" ' +  
	'Width="'  + ltrim(rtrim(isnull(@ewidth,'')))    + '" ' +
	'Height="'  + ltrim(rtrim(isnull(@eheight,'')))    + '" ' +
	'SuppressMsg="'  + ltrim(rtrim(isnull(@suppress_msg,'')))+ '"/>',@xml_seq_tmp)
	
End
Close FollowupTaskCur
Deallocate FollowupTaskCur

end

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</FollowupTasks>',@xml_seq_tmp)
-- Code modification for  PNR2.0_30127 ends

-- Code Added By Jeya for the Bug ID PNR2.0_19279 Starts
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no, process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<Trees>',@xml_seq_tmp)

If Exists (select 'K'
from    de_published_ui_section a(nolock)
where	a.customer_name	= @engg_customer_name
and		a.project_name	= @engg_project_name
and		a.ecrno			= @engg_req_no
and		a.process_name	= @process_name
and		a.component_name  = @engg_component
and		a.activity_name	= @activity_name
and		a.ui_name			= @ui_name_tmp
and     a.section_type    = 'tree' )

begin

declare TreesCur cursor FAST_FORWARD  for
select distinct upper(section_bt_synonym), upper(section_bt_synonym), upper(page_bt_synonym), CheckboxRequired, linesRequired
from de_published_tree_dtl (nolock)
where customer_name  =   @engg_customer_name
and     project_name  = @engg_project_name
and     process_name  = @process_name
and     component_name  = @engg_component
and     activity_name  = @activity_name
and     ui_name    =  @ui_name_tmp
and     ecrno   =  @engg_req_no

Union
--Code added for the Bug ID:PNR2.0_35458 starts
select  distinct upper(section_bt_synonym), upper(section_bt_synonym),upper(page_bt_synonym), '', '' 
from    de_published_ui_section a(nolock)
where	a.customer_name	= @engg_customer_name
and		a.project_name	= @engg_project_name
and		a.ecrno			= @engg_req_no
and		a.process_name	= @process_name
and		a.component_name  = @engg_component
and		a.activity_name	= @activity_name
and		a.ui_name			= @ui_name_tmp
and     a.section_type    = 'tree'
--Code added by Balaji D for the Bug ID: PNR2.0_35383 ends

and not exists (Select  'X'
                from de_published_tree_dtl b(nolock)
                where   A.customer_name   =  B.customer_name   
                and     a.project_name    =  B.project_name    
                and     a.process_name    =  B.process_name    
                and     a.component_name  =  B.component_name  
                and     a.activity_name   =  B.activity_name   
                and     a.ui_name         =  B.ui_name
         and     a.section_bt_synonym = b.section_bt_synonym)  
--Code added for the Bug ID:PNR2.0_35458 ends

declare @tree_id   engg_name
declare @tree_section  engg_name
declare @tree_page   engg_name
declare @tree_chk   engg_name
declare @tree_lines  engg_name
declare @tree_hdnctrl engg_name
declare @node_type  engg_name
declare @node_Eventreq engg_name
declare @node_task  engg_name,@associated_tree_ml engg_name


open TreesCur
-- For each control generate entries
while (1=1)
begin

fetch next from TreesCur into
@tree_id, @tree_section, @tree_page, @tree_chk, @tree_lines
if @@fetch_status <> 0
break

-- Code modified for PNR2.0_20445 on 31-Dec-2008
select  @tree_hdnctrl = c.control_id ,@associated_tree_ml=a.Associated_control --c.control_bt_synonym
from  de_ui_section  a (nolock),
de_ui_control  c (nolock)
where a.customer_name  = @engg_customer_name
and  a.project_name  = @engg_project_name
and  a.process_name  = @process_name
and  a.component_name = @engg_component
and  a.activity_name  = @activity_name
and  a.ui_name   = @ui_name_tmp
and  a.page_bt_synonym = @tree_page
and  a.section_bt_synonym = @tree_section

and  a.customer_name  = c.customer_name
and  a.project_name  = c.project_name
and  a.process_name  = c.process_name
and  a.component_name = c.component_name
and  a.activity_name  = c.activity_name
and  a.ui_name          = c.ui_name
and  a.page_bt_synonym = c.page_bt_synonym
and  a.section_bt_synonym = c.section_bt_synonym
and  a.section_type   = 'Tree'

If isnull(@tree_chk,'') = '' or @tree_chk = '0'
select @tree_chk = 'N'
else
select @tree_chk = 'Y'

If isnull(@tree_lines,'') = '' or @tree_lines = '0'
select @tree_lines = 'N'
else
select @tree_lines = 'Y'


insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Tree Id="'   + ltrim(rtrim(isnull(@tree_id,'')))   + '" ' +
'SectionName="'  + ltrim(rtrim(isnull(@tree_section,'')))    + '" ' +
'PageName="'   + ltrim(rtrim(isnull(@tree_page,''))) + '" ' +
'CheckReq="'   + ltrim(rtrim(isnull(@tree_chk,''))) + '" ' +
'LinesRequired="'   + ltrim(rtrim(isnull(@tree_lines,''))) + '" ' +
'AssociatedMl="'   + ltrim(rtrim(isnull(@associated_tree_ml,''))) + '" ' + 
'HiddenControl="'   + ltrim(rtrim(isnull(@tree_hdnctrl,''))) + '">',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<nts>',@xml_seq_tmp)

declare NodesCur cursor FAST_FORWARD  for
select distinct upper(node_type), event_req, upper(mapped_task), ExpandImageEvent
from de_published_tree_dtl (nolock)
where customer_name  =   @engg_customer_name
and project_name  = @engg_project_name
and ecrno = @engg_req_no --code changed by venkatesh
and  process_name  = @process_name
and  component_name  = @engg_component
and  activity_name  = @activity_name
and  ui_name    =  @ui_name_tmp
and  page_bt_synonym  = @tree_page
and section_bt_synonym = @tree_section
and event_req in ('Y','1')

open NodesCur
-- For each control generate entries
while (1=1)
begin

fetch next from NodesCur into
@node_type, @node_Eventreq, @node_task,@ExpandImageEvent
if @@fetch_status <> 0
break

If isnull(@node_Eventreq,'') = '' or @node_Eventreq = '0'
select @node_Eventreq = 'N'
else
select @node_Eventreq = 'Y'

--if @node_task = '--NOACTION--'    code modified for BugID:PNR2.0_33556
--select @node_task = ''			code modified for BugID:PNR2.0_33556

--Code added for BugID:PNR2.0_33556 starts 

if @node_task = '--NOACTION--' and @node_Eventreq = 'Y'
	begin			
		
	select	distinct @node_task	=	a.task_name
		from	de_action a(nolock),
				de_ui_control b(nolock),
				de_ui_section c(nolock)
		where	c.customer_name			=	@engg_customer_name
		and		c.project_name			=	@engg_project_name
		and		c.process_name			=	@process_name
		and		c.component_name		=	@engg_component
		and		c.activity_name			=	@activity_name
		and		c.ui_name				=	@ui_name_tmp
		and		c.page_bt_synonym		=	@tree_page
		and	    c.section_bt_synonym	=	@tree_section
		and		c.section_type			=	'Tree'
		and		b.customer_name			=	c.customer_name	
		and		b.project_name			=	c.project_name	
		and		b.process_name			=	c.process_name	
		and		b.component_name		=	c.component_name
		and		b.activity_name			=	c.activity_name	
		and		b.ui_name				=	c.ui_name	
		and		b.section_bt_synonym	=	c.section_bt_synonym
		and		a.primary_control_bts	=	b.control_bt_synonym
		and		a.customer_name			=	b.customer_name	
		and		a.project_name			=	b.project_name	
		and		a.process_name			=	b.process_name	
		and		a.component_name		=	b.component_name
		and		a.activity_name			=	b.activity_name	
		and		a.ui_name				=	b.ui_name	
			
   end
--else
else if @node_Eventreq = 'N'  --changed for the Bug id:PLF2.0_07428
	begin
		select @node_task = ''
	end
--Code added for BugID:PNR2.0_33556 ends

insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<nt Name="'   + ltrim(rtrim(isnull(@node_type,'')))   + '" ' +
'EventRequired="'  + ltrim(rtrim(isnull(@node_Eventreq,'')))    + '" ' +
'ExpandImageEvent="'   + ltrim(rtrim(isnull(@ExpandImageEvent,''))) + '" ' +
'MappedTask="'   + ltrim(rtrim(isnull(@node_task,''))) + '"/>',@xml_seq_tmp)


end
close NodesCur
deallocate NodesCur

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</nts>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</Tree>',@xml_seq_tmp)

end
close TreesCur
deallocate TreesCur

end 

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</Trees>',@xml_seq_tmp)

-- Code Added By Jeya for the Bug ID PNR2.0_19279 Ends

--Kanagavel Starts

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<UserSections>',@xml_seq_tmp)

If exists ( select 'K'
			from de_published_user_section(nolock)
			where customer_name		=	@engg_customer_name
			and project_name				=	@engg_project_name
			and ecrno						=	@engg_req_no
			and process_name			=	@process_name
			and component_name		=	@engg_component
			and activity_name			=	@activity_name
			and ui_name					=	@ui_name_tmp)

begin 			
			
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<BrowserContent>',@xml_seq_tmp)


declare     @include_value engg_name,
			@include_text varchar(max),
			@usersection_name engg_name
declare htmlattrcur cursor for 
select distinct section_bt_synonym,include_value,include_text						
from de_published_user_section(nolock)
where customer_name		=	@engg_customer_name
and project_name				=	@engg_project_name
and ecrno						=	@engg_req_no
and process_name			=	@process_name
and component_name		=	@engg_component
and activity_name			=	@activity_name
and ui_name					=	@ui_name_tmp

open htmlattrcur
while (1=1)
begin

fetch next from htmlattrcur into
@usersection_name,@include_value, @include_text
if @@fetch_status <> 0
break


if @include_value ='HTML Onload'
begin


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLOnload>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLOnload>',@xml_seq_tmp)


end	

if @include_value ='HTML Body Content'
begin


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLBodyContent>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLBodyContent>',@xml_seq_tmp)

end	

if @include_value ='HTML JavaScript'
begin


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLJavaScript>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLJavaScript>',@xml_seq_tmp)
end	

if @include_value ='HTML JavaScript Before'
begin


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLJavaScriptBefore>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,    '</HTMLJavaScriptBefore>',@xml_seq_tmp)
end

--end
--close htmlattrcur

--open htmlattrcur
--while (1=1)
--begin

--fetch next from htmlattrcur into
--@usersection_name,@include_value, @include_text
--if @@fetch_status <> 0
--break

if @include_value ='HTML CSS'
begin


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLCSS>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLCSS>',@xml_seq_tmp)

end	

--For EXT6 Implementation

if @include_value ='HTML CSS6'
begin


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLCSS6>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLCSS6>',@xml_seq_tmp)

end	

if @include_value ='HTML Body Content6'
begin

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLBodyContent6>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLBodyContent6>',@xml_seq_tmp)

end	

-------

if @include_value ='HTML JavaScript6'
begin

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLJavaScript6>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLJavaScript6>',@xml_seq_tmp)

end	
----------

if @include_value ='UserJS CSS6'
begin

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<UserJSCSS6>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</UserJSCSS6>',@xml_seq_tmp)
end	
-----
if @include_value ='UserJS JavaScript6'
begin

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<UserJSJavaScript6>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</UserJSJavaScript6>',@xml_seq_tmp)
end	
-------
if @include_value ='HTML Content' or @include_value ='HTML Content6' 
																		
begin
select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<Section Name="'   + ltrim(rtrim(isnull(upper(@usersection_name),''))) + '">',@xml_seq_tmp)

if @include_value ='HTML Content'
begin
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLContent>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)


select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLContent>',@xml_seq_tmp)
end	

if @include_value ='HTML Content6'
begin
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '<HTMLContent6>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
 insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,   gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,  @guid,
'<![CDATA['   + ltrim(rtrim(isnull(@include_text,''))) + ']]>',@xml_seq_tmp)

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</HTMLContent6>',@xml_seq_tmp)
end

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</Section>',@xml_seq_tmp)

end
end
close htmlattrcur

deallocate htmlattrcur

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</BrowserContent>',@xml_seq_tmp)

end

select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,    gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
@activity_name,   @guid,    '</UserSections>',@xml_seq_tmp)

--kanagavel

--declare @xml_seq_tmp_out int
if exists (select 'X' from sys.procedures where name = 'de_ui_extended_properties')
begin 
exec de_ui_extended_properties  @engg_customer_name,	@engg_project_name, @engg_req_no,  	@process_name, 	@engg_component,
				     @activity_name, @ui_name_tmp ,	@language_code,@guid,  @xml_seq_tmp , @xml_seq_tmp_out out

set @xml_seq_tmp = @xml_seq_tmp_out
end


-- Insert Closing entry for ILBO
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name,  @engg_component,
@activity_name,  @guid,    '</ILBO>',@xml_seq_tmp)
--Code modified for bugId : PNR2.0_15674
drop table #de_published_LogicExt_ui_grid_dtl_vw_tmp
drop table #de_published_LogicExt_ui_control_dtl_main
drop table #de_published_LogicExt_ui_grid_dtl_main
/* Code Modified for the Case ID:PNR2.0_31149 By Shakthi P Starts (PNR2.0_31287)*/		
drop table #maplist  
drop table #tree_ui_task
drop table #AlignBtn	--Code Added for the Bug ID:PLF2.0_00961
/* Code Modified for the Case ID:PNR2.0_31149 By Shakthi P End (PNR2.0_31287)*/
end
close uicurs
deallocate uicurs

-- Insert Closing entry for ILBOs
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,    req_no,    process_name,   component_name,
activity_name,    guid,      gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name,  @engg_req_no,    @process_name, @engg_component,
@activity_name,  @guid,     '</ILBOs>',@xml_seq_tmp)

-- Insert Closing entry for Activity
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,    project_name,    req_no,    process_name,   component_name,
activity_name,     guid,      gen_xml,seq_no)
values
(@engg_customer_name,  @engg_project_name,  @engg_req_no,    @process_name, @engg_component,
@activity_name,   @guid,     '</Activity>',@xml_seq_tmp)

-- Insert Closing Root entry
select @xml_seq_tmp=@xml_seq_tmp+1
insert into ep_genxml_tmp
(customer_name,   project_name,   req_no,   process_name,   component_name,
activity_name,    guid,     gen_xml,seq_no)
values
(@engg_customer_name, @engg_project_name, @engg_req_no,  @process_name, @engg_component,
@activity_name,  @guid,    '</Activities>',@xml_seq_tmp)

if @ctxt_service_in = 'BulkGenerate'
begin
select  'engg_ui_xml' = gen_xml
from ep_genxml_tmp (nolock)
where guid   = @guid
order  by seq_no
end


End
GO 

IF EXISTS (SELECT 'X' FROM SYSOBJECTS WHERE NAME = 'de_generate_uixml' AND TYPE = 'P')
BEGIN
	GRANT EXEC ON de_generate_uixml TO PUBLIC
END
GO