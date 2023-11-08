/************************************************************************************************/
/* Procedure    : de_ui_extended_properties														*/ 
/* Description  :																				*/
/************************************************************************************************/
/* Project      :																				*/
/* ECR          :																				*/
/* Version      :																				*/
/************************************************************************************************/
/* Created by  	: Kanagavel A																	*/
/* Date         	: 25-Feb-2015																*/
/************************************************************************************************/ 
/* modified by			Date				Defect ID											*/
/* Veena U				08-Jun-2016			PLF2.0_18487										*/
/************************************************************************************************/
/* Modified by : Jeya Latha K/Ganesh Prabhu S	for callid TECH-7349							*/
/* Modified on : 14-03-2017				 														*/
/* Description :  New Base Control types RSAssorted, RSPivotGrid, RSTreeGrid and				*/
/*				New Feature Organization chart													*/
/************************************************************************************************/
/* Modified by : Ganesh Prabhu S/Ranjitha R      for callid  TECH-10118							*/
/* Modified on : 30-May-2017                                                                    */
/* Description : Platform Feature Release                                                       */
/************************************************************************************************/
/* Modified by  : Jeya Latha K		Date: 16-Aug-2017  Defect ID	:TECH-12776					*/  
/* Modified by  : Jeya Latha K		Date: 21-Nov-2017  Defect ID	:TECH-16126					*/  
/* Modified by  : Jeya Latha K		Date: 31-Jan-2018  Defect ID	:TECH-18349					*/  
/* Modified by  : Venkatesan K		Date: 31-jan-2018  Defect ID	:TECH-17984					*/ 
/* Description :Replace the special character '&','&amp;' for extended properties in			*/
/*				UI Layout XML.															        */
/************************************************************************************************/
/* Modified by  : JeyaLatha K				Date: 28-Feb-2018  Defect ID : TECH-19347			*/  
/************************************************************************************************/
/* Modified by  : JeyaLatha K				Date: 02-Apr-2018  Defect ID : TECH-20326		    */  
/* Description : Edit Mask Implementation and AutoSelect for Mobility	     				    */
/* AssociatedHiddenView has been renamed as DynamicFileID for attachment feature			    */
/************************************************************************************************/
/* Modified by  : JeyaLatha K				Date: 20-Apr-2018			Defect ID : TECH-21011	*/  
/* Modified by	: Jeya Latha K				Defect ID: TECH-27036       On: 11-Oct-2018			*/
/* Modified by	: Jeya Latha K				Defect ID: TECH-27286       On: 22-Oct-2018			*/
/* Modified by  : Jeya Latha K/Venkatesan K	Date: 31-Oct-2018			Defect ID : TECH-28010	*/  
/* Modified By : Jeya Latha K		        Date: 08-Jan-2019			Defect ID: TECH-28436	*/
/* Modified By : Kiruthika R		        Date: 21-Jan-2019			Defect ID: TECH-29894	*/
/* Modified by : Jeya Latha K				Date: 25-Jul-2019			Defect ID: TECH-36371	*/
/* Modified by : Jeya Latha K               Date: 30-Aug-2019           Defect ID: TECH-37471   */
/* Modified by : Jeya Latha K  	            Date: 29-Jan-2020           Defect ID : TECH-42483  */
/* Modified by : Jeya Latha K  	            Date: 27-Feb-2020           Defect ID : TECH-43307  */
/* Modified by : Jeya Latha K  	            Date: 03-Sep-2020           Defect ID :				*/
/* Modified by : Janani S                   Date: 05-jan-2021           Defect ID :	TECH-52636  */
/* Modified by : Manoj S                    Date: 09-Feb-2021           Defect ID : TECH-55189  */
/* MOdified by : Jeya Latha K				Date: 25-Mar-2021			Defect ID : ECE-505		*/
/* MOdified by : Srikanth S					Date: 27-May-2021			Defect ID : TECH-58371  */
/* Modified by : Srikanth S 				Date: 15-June-2021			Defect ID : TECH-59159  */
/* Modified by : Jeya Latha K				Date: 28-Jul-2021			Defect ID : TECH-60451	*/
/* TECH-60451  : Launching Help&Link UIs, Popup sections and Grid Extensions in Side Drawer     */
/* Modified by : Manoj  S                   Date: 04-Aug-2021           Defect ID : TECH-60668  */  
/* Modified by : Ganesh Prabhu S            Date: 09-Nov-2021           Defect ID : TECH-63606  */
/* Modified by : Ganesh Prabhu S            Date: 24-Dec-2021           Defect ID : TECH-65000  */ 
/* Modified by : Janani S                   Date: 12-Dec-2021           Defect ID : TECH-65049  */ 
/* Modified by : Manoj S					Date: 10-Jan-2022			Defect ID : TECH-65298  */
/* Modified by : Priyadharshini U			Date: 31-Mar-2022			Defect ID : TECH-66989  */
/************************************************************************************************/
/* Modified by  : Venkatesan K																	*/
/* Date         : 13-APR-2022																	*/
/* Defect ID	: TECH-68067																	*/
/* Description  : Provision to download all the attachments as bulk in Grid Control.			*/
/************************************************************************************************/
/* Modified by  : Ponmalar A/ Jeya Latha K														*/
/* Date         : 18-APR-2022																	*/
/* Defect ID	: TECH-68066																	*/
/* Description  : Post and Pre Tasks for Attachment controls.									*/
/************************************************************************************************/
/* Modified by : Manoj S					Date: 06-May-2022			Defect ID : TECH-68480  */
/************************************************************************************************/
/* Modified by : Manoj S					Date: 25-May-2022			Defect ID : TECH-68935  */
/************************************************************************************************/
/* Modified by : Ponmalar A/Jeya Latha K	Date: 13-Jun-2022			Defect ID : TECH-69629  */
/************************************************************************************************/
/* Modified by	:	Venkatesan K																*/
/* Modified on	:	15-Jun-2022				 													*/
/* Defect ID	:	TECH-69624																	*/
/* Description	:	Custom border, Custom actions and Responsive layout							*/
/************************************************************************************************/
/* Modified by	:	Ponmalar A/Jeya Latha K														*/
/* Modified on	:	11-July-22				 													*/
/* Defect ID	:	TECH-70687																	*/
/* Description	:	Tool and Toolbars															*/
/************************************************************************************************/
/* Modified by	:	Ponmalar A/Jeya Latha K														*/
/* Modified on	:	11-July-22				 													*/
/* Defect ID	:	TECH-71262																	*/
/************************************************************************************************/
/* Modified by  :   Jeya Latha K			Date: 28-Jul-2022			Defect ID : TECH-71109  */
/************************************************************************************************/
/* Modified by  :   Jeya Latha K			Date: 24-Aug-2022			Defect ID : TECH-72114  */
/************************************************************************************************/
/* Modified by  :   Ganesh Prabhu S			Date: 26-Aug-2022			Defect ID : TECH-72234  */
/************************************************************************************************/
alter PROCEDURE de_ui_extended_properties
@engg_customer_name engg_name,	
@engg_project_name 	engg_name, 
@engg_req_no		engg_name,  	
@process_name		engg_name, 	
@engg_component 	engg_name,
@activity_name		engg_name,
@ui_name_tmp		engg_name,
@language_code		engg_name,
@guid				engg_name,
@xml_seq_tmp		int ,
@xml_seq_tmp_out    int output
as 
begin
set nocount on 

--Local Variables declaration
declare @control_id			engg_name,  		@view_name				engg_name,			@PreventDownload	engg_name,			@norowstodisplay_notreq	engg_name
declare @placeholder		engg_description_lng,@place_lang				engg_seqno,			@enabledefault		engg_name,			@hideSelect				engg_name
declare @hideinsert			engg_flag,			@hidedelete				engg_flag,			@hidecopy			engg_flag,			@hidecut				engg_flag,
		@hidefilterdata		engg_flag,			@hidepdf				engg_flag,			@hidereport			engg_flag,			@hidehtml				engg_flag,
		@hideexportexcel	engg_flag,			@hideexportcsv			engg_flag,			@hideexporttext		engg_flag,			@hideimportdata			engg_flag,
		@hidechart			engg_flag,			@hideexportopenoffice	engg_flag,			@hidepersonalize	engg_flag,	        @HideColumnchooser      engg_flag,
		@searchhide			engg_flag,			@autoheight				engg_flag,  		@Preserve_visible_length 	engg_flag,	@Ishijri 	engg_flag,
		@Auto_width_column	engg_seqno,			@QlikLink				engg_flag,			@config_pos			engg_name,			@rowgrandtot_pos		engg_name,
		@rowsubtot_pos		engg_name,			@colgrandtot_pos		engg_name,			@colsubtot_pos		engg_name,			@rowgrandtot_text		engg_description,
		@colgrandtot_text	engg_description,	@rowsubtot_text			engg_description,	@colsubtot_text		engg_description,	@rowlabel				engg_flag,
		@columnlabel		engg_name,			@fieldValue				engg_name,			@rowlabelseq		engg_seqno,			@columnlabelseq			engg_seqno,
		@valueseq			engg_seqno,			@ValueFunction			engg_name,			@rowlabelsorting	engg_name,			@columnlabelsorting		engg_name,
		@control_bt_synonym engg_name,			@column_name			engg_name,			@ColumnCaption		engg_description,	@columnAlignment		engg_name,
		@SystemGeneratedFileId  engg_flag,		@IsMarquee				engg_flag,			@Configuration		engg_config,		@control_type			engg_name,
		@TabStyle			engg_name,			@TabHeaderPostion		engg_name,			@TabRotation		engg_name,			@controlid				engg_name,
		@groupname			engg_name,			@groupcaption			engg_description,	@columnname			engg_name,			@SequenceNo				engg_seqno,
		@mapped_entity		engg_name,			@isAssorted				engg_flag,			@RatingType			engg_name,			@gridtoform				engg_flag,
		@CaptchaData		engg_name,			@rowexpander			engg_flag,--,			@multiselector		engg_flag
		@section_bt_synonym engg_name ,			@task_name				engg_name,			@TreeColumn			engg_name,			@insert_req				engg_name,
		@delete_req			engg_name,			@ExpandEvent			engg_name,			@ExpandAllEvent		engg_name,			@CollapseEvent			engg_name,
		@CollapseAllEvent	engg_name,			@ClickEvent				engg_name,			@checkevent			engg_name,			@DDToolTip				engg_description,
		@ZoomMin			engg_seqno,			@ZoomMax				engg_seqno,			@engg_seqno			engg_seqno,			@DefaultZoom			engg_seqno,
		@ZoomStep			engg_seqno,			@NodeWidth				engg_seqno,			@NodeHeight			engg_seqno,			@DefaultFile			engg_description,
		@base_ctrl_type		engg_name,			@IsOrgChart				engg_flag,			@ctrltype_name		engg_name,			@bufferedrows			engg_flag,
		@AttachmentWithDesc	engg_flag,			@AssociatedHiddenView	engg_name,			@controlcolumnbt	engg_name,			@HlpAssociatedcontrol	engg_name, 
		@methodid			engg_name,			@MessageID				engg_name,			@maptask_name		engg_name,			@maptask_Descr			engg_Description,
		@maptask_type		engg_name,			@TransformAs			engg_name,			@columnclass		engg_name,			@swipeicon				engg_name,
		@swipecolor			engg_name,			@sectionlaunchtype		engg_name,			@Dynamicstorepath	engg_flag,			@DynamicHdnView			engg_name,
		@delayedpwdmask		engg_flag,			@Multifileselect		engg_flag,			@Multifilehdnview	engg_name,			@MetaDataBasedLink		engg_flag,
		@MDLinkHdnview		engg_name,			@GTFFormwidth			engg_code,			@GTFControllwidth	engg_code,			@GTFLabelwidth			engg_code,
		@GTFControlsperline	engg_seqno,			@renderas				engg_name,			@GTFLabelAlign		engg_name,			@InsertFlag				engg_flag,
		@tagsectionwidth	engg_name,			@EditMask				engg_flag,			@autoselect			engg_flag,			@rawdata				engg_flag,
		@replacechar		engg_flag,			@regularexp				engg_flag,			@NodeIconReqd		engg_flag,			@NodeCustomClass		engg_flag,
		@IsList				engg_flag,			@MultiSelect			engg_flag,			@SelectedRowcount	engg_flag,			@IsDocked				engg_flag,
		@Scan				engg_flag,			@NFC					engg_flag,			@AutoScan			engg_flag,			@AssGridName			engg_name,
		@AssGridTask		engg_name,			@AssGridTaskType		engg_name,			@PivotSection		engg_name,			@DynamicStyle			engg_name,
		@ImageAsData		engg_name,			@GridcontrolID			engg_name,			@GridViewName		engg_name,			@OldGridControlID		engg_name,
		@GanttControl		engg_flag,			@ListItemExpander		engg_flag,			@ReadOnly			engg_flag,			@ShowTodayLine			engg_flag,
		@ShowRollupTasks	engg_flag,			@ShowProjectLines		engg_flag,			@SkipWeekendsDuringDragDrop engg_flag,	@LockedGridWidth		engg_flag,
		@RowHeight			engg_name,			@BottomLabelField		engg_flag,			@TopLabelField		engg_flag,			@LeftLabelField			engg_flag,
		@RightLabelField	engg_flag,			@RollupLabelField		engg_flag,			@Baseline			engg_flag,			@ScrollToDateCentered	engg_flag,
		@Zoom				engg_flag,			@Fit					engg_flag,			@Export				engg_flag,			@Highlight				engg_flag,
		@Indent				engg_flag,			@Calendar				engg_flag,			@ContextMenu		engg_flag,			@PopupTaskEditor		engg_flag,
		@GanttShift			engg_flag,			@GanttExpand			engg_flag,			@GanttInsert		engg_flag,			@GanttDelete			engg_flag,
		@MLsearchonly		engg_flag,			@ListItemType			engg_name,			@hidefilterflagtreegrid engg_flag,		@ExtensionReqd			engg_flag,			
		@ParameterName		engg_name,			@ParameterSequence		engg_Seqno,			@MappedBTSynonym	engg_name,			@MappedField			engg_name,			
		@LaunchMode			engg_name,			@ExtensionType			engg_code,			@Caption			Engg_description,	@ShowLines				engg_flag,		--TECH-66989
		@BulkDownload		engg_flag,			@PreTask				engg_name,			@PostTask			engg_name,			@SectionCaption			Engg_description,	
		@BorderStyle		engg_code,			@HasCustomAction		engg_flag,			@BorderBottomRightRadius	engg_code,	@BorderBottomLeftRadius	engg_code,	
		@BorderTopRightRadius	engg_code,		@BorderTopLeftRadius	engg_code,			@BorderBottomColor	engg_name,			@BorderTopColor			engg_name,			
		@BorderRightColor	engg_name,			@BorderLeftColor		engg_name,			@BorderBottomWidth	engg_name,			@BorderTopWidth			engg_name,			
		@BorderRightWidth	engg_name,			@BorderLeftWidth		engg_name,			@HasPopup			engg_flag,			@TargetSection			engg_name,				
		@TargetbtSynonym	engg_name,			@TargetWidth			engg_code,			@TargetHeight		engg_code,			@TargetComponent		engg_name,			
		@TargetActivity		engg_name,			@TargetIlbo				engg_name,			@ActionControlID	engg_name,			@ActionViewName			engg_name,		
		@ActionControlBTSynonym		engg_name,	@page_bt_synonym_tmp	engg_name,			@pagebtsynonym		engg_name,			@LeftToolbar			engg_flag,			
		@RightToolbar		engg_flag,			@TopToolbar				engg_flag,			@BottomToolbar		engg_flag,			@MinimizedRows			engg_seqno,			
		@ViewMode			engg_name,			@HasTitleAction  		engg_flag,			@sectionbtsynonym	engg_name,			@sequence				engg_seqno,			
		@PagertbExists		engg_seqno,			@toolbarname			engg_name,			@tborientation		engg_name,			@Sidebar				engg_flag,
		@horder				engg_Seqno,			@vorder					engg_seqno,			@pagename			engg_name,			@BrowsePreTask			engg_name,			
		@BrowsePostTask		engg_name,			@DeletePreTask			engg_name,			@DeletePostTask		engg_name,			@AssociateControl		engg_name,			
		@AssociateViewname	engg_name, 			@CtrlAssociateControl	engg_name,			@ColAssociateColumn		engg_name, 		@CtrlButtonStyle		engg_flag,			
		@ColButtonStyle		engg_flag,			@CtrlSelectOnlyLE	engg_flag,				@ColSelectOnlyLE		engg_flag,		@IsMobile				engg_flag,
		@MobileGrid			engg_flag	--TECH-72114


	DECLARE @sql NVARCHAR(MAX)

	declare @DeviceType	engg_flag

	SELECT	@DeviceType		= ISNULL(DeviceType,'')
	FROM	ep_ui_mst (nolock)
	WHERE	customer_name  	= @engg_customer_name
	AND  	project_name  	= @engg_project_name		
	AND  	process_name  	= @process_name
	AND  	component_name  = @engg_component
	AND  	activity_name  	= @activity_name
	AND  	ui_name    		= @ui_name_tmp

	select @xml_seq_tmp_out=@xml_seq_tmp+1
	insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
	values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Properties>',@xml_seq_tmp_out)
		------------------------------------------------------------------------------Pages
--TECH-70687

	SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
	INSERT INTO ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
	VALUES
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Pages>',@xml_seq_tmp_out)
		
		
		DECLARE pagecurs CURSOR FAST_FORWARD  FOR
		SELECT '[MAINSCREEN]' 'page_bt_synonym' , ISNULL(Sidebar,'N'),
		isnull(LeftToolbar,'N'),isnull(RightToolbar,'N'),isnull(TopToolbar,'N'),isnull(BottomToolbar,'N'),0 'HOrder',0 'VOrder'		
		FROM de_published_ui pg (nolock)
		WHERE   pg.customer_name	= @engg_customer_name
		AND  pg.project_name		= @engg_project_name
		AND  pg.ecrno				= @engg_req_no
		AND  pg.component_name		= @engg_component
		AND  pg.activity_name		= @activity_name
		AND  pg.ui_name				= @ui_name_tmp
		AND    (ISNULL(pg.TopToolBar, 'N')	= 'Y' OR ISNULL(pg.BottomToolBar, 'N')	= 'Y'	
		OR		ISNULL(pg.LeftToolBar, 'N')	= 'Y' OR ISNULL(pg.RightToolBar, 'N')	= 'Y' OR ISNULL(pg.Sidebar, 'N')	= 'Y')
		
		UNION 
		SELECT upper(page_bt_synonym) 'page_bt_synonym', 'N',
		isnull(LeftToolbar,'N'),isnull(RightToolbar,'N'),isnull(TopToolbar,'N'),isnull(BottomToolbar,'N'),
		horder 'horder', vorder 'vorder'
		FROM de_published_ui_page pg (nolock)
		WHERE   pg.customer_name	= @engg_customer_name
		AND  pg.project_name		= @engg_project_name
		AND  pg.ecrno				= @engg_req_no
		AND  pg.component_name		= @engg_component
		AND  pg.activity_name		= @activity_name
		AND  pg.ui_name				= @ui_name_tmp
		AND	pg.page_bt_synonym <> '[mainscreen]'
		AND    (ISNULL(pg.TopToolBar, 'N')	= 'Y' OR ISNULL(pg.BottomToolBar, 'N')	= 'Y'	
		OR		ISNULL(pg.LeftToolBar, 'N')	= 'Y' OR ISNULL(pg.RightToolBar, 'N')	= 'Y')
		
		ORDER BY horder, vorder
		
		OPEN pagecurs
		FETCH NEXT FROM pagecurs INTO @page_bt_synonym_tmp, @Sidebar, @LeftToolBar,@RightToolBar,@TopToolBar,@BottomToolBar	,@horder,	@vorder
		
		WHILE @@FETCH_STATUS = 0
		BEGIN

			IF  (ISNULL(@LeftToolBar, 'N')	= 'Y' OR ISNULL(@RightToolBar, 'N')	= 'Y'	
			OR ISNULL(@TopToolBar, 'N')	= 'Y' OR ISNULL(@BottomToolBar, 'N')	= 'Y')
				SELECT @PagertbExists	 = 1
			ELSE
				SELECT @PagertbExists	 = 0

			SELECT @sql = '<Page Name="'   + ltrim(rtrim(@page_bt_synonym_tmp))   + '" ' +
							'LeftToolBar="'    + ltrim(rtrim(isnull(@LeftToolBar,'N')))  + '" ' +
							'RightToolBar="'    + ltrim(rtrim(isnull(@RightToolBar,'N')))  + '" ' +
							'TopToolBar="'    + ltrim(rtrim(isnull(@TopToolBar,'N')))  + '" ' +
							'BottomToolBar="'    + ltrim(rtrim(isnull(@BottomToolBar,'N')))   + '" '
			IF ISNULL(@PagertbExists,0)	= 0
				SELECT @sql = @sql + '/>'
			ELSE
				SELECT @sql = @sql + '>'

			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

			IF ISNULL(@PagertbExists,0)	= 1
			BEGIN

			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
			INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '<Toolbars>', @xml_seq_tmp_out)
		
			IF ISNULL(@page_bt_synonym_tmp,'') = '[mainscreen]'
					SELECT 	@pagename = replace(replace('[mainscreen]','[',''),']','') 
			ELSE
					SELECT @pagename	= @page_bt_synonym_tmp

					SELECT @section_bt_synonym = @pagename+ '_' + '%bar'

			DECLARE Toolbars CURSOR FAST_FORWARD FOR
			SELECT	DISTINCT section_bt_synonym
			FROM	de_published_ui_section  a(NOLOCK)
			WHERE	a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND     a.section_bt_synonym	LIKE @section_bt_synonym
			AND		LEN(a.section_bt_synonym)	= LEN(@pagename)+6
			AND     a.section_bt_synonym	NOT LIKE '%_sdbar'
			AND     a.horder	= 601  
			
			OPEN Toolbars

			FETCH NEXT FROM Toolbars INTO 
			@sectionbtsynonym
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 

			SELECT @sql =	'<Toolbar Name="'  + ltrim(rtrim(isnull(upper(a.section_bt_synonym),'')))    + '" ' +
							'Orientation="'  + CASE WHEN RIGHT(a.section_bt_synonym,5) = 'ttbar' THEN 'Top'	
							WHEN RIGHT(a.section_bt_synonym,5) = 'btbar' THEN 'Bottom'
							WHEN RIGHT(a.section_bt_synonym,5) = 'ltbar' THEN 'Left'
							WHEN RIGHT(a.section_bt_synonym,5) = 'rtbar' THEN 'Right' END     + '" ' +'>'
			FROM	de_published_ui_section  a	WITH (NOLOCK) 
			WHERE	a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp
			AND		section_bt_synonym		= @sectionbtsynonym
			AND		a.horder				= 601
	

			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
			INSERT INTO ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			VALUES
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

			
			DECLARE Toolbars_control CURSOR FAST_FORWARD FOR
			
			SELECT	DISTINCT 
					a.section_bt_synonym,	b.control_id,	b.order_seq,	
					c.bt_synonym_caption,	b.control_type
			FROM	de_published_ui_section  a(nolock), 
					de_published_ui_control  b(NOLOCK), 
					de_published_glossary	 c(NOLOCK)
			WHERE	a.customer_name			= b.customer_name
			AND		a.project_name			= b.project_name
			AND		a.ecrno					= b.ecrno
			AND		a.process_name			= b.process_name
			AND		a.component_name		= b.component_name
			AND		a.activity_name			= b.activity_name
			AND		a.ui_name				= b.ui_name
			AND		a.page_bt_synonym		= b.page_bt_synonym
			AND		a.section_bt_synonym	= b.section_bt_synonym

			AND		b.customer_name			= c.customer_name
			AND		b.project_name			= c.project_name
			AND		b.ecrno					= c.ecrno
			AND		b.process_name			= c.process_name
			AND		b.component_name		= c.component_name
			AND		b.control_bt_synonym	= c.bt_synonym_name	

			AND		a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND		a.horder				= 601
			AND		a.section_bt_synonym	= @sectionbtsynonym
			ORDER BY b.order_seq

			OPEN Toolbars_control

			FETCH NEXT FROM Toolbars_control INTO 
			@sectionbtsynonym	,@control_id,	@sequence ,	@caption,	@control_type
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 
			SELECT @sql =	'<Item Name="'  + ltrim(rtrim(isnull(upper(b.control_id),'')))    + '" ' +
							 'Sequence="'  + ltrim(rtrim(isnull(b.order_seq,'')))    + '" ' +
							 'ControlType="'  + ltrim(rtrim(isnull(upper(d.base_ctrl_type),'')))    + '" ' +'/>'
			FROM	de_published_ui_section  a(nolock), 
					de_published_ui_control  b(NOLOCK), 
					de_published_glossary  c(NOLOCK),
					es_comp_ctrl_type_mst d (NOLOCK)
			WHERE	a.customer_name			= b.customer_name
			AND		a.project_name			= b.project_name
			AND		a.ecrno					= b.ecrno
			AND		a.process_name			= b.process_name
			AND		a.component_name		= b.component_name
			AND		a.activity_name			= b.activity_name
			AND		a.ui_name				= b.ui_name
			AND		a.page_bt_synonym		= b.page_bt_synonym
			AND		a.section_bt_synonym	= b.section_bt_synonym

			AND		b.customer_name			= c.customer_name
			AND		b.project_name			= c.project_name
			AND		b.ecrno					= c.ecrno
			AND		b.process_name			= c.process_name
			AND		b.component_name		= c.component_name
			AND		b.control_bt_synonym	= c.bt_synonym_name	

			AND		b.customer_name			= c.customer_name
			AND		b.project_name			= c.project_name
			AND		b.ecrno					= c.ecrno
			AND		b.process_name			= c.process_name
			AND		b.component_name		= c.component_name
			AND		b.control_bt_synonym	= c.bt_synonym_name	

			AND		b.customer_name			= d.customer_name
			AND		b.project_name			= d.project_name
			AND		b.process_name			= d.process_name
			AND		b.component_name		= d.component_name
			AND		b.control_type			= d.ctrl_type_name	

			AND		a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND		a.horder				= 601	
			AND		a.section_bt_synonym	= @sectionbtsynonym
			AND		b.control_id			= @control_id
		
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

				FETCH NEXT FROM Toolbars_control INTO 
				@sectionbtsynonym	,@control_id,	@sequence ,	@caption,	@control_type
				
				END
				CLOSE Toolbars_control
				DEALLOCATE Toolbars_control	


				FETCH NEXT FROM Toolbars INTO 
				@sectionbtsynonym
				
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Toolbar>',@xml_seq_tmp_out)

				END
				CLOSE Toolbars
				DEALLOCATE Toolbars
			
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Toolbars>',@xml_seq_tmp_out)

				IF EXISTS ( select 'X'
				from de_published_ui (nolock)
				where   customer_name			= @engg_customer_name
				AND		project_name			= @engg_project_name
				AND		ecrno					= @engg_req_no
				AND		component_name			= @engg_component
				AND		activity_name			= @activity_name
				AND		ui_name					= @ui_name_tmp
				AND		@page_bt_synonym_tmp	= '[mainscreen]'
				AND		ISNULL(Sidebar,'')		= 'Y'
				)
				BEGIN
				
				SELECT @toolbarname		= 'mainscreen_sdbar'
				SELECT @tborientation	=	'Right'

				SELECT @sql = '<Sidebar Name="'   + LTRIM(RTRIM(upper(@toolbarname)))   + '" ' +
								'Docked="'    + LTRIM(RTRIM(ISNULL(@tborientation,'')))  + '"> ' 

				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,   @sql, @xml_seq_tmp_out)

			DECLARE Toolbars_control CURSOR FAST_FORWARD FOR
			
			SELECT	DISTINCT
					a.page_bt_synonym, a.section_bt_synonym,	a.control_id,	a.order_seq,	
					'b.bt_synonym_caption',	b.base_Ctrl_type
			FROM	de_published_ui_control  a(nolock)
			JOIN	es_comp_ctrl_type_mst b (NOLOCK)
			ON		a.customer_name   		= b.customer_name
			AND		a.project_name   		= b.project_name
			AND		a.process_name   		= b.process_name
			AND		a.component_name   		= b.component_name
			AND		a.control_type			= b.ctrl_type_name
			WHERE	a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND     a.page_bt_synonym		= '[mainscreen]'	
			AND		a.section_bt_synonym	=  @toolbarname
			ORDER BY a.order_seq

			OPEN Toolbars_control

			FETCH NEXT FROM Toolbars_control INTO 
			@pagebtsynonym	,@sectionbtsynonym	,@controlid,	@sequence ,	@caption,	@control_type
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 
			SELECT @sql =	'<Item Name="'  + ltrim(rtrim(isnull(upper(@controlid),'')))    + '" ' +
							 'Sequence="'  + ltrim(rtrim(isnull(@sequence,'')))    + '" ' +
							 'ControlType="'  + ltrim(rtrim(isnull(upper(@control_type),'')))   + '" ' +'/>'
			
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

				FETCH NEXT FROM Toolbars_control INTO 
				@pagebtsynonym	,@sectionbtsynonym	,@controlid,	@sequence ,	@caption,	@control_type
			

				END
				CLOSE Toolbars_control
				DEALLOCATE Toolbars_control
				
				
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Sidebar>', @xml_seq_tmp_out)

				END 
				END

				IF	ISNULL(@TopToolBar, 'N')	= 'Y' OR ISNULL(@BottomToolBar, 'N')	= 'Y'	OR ISNULL(@LeftToolBar, 'N')	= 'Y' OR ISNULL(@RightToolBar, 'N')	= 'Y'
				BEGIN
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Page>', @xml_seq_tmp_out)
				END
				
				FETCH NEXT FROM pagecurs INTO @page_bt_synonym_tmp, @sidebar, @LeftToolBar,@RightToolBar,@TopToolBar,@BottomToolBar, @horder,	@vorder		
				END
				CLOSE pagecurs
				DEALLOCATE  pagecurs

				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Pages>', @xml_seq_tmp_out)

--- TECH-70687
	------------------------------------------------------------------------------Sections
	SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
	INSERT INTO ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
	VALUES
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Sections>',@xml_seq_tmp_out)

	DECLARE sec_chart_cur CURSOR FAST_FORWARD 
	FOR
	SELECT	DISTINCT upper(a.section_bt_synonym) , upper(task_name)
	FROM	de_published_ui_section  a(NOLOCK) , de_published_ui_control  b(NOLOCK),
			de_published_action  c(NOLOCK) 
	WHERE	a.customer_name   		= @engg_customer_name
	AND		a.project_name   		= @engg_project_name
	AND		a.ecrno       			= @engg_req_no
	AND		a.process_name   		= @process_name
	AND		a.component_name   		= @engg_component
	AND		a.activity_name   		= @activity_name
	AND		a.ui_name      			= @ui_name_tmp	
	AND		a.customer_name			= b.customer_name
	AND		a.project_name			= b.project_name
	AND		a.ecrno					= b.ecrno
	AND		a.process_name			= b.process_name
	AND		a.component_name		= b.component_name
	AND		a.activity_name			= b.activity_name
	AND		a.ui_name				= b.ui_name
	AND		 a.page_bt_synonym		= b.page_bt_synonym
	AND		a.section_bt_synonym	= b.section_bt_synonym
	AND		b.customer_name			= c.customer_name
	AND		b.project_name			= c.project_name
	AND		b.ecrno					= c.ecrno
	AND		b.process_name			= c.process_name
	AND		b.component_name		= c.component_name
	AND		b.activity_name			= c.activity_name
	AND		b.ui_name				= c.ui_name
	AND		b.page_bt_synonym		= c.page_bt_synonym	
	AND		b.control_bt_synonym	= c.primary_control_bts
	AND		a.section_type			=	'Chart'
	--and  c.task_type				=	'Link'
	
	OPEN sec_chart_cur
	FETCH NEXT FROM sec_chart_cur INTO @section_bt_synonym , @task_name
			
	WHILE (1=1)
	BEGIN		
		IF @@fetch_status <> 0 
		 BREAK;
		SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
		SELECT @sql = '<Section Name="'   + ltrim(rtrim(isnull(@section_bt_synonym,'')))   + '" ' +
		'BorderStyle="'		+ ltrim(rtrim(isnull(@BorderStyle,'')))    + '" ' +
		'BorderTopLeftRadius="'  + ltrim(rtrim(isnull(@BorderTopLeftRadius,'')))    + '" ' +
		'BorderTopRightRadius="'  + ltrim(rtrim(isnull(@BorderTopRightRadius,'')))    + '" ' +
		'BorderBottomLeftRadius="'  + ltrim(rtrim(isnull(@BorderBottomLeftRadius,'')))    + '" ' +
		'BorderBottomRightRadius="'  + ltrim(rtrim(isnull(@BorderBottomRightRadius,'')))    + '" ' +
		'BorderLeftWidth="'  + ltrim(rtrim(isnull(@BorderLeftWidth,'')))+CASE WHEN ISNULL(@BorderLeftWidth,'')<>'' THEN 'px' ELSE '' END   + '" ' +
		'BorderRightWidth="'  + ltrim(rtrim(isnull(@BorderRightWidth,'')))+CASE WHEN ISNULL(@BorderRightWidth,'')<>'' THEN 'px' ELSE '' END   + '" ' +
		'BorderTopWidth="'  + ltrim(rtrim(isnull(@BorderTopWidth,'')))+CASE WHEN ISNULL(@BorderTopWidth,'')<>'' THEN 'px' ELSE '' END   + '" ' +
		'BorderBottomWidth="'  + ltrim(rtrim(isnull(@BorderBottomWidth,'')))+CASE WHEN ISNULL(@BorderBottomWidth,'')<>'' THEN 'px' ELSE '' END   + '" ' +
		'BorderLeftColor="'  + ltrim(rtrim(isnull(@BorderLeftColor,'')))    + '" ' +
		'BorderRightColor="'  + ltrim(rtrim(isnull(@BorderRightColor,'')))    + '" ' +
		'BorderTopColor="'  + ltrim(rtrim(isnull(@BorderTopColor,'')))    + '" ' +
		'BorderBottomColor="'  + ltrim(rtrim(isnull(@BorderBottomColor,'')))    + '" ' +
		'AssociatedTask="'  + ltrim(rtrim(isnull(@task_name,'')))    + '" '
		SELECT @sql = @sql +'/>'
	
		INSERT INTO ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		VALUES
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,   @sql,@xml_seq_tmp_out)

	FETCH NEXT FROM sec_chart_cur INTO @section_bt_synonym , @task_name
		
	END
	CLOSE sec_chart_cur
	DEALLOCATE sec_chart_cur

	--TECH-69624 starts

	DECLARE sec_cus_border CURSOR FAST_FORWARD 
	FOR
	SELECT	DISTINCT 
				upper(a.section_bt_synonym) ,	bt_synonym_caption,		BorderStyle,	
				BorderBottomRightRadius,		BorderBottomLeftRadius,	BorderTopRightRadius,	BorderTopLeftRadius,	
				BorderBottomColor,				BorderTopColor,			BorderRightColor,		BorderLeftColor,		
				BorderBottomWidth,				BorderTopWidth,			BorderRightWidth,		BorderLeftWidth,
				LeftToolbar,					RightToolbar,			TopToolbar,				BottomToolbar,		--TECH-71262
				MinimizedRows,					ViewMode,				HasTitleAction
	FROM	de_published_ui_section  a(NOLOCK) , 
			de_published_glossary  b(NOLOCK)
	WHERE	a.customer_name   		= @engg_customer_name
	AND		a.project_name   		= @engg_project_name
	AND		a.ecrno       			= @engg_req_no
	AND		a.process_name   		= @process_name
	AND		a.component_name   		= @engg_component
	AND		a.activity_name   		= @activity_name
	AND		a.ui_name      			= @ui_name_tmp	

	AND		a.customer_name			= b.customer_name
	AND		a.project_name			= b.project_name
	AND		a.ecrno					= b.ecrno
	AND		a.process_name			= b.process_name
	AND		a.component_name		= b.component_name
	AND		a.section_bt_synonym	= b.bt_synonym_name

	AND		a.section_type			<>	'Chart'
	AND		(ISNULL(BorderTopWidth,'') <> ''
	OR		ISNULL(a.HasTitleAction,'')	=	'Y'  --TECH-70687
	OR		ISNULL(a.TopToolbar,'')		=	'Y'
	OR		ISNULL(a.BottomToolbar,'')	=	'Y'
	OR		ISNULL(a.LeftToolbar,'')	=	'Y'
	OR		ISNULL(a.RightToolbar,'')	=	'Y') 

	OPEN sec_cus_border
	FETCH NEXT FROM sec_cus_border INTO		@section_bt_synonym ,		@SectionCaption,		@BorderStyle,	
				@BorderBottomRightRadius,	@BorderBottomLeftRadius,	@BorderTopRightRadius,	@BorderTopLeftRadius,	
				@BorderBottomColor,			@BorderTopColor,			@BorderRightColor,		@BorderLeftColor,		
				@BorderBottomWidth,			@BorderTopWidth,			@BorderRightWidth,		@BorderLeftWidth,
				@LeftToolbar,				@RightToolbar,				@TopToolbar,			@BottomToolbar,		--TECH-70687
				@MinimizedRows,				@ViewMode,					@HasTitleAction

	WHILE (1=1)
	BEGIN		
		IF @@fetch_status <> 0 
		 BREAK;
		SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
		SELECT @sql = '<Section Name="'   + ltrim(rtrim(isnull(@section_bt_synonym,'')))   + '" ' +
		'SectionCaption="'  + ltrim(rtrim(isnull(@SectionCaption,'')))    + '" ' +
		'BorderStyle="'		+ ltrim(rtrim(isnull(@BorderStyle,'')))    + '" ' +
		'BorderTopLeftRadius="'  + ltrim(rtrim(isnull(@BorderTopLeftRadius,'')))    + '" ' +
		'BorderTopRightRadius="'  + ltrim(rtrim(isnull(@BorderTopRightRadius,'')))    + '" ' +
		'BorderBottomLeftRadius="'  + ltrim(rtrim(isnull(@BorderBottomLeftRadius,'')))    + '" ' +
		'BorderBottomRightRadius="'  + ltrim(rtrim(isnull(@BorderBottomRightRadius,'')))    + '" ' +
		'BorderLeftWidth="'  + ltrim(rtrim(isnull(@BorderLeftWidth,'')))+CASE WHEN ISNULL(@BorderLeftWidth,'')<>'' THEN 'px' ELSE '' END    + '" ' +
		'BorderRightWidth="'  + ltrim(rtrim(isnull(@BorderRightWidth,'')))+CASE WHEN ISNULL(@BorderRightWidth,'')<>'' THEN 'px' ELSE '' END    + '" ' +
		'BorderTopWidth="'  + ltrim(rtrim(isnull(@BorderTopWidth,'')))+CASE WHEN ISNULL(@BorderTopWidth,'')<>'' THEN 'px' ELSE '' END    + '" ' +
		'BorderBottomWidth="'  + ltrim(rtrim(isnull(@BorderBottomWidth,'')))+CASE WHEN ISNULL(@BorderBottomWidth,'')<>'' THEN 'px' ELSE '' END    + '" ' +
		'BorderLeftColor="'  + ltrim(rtrim(isnull(@BorderLeftColor,'')))    + '" ' +
		'BorderRightColor="'  + ltrim(rtrim(isnull(@BorderRightColor,'')))    + '" ' +
		'BorderTopColor="'  + ltrim(rtrim(isnull(@BorderTopColor,'')))    + '" ' +
		'BorderBottomColor="'  + ltrim(rtrim(isnull(@BorderBottomColor,'')))    + '" ' +
		--TECH-70687
		'LeftToolbar="'  + ltrim(rtrim(isnull(@LeftToolbar,'N')))    + '" ' +				
		'RightToolbar="'  + ltrim(rtrim(isnull(@RightToolbar,'N')))    + '" ' + 
		'TopToolbar="'  + ltrim(rtrim(isnull(@TopToolbar,'N')))    + '" ' +
		'BottomToolbar="'  + ltrim(rtrim(isnull(@BottomToolbar,'N')))    + '" ' 
		
		IF ISNULL(@MinimizedRows,0)>0 
			SELECT @sql = @sql +
		'MinimizedRows="'  + ltrim(rtrim(isnull(@MinimizedRows,'')))    + '" ' +
		'ViewMode="'  + ltrim(rtrim(isnull(@ViewMode,'')))    + '"' 
		--TECH-70687
		

		----TECH-70687
		IF	ISNULL(@HasTitleAction, 'N')	= 'N' AND	ISNULL(@TopToolBar, 'N')	= 'N' AND ISNULL(@BottomToolBar, 'N')	= 'N'	AND ISNULL(@LeftToolBar, 'N')	= 'N' AND ISNULL(@RightToolBar, 'N')	= 'N'
			SELECT @sql = @sql +'/>'
		ELSE
			SELECT @sql = @sql +'>'

		INSERT INTO ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		VALUES
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,   @sql,@xml_seq_tmp_out)
	
		IF	ISNULL(@HasTitleAction, 'N')	= 'Y'
		BEGIN
		SELECT	@Caption		=	''

		SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
		INSERT INTO ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		VALUES
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Tools>',@xml_seq_tmp_out)
		
			DECLARE Title_action CURSOR FAST_FORWARD FOR
			SELECT	ActionControlID,	ActionViewName,		TitleControlBTSynonym
			FROM	de_published_ui_section_titleaction   grd (NOLOCK)
			WHERE	grd.customer_name  	= @engg_customer_name
			and		grd.project_name  	= @engg_project_name
			and		grd.ecrno    		= @engg_req_no
			and		grd.process_name  	= @process_name
			and		grd.component_name  = @engg_component
			and		grd.activity_name  	= @activity_name
			and		grd.ui_name    		= @ui_name_tmp
			ORDER BY grd.ActionSequence

			OPEN Title_action

			FETCH NEXT FROM Title_action INTO 
			@ActionControlID,			@ActionViewName,	@ActionControlBTSynonym
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 

				SELECT	@Caption		=	bt_synonym_caption
				FROM	de_glossary (nolock)
				WHERE	customer_name	=	@engg_customer_name
				AND		project_name	=	@engg_project_name
				AND		process_name	=	@process_name
				AND		component_name	=	@engg_component
				AND		bt_synonym_name	=	@ActionControlBTSynonym

			SELECT @sql =	'<Item Name="'  + ltrim(rtrim(isnull(upper(ActionControlID),'')))    + '" ' +  --29jul2022
							'Sequence="'		+ ltrim(rtrim(isnull(ActionSequence,'')))    + '" ' +
							'ControlType="'  + case when Actiontype='link' then 'LINK' ELSE 'BUTTON' END    + '" ' +'/>'						
							--'ActionType="'  + ltrim(rtrim(isnull(ActionType,'')))    + '" ' +							
							--'TaskName="' 		+ ltrim(rtrim(isnull(upper(ActionName),'')))	+ '" ' +	
							--'TaskDesc="'  + ltrim(rtrim(isnull(ActionDescription,'')))    + '" ' +							
							--'TaskType="'  + ltrim(rtrim(isnull(ActionType,'')))    + '" ' +							
							--'Caption="'  + ltrim(rtrim(isnull(BT_Synonym_Caption,'')))    + '" ' +
							--'IconClass="'  + ltrim(rtrim(isnull(IconClass,'')))    + '" ' +
							--'ToolTip="'  + ltrim(rtrim(isnull(ToolTip,'')))    + '" ' +
							--'PrimaryControlBT="'  + ltrim(rtrim(isnull(upper(tit.TitleControlBTSynonym),'')))    + '" ' +
							--'Width="'  + ltrim(rtrim(isnull(tit.Width,'')))    + '" ' +
							--'IconPosition="'  + ltrim(rtrim(isnull(IconPosition,'')))    + '"' +'/>'
			FROM	de_published_ui_section   sec (NOLOCK),
					de_published_ui_section_titleaction tit (NOLOCK),
					de_published_glossary gls (NOLOCK)
			WHERE	sec.customer_name  			=	tit.customer_name
			AND		sec.project_name  			=	tit.project_name
			AND		sec.ecrno    				=	tit.ecrno
			AND		sec.process_name  			=	tit.process_name
			AND		sec.component_name			=	tit.component_name
			AND		sec.activity_name  			=	tit.activity_name
			AND		sec.ui_name    				=	tit.ui_name
			AND		sec.page_bt_synonym			=	tit.page_bt_synonym
			AND		sec.section_bt_synonym		=	tit.section_bt_synonym

			AND		tit.customer_name  			=	gls.customer_name
			AND		tit.project_name  			=	gls.project_name
			AND		tit.ecrno    				=	gls.ecrno
			AND		tit.process_name  			=	gls.process_name
			AND		tit.component_name			=	gls.component_name
			AND		tit.TitleControlBTSynonym  =	gls.Bt_Synonym_name

			AND		Tit.customer_name  			=	@engg_customer_name
			AND		Tit.project_name  			=	@engg_project_name
			AND		Tit.ecrno    				=	@engg_req_no
			AND		Tit.process_name  			=	@process_name
			AND		Tit.component_name			=	@engg_component
			AND		Tit.activity_name  			=	@activity_name
			AND		Tit.ui_name    				=	@ui_name_tmp
			AND		Tit.ActionControlID			=	@ActionControlID
			ORDER BY tit.ActionSequence	
		
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

				FETCH NEXT FROM Title_action INTO 
				@ActionControlID,			@ActionViewName,		@ActionControlBTSynonym
				
				END
				CLOSE Title_action
				DEALLOCATE Title_action

			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
			INSERT INTO ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			VALUES
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Tools>',@xml_seq_tmp_out)

			END

		IF	ISNULL(@TopToolBar, 'N')	= 'Y' OR ISNULL(@BottomToolBar, 'N')	= 'Y'	OR ISNULL(@LeftToolBar, 'N')	= 'Y' OR ISNULL(@RightToolBar, 'N')	= 'Y'
		BEGIN
		SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
		INSERT INTO ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		VALUES
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Toolbars>',@xml_seq_tmp_out)
		
			select @section_bt_synonym = '%' +@section_bt_synonym+ '_%bar'

			DECLARE Toolbars CURSOR FAST_FORWARD FOR
			SELECT	DISTINCT section_bt_synonym
			FROM	de_published_ui_section  a(NOLOCK)
			WHERE	a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND     a.section_bt_synonym	LIKE @section_bt_synonym  
			AND     a.horder	= 601  
			
			OPEN Toolbars

			FETCH NEXT FROM Toolbars INTO 
			@sectionbtsynonym
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 

			SELECT @sql =	'<Toolbar Name="'  + ltrim(rtrim(isnull(upper(a.section_bt_synonym),'')))    + '" ' +
							'Orientation="'  + CASE WHEN RIGHT(a.section_bt_synonym,5) = 'ttbar' THEN 'Top'	
							WHEN RIGHT(a.section_bt_synonym,5) = 'btbar' THEN 'Bottom'
							WHEN RIGHT(a.section_bt_synonym,5) = 'ltbar' THEN 'Left'
							WHEN RIGHT(a.section_bt_synonym,5) = 'rtbar' THEN 'Right' END     + '" ' +'>'
			FROM	de_published_ui_section  a	WITH (NOLOCK) 
			WHERE	a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp
			AND		section_bt_synonym		= @sectionbtsynonym
			AND		a.horder				= 601
	

			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
			INSERT INTO ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			VALUES
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

			DECLARE Toolbars_control CURSOR FAST_FORWARD FOR
			
			SELECT	DISTINCT 
					a.section_bt_synonym,	b.control_id,	b.order_seq,	
					c.bt_synonym_caption,	d.base_ctrl_type
			FROM	de_published_ui_section  a(nolock), 
					de_published_ui_control  b(NOLOCK), 
					de_published_glossary    c(NOLOCK),
					es_comp_ctrl_type_mst    d(NOLOCK)
			WHERE	a.customer_name			= b.customer_name
			and		a.project_name			= b.project_name
			and		a.ecrno					= b.ecrno
			and		a.process_name			= b.process_name
			and		a.component_name		= b.component_name
			and		a.activity_name			= b.activity_name
			and		a.ui_name				= b.ui_name
			and		a.page_bt_synonym		= b.page_bt_synonym
			and		a.section_bt_synonym	= b.section_bt_synonym

			AND		b.customer_name			= c.customer_name
			AND		b.project_name			= c.project_name
			AND		b.ecrno					= c.ecrno
			AND		b.process_name			= c.process_name
			AND		b.component_name		= c.component_name
			AND		b.control_bt_synonym	= c.bt_synonym_name	

			AND		b.customer_name			= d.customer_name
			AND		b.project_name			= d.project_name
			AND		b.process_name			= d.process_name
			AND		b.component_name		= d.component_name
			AND		b.control_type			= d.ctrl_type_name	

			AND		a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND		a.horder				= 601
			AND		a.section_bt_synonym	= @sectionbtsynonym
			ORDER BY b.order_seq

			OPEN Toolbars_control

			FETCH NEXT FROM Toolbars_control INTO 
			@sectionbtsynonym	,@control_id,	@sequence ,	@caption,	@control_type
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 
			SELECT @sql =	'<Item Name="'  + ltrim(rtrim(isnull(upper(b.control_id),'')))    + '" ' +
							 'Sequence="'  + ltrim(rtrim(isnull(b.order_seq,'')))    + '" ' +
							 'ControlType="'  + ltrim(rtrim(isnull(upper(b.control_type),'')))    + '" ' +'/>'
			FROM	de_published_ui_section  a(nolock), 
					de_published_ui_control  b(NOLOCK), 
					de_published_glossary  c(NOLOCK)
			WHERE	a.customer_name			= b.customer_name
			and		a.project_name			= b.project_name
			and		a.ecrno					= b.ecrno
			and		a.process_name			= b.process_name
			and		a.component_name		= b.component_name
			and		a.activity_name			= b.activity_name
			and		a.ui_name				= b.ui_name
			and		a.page_bt_synonym		= b.page_bt_synonym
			and		a.section_bt_synonym	= b.section_bt_synonym

			AND		b.customer_name			= c.customer_name
			AND		b.project_name			= c.project_name
			AND		b.ecrno					= c.ecrno
			AND		b.process_name			= c.process_name
			AND		b.component_name		= c.component_name
			AND		b.control_bt_synonym	= c.bt_synonym_name	

			AND		a.customer_name   		= @engg_customer_name
			AND		a.project_name   		= @engg_project_name
			AND		a.ecrno       			= @engg_req_no
			AND		a.process_name   		= @process_name
			AND		a.component_name   		= @engg_component
			AND		a.activity_name   		= @activity_name
			AND		a.ui_name      			= @ui_name_tmp	
			AND		a.horder				= 601	
			AND		a.section_bt_synonym	= @sectionbtsynonym
			AND		b.control_id			= @control_id
			ORDER BY b.order_seq
		
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

				FETCH NEXT FROM Toolbars_control INTO 
				@sectionbtsynonym	,@control_id,	@sequence ,	@caption,	@control_type
				
				END
				CLOSE Toolbars_control
				DEALLOCATE Toolbars_control	


				FETCH NEXT FROM Toolbars INTO 
				@sectionbtsynonym
				
				SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Toolbar>',@xml_seq_tmp_out)

				END
				CLOSE Toolbars
				DEALLOCATE Toolbars
			

			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
			INSERT INTO ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			VALUES
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Toolbars>',@xml_seq_tmp_out)

			END

			IF	ISNULL(@TopToolBar, 'N')	= 'Y' OR ISNULL(@BottomToolBar, 'N')	= 'Y'	OR ISNULL(@LeftToolBar, 'N')	= 'Y' OR ISNULL(@RightToolBar, 'N')	= 'Y' OR ISNULL(@HasTitleAction,'N')= 'Y'
			BEGIN
			SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
			INSERT INTO ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			VALUES
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Section>',@xml_seq_tmp_out)
			END
	--TECH-70687

	FETCH NEXT FROM sec_cus_border INTO		@section_bt_synonym ,		@SectionCaption,		@BorderStyle,	
				@BorderBottomRightRadius,	@BorderBottomLeftRadius,	@BorderTopRightRadius,	@BorderTopLeftRadius,	
				@BorderBottomColor,			@BorderTopColor,			@BorderRightColor,		@BorderLeftColor,		
				@BorderBottomWidth,			@BorderTopWidth,			@BorderRightWidth,		@BorderLeftWidth,
				@LeftToolbar,				@RightToolbar,				@TopToolbar,			@BottomToolbar,		--TECH-70687
				@MinimizedRows,				@ViewMode,					@HasTitleAction
	END
	CLOSE sec_cus_border
	DEALLOCATE sec_cus_border
	--TECH-69624 ends

If exists (select 'x'
from de_published_ui_page  (nolock)
where customer_name   = @engg_customer_name
and  project_name   = @engg_project_name
and  ecrno       = @engg_req_no
and  process_name   = @process_name
and  component_name   = @engg_component
and  activity_name   = @activity_name
and  ui_name      = @ui_name_tmp
and  page_bt_synonym <> '[mainscreen]'
)
Begin


	select @TabStyle = TabStyle, @TabHeaderPostion = TabPosition, --TabHeaderPostion, /*TECH-29894*/
		   @TabRotation = TabRotation
	from de_published_ui  (nolock)
	where customer_name   = @engg_customer_name
	and  project_name   = @engg_project_name
	and  ecrno       = @engg_req_no
	and  process_name   = @process_name
	and  component_name   = @engg_component
	and  activity_name   = @activity_name
	and  ui_name      = @ui_name_tmp

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	select @sql = '<Section Name="'   + ltrim(rtrim(isnull('[TABCONTROL]','')))   + '" ' +
	'SectionCaption="'  + ltrim(rtrim(isnull('[tabcontrol]','')))    + '" ' +
	'TabStyle="'  + ltrim(rtrim(isnull(@TabStyle,'')))    + '" ' +
	'TabPosition="'  + ltrim(rtrim(isnull(@TabHeaderPostion,'')))    + '" ' +
	'TabRotation="'  + ltrim(rtrim(isnull(@TabRotation,'')))    + '"'
	select @sql = @sql +'/>'

	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,
	@sql ,@xml_seq_tmp_out)
end

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '</Sections>',@xml_seq_tmp_out)
	------------------------------------------------------------------------------Sections
	
	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<Controls>',@xml_seq_tmp_out)

	--- Tree Grid Starts

	--declare control_curs cursor FAST_FORWARD for
	--select	upper(control_id),	insert_req,			delete_req,			ExpandEvent,		ExpandAllEvent,		CollapseEvent,	CollapseAllEvent,	
	--		ClickEvent,			checkevent,			DDToolTip,			ZoomMin,			ZoomMax,			DefaultZoom,	ZoomStep,			
	--		NodeWidth,			NodeHeight,			DefaultFile,		IsOrgChart,			ctype.base_ctrl_type
	--from de_published_ui_control   ctrl (nolock),
	--es_comp_ctrl_type_mst_vw ctype (nolock)	left outer join 
	--es_comp_ctrl_type_mst_extn  ext(nolock)
	--on		ctype.customer_name		= ext.customer_name
	--and		ctype.project_name		= ext.project_name
	--and		ctype.process_name		= ext.process_name
	--and		ctype.component_name	= ext.component_name
	--and		ctype.base_ctrl_type	= ext.base_ctrl_type
	--and		ctype.ctrl_type_name	= ext.ctrl_type_name

	--where ctrl.customer_name  	= ctype.customer_name
	--and  ctrl.project_name  	= ctype.project_name
	--and  ctrl.process_name  	= ctype.process_name
	--and  ctrl.component_name  	= ctype.component_name
	--and  ctrl.control_type  	= ctype.ctrl_type_name
	--and  ctrl.customer_name  	= @engg_customer_name
	--and  ctrl.project_name  	= @engg_project_name
	--and  ctrl.ecrno    			= @engg_req_no
	--and  ctrl.process_name  	= @process_name
	--and  ctrl.component_name  	= @engg_component
	--and  ctrl.activity_name  	= @activity_name
	--and  ctrl.ui_name    		= @ui_name_tmp
	--and	ctype.base_ctrl_type	= 'TreeGrid'

	
	--open control_curs

	--fetch next from control_curs into 
	--@control_id, 				@insert_req,			@delete_req,		@ExpandEvent,		@ExpandAllEvent,			@CollapseEvent,	
	--@CollapseAllEvent,	@ClickEvent,		@checkevent,			@DDToolTip,			@ZoomMin,			@ZoomMax,					@DefaultZoom,				
	--@ZoomStep,			@NodeWidth,			@NodeHeight,			@DefaultFile,		@IsOrgChart,		@base_ctrl_type

	--WHILE @@FETCH_STATUS = 0   
	--BEGIN 

	--	select	@TreeColumn		= isnull(column_bt_synonym,'')
	--	from	de_published_ui_grid (nolock)
	--	where	customer_name  	= @engg_customer_name
	--	and		project_name  		= @engg_project_name
	--	and		ecrno    			= @engg_req_no
	--	and		process_name		= @process_name
	--	and		component_name  	= @engg_component
	--	and		activity_name  	= @activity_name
	--	and		ui_name    		= @ui_name_tmp
	--	and		control_id		= @control_id
	--	and		isnull(TreeColumn,'') = 'Y'
	--	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	--	select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull(@control_id,'')))			+ '" ' 	
		
		
	--	if isnull(@IsOrgChart,'N') = 'Y'
	--	Begin
	--		select @sql    = @sql+'ZoomMin="'			+ ltrim(rtrim(isnull(@ZoomMin,'')))		+ '" '
	--		select @sql    = @sql+'ZoomMax="'			+ ltrim(rtrim(isnull(@ZoomMax,'')))		+ '" '
	--		select @sql    = @sql+'ZoomStep="'			+ ltrim(rtrim(isnull(@DefaultZoom,'')))		+ '" '
	--		select @sql    = @sql+'DefaultZoom="'		+ ltrim(rtrim(isnull(@ZoomStep,'')))		+ '" '
	--		select @sql    = @sql+'NodeWidth="'			+ ltrim(rtrim(isnull(@NodeWidth,'')))		+ '" '
	--		select @sql    = @sql+'NodeHeight="'		+ ltrim(rtrim(isnull(@NodeHeight,'')))		+ '" '
	--		select @sql    = @sql+'DefFile="'			+ ltrim(rtrim(isnull(@DefaultFile,'')))		+ '" '		
	--	End
	--	Else
	--	Begin 
	--		select @sql    = @sql+'TreeColumn="'			+ ltrim(rtrim(isnull(@TreeColumn,'')))		+ '" '
	--		select @sql    = @sql+'InsertEvent="'			+ ltrim(rtrim(isnull(@insert_req,'')))		+ '" '
	--		select @sql    = @sql+'DeleteEvent="'			+ ltrim(rtrim(isnull(@delete_req,'')))		+ '" '
	--		select @sql    = @sql+'CheckEvent="'			+ ltrim(rtrim(isnull(@CheckEvent,'')))		+ '" '
	--		select @sql    = @sql+'DDToolTip="'				+ ltrim(rtrim(isnull(@DDToolTip,'')))		+ '" '
	--	End
	--	select @sql    = @sql+'ExpandEvent="'			+ ltrim(rtrim(isnull(@ExpandEvent,'')))		+ '" '
	--	select @sql    = @sql+'ExpandAllEvent="'		+ ltrim(rtrim(isnull(@ExpandAllEvent,'')))		+ '" '
	--	select @sql    = @sql+'CollapseEvent="'			+ ltrim(rtrim(isnull(@CollapseEvent,'')))		+ '" '
	--	select @sql    = @sql+'CollapseAllEvent="'		+ ltrim(rtrim(isnull(@CollapseAllEvent,'')))		+ '" '
	--	select @sql    = @sql+'ClickEvent="'			+ ltrim(rtrim(isnull(@ClickEvent,'')))		+ '" '

	--	select @sql = @sql +'/>'

			
	--insert into ep_genxml_tmp
	--(customer_name,   project_name,   req_no,   process_name,  component_name,
	--activity_name,    guid,    gen_xml,seq_no)
	--values
	--(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	--@activity_name,  @guid,    
	--@sql ,@xml_seq_tmp_out)
	
	

	--fetch next from control_curs into 
	--@control_id, 				@insert_req,			@delete_req,		@ExpandEvent,		@ExpandAllEvent,			@CollapseEvent,	
	--@CollapseAllEvent,	@ClickEvent,		@checkevent,			@DDToolTip,			@ZoomMin,			@ZoomMax,					@DefaultZoom,				
	--@ZoomStep,			@NodeWidth,			@NodeHeight,			@DefaultFile,		@IsOrgChart,		@base_ctrl_type

	--end
	--close control_curs
	--deallocate control_curs
		
	declare control_curs cursor FAST_FORWARD for
	select	upper(control_id),	ExpandEvent,		ExpandAllEvent,		CollapseEvent,	
			CollapseAllEvent,	ClickEvent,			checkevent,			DDToolTip,			
			ZoomMin,			ZoomMax,			DefaultZoom,		ZoomStep,			
			NodeWidth,			NodeHeight,			DefaultFile,		IsOrgChart,			
			ext.ctrl_type_name, bufferedrows,		NodeIconReqd,		NodeCustomClass,	
			GanttControl,		ShowLines	--TECH-66989
	from de_published_ui_control   ctrl (nolock),
	--es_comp_ctrl_type_mst_vw ctype (nolock)	left outer join 
	es_comp_ctrl_type_mst_extn  ext(nolock)	
	where  ctrl.customer_name  	= @engg_customer_name
	and  ctrl.project_name  	= @engg_project_name
	and  ctrl.ecrno    			= @engg_req_no
	and  ctrl.process_name  	= @process_name
	and  ctrl.component_name  	= @engg_component
	and  ctrl.activity_name  	= @activity_name
	and  ctrl.ui_name    		= @ui_name_tmp
	and	ext.base_ctrl_type		= 'TreeGrid'
	and	ctrl.customer_name  	= ext.customer_name
	and  ctrl.project_name  	= ext.project_name
	and  ctrl.process_name  	= ext.process_name
	and  ctrl.component_name  	= ext.component_name
	and  ctrl.control_type  	= ext.ctrl_type_name
	--and  ctrl.control_type  	= ext.ctrl_type_name

	
	open control_curs

	fetch next from control_curs into 
	@control_id, 		@ExpandEvent,		@ExpandAllEvent,		@CollapseEvent,	
	@CollapseAllEvent,	@ClickEvent,		@checkevent,			@DDToolTip,			
	@ZoomMin,			@ZoomMax,			@DefaultZoom,			@ZoomStep,			
	@NodeWidth,			@NodeHeight,		@DefaultFile,			@IsOrgChart,		
	@ctrltype_name,		@bufferedrows,		@NodeIconReqd,			@NodeCustomClass,	
	@GanttControl,		@ShowLines	--TECH-66989

	WHILE @@FETCH_STATUS = 0   
	BEGIN 

		select	@base_ctrl_type = 'TreeGrid'

		select	@TreeColumn		= isnull(column_bt_synonym,'')
		from	de_published_ui_grid (nolock)
		where	customer_name  	= @engg_customer_name
		and		project_name  		= @engg_project_name
		and		ecrno    			= @engg_req_no
		and		process_name		= @process_name
		and		component_name  	= @engg_component
		and		activity_name  	= @activity_name
		and		ui_name    		= @ui_name_tmp
		and		control_id		= @control_id
		and		isnull(TreeColumn,'') = 'Y'
		 -- Commented for TECH-18349
		--select	@delete_req			= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts	= @control_id
		--and		task_descr			= 'Allow Deletion'

		--select	@insert_req			= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts			= @control_id
		--and		task_descr			= 'Allow Insertion'
		 -- Commented for TECH-18349
		 
		select	@ExpandEvent		= isnull(task_name,'')
		from	de_action (nolock)
		where	customer_name  		= @engg_customer_name
		and		project_name  		= @engg_project_name
		and		ecrno    			= @engg_req_no
		and		process_name		= @process_name
		and		component_name  	= @engg_component
		and		activity_name  		= @activity_name
		and		ui_name    			= @ui_name_tmp
		and		primary_control_bts	= @control_id
		and		task_descr			= 'Expand Event'
		 -- Commented for TECH-18349
		--select	@ExpandAllEvent		= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts			= @control_id
		--and		task_descr			= 'Expand All Event'

		--select	@CollapseEvent			= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts			= @control_id
		--and		task_descr			= 'Collapse Event'

		--select	@CollapseAllEvent			= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts			= @control_id
		--and		task_descr			= 'Collapse All Event'

		--select	@ClickEvent			= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts			= @control_id
		--and		task_descr			= 'Click Event'
		
		--select	@checkevent			= isnull(task_name,'')
		--from	de_action (nolock)
		--where	customer_name  	= @engg_customer_name
		--and		project_name  		= @engg_project_name
		--and		ecrno    			= @engg_req_no
		--and		process_name		= @process_name
		--and		component_name  	= @engg_component
		--and		activity_name  	= @activity_name
		--and		ui_name    		= @ui_name_tmp
		--and		primary_control_bts			= @control_id
		--and		task_descr			= 'Check Event'
		 -- Commented for TECH-18349
		 
		 --CODE ADDED BY 11742 Pavithra V
		 
		SELECT @hidepersonalize = isnull(hidepersonalize,''), --TECH-55189
		       @HideColumnchooser = isnull(hidecolumnchooser,''),
			   @hidefilterflagtreegrid = isnull(hidefilterdata,'') --TECH-58371
		FROM   es_comp_ctrl_type_mst
		where  customer_name    = @engg_customer_name  
        and    project_name     = @engg_project_name  
        and    process_name     = @process_name  
        and    component_name   = @engg_component 
		and    ctrl_type_name   = @ctrltype_name  
        and    base_ctrl_type   = 'TreeGrid'
		
	       if isnull (@IsOrgChart,'N')  ='Y'
              begin
                     select @base_ctrl_type= 'ORGCHART' ---11742
              end
			-- Added for the Defect ID: TECH-37471 Starts for GANTT Control
			if isnull (@GanttControl,'N')  ='Y'
              begin
					select @base_ctrl_type= 'GANTT' 

					SELECT	@ReadOnly						= ReadOnly,
							@ShowTodayLine					= ShowTodayLine,
							@ShowRollupTasks				= ShowRollupTasks,
							@ShowProjectLines				= ShowProjectLines,
							@SkipWeekendsDuringDragDrop		= SkipWeekendsDuringDragDrop,
							@LockedGridWidth				= LockedGridWidth,
							@RowHeight						= RowHeight,
							@BottomLabelField				= BottomLabelField,
							@TopLabelField					= TopLabelField,
							@LeftLabelField					= LeftLabelField,
							@RightLabelField				= RightLabelField,
							@RollupLabelField				= RollupLabelField,
							@Baseline						= Baseline,
							@ScrollToDateCentered			= ScrollToDateCentered,
							@Zoom							= Zoom,
							@Fit							= Fit,
							@Export							= Export,
							@Highlight						= Highlight,
							@Indent							= Indent,
							@Calendar						= Calendar,
							@ContextMenu					= ContextMenu,
							@PopupTaskEditor				= PopupTaskEditor,
							@GanttShift						= GanttShift,
							@GanttExpand					= GanttExpand,
							@GanttInsert					= GanttInsert,
							@GanttDelete					= GanttDelete
					FROM	es_comp_ctrl_type_mst_extn (nolock)
				 	where	customer_name  		= @engg_customer_name
					and		project_name  		= @engg_project_name					
					and		process_name  		= @process_name
					and		component_name  	= @engg_component
					and		ctrl_type_name		= @ctrltype_name
					and		base_ctrl_type		= 'TreeGrid'
              end
		 -- Added for the Defect ID: TECH-37471 Ends for GANTT Control
			

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull(@control_id,'')))			+ '" ' 	
		select @sql    = @sql+'RenderAs="'			+ ltrim(rtrim(isnull(@base_ctrl_type,'')))		+ '" '
		
		if isnull(@IsOrgChart,'N') = 'Y'
		Begin
			select @sql    = @sql+'ZoomMin="'			+ ltrim(rtrim(isnull(@ZoomMin,'')))		+ '" '
			select @sql    = @sql+'ZoomMax="'			+ ltrim(rtrim(isnull(@ZoomMax,'')))		+ '" '
			select @sql    = @sql+'ZoomStep="'			+ ltrim(rtrim(isnull(@DefaultZoom,'')))		+ '" '
			select @sql    = @sql+'DefaultZoom="'		+ ltrim(rtrim(isnull(@ZoomStep,'')))		+ '" '
			select @sql    = @sql+'NodeWidth="'			+ ltrim(rtrim(isnull(@NodeWidth,'')))		+ '" '
			select @sql    = @sql+'NodeHeight="'		+ ltrim(rtrim(isnull(@NodeHeight,'')))		+ '" '
			select @sql    = @sql+'DefFile="'			+ ltrim(rtrim(isnull(@DefaultFile,'')))		+ '" '		
		End
		Else if isnull(@GanttControl,'N')  ='Y'
        begin
			select @sql    = @sql+'ReadOnly="'					+ ltrim(rtrim(isnull(@ReadOnly,'')))		+ '" '
			select @sql    = @sql+'ShowTodayLine="'				+ ltrim(rtrim(isnull(@ShowTodayLine,'')))		+ '" '
			select @sql    = @sql+'ShowRollupTasks="'			+ ltrim(rtrim(isnull(@ShowRollupTasks,'')))		+ '" '
			select @sql    = @sql+'ShowProjectLines="'			+ ltrim(rtrim(isnull(@ShowProjectLines,'')))		+ '" '
			select @sql    = @sql+'SkipWeekendsDuringDragDrop="'+ ltrim(rtrim(isnull(@SkipWeekendsDuringDragDrop,'')))		+ '" '

			select @sql    = @sql+'LockedGridWidth="'			+ ltrim(rtrim(isnull(@LockedGridWidth,'')))		+ '" '
			select @sql    = @sql+'RowHeight="'					+ ltrim(rtrim(isnull(@RowHeight,'')))		+ '" '
			select @sql    = @sql+'BottomLabelField="'			+ ltrim(rtrim(isnull(@BottomLabelField,'')))		+ '" '
			select @sql    = @sql+'TopLabelField="'				+ ltrim(rtrim(isnull(@TopLabelField,'')))		+ '" '
			select @sql    = @sql+'LeftLabelField="'			+ ltrim(rtrim(isnull(@LeftLabelField,'')))		+ '" '

			select @sql    = @sql+'RightLabelField="'			+ ltrim(rtrim(isnull(@RightLabelField,'')))		+ '" '
			select @sql    = @sql+'RollupLabelField="'			+ ltrim(rtrim(isnull(@RollupLabelField,'')))		+ '" '
			select @sql    = @sql+'Baseline="'					+ ltrim(rtrim(isnull(@Baseline,'')))		+ '" '
			select @sql    = @sql+'ScrollToDateCentered="'		+ ltrim(rtrim(isnull(@ScrollToDateCentered,'')))		+ '" '
			select @sql    = @sql+'Zoom="'						+ ltrim(rtrim(isnull(@Zoom,'')))		+ '" '

			select @sql    = @sql+'Fit="'						+ ltrim(rtrim(isnull(@Fit,'')))		+ '" '
			select @sql    = @sql+'Export="'					+ ltrim(rtrim(isnull(@Export,'')))		+ '" '
			select @sql    = @sql+'Highlight="'					+ ltrim(rtrim(isnull(@Highlight,'')))		+ '" '
			select @sql    = @sql+'Indent="'					+ ltrim(rtrim(isnull(@Indent,'')))		+ '" '
			select @sql    = @sql+'Calendar="'					+ ltrim(rtrim(isnull(@Calendar,'')))		+ '" '
			
			select @sql    = @sql+'ContextMenu="'				+ ltrim(rtrim(isnull(@ContextMenu,'')))		+ '" '
			select @sql    = @sql+'PopupTaskEditor="'			+ ltrim(rtrim(isnull(@PopupTaskEditor,'')))		+ '" '
			select @sql    = @sql+'GanttShift="'				+ ltrim(rtrim(isnull(@GanttShift,'')))		+ '" '
			select @sql    = @sql+'GanttExpand="'				+ ltrim(rtrim(isnull(@GanttExpand,'')))		+ '" '
			select @sql    = @sql+'GanttInsert="'				+ ltrim(rtrim(isnull(@GanttInsert,'')))		+ '" '
			select @sql    = @sql+'GanttDelete="'				+ ltrim(rtrim(isnull(@GanttDelete,'')))		+ '" '

		END
		Else
		Begin 
			select @sql    = @sql+'TreeColumn="'			+ ltrim(rtrim(isnull(@TreeColumn,'')))		+ '" '
			--select @sql    = @sql+'InsertEvent="'			+ ltrim(rtrim(isnull(@insert_req,'')))		+ '" '
			--select @sql    = @sql+'DeleteEvent="'			+ ltrim(rtrim(isnull(@delete_req,'')))		+ '" '
			--select @sql    = @sql+'CheckEvent="'			+ ltrim(rtrim(isnull(@CheckEvent,'')))		+ '" '
			select @sql    = @sql+'DragDrop="'				+ ltrim(rtrim(isnull(@DDToolTip,'N')))		+ '" '
			select @sql    = @sql+'BufferedRows="'			+ ltrim(rtrim(isnull(@BufferedRows,'')))		+ '" '
		End
		select @sql    = @sql+'ExpandEvent="'			+ ltrim(rtrim(isnull(@ExpandEvent,'')))		+ '" '
		select @sql    = @sql+'NodeIconRequired="'			+ ltrim(rtrim(isnull(@NodeIconReqd,'')))		+ '" '
		select @sql    = @sql+'NodeCustomClass="'			+ ltrim(rtrim(isnull(@NodeCustomClass,'')))		+ '" '
		--select @sql    = @sql+'ExpandAllEvent="'		+ ltrim(rtrim(isnull(@ExpandAllEvent,'')))		+ '" '
		--select @sql    = @sql+'CollapseEvent="'			+ ltrim(rtrim(isnull(@CollapseEvent,'')))		+ '" '
		--select @sql    = @sql+'CollapseAllEvent="'		+ ltrim(rtrim(isnull(@CollapseAllEvent,'')))		+ '" '
		--select @sql    = @sql+'ClickEvent="'			+ ltrim(rtrim(isnull(@ClickEvent,'')))		+ '"'
		/* added for TECH-55189 */
		if (isnull(@hidepersonalize,'') =  'y')  
        select @sql    = @sql+'HidePersonalize="'   + ltrim(rtrim(isnull(@hidepersonalize,'')))    + '" '  
		if (isnull(@HideColumnchooser,'') =  'y')  
        select @sql    = @sql+'HideColumnchooser="'   + ltrim(rtrim(isnull(@HideColumnchooser,'')))    + '" '  
		/* added for TECH-55189 */
		if (isnull(@hidefilterflagtreegrid,'') =  'y')  
        select @sql    = @sql+'HideFilterData="'   + ltrim(rtrim(isnull(@hidefilterflagtreegrid,'')))    + '" '  
		/*added for TECH-58371 */
		select @sql    = @sql+'ShowLines="'   + ltrim(rtrim(isnull(@ShowLines,'N')))    + '" '		--TECH-66989
		select @sql = @sql +'/>'

			
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    
	@sql ,@xml_seq_tmp_out)
	

	fetch next from control_curs into 
	@control_id, 		@ExpandEvent,		@ExpandAllEvent,		@CollapseEvent,	
	@CollapseAllEvent,	@ClickEvent,		@checkevent,			@DDToolTip,			
	@ZoomMin,			@ZoomMax,			@DefaultZoom,			@ZoomStep,			
	@NodeWidth,			@NodeHeight,		@DefaultFile,			@IsOrgChart,		
	@ctrltype_name,		@bufferedrows,		@NodeIconReqd,			@NodeCustomClass,	
	@GanttControl,		@ShowLines	--TECH-66989

	--@control_id, 					@ExpandEvent,		@ExpandAllEvent,			@CollapseEvent,	
	--@CollapseAllEvent,	@ClickEvent,		@checkevent,			@DDToolTip,			@ZoomMin,			@ZoomMax,					@DefaultZoom,				
	--@ZoomStep,			@NodeWidth,			@NodeHeight,			@DefaultFile,		@IsOrgChart,		@ctrltype_name	,			@bufferedrows,
	--@NodeIconReqd,		@NodeCustomClass,	@GanttControl,	@ShowLines	--TECH-66989
	end
	
	close control_curs
	deallocate control_curs

	--- Tree Grid Ends 


	declare ctrl_curs cursor FAST_FORWARD for
	select upper(control_id), upper(view_name),PreventDownload,norowstodisplay_notreq
	,enabledefault		,hideinsert				,hidedelete			,hideselect
	,hidecopy			,hidecut				,hidefilterdata		,hidepdf				
	,hidereport			,hidehtml				,hideexportexcel	,hideexportcsv
	,hideexporttext		,hideimportdata			,hidechart			,hideexportopenoffice
	,hidepersonalize	,searchhide				,ctype.autoheight			,Preserve_visible_length,
	Auto_width_column,	ishijri					,QlikLink			,SystemGeneratedFileId,
	IsMarquee,			ctype.ctrl_type_name,			IsAssorted			--PLF2.0_18487		
	,RatingType,		CaptchaData, --IsCaptcha,	
	'','',				AttachmentWithDesc		,control_bt_synonym	,'',--for column_TransformAs
	ControlClass,		Dynamicfileupload,		Delayedpwdmask,		MetaDataBasedLink, -- 	Added for TECH-18349
	FormWidth,			ControlWidth,			LabelWidth,			NoofCtrlPerLine,
	renderas,			LabelAlignment,			EditMask,			Autoselect,
	DynamicStyle,		ImageAsData,			MLsearchonly,		ExtensionReqd,		ExtensionLaunchMode,
	BulkDownload -- TECH-68067
	,hidecolumnchooser, ---TECH-68480
	--TECH-69624 starts
	BorderStyle,					HasCustomAction,	
	BorderBottomRightRadius,		BorderBottomLeftRadius,			BorderTopRightRadius,		BorderTopLeftRadius,	
	BorderBottomColor,				BorderTopColor,					BorderRightColor,			BorderLeftColor,      
	BorderBottomWidth,				BorderTopWidth,					BorderRightWidth,			BorderLeftWidth,
	--TECH-69624 ends
	AssociateControl,				ButtonStyle,					SelectOnlyListValues  --TECH-71262
	FROM de_published_ui_control   ctrl (nolock),
		es_comp_ctrl_type_mst_vw ctype (nolock)	left outer join 
		es_comp_ctrl_type_mst_extn  ext(nolock)
	ON		ctype.customer_name		= ext.customer_name
	AND		ctype.project_name		= ext.project_name
	AND		ctype.process_name		= ext.process_name
	AND		ctype.component_name	= ext.component_name
	AND		ctype.base_ctrl_type	= ext.base_ctrl_type
	AND		ctype.ctrl_type_name	= ext.ctrl_type_name

	WHERE ctrl.customer_name  	= ctype.customer_name
	AND  ctrl.project_name  	= ctype.project_name
	AND  ctrl.process_name  	= ctype.process_name
	AND  ctrl.component_name  	= ctype.component_name
	AND  ctrl.control_type  	= ctype.ctrl_type_name
	AND  ctrl.customer_name  	= @engg_customer_name
	AND  ctrl.project_name  	= @engg_project_name
	AND  ctrl.ecrno    			= @engg_req_no
	AND  ctrl.process_name  	= @process_name
	AND  ctrl.component_name  	= @engg_component
	AND  ctrl.activity_name  	= @activity_name
	AND  ctrl.ui_name    		= @ui_name_tmp
	AND	ctype.base_ctrl_type	<> 'TreeGrid'
	 -- Commented for TECH-18349
	--union
	--select upper(control_id), upper(view_name),PreventDownload,norowstodisplay_notreq
	--,enabledefault		,hideinsert				,hidedelete			,hideselect
	--,hidecopy			,hidecut				,hidefilterdata		,hidepdf				
	--,hidereport			,hidehtml				,hideexportexcel	,hideexportcsv
	--,hideexporttext		,hideimportdata			,hidechart			,hideexportopenoffice
	--,hidepersonalize	,searchhide				,autoheight,		'',
	--'' ,				ishijri					,QlikLink		,	SystemGeneratedFileId,
	--IsMarquee,			ctype.ctrl_type_name,			IsAssorted				--PLF2.0_18487				
	--,RatingType,		CaptchaData,
	--ctrl.GridToForm,	ctrl.RowExpander,		AttachmentWithDesc	,column_bt_synonym,
	--column_TransformAs,	ctrl.ColumnClass -- added for GridToForm TECH-12776 
	--from de_published_ui_grid   ctrl (nolock),
	--es_comp_ctrl_type_mst_vw ctype (nolock) left outer join 
	--es_comp_ctrl_type_mst_extn  ext (nolock)
	--on		ctype.customer_name		= ext.customer_name
	--and		ctype.project_name		= ext.project_name
	--and		ctype.process_name		= ext.process_name
	--and		ctype.component_name	= ext.component_name
	--and		ctype.base_ctrl_type	= ext.base_ctrl_type
	--and		ctype.ctrl_type_name	= ext.ctrl_type_name

	--where ctrl.customer_name  	= ctype.customer_name
	--and  ctrl.project_name  	= ctype.project_name
	--and  ctrl.process_name  	= ctype.process_name
	--and  ctrl.component_name  	= ctype.component_name
	--and  ctrl.column_type  		= ctype.ctrl_type_name
	--and  ctrl.customer_name  	= @engg_customer_name
	--and  ctrl.project_name  	= @engg_project_name
	--and  ctrl.ecrno    			= @engg_req_no
	--and  ctrl.process_name  	= @process_name
	--and  ctrl.component_name  	= @engg_component
	--and  ctrl.activity_name  	= @activity_name
	--and  ctrl.ui_name    		= @ui_name_tmp
	 -- Commented for TECH-18349
	 -- GridToForm Latest Attributes, MetaDatabasedlink & Renderas parameters added for TECH-19347
	open ctrl_curs

	fetch next from ctrl_curs into 
	@control_id			,@view_name,			@PreventDownload	,@norowstodisplay_notreq	,@enabledefault		,		@hideinsert,	@hidedelete			,@hideselect
	,@hidecopy			,@hidecut,				@hidefilterdata		,@hidepdf,					@hidereport					,@hidehtml,		@hideexportexcel	,@hideexportcsv			
	,@hideexporttext	,@hideimportdata,		@hidechart			,@hideexportopenoffice		,@hidepersonalize	,		@searchhide		,@autoheight,
	@Preserve_visible_length, @Auto_width_column,@Ishijri,			@QlikLink 					,@SystemGeneratedFileId,	@ismarquee,		@control_type,		@IsAssorted	--PLF2.0_18487		
	,@RatingType,		@CaptchaData,			@gridtoform,		@rowexpander,				@AttachmentWithDesc,		@controlcolumnbt,
	@TransformAs,		@columnclass,			@Dynamicstorepath,	@Delayedpwdmask,			@MetaDataBasedLink,			@GTFFormwidth,	@GTFControllwidth,	 @GTFLabelwidth,
	@GTFControlsperline, @renderas,				@GTFLabelAlign,		@editmask,					@Autoselect,				@DynamicStyle,	@ImageAsData,		 @MLsearchonly,  --TECH-45171
	@ExtensionReqd,		@LaunchMode,			@BulkDownload	 --TECH-68067
	,@hidecolumnchooser, --TECH-68480
	--TECH-69624
	@BorderStyle,				@HasCustomAction,	
	@BorderBottomRightRadius,	@BorderBottomLeftRadius,	@BorderTopRightRadius,	@BorderTopLeftRadius,	
	@BorderBottomColor,			@BorderTopColor,			@BorderRightColor,		@BorderLeftColor,		
	@BorderBottomWidth,			@BorderTopWidth,			@BorderRightWidth,		@BorderLeftWidth,
	--TECH-69624
	@CtrlAssociateControl,		@CtrlButtonStyle,			@CtrlSelectOnlyLE --26jul2022

	WHILE @@FETCH_STATUS = 0   
	BEGIN 
	
		if isnull(@renderas,'') = 'gridtoform'
			select	@gridtoform = 'Y'
	
		--Select for placeholder
		Select @placeholder		= ''
		Select @place_lang		= ''
		Select @configuration	= ''
		
		--TECH-72114
		IF EXISTS ( SELECT 'X'
		FROM	de_ui_section_mobile mob (nolock),
				de_published_ui_control ctl (nolock)
		where	ctl.customer_name  	= @engg_customer_name
		and  	ctl.project_name  	= @engg_project_name
		and  	ctl.ecrno    		= @engg_req_no
		and  	ctl.process_name  	= @process_name
		and  	ctl.component_name  = @engg_component
		and  	ctl.activity_name  	= @activity_name
		and  	ctl.ui_name    		= @ui_name_tmp
		AND		ctl.control_id		= @control_id

		AND		ctl.customer_name  	= mob.customer_name
		AND		ctl.project_name  	= mob.project_name
		AND		ctl.ecrno			= mob.ecrno
		AND		ctl.process_name  	= mob.process_name
		AND		ctl.component_name  = mob.component_name
		AND		ctl.activity_name	= mob.activity_name
		AND		ctl.ui_name			= mob.ui_name
		AND		ctl.page_bt_synonym	= mob.page_bt_synonym
		AND		ctl.section_bt_synonym = mob.section_bt_synonym
		)
		BEGIN
			SELECT	@MobileGrid		= 'Y'
		END
		--TECH-72114
		select	@placeholder	= Placeholder,
				@place_lang		= languageid
		from	de_published_ui_placeholder_lng_extn  (nolock)
		where	customer_name  	= @engg_customer_name
		and  	project_name  	= @engg_project_name
		and  	ecrno    		= @engg_req_no
		and  	process_name  	= @process_name
		and  	component_name  = @engg_component
		and  	activity_name  	= @activity_name
		and  	ui_name    		= @ui_name_tmp
		and		control_id		= @control_id
		and		view_name		= @view_name
		and		languageid		= @language_code

		-- Added By 11536 for Bug ID:TECH-17984 -- start
		select @placeholder = replace(@placeholder,'&','&amp;') 

		select @PreTask		=	''		---TECH-68066
		select @PostTask	=	''		---TECH-68066

		SELECT @BrowsePreTask	=	''		--TECH-71262
		SELECT @BrowsePostTask	=	''
		SELECT @DeletePreTask	=	''
		SELECT @DeletePostTask	=	''

		If isnull(@AttachmentWithDesc,'N') = 'Y'
		Begin	
			--select	@AssociatedHiddenView	= hidden_view_bt_synonym
			select	@AssociatedHiddenView	= upper(view_name)
			from	de_hidden_view (nolock)
			where	customer_name  	= @engg_customer_name
			and  	project_name  	= @engg_project_name		
			and  	process_name  	= @process_name
			and  	component_name  = @engg_component
			and  	activity_name  	= @activity_name
			and  	ui_name    		= @ui_name_tmp
			and		control_bt_synonym= @controlcolumnbt	
			and		hidden_view_bt_synonym like	'hdifid%'			
			--and		view_name like	'hdifid%'	
		
		---TECH-68066 starts
			SELECT @PreTask	=	upper(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(pretask,'')  		= 'y'
			AND  task_name	like '%PrUI'
			AND  task_descr like 'Pre Task for attachment of%'

			SELECT @PostTask	=	upper(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(PostTask,'')  		= 'y'
			AND  task_name	like '%PsUI'
			AND  task_descr like 'Post Task for attachment of%'--TECH-71262
			
		--code added for the defect id TECH-71262 starts
			SELECT @BrowsePreTask	=	upper(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(Browsepretask,'')  		= 'y'
			AND  task_name	like '%BrPrUI'
			AND  task_descr like 'Browse Pre Task for attachment of%'
			
			SELECT @BrowsePostTask	=	upper(task_name)
			FROM de_published_action   act (nolock),
					es_comp_ctrl_type_mst_extn  ext(nolock)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(BrowsePostTask,'')  		= 'y'
			AND  task_name	like '%BrPsUI'
			AND  task_descr like 'Browse Post Task for attachment of%'

			SELECT @DeletePreTask	=	upper(task_name)
			FROM de_published_action   act (nolock),
			es_comp_ctrl_type_mst_extn  ext(nolock)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(Deletepretask,'')  		= 'y'
			AND  task_name	like '%DePrUI'
			AND  task_descr like 'Delete Pre Task for attachment of%'

			SELECT @DeletePostTask	=	upper(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(DeletePostTask,'')  		= 'y'
			AND  task_name	like '%DePsUI'
			AND  task_descr like 'Delete Post Task for attachment of%'

		--code added for the defect id TECH-71262 ends

		--TECH-68066 ends

		End
	
		If isnull(@Dynamicstorepath,'N') = 'Y'
		Begin		
			select	@DynamicHdnView	= upper(view_name)
			from	de_hidden_view (nolock)
			where	customer_name  	= @engg_customer_name
			and  	project_name  	= @engg_project_name		
			and  	process_name  	= @process_name
			and  	component_name  = @engg_component
			and  	activity_name  	= @activity_name
			and  	ui_name    		= @ui_name_tmp
			and		control_bt_synonym= @controlcolumnbt			
			and		hidden_view_bt_synonym like	'hdidfu%'
		
		End
		-- added for Defect ID TECH-19347 Starts
		If isnull(@MetaDataBasedLink,'N') = 'Y'
		Begin		
			select	@MDLinkHdnview	= upper(view_name)
			from	de_hidden_view (nolock)
			where	customer_name  	= @engg_customer_name
			and  	project_name  	= @engg_project_name		
			and  	process_name  	= @process_name
			and  	component_name  = @engg_component
			and  	activity_name  	= @activity_name
			and  	ui_name    		= @ui_name_tmp
			and		control_bt_synonym= @controlcolumnbt			
			and		hidden_view_bt_synonym like	'hdimdl%'
		
		End
		-- added for Defect ID TECH-19347 Ends

		-- code added for Defect ID	: TECH-68067 starts
		
		IF ISNULL(@BulkDownload,'N') = 'Y'
		BEGIN 
			IF EXISTS ( SELECT 'X'
						FROM	de_published_ui_control a (nolock),
								de_published_ui_grid b (nolock),
								de_published_comp_ctrl_type_mst c (nolock)
						WHERE	a.customer_name			=	@engg_customer_name
						AND		a.project_name			=	@engg_project_name
						AND		a.process_name			=	@process_name
						AND		a.component_name		=	@engg_component
						AND		a.activity_name			=	@activity_name
						AND		a.ui_name				=	@ui_name_tmp
						AND		a.Control_id			=	@control_id
						AND		a.ecrno					=	@engg_req_no
						--AND		a.control_type			=	@control_type_tmp
		
						AND		a.customer_name			=	b.customer_name
						AND		a.project_name			=	b.project_name
						AND		a.process_name			=	b.process_name
						AND		a.component_name		=	b.component_name
						AND		a.ecrno					=	b.ecrno
						AND		a.activity_name			=	b.activity_name
						AND		a.ui_name				=	b.ui_name
						AND		a.control_id			=	b.control_id
						
						AND		b.customer_name			=	c.customer_name
						AND		b.project_name			=	c.project_name
						AND		b.process_name			=	c.process_name
						AND		b.component_name		=	c.component_name
						AND		b.ecrno					=	c.ecrno
						AND		b.column_type			=	c.ctrl_type_name
						AND		(		( ISNULL (c.relative_document_path,'') <> '' )
									OR	( ISNULL (c.relative_image_path,'') <> '' )	
									OR	( ISNULL (c.save_doc_content_to_db,'') = 'y' )		
									OR	( ISNULL (c.save_image_content_to_db,'') = 'y' )
								)	
						)
						BEGIN
							SELECT	@BulkDownload	=	'Y'
						END
						ELSE
						BEGIN
							SELECT	@BulkDownload	=	'N'
						END						
		END 
		-- code added for Defect ID	: TECH-68067 ends
		
		----For stacked links configuration	PLF2.0_18487	starts
		If exists (Select 'x' from 
					es_comp_ctrl_type_mst_extn(nolock)
					where	customer_name	= @engg_customer_name
					and		project_name	= @engg_project_name
					and		process_name	= @process_name
					and		component_name  = @engg_component
					and		ctrl_type_name	= @control_type)
		Begin
			Select	@configuration  = isnull(Configuration,''),
					@ListItemType	= ISNULL(ListItemType,''), -- added on 3rd sep 2020
			-- Code Added for the Defect ID TECH-27286 Starts
					@IsList			= ISNULL(IsList,'N'),
					@ListItemExpander= ISNULL(ListItemExpander, 'N'),
					@MultiSelect	= ISNULL(MultiSelect,'N'),
					@SelectedRowCount= ISNULL(SelectedRowCount,'N'),
					@IsDocked		= ISNULL(IsDocked,'N'),
					@Scan			= ISNULL(Scan,'N'),
					@NFC			= ISNULL(NFCEnabled,'N'),
					@AutoScan		= ISNULL(AutoScan,'N'),
					@IsMobile		=	ISNULL(IsMobile, 'N')
					-- Code Added for the Defect ID TECH-27286 Ends
			from	es_comp_ctrl_type_mst_extn(nolock)	
			where	customer_name	=  @engg_customer_name
			and		project_name	= @engg_project_name
			and		process_name	= @process_name
			and		component_name  = @engg_component
			and		ctrl_type_name	= @control_type
			--Select @Configuration	=  '{''type'':''marquee'', ''carousel'':''y'', ''orientation'':''ver'', ''direction'':''left'',''scrollamount'':''10'',''scrolldelay'':''10'',''scrollspeed'':''900'',''timeout'':''1000'',''navigator'':true,''pauseonover'':true}'



		End
		ELSE
			Select	@configuration  = '',
					@ListItemType	= '',
					@IsList			= '',
					@ListItemExpander='',
					@MultiSelect	= '',
					@SelectedRowCount= '',
					@IsDocked		= '',
					@Scan			= '',
					@NFC			= '',
					@AutoScan		= '',
					@IsMobile		= ''
	-- added for Defect ID TECH-19347 Starts
		If isnull(@renderas,'N') = 'gridtoform'
		Begin
			Select	@GTFFormwidth		= FormWidth,
					@GTFControllwidth	= ControlWidth,
					@GTFLabelwidth		= LabelWidth,
					@GTFControlsperline	= NoofCtrlPerLine,
					@GTFLabelAlign		= LabelAlignment
			from	es_comp_ctrl_type_mst_extn (nolock)
			where	customer_name	= @engg_customer_name
			and		project_name	= @engg_project_name
			and		process_name	= @process_name
			and		component_name  = @engg_component
			and		ctrl_type_name	= @control_type

			Declare	@GTFCtrlwidth	engg_name	
			select	@GTFCtrlwidth	= ''
		

			If CHARINDEX ('px', @GTFControllwidth)  > 0
			Begin
				select @GTFCtrlwidth = cast(left(@GTFControllwidth, len(@GTFControllwidth) -2) as int)  + cast(left(@GTFLabelwidth, len(@GTFLabelwidth) -2) as int)
				select @GTFCtrlwidth = cast( @GTFCtrlwidth  as varchar) + 'px'
			End

			If CHARINDEX ('%', @GTFControllwidth)  > 0
			Begin	
				select @GTFCtrlwidth = cast(left(@GTFControllwidth, len(@GTFControllwidth) -1) as int)  + cast(left(@GTFLabelwidth, len(@GTFLabelwidth) -1) as int)
				select @GTFCtrlwidth = cast( @GTFCtrlwidth  as varchar) + '%'
			End
		End
	-- added for Defect ID TECH-19347 Ends
	

	-- To get the Report Task enabled controls for Mobility --TECH-27286 Starts
	declare @ReportName			engg_name,
			@ReportContext		engg_name, 
			@SPReportName		engg_name, 
			@SPReportContext	engg_name 

	SET		@ReportName			= ''
	SET		@ReportContext		= ''
	SET		@SPReportName		= ''
	SET		@SPReportContext	= ''

	IF ISNULL(@DeviceType,'') IN ('P', 'T', 'B')
	BEGIN		

		SELECT	@ReportName			= rep.report_name, 
				@ReportContext		= rep.report_context
		FROM	es_comp_ctrl_type_mst mst (nolock),
				De_published_report_attributes rep (nolock),
				de_published_action act (nolock)
		WHERE	rep.customer_name  	= @engg_customer_name
		AND		rep.project_name  	= @engg_project_name
		AND		rep.ecrno    		= @engg_req_no
		AND		rep.process_name  	= @process_name
		AND		rep.component_name  = @engg_component
		AND		rep.activity_name  	= @activity_name
		AND		rep.ui_name    		= @ui_name_tmp
		AND		ISNULL(mst.report_req,'')= 'y'

		AND		rep.customer_name	= mst.customer_name
		AND		rep.project_name  	= mst.project_name
		AND		rep.process_name  	= mst.process_name
		AND		rep.component_name	= mst.component_name		

		AND		rep.customer_name	= act.customer_name
		AND		rep.project_name  	= act.project_name
		AND		rep.process_name  	= act.process_name
		AND		rep.component_name	= act.component_name
		AND		rep.Activity_name	= act.activity_name
		AND		rep.ui_name			= act.ui_name
		AND		rep.page_name		= act.page_bt_synonym
		AND		rep.task_name		= act.task_name
		AND		act.primary_control_bts	= @controlcolumnbt

		
		SELECT	@SPReportName		= rep.report_name, 
				@SPReportContext	= rep.report_context
		FROM	es_comp_ctrl_type_mst mst (nolock),
				de_published_sp_report_action_segment rep (nolock),
				de_published_action act (nolock)
		WHERE	rep.customer_name  	= @engg_customer_name
		AND		rep.project_name  	= @engg_project_name
		AND		rep.ecrno    		= @engg_req_no
		AND		rep.process_name  	= @process_name
		AND		rep.component_name  = @engg_component
		AND		rep.activity_name  	= @activity_name
		AND		rep.ui_name    		= @ui_name_tmp
		AND		ISNULL(mst.report_req,'')= 'y'

		AND		rep.customer_name	= mst.customer_name
		AND		rep.project_name  	= mst.project_name
		AND		rep.process_name  	= mst.process_name
		AND		rep.component_name	= mst.component_name

		AND		rep.customer_name	= act.customer_name
		AND		rep.project_name  	= act.project_name
		AND		rep.process_name  	= act.process_name
		AND		rep.component_name	= act.component_name
		AND		rep.Activity_name	= act.activity_name
		AND		rep.ui_name			= act.ui_name
		AND		rep.page_bt_synonym	= act.page_bt_synonym
		AND		rep.task_name		= act.task_name
		AND		act.primary_control_bts	= @controlcolumnbt


	END
	 ---code fixed against systemgeneratedfielid TECH-52636      
  declare @attachdocument  engg_name,  @attachimage  engg_name, @save_doc_content_to_db  engg_name, @save_image_content_to_db  engg_name,@autofilename  engg_name        
  select @attachdocument = '',@save_doc_content_to_db='',@save_image_content_to_db='',@attachimage='',@autofilename=''      
      
 select @attachdocument= isnull(attach_document,'N') from es_comp_ctrl_type_mst(nolock)    
  where customer_name = @engg_customer_name        
   and  project_name   = @engg_project_name         
   and  process_name   = @process_name         
   and  component_name  = @engg_component        
   and  ctrl_type_name = @control_type       
         
 select @save_doc_content_to_db= isnull(save_doc_content_to_db,'N') from  es_comp_ctrl_type_mst(nolock)   
 where customer_name = @engg_customer_name        
   and  project_name   = @engg_project_name           
   and  process_name   = @process_name    
   and  component_name = @engg_component        
   and  ctrl_type_name = @control_type  
             
 select @save_image_content_to_db = isnull(save_image_content_to_db,'N') from es_comp_ctrl_type_mst(nolock)     
 where customer_name = @engg_customer_name      
   and  project_name   = @engg_project_name         
   and  process_name   = @process_name      
   and  component_name  = @engg_component         
   and  ctrl_type_name = @control_type   
        
 select @attachimage =isnull(image_upload,'N') from es_comp_ctrl_type_mst(nolock)     
 where customer_name = @engg_customer_name       
  and  project_name   = @engg_project_name          
  and  process_name   = @process_name       
  and  component_name  = @engg_component         
  and  ctrl_type_name = @control_type        
     
	 --TECH-71262
	 IF ISNULL(@CtrlAssociateControl, '') <> ''
	 BEGIN
		SELECT	@AssociateControl		= UPPER(Control_id)
		FROM	de_published_ui_control (NOLOCK)
		WHERE	customer_name  		= @engg_customer_name
		AND  	project_name  		= @engg_project_name
		AND		ecrno				= @engg_req_no
		AND  	process_name  		= @process_name
		AND  	component_name		= @engg_component
		AND  	activity_name  		= @activity_name
		AND  	ui_name    			= @ui_name_tmp
		AND		control_bt_synonym	= @CtrlAssociateControl
	END
	--TECH-71262
      
 if ((@attachdocument='y'or @attachimage='y' or  @save_doc_content_to_db='Y' or @save_image_content_to_db='Y') and (isnull(@SystemGeneratedFileId,'N') = 'N'  and isnull(@AttachmentWithDesc,'N')='N' and isnull(@Dynamicstorepath,'N')='N' ))      
 begin       
 select @autofilename ='n'      
 end 
 -- for systemgeneratedfielid TECH-52636 ends 

	-- To get the Report Task enabled controls for Mobility --TECH-27286 Ends
		
	----For stacked links configuration	PLF2.0_18487	Ends
	

		if isnull(@PreventDownload,'')		= 'y' 	or isnull(@norowstodisplay_notreq,'')	= 'y'	--or isnull(@placeholder,'')				<> ''	
		or LEN(@placeholder)				> 0 	or isnull(@hidecopy,'')				= 'y'
		or isnull(@enabledefault,'')		= 'y' 	or isnull(@hideSelect,'')				= 'Y'	or isnull(@hideinsert,'')				= 'y'	or isnull(@hidedelete,'')			= 'Y'	 
		or isnull(@hidefilterdata,'')		= 'y' 	or isnull(@hidepdf,'')					= 'y'	or isnull(@hidereport,'')				= 'y'	or isnull(@hidehtml,'')				= 'y'
		or isnull(@hideexportexcel,'')		= 'y' 	or isnull(@hideexportcsv,'')			= 'y'	or isnull(@hideexporttext,'')			= 'y'	or isnull(@hideimportdata,'')		= 'y'	
		or isnull(@hidechart,'')			= 'y' 	or isnull(@hideexportopenoffice,'')		= 'y'	or isnull(@hidepersonalize,'')			= 'y'	or isnull(@searchhide,'')			= 'y'
		or isnull(@hidecut,'')				= 'y' 	or isnull(@autoheight,'')				= 'y'	or isnull(@Preserve_visible_length,'')	= 'y'	or isnull(@Auto_width_column,'')	<> ''
		or isnull(@QlikLink,'N')			= 'y'	or isnull(@SystemGeneratedFileId,'')	=  'y'		or isnull(@Ishijri,'')					=  'y'	or ISNULL(@IsMarquee,'N')			= 'Y'
		or ISNULL(@configuration,'')		<>''	or ISNULL(@IsAssorted,'N')				= 'y'--PLF2.0_18487	
		or isnull(@RatingType,'')			 <>''	or ISNULL(@CaptchaData,'')		<> ''	
		or isnull(@gridtoform,'N')			= 'y'	or isnull(@rowexpander,'N')				= 'y'	--or isnull(@multiselector,'N')			= 'y'
		or isnull(@AttachmentWithDesc,'N')	= 'y'	or isnull(@Delayedpwdmask,'N')			= 'y'   or isnull(@MetaDataBasedLink, 'N')		= 'y'
		or	isnull(@EditMask,'N')			= 'y'	or isnull(@Autoselect,'N')				= 'y'	--or isnull(@IsList,'N')					= 'y'	
		or isnull(@IsDocked,'N')			= 'y'	or	isnull(@Scan,'N')				= 'y'	or Len(@ReportName)						>= 1	or LEN(@SPReportName)					>= 1	or isnull(@DynamicStyle, 'N')		= 'Y'
		or	isnull(@ImageAsData, 'N')		= 'Y'	or	isnull(@ListItemExpander, 'N')		= 'Y'	or isnull(@mlsearchonly,'')			= 'y'  or @autofilename ='n'  --TECH-45171
		or	isnull(@ExtensionReqd, 'No')		= 'Yes'	or	isnull(@BulkDownload, 'N')		= 'Y' --TECH-68067
		--or (isnull(@IsList,'N')					= 'y'	and isnull(@IsMobile,'N')			= 'N'	)	--TECH-72114
		or ISNULL(@BorderLeftWidth,'') <> ''		or ISNULL(@HasCustomAction,'') = 'Y'
		OR ISNULL(@CtrlAssociateControl,'') <> ''	OR ISNULL(@CtrlButtonStyle,'')			= 'Y'	OR ISNULL(@CtrlSelectOnlyLE,'')			= 'Y'--TECH-71262
		
		
		begin
		
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull(@control_id,'')))			+ '" ' +	
			'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' 
	
		if (@PreventDownload = 'y')
			--select @sql    = 'PreventDownload="'			+ ltrim(rtrim(isnull(upper(@PreventDownload),'')))		+ '" '
			select @sql    = @sql+'PreventDownload="'			+ ltrim(rtrim(isnull(upper(@PreventDownload),'')))		+ '" '
	
		if (@norowstodisplay_notreq = 'y')
			select @sql    = @sql+'DisplayNoRowsNotReq="'			+ ltrim(rtrim(isnull(upper(@norowstodisplay_notreq),''))) + '" '	

		--if (isnull(@placeholder,'') <> '') 
		IF LEN(@placeholder) > 0 
			select @sql    = @sql+'phtext="'			+ ltrim(rtrim(isnull(@placeholder,'')))	  	+ '" '
		
		---New
		if (isnull(@hideSelect,'') =  'y')
			select @sql    = @sql+'HideSelect="'			+ ltrim(rtrim(isnull(upper(@hideSelect),'')))	  	+ '" '
 
		if (isnull(@enabledefault,'') =  'y')
			select @sql    = @sql+'EnableDefault="'			+ ltrim(rtrim(isnull(upper(@enabledefault),'')))	  	+ '" '
  
		if (isnull(@hideinsert,'') =  'y')
			select @sql    = @sql+'HideInsert="'			+ ltrim(rtrim(isnull(upper(@hideinsert),'')))	  	+ '" '

		if (isnull(@hidedelete,'') =  'y')
			select @sql    = @sql+'HideDelete="'			+ ltrim(rtrim(isnull(upper(@hidedelete),'')))	  	+ '" '

		if (isnull(@hidecopy,'') =  'y')
			select @sql    = @sql+'HideCopy="'			+ ltrim(rtrim(isnull(@hidecopy,'')))	  	+ '" '
  
		if (isnull(@hidecut,'') =  'y')
			select @sql    = @sql+'HideCut="'			+ ltrim(rtrim(isnull(@hidecut,'')))	  	+ '" '
  
		if (isnull(@hidefilterdata,'') =  'y')
			select @sql    = @sql+'HideFilterData="'			+ ltrim(rtrim(isnull(@hidefilterdata,'')))	  	+ '" '

		if (isnull(@hidepdf,'') =  'y')
			select @sql    = @sql+'HidePdf="'			+ ltrim(rtrim(isnull(@hidepdf,'')))	  	+ '" '

		if (isnull(@hidereport,'') =  'y')
			select @sql    = @sql+'HideReport="'			+ ltrim(rtrim(isnull(@hidereport,'')))	  + '" '	

		if (isnull(@hidehtml,'') =  'y')
			select @sql    = @sql+'HideHtml="'			+ ltrim(rtrim(isnull(@hidehtml,'')))	  	+ '" '

		if (isnull(@hideexportexcel,'') =  'y')
			select @sql    = @sql+'HideExportexcel="'			+ ltrim(rtrim(isnull(@hideexportexcel,'')))	  	 + '" '
  
		if (isnull(@hideexportcsv,'') =  'y')
			select @sql    = @sql+'HideExportcsv="'			+ ltrim(rtrim(isnull(@hideexportcsv,'')))	  	+ '" '
  
		if (isnull(@hideexporttext,'') =  'y')
			select @sql    = @sql+'HideExporttext="'			+ ltrim(rtrim(isnull(@hideexporttext,'')))	  	+ '" '	--code added for the DefectId Tech-63606

		if (isnull(@hideimportdata,'') =  'y')
			select @sql    = @sql+'HideImportdata="'			+ ltrim(rtrim(isnull(@hideimportdata,'')))	  	+ '" '
  
		if (isnull(@hidechart,'') =  'y')
			select @sql    = @sql+'HideChart="'			+ ltrim(rtrim(isnull(@hidechart,'')))	  	+ '" '
  
		if (isnull(@hideexportopenoffice,'') =  'y')
			select @sql    = @sql+'HideExportopenoffice="'			+ ltrim(rtrim(isnull(@hideexportopenoffice,'')))	  	+ '" '

		if (isnull(@hidepersonalize,'') =  'y')
			select @sql    = @sql+'HidePersonalize="'			+ ltrim(rtrim(isnull(@hidepersonalize,'')))	  	+ '" '
		--TECH-68480 starts
		if (isnull(@HideColumnchooser,'') =  'y')    
        select @sql    = @sql+'HideColumnchooser="'   + ltrim(rtrim(isnull(@HideColumnchooser,'')))    + '" '     
		--TECH-68480 ends
-- TECH-45171 starts
		
		if (isnull(@mlsearchonly,'') =  'y')
			select @sql    = @sql+'MlSearchOnly="'			+ ltrim(rtrim(isnull(@mlsearchonly,'')))	  	+ '" '

		-- TECH-45171 ends
		
		if (isnull(@searchhide,'') =  'y')
			select @sql    = @sql+'SearchHide="'			+ ltrim(rtrim(isnull(@searchhide,'')))	  	+ '" '
  
		if (isnull(@autoheight,'') =  'y')
			select @sql    = @sql+'AutoHeight="'			+ ltrim(rtrim(isnull(upper(@autoheight),'')))	+ '" '  	

		if (isnull(@Preserve_visible_length,'') =  'y')
			select @sql    = @sql+'Preserve_Visible_Length="'			+ ltrim(rtrim(isnull(@Preserve_visible_length,'')))	+ '" '  	

		if (isnull(@Auto_Width_Column,'') <>  '')
			select @sql    = @sql+'Auto_Width_Column="'			+ ltrim(rtrim(isnull(@Auto_Width_Column,'')))	+ '" '  	

		if (isnull(@Ishijri,'') =  'y')
			select @sql    = @sql+'Ishijiri="'			+ ltrim(rtrim(isnull(Lower(@Ishijri),'')))	+ '" '  
	
		if (isnull(@QlikLink,'') =  'y')
			select @sql    = @sql+'QlikLink="'			+ ltrim(rtrim(isnull(@QlikLink,'')))	+ '" '  

		if (isnull(@SystemGeneratedFileId,'') =  'y')
			select @sql    = @sql+'SystemGeneratedFileId="'			+ ltrim(rtrim(isnull(Lower(@SystemGeneratedFileId),'')))	+ '" '  --TECH-65049 code modified to Lowercase for handling dynamic file name in user.js file.
--- starts TECH-52636
			if (isnull(@autofilename,'') =  'n')        
   select @sql    = @sql+'SystemGeneratedFileId="'   + ltrim(rtrim(isnull(upper('n'),''))) + '" '  
   --ends TECH-52636
			--PLF2.0_18487		Starts
		if (isnull(@IsMarquee,'') =  'y')
			select @sql    = @sql+'IsMarquee="'			+ ltrim(rtrim(isnull(@IsMarquee,'N')))	+ '" '  

		if (isnull(@Configuration,'') <>	'')
			select @sql    = @sql+'marqueeconfig="'			+ ltrim(rtrim(isnull(@Configuration,'')))	+ '" '  

		if (isnull(@IsAssorted,'N') = 'y')
			select @sql    = @sql+'IsAssorted="'			+ ltrim(rtrim(isnull(@IsAssorted,'N')))	+ '" '  
 	
		if (isnull(@RatingType,'')	<>	'')
			select @sql    = @sql+'RatingType="'			+ ltrim(rtrim(isnull(@RatingType,'')))	+ '" '  
 	 	 	
		if (isnull(@CaptchaData,'') <> '')
			select @sql    = @sql+'CaptchaData="'			+ ltrim(rtrim(isnull(@CaptchaData,'')))	+ '" '  
	
		if (isnull(@gridtoform,'N') = 'y')
		Begin
			-- added for Defect ID TECH-19347 Starts
			select @sql    = @sql+'GridToForm="'			+ ltrim(rtrim(isnull(@gridtoform,'')))	+ '" '  
			select @sql    = @sql+'FormWidth="'				+ ltrim(rtrim(isnull(@GTFFormwidth,'')))+ '" '  
			select @sql    = @sql+'ControlWidth="'			+ ltrim(rtrim(isnull(@GTFCtrlwidth,'')))+ '" '  
			select @sql    = @sql+'LabelWidth="'			+ ltrim(rtrim(isnull(@GTFLabelwidth,'')))+ '" '  
			select @sql    = @sql+'ControlsPerLine="'		+ ltrim(rtrim(isnull(@GTFControlsperline,'')))+ '" '  
			select @sql    = @sql+'LabelAlignment="'		+ ltrim(rtrim(isnull(@GTFLabelAlign,'')))+ '" '  

		End
 		if (isnull(@rowexpander,'N') = 'y')
			select @sql    = @sql+'ColumnAsRow="'			+ ltrim(rtrim(isnull(@rowexpander,'')))	+ '" '  
	
		if (isnull(@AttachmentWithDesc,'N') = 'y')
		Begin
			select @sql    = @sql+'AttachmentWithDesc="'			+ ltrim(rtrim(isnull(@AttachmentWithDesc,'')))	+ '" '  
			select @sql    = @sql+'DynamicFileID="'			+ ltrim(rtrim(isnull(@AssociatedHiddenView,'')))	+ '" '  
			select @sql    = @sql+'PreTask="'			+ ltrim(rtrim(isnull(@PreTask,'')))	+ '" '					---TECH-68066
			select @sql    = @sql+'PostTask="'			+ ltrim(rtrim(isnull(@PostTask,'')))	+ '" '				---TECH-68066

			select @sql    = @sql+'BrowsePreTask="'			+ ltrim(rtrim(isnull(@BrowsePreTask,'')))	+ '" '			---TECH-71262
			select @sql    = @sql+'BrowsePostTask="'		+ ltrim(rtrim(isnull(@BrowsePostTask,'')))	+ '" '	
			select @sql    = @sql+'DeletePreTask="'			+ ltrim(rtrim(isnull(@DeletePreTask,'')))	+ '" '	
			select @sql    = @sql+'DeletePostTask="'		+ ltrim(rtrim(isnull(@DeletePostTask,'')))	+ '" '	

		End
		if (isnull(@Dynamicstorepath,'N') = 'y')
		Begin
			--select @sql    = @sql+'DynamicStorePath="'			+ ltrim(rtrim(isnull(@Dynamicstorepath,'')))	+ '" '  
			select @sql    = @sql+'DynamicStorePath="'			+ ltrim(rtrim(isnull(@DynamicHdnView,'')))	+ '" '  
		End

		--TECH-71262
		IF (isnull(@CtrlAssociateControl,'') <> '')
		BEGIN
			SELECT @sql    = @sql+'AssociateControl="'			+ ltrim(rtrim(isnull(@AssociateControl,'')))	+ '" '  
		END

		IF (isnull(@CtrlButtonStyle,'') = 'y')
		BEGIN
			SELECT @sql    = @sql+'ButtonStyle="'			+ ltrim(rtrim(isnull(@CtrlButtonStyle,'')))	+ '" '  
		END

		IF (isnull(@CtrlSelectOnlyLE,'') = 'y')
		BEGIN
			SELECT @sql    = @sql+'SelectOnlyListValues="'			+ ltrim(rtrim(isnull(@CtrlSelectOnlyLE,'')))	+ '" '  
		END
		--TECH-71262

		if (isnull(@MetaDataBasedLink,'N') = 'y')
			select @sql    = @sql+'MetaDataBasedLink="'			+ ltrim(rtrim(isnull(@MDLinkHdnview,'')))	+ '" '  
				
		if (isnull(@editmask,'N') = 'y') 
			select @sql    = @sql+'MaskControl="'			+ upper(ltrim(rtrim(isnull('HDNH'+@controlcolumnbt+'_RD',''))))	+ '" '  

		if (isnull(@Delayedpwdmask,'N') = 'y')
			select @sql    = @sql+'DelayedPwdMask="'			+ ltrim(rtrim(isnull(@Delayedpwdmask,'')))	+ '" '  
		
		-- Code Added for the Defect ID TECH-27286 Starts
		--if (isnull(@IsList,'N') = 'y') AND (isnull(@IsMobile,'N') = 'N')		--TECH-72114
		--	select @sql    = @sql+'IsList="'			+ ltrim(rtrim(isnull(@IsList,'')))	+ '" '  
		
		if (isnull(@ListItemExpander,'N') = 'y')
			select @sql    = @sql+'ListItemExpander="'			+ ltrim(rtrim(isnull(@ListItemExpander,'')))	+ '" '  

		if LEN(@ListItemType) > 0
			select @sql    = @sql+'ListItemType="'			+ ltrim(rtrim(isnull(@ListItemType,'')))	+ '" '  
			
		
		--if (isnull(@MultiSelect,'N') = 'y')		--TECH-72114
		--	select @sql    = @sql+'MultiSelect="'			+ ltrim(rtrim(isnull(@MultiSelect,'')))	+ '" '  

		if (isnull(@SelectedRowCount,'N') = 'y')
			select @sql    = @sql+'SelectedRowCount="'			+ ltrim(rtrim(isnull('h' + @controlcolumnbt + '_rwcnt','')))	+ '" '  
			
		if (isnull(@IsDocked,'N') = 'y')
			select @sql    = @sql+'IsDocked="'				+ ltrim(rtrim(isnull(@IsDocked,'')))	+ '" '   

		if (isnull(@Scan,'N') = 'y')
		begin
			select @sql    = @sql+'Scan="'				+ ltrim(rtrim(isnull(@Scan,'')))	+ '" '   
			select @sql    = @sql+'Autoscan="'				+ ltrim(rtrim(isnull(@AutoScan,'')))	+ '" '   
		end
		
		if (isnull(@DynamicStyle,'N') = 'y')
			select @sql    = @sql+'DynamicStyle="'				+ ltrim(rtrim(isnull(@DynamicStyle,'')))	+ '" ' 

		if (isnull(@ImageAsData,'N') = 'y')
			select @sql    = @sql+'ImageAsData="'				+ ltrim(rtrim(isnull(@ImageAsData,'')))	+ '" '   
		

		--if (isnull(@AutoScan,'N') = 'y')
		--	select @sql    = @sql+'AutoScan="'				+ ltrim(rtrim(isnull(@AutoScan,'')))	+ '" '   

		if (isnull(@NFC,'N') = 'y')
			select @sql    = @sql+'NFC="'				+ ltrim(rtrim(isnull(@NFC,'')))	+ '" '   
-- To get the Report Task enabled controls for Mobility --TECH-27286 Starts
		IF LEN(@ReportName)	>= 1
		BEGIN
			select @sql    = @sql+'ReportName="'		+ ltrim(rtrim(isnull(@ReportName,'')))	+ '" '   		
			select @sql    = @sql+'ReportContext="'		+ ltrim(rtrim(isnull(@ReportContext,'')))	+ '" '   
		END

		IF LEN(@SPReportName)	>= 1
		BEGIN
			select @sql    = @sql+'ReportName="'		+ ltrim(rtrim(isnull(@SPReportName,'')))	+ '" '   		
			select @sql    = @sql+'ReportContext="'				+ ltrim(rtrim(isnull(@SPReportContext,'')))	+ '" '   
		END
		-- To get the Report Task enabled controls for Mobility --TECH-27286 Ends
-- Code Added for the Defect ID TECH-27286 Ends

		If	isnull(@Autoselect,'N') = 'y' 
			select @sql    = @sql+'AutoSelect="Y" '  
		--if (isnull(@multiselector,'') <> '')
		--	select @sql    = @sql+'CaptchaData="'			+ ltrim(rtrim(isnull(@multiselector,'')))	+ '" '  
		
		--TECH-69624
		IF ISNULL(@BorderLeftWidth,'') <> ''
		BEGIN
			select @sql    = @sql+'BorderStyle="'		+ ltrim(rtrim(isnull(@BorderStyle,'')))	+ '" '
			select @sql    = @sql+'BorderTopLeftRadius="'	+ ltrim(rtrim(isnull(@BorderTopLeftRadius,'')))	+ '" '
			select @sql    = @sql+'BorderTopRightRadius="'	+ ltrim(rtrim(isnull(@BorderTopRightRadius,'')))	+ '" '
			select @sql    = @sql+'BorderBottomLeftRadius="'	+ ltrim(rtrim(isnull(@BorderBottomLeftRadius,'')))	+ '" '
			select @sql    = @sql+'BorderBottomRightRadius="'	+ ltrim(rtrim(isnull(@BorderBottomRightRadius,'')))	+ '" '
			select @sql    = @sql+'BorderLeftWidth="'	+ ltrim(rtrim(isnull(@BorderLeftWidth,'')))+CASE WHEN ISNULL(@BorderLeftWidth,'')<>'' THEN 'px' ELSE '' END	+ '" '
			select @sql    = @sql+'BorderRightWidth="'	+ ltrim(rtrim(isnull(@BorderRightWidth,'')))+CASE WHEN ISNULL(@BorderRightWidth,'')<>'' THEN 'px' ELSE '' END	+ '" '
			select @sql    = @sql+'BorderTopWidth="'	+ ltrim(rtrim(isnull(@BorderTopWidth,'')))+CASE WHEN ISNULL(@BorderTopWidth,'')<>'' THEN 'px' ELSE '' END	+ '" '
			select @sql    = @sql+'BorderBottomWidth="'	+ ltrim(rtrim(isnull(@BorderBottomWidth,'')))+CASE WHEN ISNULL(@BorderBottomWidth,'')<>'' THEN 'px' ELSE '' END	+ '" '
			select @sql    = @sql+'BorderLeftColor="'	+ ltrim(rtrim(isnull(@BorderLeftColor,'')))	+ '" '
			select @sql    = @sql+'BorderRightColor="'	+ ltrim(rtrim(isnull(@BorderRightColor,'')))	+ '" '
			select @sql    = @sql+'BorderTopColor="'	+ ltrim(rtrim(isnull(@BorderTopColor,'')))	+ '" '
			select @sql    = @sql+'BorderBottomColor="'	+ ltrim(rtrim(isnull(@BorderBottomColor,'')))	+ '" ' --+ '"' +'/>'

		END


		--IF ISNULL(@HasCustomAction,'') = 'y'
		--BEGIN

		--	select @xml_seq_tmp_out=@xml_seq_tmp_out+1

		--	insert into ep_genxml_tmp
		--	(customer_name,   project_name,   req_no,   process_name,  component_name,
		--	activity_name,    guid,    gen_xml,seq_no)
		--	values
		--	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		--	@activity_name,  @guid,    '<CustomActions>',@xml_seq_tmp_out)

		--	SELECT	@TargetComponent	=	linked_component,
		--			@TargetActivity		=	linked_activity,
		--			@TargetIlbo			=	linked_ui,
		--			@TargetHeight		=	Height,
		--			@TargetWidth		=	Width,
		--			@LaunchMode			=	LinkLaunchType
		--	FROM	de_published_ui_control ctl (NOLOCK),
		--			de_published_ui_traversal tra (NOLOCK)
		--	where	ctl.customer_name  		=	tra.customer_name
		--	and		ctl.project_name  		=	tra.project_name
		--	and		ctl.ecrno    			=	tra.ecrno
		--	and		ctl.process_name  		=	tra.process_name
		--	and		ctl.component_name		=	tra.component_name
		--	and		ctl.activity_name  		=	tra.activity_name
		--	and		ctl.ui_name    			=	tra.ui_name
		--	and		ctl.page_bt_synonym		=	tra.page_bt_synonym
		--	and		ctl.section_bt_synonym  =	tra.section_bt_synonym
		--	and		ctl.control_bt_synonym	=	tra.control_bt_synonym

		--	and		ctl.customer_name  		=	@engg_customer_name
		--	and		ctl.project_name  		=	@engg_project_name
		--	and		ctl.ecrno    			=	@engg_req_no
		--	and		ctl.process_name  		=	@process_name
		--	and		ctl.component_name		=	@engg_component
		--	and		ctl.activity_name  		=	@activity_name
		--	and		ctl.ui_name    			=	@ui_name_tmp
		--	and		ctl.control_id			=	@control_id

		--	SELECT	@TargetSection	=	PopUp_section
		--	FROM	de_published_ui_control ctl (NOLOCK),
		--			de_published_action tsk (NOLOCK)
		--	where	ctl.customer_name  		=	tsk.customer_name
		--	and		ctl.project_name  		=	tsk.project_name
		--	and		ctl.ecrno    			=	tsk.ecrno
		--	and		ctl.process_name  		=	tsk.process_name
		--	and		ctl.component_name		=	tsk.component_name
		--	and		ctl.activity_name  		=	tsk.activity_name
		--	and		ctl.ui_name    			=	tsk.ui_name
		--	and		ctl.page_bt_synonym		=	tsk.page_bt_synonym
		--	and		ctl.control_bt_synonym	=	tsk.primary_control_bts

		--	and		ctl.customer_name  		=	@engg_customer_name
		--	and		ctl.project_name  		=	@engg_project_name
		--	and		ctl.ecrno    			=	@engg_req_no
		--	and		ctl.process_name  		=	@process_name
		--	and		ctl.component_name		=	@engg_component
		--	and		ctl.activity_name  		=	@activity_name
		--	and		ctl.ui_name    			=	@ui_name_tmp
		--	and		ctl.control_id			=	@control_id

		--	--select 't', @engg_customer_name,@engg_project_name,@engg_req_no,@process_name,@engg_component,
		--	--			@activity_name,@ui_name_tmp,@control_id,@TargetIlbo,@TargetSection

		--	select @sql =	'<CustomAction Name="' 		+ ltrim(rtrim(isnull(ActionControlBTSynonym,'')))			+ '" ' +
		--					'ActionDesc="'  + ltrim(rtrim(isnull(ActionDescription,'')))    + '"' +
		--					'Sequence="'		+ ltrim(rtrim(isnull(ActionSequence,'')))    + '"' +
		--					'Type="'  + ltrim(rtrim(isnull(ActionType,'')))    + '"' +
		--					'BTSynonym="'  + ltrim(rtrim(isnull(ctl.control_bt_synonym,'')))    + '"' +
		--					'Caption="'  + ltrim(rtrim(isnull(BT_Synonym_Caption,'')))    + '"' +
		--					'LaunchMode="'  + ltrim(rtrim(isnull(@LaunchMode,'')))    + '"' +
		--					'HasPopup="'  + ltrim(rtrim(isnull(@HasPopup,'')))    + '"' +
		--					'TargetSection="'  + ltrim(rtrim(isnull(@TargetSection,'')))    + '"' +
		--					'TargetbtSynonym="'  + ltrim(rtrim(isnull(@TargetbtSynonym,'')))    + '"' +
		--					'TargetWidth="'  + ltrim(rtrim(isnull(@TargetWidth,'')))    + '"' +
		--					'TargetHeight="'  + ltrim(rtrim(isnull(@TargetHeight,'')))    + '"' +
		--					'IconClass="'  + ltrim(rtrim(isnull(IconClass,'')))    + '"' +
		--					'ToolTip="'  + ltrim(rtrim(isnull(ToolTip,'')))    + '"' +
		--					'TargetComponent="'  + ltrim(rtrim(isnull(@TargetComponent,'')))    + '"' +
		--					'TargetActivity="'  + ltrim(rtrim(isnull(@TargetActivity,'')))    + '"'  +
		--					'TargetIlbo="'  + ltrim(rtrim(isnull(@TargetIlbo,'')))    + '"' +
		--					--'CustomClass="'  + ltrim(rtrim(isnull(CustomClass,'')))    + '"' +
		--					'PrimaryControlBT="'  + ltrim(rtrim(isnull(cus.ActionControlBTSynonym,'')))    + '"' +
		--					'Width="'  + ltrim(rtrim(isnull(Width,'')))    + '"' +
		--					'IconPosition="'  + ltrim(rtrim(isnull(IconPosition,'')))    + '"' +'/>'
		--	from	de_published_ui_control   ctl (nolock),
		--			de_published_ui_control_customaction cus (NOLOCK),
		--			de_published_glossary gls (NOLOCK)
		--	where	ctl.customer_name  			=	cus.customer_name
		--	and		ctl.project_name  			=	cus.project_name
		--	and		ctl.ecrno    				=	cus.ecrno
		--	and		ctl.process_name  			=	cus.process_name
		--	and		ctl.component_name			=	cus.component_name
		--	and		ctl.activity_name  			=	cus.activity_name
		--	and		ctl.ui_name    				=	cus.ui_name
		--	and		ctl.page_bt_synonym			=	cus.page_bt_synonym
		--	and		ctl.section_bt_synonym		=	cus.section_bt_synonym
		--	and		ctl.Control_ID    			=	cus.Control_ID
		--	and		ctl.View_Name    			=	cus.View_Name

		--	and		cus.customer_name  			=	gls.customer_name
		--	and		cus.project_name  			=	gls.project_name
		--	and		cus.ecrno    				=	gls.ecrno
		--	and		cus.process_name  			=	gls.process_name
		--	and		cus.component_name			=	gls.component_name
		--	and		cus.ActionControlBTSynonym  =	gls.Bt_Synonym_name

		--	and		ctl.customer_name  			=	@engg_customer_name
		--	and		ctl.project_name  			=	@engg_project_name
		--	and		ctl.ecrno    				=	@engg_req_no
		--	and		ctl.process_name  			=	@process_name
		--	and		ctl.component_name			=	@engg_component
		--	and		ctl.activity_name  			=	@activity_name
		--	and		ctl.ui_name    				=	@ui_name_tmp
		--	and		ctl.control_id				=	@control_id
		--	ORDER BY cus.ActionSequence	
			
		--	--select @sql = @sql +'/>'
		--	--select 'tt',@sql '@sql'
			
		--	select @xml_seq_tmp_out=@xml_seq_tmp_out+1

		--	insert into ep_genxml_tmp
		--	(customer_name,   project_name,   req_no,   process_name,  component_name,
		--	activity_name,    guid,    gen_xml,seq_no)
		--	values
		--	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		--	@activity_name,  @guid,    @sql,@xml_seq_tmp_out)

		--IF ISNULL(@BulkDownload,'N') = 'Y'
		--BEGIN
		--	select @sql    = @sql+'BulkDownload="'			+ ltrim(rtrim(isnull(@BulkDownload,'')))	+ '" '  
		--	select @sql = @sql +'/>'
		--END
		
		--TECH-71262
		IF	ISNULL(@LaunchMode, '')	<> ''
		BEGIN
			select @sql    = @sql+'LaunchMode="'		+ ltrim(rtrim(isnull(@LaunchMode,'')))	+ '" '   		
		END
		IF ISNULL(@BulkDownload,'N') = 'Y'
		BEGIN
			select @sql    = @sql+'BulkDownload="'			+ ltrim(rtrim(isnull(@BulkDownload,'')))	+ '" '  
			--select @sql = @sql +'/>'
		END
		IF	ISNULL(@HasCustomAction, 'n')	= 'Y'
		BEGIN
			select @sql		=	@sql+'ShowCustomAction="'			+ ltrim(rtrim(isnull(@HasCustomAction,'')))	+ '" '  --TECH-71262
			select @sql = @sql +'>'
		END
		
						-- -- Code Modifed for TECH-60451 
		IF	ISNULL(@ExtensionReqd, 'N')	IN ('No', 'N')  OR ISNULL(@HasCustomAction, 'N')	 = 'N'   --TECH-71262
		BEGIN
		
		--PLF2.0_18487		Ends
		select @sql = @sql +'/>'
		END
		--ELSE
		--BEGIN
		--	select @sql    = @sql+'LaunchMode="'		+ ltrim(rtrim(isnull(@LaunchMode,'')))	+ '" '   		
		--	--select @sql = @sql +'/>'	--code added for the DefectId Tech-63606
		--END	----TECH-71262
		-- -- Code Modifed for TECH-68067 starts 

	--	IF ISNULL(@BulkDownload,'N') = 'Y'
	--	BEGIN
	--		select @sql    = @sql+'BulkDownload="'			+ ltrim(rtrim(isnull(@BulkDownload,'')))	+ '" '  
			--select @sql = @sql +'/>'
	--	END

		
		-- -- Code Modifed for TECH-68067 ends	


		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)	

		--TECH-69624 for custom action

		IF	ISNULL(@HasCustomAction, 'n')	= 'Y'
		BEGIN

		--select @sql		=	@sql+'ShowCustomAction="'			+ ltrim(rtrim(isnull(@HasCustomAction,'')))	+ '" '  
		--select @sql		=	@sql +'/>'

		SELECT		@Caption				=	''
				
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<CustomActions>',@xml_seq_tmp_out)
		
			declare custom_action cursor FAST_FORWARD for
			select	Control_id,			View_Name,		control_bt_synonym,			ActionControlID,			
					ActionViewName,		ActionControlBTSynonym
			from	de_published_ui_control_customaction   grd (nolock)
			where	grd.customer_name  	= @engg_customer_name
			and		grd.project_name  	= @engg_project_name
			and		grd.ecrno    		= @engg_req_no
			and		grd.process_name  	= @process_name
			and		grd.component_name  = @engg_component
			and		grd.activity_name  	= @activity_name
			and		grd.ui_name    		= @ui_name_tmp
			and		grd.control_id		= @control_id
			ORDER BY grd.ActionSequence

			open custom_action

			fetch next from custom_action into 
			@Control_id,			@View_Name,						@control_bt_synonym,			@ActionControlID,			
			@ActionViewName,		@ActionControlBTSynonym
	
			WHILE @@FETCH_STATUS = 0   
			BEGIN 
			--	select @xml_seq_tmp_out=@xml_seq_tmp_out+1

				SELECT	@Caption		=	bt_synonym_caption
				FROM	de_glossary (nolock)
				WHERE	customer_name	=	@engg_customer_name
				AND		project_name	=	@engg_project_name
				AND		process_name	=	@process_name
				AND		component_name	=	@engg_component
				AND		bt_synonym_name	=	@ActionControlBTSynonym

			SELECT	@TargetComponent	=	linked_component,
					@TargetActivity		=	linked_activity,
					@TargetIlbo			=	linked_ui,
					@TargetHeight		=	Height,
					@TargetWidth		=	Width,
					@LaunchMode			=	LinkLaunchType
			FROM	de_published_ui_control ctl (NOLOCK),
					de_published_ui_traversal tra (NOLOCK)
			where	ctl.customer_name  		=	tra.customer_name
			and		ctl.project_name  		=	tra.project_name
			and		ctl.ecrno    			=	tra.ecrno
			and		ctl.process_name  		=	tra.process_name
			and		ctl.component_name		=	tra.component_name
			and		ctl.activity_name  		=	tra.activity_name
			and		ctl.ui_name    			=	tra.ui_name
			and		ctl.page_bt_synonym		=	tra.page_bt_synonym
			and		ctl.section_bt_synonym  =	tra.section_bt_synonym
			and		ctl.control_bt_synonym	=	tra.control_bt_synonym

			and		ctl.customer_name  		=	@engg_customer_name
			and		ctl.project_name  		=	@engg_project_name
			and		ctl.ecrno    			=	@engg_req_no
			and		ctl.process_name  		=	@process_name
			and		ctl.component_name		=	@engg_component
			and		ctl.activity_name  		=	@activity_name
			and		ctl.ui_name    			=	@ui_name_tmp
			and		ctl.control_id			=	@ActionControlID

			SELECT	@TargetSection	=	PopUp_section
			FROM	de_published_ui_control ctl (NOLOCK),
					de_published_action tsk (NOLOCK)
			where	ctl.customer_name  		=	tsk.customer_name
			and		ctl.project_name  		=	tsk.project_name
			and		ctl.ecrno    			=	tsk.ecrno
			and		ctl.process_name  		=	tsk.process_name
			and		ctl.component_name		=	tsk.component_name
			and		ctl.activity_name  		=	tsk.activity_name
			and		ctl.ui_name    			=	tsk.ui_name
			and		ctl.page_bt_synonym		=	tsk.page_bt_synonym
			and		ctl.control_bt_synonym	=	tsk.primary_control_bts

			and		ctl.customer_name  		=	@engg_customer_name
			and		ctl.project_name  		=	@engg_project_name
			and		ctl.ecrno    			=	@engg_req_no
			and		ctl.process_name  		=	@process_name
			and		ctl.component_name		=	@engg_component
			and		ctl.activity_name  		=	@activity_name
			and		ctl.ui_name    			=	@ui_name_tmp
			and		ctl.control_id			=	@ActionControlID

			select @sql =	--'<CustomAction Name="' 		+ ltrim(rtrim(isnull(upper(ActionName),'')))	+ '" ' +	
							'<Item Name="' 		+ ltrim(rtrim(isnull(upper(ActionControlID),'')))	+ '" ' +	  --29jul2022
							--'ActionDesc="'  + ltrim(rtrim(isnull(ActionDescription,'')))    + '" ' +
							'Sequence="'		+ ltrim(rtrim(isnull(ActionSequence,'')))    + '" ' +
							'ControlType="'		+ case when Actiontype='link' then 'LINK' ELSE 'BUTTON' END    + '" '+'/>' 
							--'Type="'  + ltrim(rtrim(isnull(ActionType,'')))    + '" ' +
							--'ControlName="'  + ltrim(rtrim(isnull(upper(ActionControlID),'')))    + '" ' +
							--'BTSynonym="'  + ltrim(rtrim(isnull(ctl.control_bt_synonym,'')))    + '" ' +
							--'Caption="'  + ltrim(rtrim(isnull(BT_Synonym_Caption,'')))    + '" ' +
							--'LaunchMode="'  + ltrim(rtrim(isnull(@LaunchMode,'')))    + '" ' +
							--'HasPopup="'  + ltrim(rtrim(isnull(@HasPopup,'')))    + '" ' +
							--'TargetSection="'  + ltrim(rtrim(isnull(@TargetSection,'')))    + '" ' +
							--'TargetbtSynonym="'  + ltrim(rtrim(isnull(@TargetbtSynonym,'')))    + '" ' +
							--'TargetWidth="'  + ltrim(rtrim(isnull(@TargetWidth,'')))    + '" ' +
							--'TargetHeight="'  + ltrim(rtrim(isnull(@TargetHeight,'')))    + '" ' +
							--'IconClass="'  + ltrim(rtrim(isnull(IconClass,'')))    + '" ' +
							--'ToolTip="'  + ltrim(rtrim(isnull(ToolTip,'')))    + '" ' +
							--'TargetComponent="'  + ltrim(rtrim(isnull(@TargetComponent,'')))    + '" ' +
							--'TargetActivity="'  + ltrim(rtrim(isnull(@TargetActivity,'')))    + '" '  +
							--'TargetIlbo="'  + ltrim(rtrim(isnull(@TargetIlbo,'')))    + '" ' +
							--'CustomClass="'  + ltrim(rtrim(isnull(CustomClass,'')))    + '"' +
							--'PrimaryControlBT="'  + ltrim(rtrim(isnull(upper(cus.ActionControlBTSynonym),'')))    + '" ' +
							--'Width="'  + ltrim(rtrim(isnull(Width,'')))    + '" ' +
							--'IconPosition="'  + ltrim(rtrim(isnull(IconPosition,'')))    + '" ' +'/>'
			from	de_published_ui_control   ctl (nolock),
					de_published_ui_control_customaction cus (NOLOCK),
					de_published_glossary gls (NOLOCK)
			where	ctl.customer_name  			=	cus.customer_name
			and		ctl.project_name  			=	cus.project_name
			and		ctl.ecrno    				=	cus.ecrno
			and		ctl.process_name  			=	cus.process_name
			and		ctl.component_name			=	cus.component_name
			and		ctl.activity_name  			=	cus.activity_name
			and		ctl.ui_name    				=	cus.ui_name
			and		ctl.page_bt_synonym			=	cus.page_bt_synonym
			and		ctl.section_bt_synonym		=	cus.section_bt_synonym
			and		ctl.Control_ID    			=	cus.Control_ID
			and		ctl.View_Name    			=	cus.View_Name

			and		cus.customer_name  			=	gls.customer_name
			and		cus.project_name  			=	gls.project_name
			and		cus.ecrno    				=	gls.ecrno
			and		cus.process_name  			=	gls.process_name
			and		cus.component_name			=	gls.component_name
			and		cus.ActionControlBTSynonym  =	gls.Bt_Synonym_name

			and		cus.customer_name  			=	@engg_customer_name
			and		cus.project_name  			=	@engg_project_name
			and		cus.ecrno    				=	@engg_req_no
			and		cus.process_name  			=	@process_name
			and		cus.component_name			=	@engg_component
			and		cus.activity_name  			=	@activity_name
			and		cus.ui_name    				=	@ui_name_tmp
			and		cus.ActionControlID			=	@ActionControlID
			ORDER BY cus.ActionSequence	
		
				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

				fetch next from custom_action into 
				@Control_id,			@View_Name,						@control_bt_synonym,			@ActionControlID,			
				@ActionViewName,		@ActionControlBTSynonym
				
				END
				CLOSE custom_action
				DEALLOCATE custom_action

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</CustomActions>',@xml_seq_tmp_out)

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Control>',@xml_seq_tmp_out)
		END
		

		-- Code added for TECH-60451 Starts
		
		IF	ISNULL(@ExtensionReqd, 'No')	= 'Yes'
		BEGIN
				
		
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Extension>',@xml_seq_tmp_out)
		
			declare extension_curs cursor FAST_FORWARD for
			select	upper(@control_id),			ParameterName,			ParameterSequence,			MappedBTSynonym,	
					MappedField,				View_Name
			from	de_published_ui_grid_extension   grd (nolock)
			where	grd.customer_name  	= @engg_customer_name
			and		grd.project_name  	= @engg_project_name
			and		grd.ecrno    		= @engg_req_no
			and		grd.process_name  	= @process_name
			and		grd.component_name  = @engg_component
			and		grd.activity_name  	= @activity_name
			and		grd.ui_name    		= @ui_name_tmp
			and		grd.control_id		= @control_id
			AND		ISNULL(grd.parametername,'') <> ''
			ORDER BY grd.parametersequence

			open extension_curs

			fetch next from extension_curs into 
			@control_id, 		@ParameterName,		@ParameterSequence,			@MappedBTSynonym,	
			@MappedField,		@view_name

			WHILE @@FETCH_STATUS = 0   
			BEGIN 
			--	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				SELECT	@Caption	= ''
				IF	ISNULL(@MappedBTSynonym,'')	<>	''

				SELECT	@Caption		=	bt_synonym_caption
				FROM	de_glossary (nolock)
				WHERE	customer_name	=	@engg_customer_name
				AND		project_name	=	@engg_project_name
				AND		process_name	=	@process_name
				AND		component_name	=	@engg_component
				AND		bt_synonym_name	=	@MappedBTSynonym

				IF	ISNULL(@MappedBTSynonym,'') <> ''
					SELECT @ExtensionType	= 'static'
				ELSE
					SELECT @ExtensionType	= 'columns'

				select @sql = '<Param Name="' 			+ ltrim(rtrim(@ParameterName))			+ '" ' 	
				select @sql    = @sql+'Sequence="'		+ ltrim(rtrim(isnull(@ParameterSequence,0)))		+ '" '
				select @sql    = @sql+'Type="'			+ ltrim(rtrim(isnull(@ExtensionType,'')))	+ '" '  	
				select @sql    = @sql+'MappedViewName="'+ ltrim(rtrim(isnull(@MappedField,'')))	+ '" '  	
				select @sql    = @sql+'BTSynonym="'		+ ltrim(rtrim(isnull(@MappedBTSynonym,'')))	+ '" ' 				
				select @sql    = @sql+'Caption="'		+ ltrim(rtrim(isnull(@Caption,'')))	+ '" '
				select @sql = @sql +'/>'

				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    @sql, @xml_seq_tmp_out)

				fetch next from extension_curs into 
				@control_id, 		@ParameterName,		@ParameterSequence,			@MappedBTSynonym,	
				@MappedField,		@view_name
				
				END
				CLOSE extension_curs
				DEALLOCATE extension_curs

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</Extension>',@xml_seq_tmp_out)
		-- 11537 code commented since duplicating of control node close (TECH-72234)
	
		--select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		--insert into ep_genxml_tmp
		--(customer_name,   project_name,   req_no,   process_name,  component_name,
		--activity_name,    guid,    gen_xml,seq_no)
		--values
		--(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		--@activity_name,  @guid,    '</Control>',@xml_seq_tmp_out)
		-- 11537 code commented since duplicating of control node close (TECH-72234)
		END
		-- Code added for TECH-60451 Ends
	
		end

	fetch next from ctrl_curs into 
	@control_id			,@view_name,			@PreventDownload	,@norowstodisplay_notreq,	@enabledefault		,	@hideinsert,		@hidedelete			,@hideselect
	,@hidecopy			,@hidecut,				@hidefilterdata		,@hidepdf,					@hidereport		,		@hidehtml,			@hideexportexcel	,@hideexportcsv			
	,@hideexporttext	,@hideimportdata,		@hidechart			,@hideexportopenoffice	 ,	@hidepersonalize	,	@searchhide			, @autoheight,
	@Preserve_visible_length, @Auto_width_column,@Ishijri,			@QlikLink  ,				@SystemGeneratedFileId,	@IsMarquee,			@control_type,		@IsAssorted--PLF2.0_18487		
	,@RatingType,		@CaptchaData,			@gridtoform,		@rowexpander,				@AttachmentWithDesc,	@controlcolumnbt,
	@TransformAs,		@columnclass,			@Dynamicstorepath,	@Delayedpwdmask	,			@MetaDataBasedLink,		@GTFFormwidth,		@GTFControllwidth,	 @GTFLabelwidth,
	@GTFControlsperline, @renderas,				@GTFLabelAlign,		@editmask,					@Autoselect,			@DynamicStyle,		@ImageAsData,		 @mlsearchonly, --TECH-45171
	@ExtensionReqd,		@LaunchMode,			
	@BulkDownload -- code added for Defect ID	: TECH-68067
	,@hidecolumnchooser,  --TECH-68480
	--TECH-69624
	@BorderStyle,				@HasCustomAction,	
	@BorderBottomRightRadius,	@BorderBottomLeftRadius,	@BorderTopRightRadius,	@BorderTopLeftRadius,	
	@BorderBottomColor,			@BorderTopColor,			@BorderRightColor,		@BorderLeftColor,		
	@BorderBottomWidth,			@BorderTopWidth,			@BorderRightWidth,		@BorderLeftWidth,
	@CtrlAssociatecontrol,		@CtrlButtonStyle,			@CtrlSelectOnlyLE  --TECH-71262
	--TECH-69624
	end
	--End
	close ctrl_curs
	deallocate ctrl_curs
	
	-- For Calendar Section Starts
	Declare	@sectionname		engg_name,	
			@monthview_cal		engg_flag,		
			@weekview_cal		engg_flag,	
			@editable			engg_flag,		
			@detailspane		engg_flag,		
			@listview_req		engg_flag,	
			@DefaultTemplate	engg_flag,	
			@eventstyle			engg_name,	
			@month_nav_req		engg_flag,
			@week_nav_req		engg_flag,	
			@tap_req			engg_flag,	
			@doubletap_req		engg_flag,	
			@drag_req			engg_flag,	
			@month_nav_event	engg_name,	
			@week_nav_event		engg_name,	
			@tapevent			engg_name,	
			@doubletap_event	engg_name,	
			@dragevent			engg_name,
			@navigation			engg_name,
			@caldate			engg_name,
			@calendarType		engg_name

	declare calendar_curs cursor FAST_FORWARD for
	select	Distinct section_name,	monthview_cal,		weekview_cal,	editable,		detailspane,		listview_req,	DefaultTemplate,	eventstyle,	month_nav_req,
			week_nav_req,	tap_req,	doubletap_req,	drag_req--,	month_nav_event,	week_nav_event,	tapevent,	doubletap_event,	dragevent
	from	de_published_calendar_configure cal (nolock)
	where	customer_name  		= @engg_customer_name
	and  	project_name  		= @engg_project_name
	and  	ecrno    			= @engg_req_no
	and  	process_name  		= @process_name
	and  	component_name  	= @engg_component
	and  	activity_name  		= @activity_name
	and  	ui_name    			= @ui_name_tmp

	open calendar_curs

	fetch next from calendar_curs into 
			@sectionname,	@monthview_cal,		@weekview_cal,	@editable,		@detailspane,		@listview_req,	@DefaultTemplate,	@eventstyle,		@month_nav_req,
			@week_nav_req,	@tap_req,			@doubletap_req,	@drag_req--,		@month_nav_event,	@week_nav_event,@tapevent,			@doubletap_event,	@dragevent

	WHILE @@FETCH_STATUS = 0   
	BEGIN 

		select	@navigation	= @sectionname+'_NA',
				@caldate	= @sectionname+'_DT',
				@calendarType= @sectionname+'_CT'

		select	@month_nav_event = isnull(task_name,'')
		from	de_published_action (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		process_name	= @process_name
		and		component_name	= @engg_component
		and		activity_name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_descr		= 'Month Navigation'

		select	@week_nav_event = isnull(task_name,'')
		from	de_published_action (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		process_name	= @process_name
		and		component_name	= @engg_component
		and		activity_name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_descr		= 'Week Navigation'

		select	@tapevent = isnull(task_name,'')
		from	de_published_action (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		process_name	= @process_name
		and		component_name	= @engg_component
		and		activity_name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_descr		= 'Tap Event'

		select	@week_nav_event = isnull(task_name,'')
		from	de_published_action (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		process_name	= @process_name
		and		component_name	= @engg_component
		and		activity_name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_descr		= 'Week Navigation'

		select	@doubletap_event = isnull(task_name,'')
		from	de_published_action (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		process_name	= @process_name
		and		component_name	= @engg_component
		and		activity_name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_descr		= 'Double Tap Event'

		select	@dragevent = isnull(task_name,'')
		from	de_published_action (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name	= @engg_project_name
		and		process_name	= @process_name
		and		component_name	= @engg_component
		and		activity_name	= @activity_name
		and		ui_name			= @ui_name_tmp
		and		task_descr		= 'Drag Event'

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1

		select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull('ML'+@sectionname+'_ML','')))			+ '" ' +	
				'RenderAs="CALENDAR"'	+ ' ' 	
		
		select @sql    = @sql+'MonthView="'				+ ltrim(rtrim(isnull(@monthview_cal,'')))		+ '" '
		select @sql    = @sql+'WeekView="'				+ ltrim(rtrim(isnull(@weekview_cal,'')))	+ '" '  	
		select @sql    = @sql+'DetailsPaneRequired="'	+ ltrim(rtrim(isnull(@detailspane,'')))		+ '" '
		select @sql    = @sql+'ListViewRequired="'		+ ltrim(rtrim(isnull(@listview_req,'')))	+ '" '  
		select @sql    = @sql+'Editable="'				+ ltrim(rtrim(isnull(@editable,'')))		+ '" '
		select @sql    = @sql+'DefaultTemplateID="'		+ ltrim(rtrim(isnull(@DefaultTemplate,'')))	+ '" '  
		select @sql    = @sql+'CalendarEventStyle="'	+ ltrim(rtrim(isnull(@eventstyle,'')))		+ '" '
		select @sql    = @sql+'MonthNavigationRequired="'+ ltrim(rtrim(isnull(@month_nav_req,'')))	+ '" '  
		select @sql    = @sql+'WeekNavigationRequired="'+ ltrim(rtrim(isnull(@week_nav_req,'')))		+ '" '
		select @sql    = @sql+'TapRequired="'			+ ltrim(rtrim(isnull(@tap_req,'')))	+ '" ' 
		select @sql    = @sql+'DoubleTapRequired="'		+ ltrim(rtrim(isnull(@doubletap_req,'')))		+ '" '
		select @sql    = @sql+'DragRequired="'			+ ltrim(rtrim(isnull(@drag_req,'')))	+ '" ' 
		select @sql    = @sql+'MonthNavigationEvent="'	+ ltrim(rtrim(isnull(@month_nav_event,'')))		+ '" '
		select @sql    = @sql+'WeekNavigationEvent="'	+ ltrim(rtrim(isnull(@week_nav_event,'')))	+ '" ' 
		select @sql    = @sql+'TapEvent="'				+ ltrim(rtrim(isnull(@tapevent,'')))		+ '" '
		select @sql    = @sql+'DoubleTapEvent="'		+ ltrim(rtrim(isnull(@doubletap_event,'')))	+ '" ' 
		select @sql    = @sql+'DragEvent="'				+ ltrim(rtrim(isnull(@dragevent,'')))		+ '" '
		select @sql    = @sql+'NavigationAction="'		+ ltrim(rtrim(isnull(@navigation,'')))	+ '" ' 
		select @sql    = @sql+'CalendarDate="'			+ ltrim(rtrim(isnull(@caldate,'')))		+ '" '
		select @sql    = @sql+'CurrentCalendarType="'	+ ltrim(rtrim(isnull(@calendarType,'')))	+ '"' 
		select @sql = @sql +'/>'

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)	


	fetch next from calendar_curs into 
			@sectionname,	@monthview_cal,		@weekview_cal,	@editable,		@detailspane,		@listview_req,	@DefaultTemplate,	@eventstyle,		@month_nav_req,
			@week_nav_req,	@tap_req,			@doubletap_req,	@drag_req--,		@month_nav_event,	@week_nav_event,@tapevent,			@doubletap_event,	@dragevent

	end
	close calendar_curs
	deallocate calendar_curs
	-- For Calendar Section Ends


	---- For MobGrid section Starts
	Declare	@mobcontrol_id		engg_name,
			@mobPagingTask		engg_name,
			@mobgridCtrllist	engg_description,
			@cntchar			engg_seqno,
			@mob_controlid		engg_name

	IF EXISTS (
	SELECT	'X'
	FROM	de_ui_section_mobile sec (nolock)
	where	sec.customer_name	= @engg_customer_name
	and		sec.project_name	= @engg_project_name
	and		sec.ecrno			= @engg_req_no
	and		sec.process_name	= @process_name
	and		sec.component_name	= @engg_component
	and		sec.activity_name	= @activity_name
	and		sec.ui_name			= @ui_name_tmp
    and		sec.mobilegridas	= 'SectionType'
	)
	BEGIN


	SELECT @mobgridCtrllist = ''				
	declare mobgrid_curs cursor FAST_FORWARD for
	-- Cursor query modified to fetch the mobile grid information for the section type and control type ECE-505 Starts
	--SELECT	sec.section_bt_synonym,
	--		STUFF((SELECT ';' + ctrl.control_id 
	--		FROM de_ui_control ctrl (nolock)
	--		WHERE 	ctrl.customer_name		= sec.customer_name
	--		and		ctrl.project_name		= sec.project_name
	--		and		ctrl.process_name		= sec.process_name
	--		and		ctrl.component_name		= sec.component_name
	--		and		ctrl.activity_name		= sec.activity_name
	--		and		ctrl.ui_name			= sec.ui_name
	--		and		ctrl.page_bt_synonym	= sec.page_bt_synonym
	--		and		ctrl.section_bt_synonym	= sec.section_bt_synonym
	--		ORDER BY vorder desc
	--		FOR XML PATH('')), 1, 1, '') [mobgridCtrllist]
	--FROM	de_ui_section sec (nolock)
	--where	sec.customer_name	= @engg_customer_name
	--and		sec.project_name	= @engg_project_name
	--and		sec.process_name	= @process_name
	--and		sec.component_name	= @engg_component
	--and		sec.activity_name	= @activity_name
	--and		sec.ui_name			= @ui_name_tmp
	--and		sec.section_type	= 'MobileGrid'  -- 	Modified for TECH-18349
	--GROUP BY sec.customer_name, sec.project_name, sec.process_name, sec.component_name, sec.activity_name, sec.ui_name, 
	--		sec.page_bt_synonym, sec.section_bt_synonym,sec.section_type
	 SELECT	sec.section_bt_synonym,
			STUFF((SELECT ';' + ctrl.control_id 
			FROM de_ui_control ctrl (nolock)
			WHERE 	ctrl.customer_name		= sec.customer_name
			and		ctrl.project_name		= sec.project_name
			and		ctrl.process_name		= sec.process_name
			and		ctrl.component_name		= sec.component_name
			and		ctrl.activity_name		= sec.activity_name
			and		ctrl.ui_name			= sec.ui_name
			and		ctrl.page_bt_synonym	= sec.page_bt_synonym
			and		ctrl.section_bt_synonym	= sec.section_bt_synonym
			and		ctrl.control_type		<>	'Button'
			ORDER BY vorder desc
			FOR XML PATH('')), 1, 1, '') [mobgridCtrllist]
	FROM	de_ui_section_mobile sec (nolock)
	where	sec.customer_name	= @engg_customer_name
	and		sec.project_name	= @engg_project_name
	and		sec.ecrno			= @engg_req_no
	and		sec.process_name	= @process_name
	and		sec.component_name	= @engg_component
	and		sec.activity_name	= @activity_name
	and		sec.ui_name			= @ui_name_tmp
    and		sec.mobilegridas	= 'SectionType'
	GROUP BY sec.customer_name, sec.project_name, sec.process_name, sec.component_name, sec.activity_name, sec.ui_name, 
			sec.page_bt_synonym, sec.section_bt_synonym
	ORDER BY 1
	--UNION
	-- SELECT	sec.section_bt_synonym,
	--		STUFF((SELECT ';' + ctrl.control_id 
	--		FROM de_ui_control ctrl (nolock)
	--		WHERE 	ctrl.customer_name		= sec.customer_name
	--		and		ctrl.project_name		= sec.project_name
	--		and		ctrl.process_name		= sec.process_name
	--		and		ctrl.component_name		= sec.component_name
	--		and		ctrl.activity_name		= sec.activity_name
	--		and		ctrl.ui_name			= sec.ui_name
	--		and		ctrl.page_bt_synonym	= sec.page_bt_synonym
	--		and		ctrl.section_bt_synonym	= sec.section_bt_synonym
 --  			and 	ctrl.control_type		<> 'Button' --Added against TECH-68935
	--		ORDER BY vorder asc
	--		FOR XML PATH('')), 1, 1, '') [mobgridCtrllist]
	--FROM	de_ui_section_mobile sec (nolock)
	--where	sec.customer_name	= @engg_customer_name
	--and		sec.project_name	= @engg_project_name
	--and		sec.process_name	= @process_name
	--and		sec.component_name	= @engg_component
	--and		sec.activity_name	= @activity_name
	--and		sec.ui_name			= @ui_name_tmp
 --   and		sec.mobilegridas	= 'ControlType'
	--GROUP BY sec.customer_name, sec.project_name, sec.process_name, sec.component_name, sec.activity_name, sec.ui_name, 
	--		sec.page_bt_synonym, sec.section_bt_synonym
	--ORDER BY 1
	-- Cursor query modified to fetch the mobile grid information for the section type and control type ECE-505 Ends
		
	open mobgrid_curs
		
	fetch next from mobgrid_curs into @sectionname, @mobgridCtrllist			

	WHILE @@FETCH_STATUS = 0   
	BEGIN 
	
		if	isnull(@mobgridCtrllist,'') <> ''
		Begin
			select	@mobcontrol_id	= substring(@mobgridCtrllist, 1, charindex(';', @mobgridCtrllist)-1) 
			select	@cntchar		= len(@mobgridCtrllist)- charindex(';', @mobgridCtrllist)+1
 			select @mobgridCtrllist = substring (@mobgridCtrllist, charindex(';', @mobgridCtrllist)+1, @cntchar)
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql = '<Control Name="' + upper(isnull(@mobcontrol_id,''))	+ '" '
			
	--TECH-72114
			Select	@IsList			= ISNULL(IsList,'N'),
					@MultiSelect	= ISNULL(MultiSelect,'N')
			from	es_comp_ctrl_type_mst_extn(nolock)	
			where	customer_name	=  @engg_customer_name
			and		project_name	= @engg_project_name
			and		process_name	= @process_name
			and		component_name  = @engg_component
			and		ctrl_type_name	= @control_type
	--TECH-72114

			If @mobcontrol_id like '%grid'
			Begin
				select	@renderas  = upper(isnull(RenderAs,base_ctrl_type))
				from	de_published_ui_control   ctrl (nolock),
						es_comp_ctrl_type_mst_vw ctype (nolock)
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
				and	 ctrl.section_bt_synonym= @sectionname 
				and	ctrl.control_id	= @mobcontrol_id

				
				If @renderas	= 'ROWEXPANDER'
				Begin
					select @xml_seq_tmp_out=@xml_seq_tmp_out+1
					select @sql    = @sql+'ColumnAsRow="Y" ' 
				End
			End

			 -- Code added for the defect id TECH-44891 starts

		--select	@mobPagingTask=	act.task_name 
	 --  from			de_published_ui_control ctrl(nolock)  , de_published_ui_section sec(nolock) ,de_published_action act(nolock)  
	 --  where		sec.customer_name		= @engg_customer_name
  --     and           sec.project_name		= @engg_project_name
  --     and           sec.process_name		= @process_name
  --     and           sec.component_name		= @engg_component
  --     and           sec.activity_name		= @activity_name
  --     and           sec.ui_name            = @ui_name_tmp
	 --  and			sec.ecrno				=  @engg_req_no
  --     and           sec.section_type		= 'MobileGrid'   
	 --  and		 	ctrl.customer_name		= sec.customer_name
	 --  and			ctrl.project_name		= sec.project_name
	 --  and			ctrl.process_name		= sec.process_name
	 --  and			ctrl.component_name		= sec.component_name
	 --  and			ctrl.activity_name		= sec.activity_name
	 --  and			ctrl.ui_name			= sec.ui_name
	 --  and			ctrl.page_bt_synonym	= sec.page_bt_synonym
	 --  and			ctrl.section_bt_synonym	= sec.section_bt_synonym
	 --  and			ctrl.ecrno				= sec.ecrno
	 --  and		 	ctrl.customer_name		= act.customer_name
	 --  and			ctrl.project_name		= act.project_name
	 --  and			ctrl.process_name		= act.process_name
	 --  and			ctrl.component_name		= act.component_name
	 --  and			ctrl.activity_name		= act.activity_name
	 --  and			ctrl.ui_name			= act.ui_name
	 --  and			ctrl.page_bt_synonym	= act.page_bt_synonym
	 --  and			ctrl.control_bt_synonym	= act.primary_control_bts
	 --   and			ctrl.ecrno				= act.ecrno
	 --  and			act.task_descr		like '%Pagination Event%'
	   
	   -- Code added for the defect id TECH-44891 ends
	   select @mobPagingTask = ''
	    -- Code added for the defect id TECH-44891 starts
	select @mobPagingTask= act.task_name   
    from   de_published_ui_control ctrl(nolock)  , de_published_ui_section sec(nolock) ,  
    de_published_action act(nolock)  ,es_comp_ctrl_type_mst_extn extn(nolock)  
    where  sec.customer_name  = @engg_customer_name  
       and           sec.project_name  = @engg_project_name  
       and           sec.process_name  = @process_name  
       and           sec.component_name  = @engg_component  
       and           sec.activity_name  = @activity_name  
       and           sec.ui_name            = @ui_name_tmp  
    and   sec.ecrno    =  @engg_req_no  
    /* added by 13578 starts*/  
       and    ((sec.section_type in ( 'MobileGrid','Main') )or  (extn.IsMobile          = 'Y'))  
    --and           sec.section_type  = 'MobileGrid'   
    /* added by 13578 ends*/  
    and    ctrl.customer_name  = act.customer_name  
    and   ctrl.project_name  = act.project_name  
    and   ctrl.process_name  = act.process_name  
    and   ctrl.component_name  = act.component_name  
    and   ctrl.activity_name  = act.activity_name  
    and   ctrl.ui_name   = act.ui_name  
    and   ctrl.page_bt_synonym = act.page_bt_synonym  
    and   ctrl.control_bt_synonym = act.primary_control_bts  
    and   ctrl.ecrno    = act.ecrno  
    and   ctrl.section_bt_synonym = @sectionname 
	
	and    ctrl.customer_name		= sec.customer_name  
   and   ctrl.project_name			= sec.project_name  
    and   ctrl.process_name			= sec.process_name  
    and   ctrl.component_name		= sec.component_name  
    and   ctrl.activity_name		= sec.activity_name  
    and   ctrl.ui_name				= sec.ui_name  
    and   ctrl.page_bt_synonym		= sec.page_bt_synonym  
    and   ctrl.section_bt_synonym	= sec.section_bt_synonym  
    and   ctrl.ecrno    = sec.ecrno   

    /* added by 13578 starts*/  
    and   sec.customer_name = extn.customer_name  
    and   sec.project_name = extn.project_name  
    and   sec.process_name = extn.process_name  
    and   sec.component_name = extn.component_name  
    and   ctrl.control_type = extn.ctrl_type_name  
    /* added by 13578 ends*/  
    and ((act.task_descr  like '%Pagination task%')or ( task_descr ='Pagination Event for Mobility'))
  
	   -- Code added for the defect id TECH-44891 ends
	
	--TECH-72114  
		select @sql    = @sql+'IsList="'			+ ltrim(rtrim(isnull(@IsList,'')))	+ '" '  
		if (isnull(@MultiSelect,'N') = 'y')
					select @sql    = @sql+'MultiSelect="'			+ ltrim(rtrim(isnull(@MultiSelect,'')))	+ '" '  
	--TECH-72114
			----select	@mobcontrol_id	= substring(@mobgridCtrllist, 1, charindex(';', @mobgridCtrllist)-1) 
			----select	@cntchar		= len(@mobgridCtrllist)- charindex(';', @mobgridCtrllist)+1
 		----	select @mobgridCtrllist = substring (@mobgridCtrllist, charindex(';', @mobgridCtrllist)+1, @cntchar)
			----select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql    = @sql+'PagingTask="'	+ upper(isnull(@mobPagingTask,''))		+ '" '

			select	@mobcontrol_id	= substring(@mobgridCtrllist, 1, charindex(';', @mobgridCtrllist)-1) 
			select	@cntchar		= len(@mobgridCtrllist)- charindex(';', @mobgridCtrllist)+1
 			select @mobgridCtrllist = substring (@mobgridCtrllist, charindex(';', @mobgridCtrllist)+1, @cntchar)
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql    = @sql+'TargetPage="'	+ upper(isnull(@mobcontrol_id,''))		+ '" '
				
			select	@mobcontrol_id	= substring(@mobgridCtrllist, 1, charindex(';', @mobgridCtrllist)-1) 
			select	@cntchar		= len(@mobgridCtrllist)- charindex(';', @mobgridCtrllist)+1
 			select @mobgridCtrllist = substring (@mobgridCtrllist, charindex(';', @mobgridCtrllist)+1, @cntchar)
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql    = @sql+'CurrentPage="'	+ upper(isnull(@mobcontrol_id,''))		+ '" '

			select	@mobcontrol_id	= substring(@mobgridCtrllist, 1, charindex(';', @mobgridCtrllist)-1) 
			select	@cntchar		= len(@mobgridCtrllist)- charindex(';', @mobgridCtrllist)+1
 			select @mobgridCtrllist = substring (@mobgridCtrllist, charindex(';', @mobgridCtrllist)+1, @cntchar)
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql    = @sql+'BucketSize="'	+ upper(isnull(@mobcontrol_id,''))		+ '" '
			select @sql    = @sql+'TotalRows="'		+ upper(isnull(@mobgridCtrllist,''))		+ '"'
			select @sql = @sql +'/>'
		End

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)	

	fetch next from mobgrid_curs into @sectionname, @mobgridCtrllist			

	end
	close mobgrid_curs
	deallocate mobgrid_curs
	---- For MobGrid section Ends
	-- Added for TECH-71109 Creates Hidden controls & Pagination task for IsMobile & IsList options(MobileGrid) Starts
	
	END
	ELSE IF EXISTS (	--TECH-72114
	SELECT	'X'
	FROM	de_ui_section_mobile sec (nolock)
	where	sec.customer_name	= @engg_customer_name
	AND		sec.project_name	= @engg_project_name
	AND		sec.process_name	= @process_name
	AND		sec.component_name	= @engg_component
	AND		sec.activity_name	= @activity_name
	AND		sec.ui_name			= @ui_name_tmp
    AND		sec.mobilegridas	= 'ControlType'
	)
	BEGIN

	DECLARE @cnt engg_Seqno
	DECLARE @sectionname1 engg_name
	DECLARE @secprefix	engg_code

	SELECT @cnt = 0

	SELECT @control_type = ''

		DECLARE mobgrid_curs cursor FAST_FORWARD FOR
		SELECT	DISTINCT sec.section_bt_synonym, sec.section_prefix,  ctl.control_id, ctl.control_type	--TECH-72114
		FROM	de_ui_section_mobile sec (NOLOCK),
				de_published_ui_control ctl (nolock)
		WHERE	sec.customer_name	= @engg_customer_name
		AND		sec.project_name	= @engg_project_name
		AND		sec.ecrno			= @engg_req_no
		AND		sec.process_name	= @process_name
		AND		sec.component_name	= @engg_component
		AND		sec.activity_name	= @activity_name
		AND		sec.ui_name			= @ui_name_tmp
		AND		ctl.control_type	<> 'Button'
		AND		sec.mobilegridas	= 'ControlType'
	
		AND		sec.customer_name	= ctl.customer_name  
		AND		sec.project_name	= ctl.project_name
		AND		sec.ecrno			= ctl.ecrno
		AND		sec.process_name	= ctl.process_name
		AND		sec.component_name	= ctl.component_name
		AND		sec.activity_name	= ctl.activity_name
		AND		sec.ui_name			= ctl.ui_name
		AND		sec.page_bt_synonym = ctl.page_bt_synonym
		AND		sec.section_bt_synonym= ctl.section_bt_synonym
		ORDER BY 1,2
	   	
		OPEN mobgrid_curs
		
		FETCH NEXT FROM mobgrid_curs INTO @sectionname, @secprefix, @mob_controlid, @control_type	--TECH-72114

		WHILE @@FETCH_STATUS = 0   
		BEGIN 
	
		SELECT @mobPagingTask = '' --TECH-72114
			
			SELECT @cnt = @cnt + 1	

	--TECH-72114
			SELECT	@IsList			= ISNULL(IsList,'N'),
					@MultiSelect	= ISNULL(MultiSelect,'N')
			FROM	es_comp_ctrl_type_mst_extn(NOLOCK)	
			WHERE	customer_name	=  @engg_customer_name
			AND		project_name	= @engg_project_name
			AND		process_name	= @process_name
			AND		component_name  = @engg_component
			AND		ctrl_type_name	= @control_type
	--TECH-72114

			IF ISNULL(@mob_controlid, '') LIKE 'ML%' AND ISNULL(@sectionname1 ,'') <> @sectionname
			BEGIN

				SELECT	@mobPagingTask	= UPPER(ISNULL(task_name,''))
				FROM	de_published_Action (nolock)
				WHERE	customer_name		= @engg_customer_name  
				AND     project_name		= @engg_project_name  
				AND		ecrno				= @engg_req_no
				AND     process_name		= @process_name  
				AND     component_name		= @engg_component  
				AND     activity_name		= @activity_name  
				AND     ui_name				= @ui_name_tmp  
				AND		primary_control_bts	= REPLACE(@mob_controlid, 'ML', '')

				
				IF	ISNULL(@mobPagingTask, '') = ''
				BEGIN
					SELECT	@mobPagingTask	= UPPER(ISNULL(task_name,''))
					FROM	de_published_Action (nolock)
					WHERE	customer_name		= @engg_customer_name  
					AND     project_name		= @engg_project_name  
					AND		ecrno				= @engg_req_no
					AND     process_name		= @process_name  
					AND     component_name		= @engg_component  
					AND     activity_name		= @activity_name  
					AND     ui_name				= @ui_name_tmp  
					AND		primary_control_bts	= ISNULL(@secprefix, '') + '_Pagtask'			
					
				END
				
				--IF ISNULL(@IsList, 'n')	= 'N'
				--BEGIN
				SELECT	@sql	= '<Control Name="' + upper(isnull(@mob_controlid,''))	+ '" '
			
		--TECH-72114
				SELECT @sql    = @sql+'IsList="'			+ ltrim(rtrim(isnull(@IsList,'')))	+ '" '  
				IF (isnull(@MultiSelect,'N') = 'y')
					SELECT @sql    = @sql+'MultiSelect="'			+ ltrim(rtrim(isnull(@MultiSelect,'')))	+ '" '  
				--END
		--TECH-72114

				SELECT	@sql	= @sql+'PagingTask="'	+ upper(isnull(@mobPagingTask,''))		+ '" '
			END
		
			IF ISNULL(@mob_controlid,'') LIKE '%_TargetPage'
			BEGIN			
				SELECT @sql    = @sql+'TargetPage="'	+ upper(isnull(@mob_controlid,''))		+ '" '
			END
			IF ISNULL(@mob_controlid,'') LIKE '%_CurrPage'
			BEGIN
				SELECT @sql    = @sql+'CurrentPage="'	+ upper(isnull(@mob_controlid,''))		+ '" '
			END
			IF ISNULL(@mob_controlid,'') LIKE '%_BucketSize'
			BEGIN
				SELECT @sql    = @sql+'BucketSize="'	+ upper(isnull(@mob_controlid,''))		+ '" '
			END
			IF ISNULL(@mob_controlid,'') LIKE '%_totrows'
			BEGIN
				SELECT @sql    = @sql+'TotalRows="'		+ upper(isnull(@mob_controlid,''))		+ '"'
			END
	
			IF  (@cnt% 5) = 0
			BEGIN
				SELECT @sql = @sql +'/>'
				
				INSERT INTO ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				VALUES
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    
				@sql ,@xml_seq_tmp_out)	
				SELECT @sql = ''
			END
	
			SELECT @sectionname1 = @sectionname
		
		FETCH NEXT FROM mobgrid_curs INTO @sectionname, @secprefix, @mob_controlid, @control_type		--TECH-72114

		END
		CLOSE mobgrid_curs
		DEALLOCATE mobgrid_curs
	END
	--END -- TECH-72114

	-- Added for TECH-71109 Creates Hidden controls & Pagination task for IsMobile & IsList options(MobileGrid) Ends

	SELECT @xml_seq_tmp_out=@xml_seq_tmp_out+1
	INSERT INTO ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	VALUES
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '</Controls>',@xml_seq_tmp_out)
---- For MobGrid Control Ends

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<Columns>',@xml_seq_tmp_out)

	-------Callout in Grid for mobility Starts
	Declare	colcur  cursor FAST_FORWARD for
	select upper(control_id), upper(view_name),PreventDownload,norowstodisplay_notreq
	,enabledefault		,hideinsert				,hidedelete			,hideselect
	,hidecopy			,hidecut				,hidefilterdata		,hidepdf				
	,hidereport			,hidehtml				,hideexportexcel	,hideexportcsv
	,hideexporttext		,hideimportdata			,hidechart			,hideexportopenoffice
	,hidepersonalize	,searchhide				,ctype.autoheight,		'',
	'' ,				ishijri					,QlikLink		,	SystemGeneratedFileId,
	IsMarquee,			ctype.ctrl_type_name,			IsAssorted				--PLF2.0_18487				
	,RatingType,		CaptchaData,
	ctrl.GridToForm,	ctrl.RowExpander,		AttachmentWithDesc	,column_bt_synonym,
	column_TransformAs,	ctrl.ColumnClass,		Dynamicfileupload,	MultiFileSelect ,-- added for GridToForm TECH-12776 
	MetaDataBasedLink,	EditMask,				mlsearchonly,
	AssociateControl,	ButtonStyle,			SelectOnlyListValues  --TECH-71262
	from de_published_ui_grid   ctrl (nolock),
	es_comp_ctrl_type_mst_vw ctype (nolock) left outer join 
	es_comp_ctrl_type_mst_extn  ext (nolock)
	on		ctype.customer_name		= ext.customer_name
	and		ctype.project_name		= ext.project_name
	and		ctype.process_name		= ext.process_name
	and		ctype.component_name	= ext.component_name
	and		ctype.base_ctrl_type	= ext.base_ctrl_type
	and		ctype.ctrl_type_name	= ext.ctrl_type_name

	where ctrl.customer_name  	= ctype.customer_name
	and  ctrl.project_name  	= ctype.project_name
	and  ctrl.process_name  	= ctype.process_name
	and  ctrl.component_name  	= ctype.component_name
	and  ctrl.column_type  		= ctype.ctrl_type_name
	and  ctrl.customer_name  	= @engg_customer_name
	and  ctrl.project_name  	= @engg_project_name
	and  ctrl.ecrno    			= @engg_req_no
	and  ctrl.process_name  	= @process_name
	and  ctrl.component_name  	= @engg_component
	and  ctrl.activity_name  	= @activity_name
	and  ctrl.ui_name    		= @ui_name_tmp

	open colcur

	fetch next from colcur into 
	@control_id,		@view_name,			@PreventDownload,		@norowstodisplay_notreq	,	@enabledefault,		@hideinsert,		@hidedelete	,
	@hideselect,		@hidecopy,			@hidecut,				@hidefilterdata,			@hidepdf,			@hidereport,		@hidehtml,
	@hideexportexcel,	@hideexportcsv,		@hideexporttext,		@hideimportdata,			@hidechart,			@hideexportopenoffice,@hidepersonalize	,		
	@searchhide,		@autoheight,		@Preserve_visible_length,@Auto_width_column,		@Ishijri,			@QlikLink,			@SystemGeneratedFileId,	
	@ismarquee,			@control_type,		@IsAssorted,			@RatingType,				@CaptchaData,		@gridtoform,		@rowexpander,				
	@AttachmentWithDesc,@controlcolumnbt,	@TransformAs,			@columnclass,				@Dynamicstorepath,	@Multifileselect,	@MetaDataBasedLink,
	@EditMask,			@mlsearchonly,	--TECH-45171
	@ColAssociateColumn,					@ColButtonStyle,		@ColSelectOnlyLE	--TECH-71262
	

	WHILE @@FETCH_STATUS = 0   
	BEGIN 
	
		--Select for placeholder
		SELECT @placeholder		= ''
		SELECT @place_lang		= ''
		SELECT @configuration	= ''
		SELECT @AssociatedHiddenView = ''
		SELECT @DynamicHdnView = ''	
		SELECT @MDLinkHdnview = ''
		SELECT @PreTask	=	''			---TECH-68066
		SELECT @PostTask	=	''		---TECH-68066

		SELECT @BrowsePreTask	=	''	 --TECH-71262	
		SELECT @BrowsePostTask	=	''		
		SELECT @DeletePreTask	=	''			
		SELECT @DeletePostTask	=	''		
		
		select	@placeholder	= Placeholder,
				@place_lang		= languageid
		from	de_published_ui_placeholder_lng_extn  (nolock)
		where	customer_name  	= @engg_customer_name
		and  	project_name  	= @engg_project_name
		and  	ecrno    		= @engg_req_no
		and  	process_name  	= @process_name
		and  	component_name  = @engg_component
		and  	activity_name  	= @activity_name
		and  	ui_name    		= @ui_name_tmp
		and		control_id		= @control_id
		and		view_name		= @view_name
		and		languageid		= @language_code

		If isnull(@AttachmentWithDesc,'N') = 'Y'
		Begin	
			--select	@AssociatedHiddenView	= hidden_view_bt_synonym
			select	@AssociatedHiddenView	= view_name
			from	de_hidden_view (nolock)
			where	customer_name  	= @engg_customer_name
			and  	project_name  	= @engg_project_name		
			and  	process_name  	= @process_name
			and  	component_name  = @engg_component
			and  	activity_name  	= @activity_name
			and  	ui_name    		= @ui_name_tmp
			and		control_bt_synonym= @controlcolumnbt				
			and		hidden_view_bt_synonym like 'hdifid%'
	--		and		view_name like 'hdifid%'

	---TECH-68066 starts
			SELECT @PreTask	=	upper(task_name)
			from de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(pretask,'')  		= 'y'
			AND  task_name	like '%PrUI'
			AND task_descr like 'Pre Task for attachment of%' --TECH-71262

			SELECT @PostTask	=	upper(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno   				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(PostTask,'')  		= 'y'
			AND  task_name	LIKE '%PsUI'
			AND task_descr LIKE 'Post Task for attachment of%'--TECH-71262

	---TECH-68066 ends

	--Tech-71262

			SELECT @BrowsePreTask	=	UPPER(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(Browsepretask,'')  		= 'y'
			AND  task_name	like '%BrPrUI'
			AND  task_descr like 'Browse Pre Task for attachment of%'

			SELECT @BrowsePostTask	=	UPPER(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(BrowsePostTask,'')  		= 'y'
			AND  task_name	like '%BrPsUI'
			AND  task_descr like 'Browse Post Task for attachment of%'

			SELECT @DeletePreTask	=	UPPER(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(Deletepretask,'')  		= 'y'
			AND  task_name	like '%DePrUI'
			AND  task_descr like 'Delete Pre Task for attachment of%'

			SELECT @DeletePostTask	=	upper(task_name)
			FROM de_published_action   act (NOLOCK),
			es_comp_ctrl_type_mst_extn  ext(NOLOCK)	
			WHERE act.customer_name  		= @engg_customer_name
			AND   act.project_name  		= @engg_project_name
			AND   act.ecrno    				= @engg_req_no
			AND   act.process_name  		= @process_name
			AND   act.component_name  		= @engg_component
			AND   act.activity_name  		= @activity_name
			AND   act.ui_name    			= @ui_name_tmp
			AND   act.primary_control_bts	= @controlcolumnbt 	
			AND	 ext.base_ctrl_type			= 'Edit'
			AND	 act.customer_name  		= ext.customer_name
			AND  act.project_name  			= ext.project_name
			AND  act.process_name  			= ext.process_name
			AND  act.component_name  		= ext.component_name
			AND  isnull(DeletePostTask,'')  		= 'y'
			AND  task_name	LIKE '%DePsUI'
			AND  task_descr LIKE 'Delete Post Task for attachment of%'

	--Tech-71262

		End

		If isnull(@Dynamicstorepath,'N') = 'Y'
		Begin			
			select	@DynamicHdnView	= view_name
			from	de_hidden_view (nolock)
			where	customer_name  	= @engg_customer_name
			and  	project_name  	= @engg_project_name		
			and  	process_name  	= @process_name
			and  	component_name  = @engg_component
			and  	activity_name  	= @activity_name
			and  	ui_name    		= @ui_name_tmp
			and		control_bt_synonym= @controlcolumnbt				
			and		hidden_view_bt_synonym like 'hdidfu%'		
		End	
		If isnull(@MetaDataBasedLink,'N') = 'Y'
		Begin			
			select	@MDLinkHdnview	= view_name
			from	de_hidden_view (nolock)
			where	customer_name  	= @engg_customer_name
			and  	project_name  	= @engg_project_name		
			and  	process_name  	= @process_name
			and  	component_name  = @engg_component
			and  	activity_name  	= @activity_name
			and  	ui_name    		= @ui_name_tmp
			and		control_bt_synonym= @controlcolumnbt				
			and		hidden_view_bt_synonym like 'hdimdl%'		
		End	
		
		----For stacked links configuration	PLF2.0_18487	starts
		If exists (Select 'x' from 
					es_comp_ctrl_type_mst_extn(nolock)
					where	customer_name	=   @engg_customer_name
					and		project_name	= @engg_project_name
					and		process_name	= @process_name
					and		component_name  = @engg_component
					and		ctrl_type_name	= @control_type)
		Begin
			Select @configuration  = isnull(Configuration,''),					
					@IsDocked		= ISNULL(IsDocked,'N'),
					@Scan			= ISNULL(Scan,'N'),
					@NFC			= ISNULL(NFCEnabled,'N'),
					@AutoScan		= ISNULL(AutoScan,'N')
			from	es_comp_ctrl_type_mst_extn(nolock)	
			where	customer_name	=  @engg_customer_name
			and		project_name	= @engg_project_name
			and		process_name	= @process_name
			and		component_name  = @engg_component
			and		ctrl_type_name	= @control_type
			--Select @Configuration	=  '{''type'':''marquee'', ''carousel'':''y'', ''orientation'':''ver'', ''direction'':''left'',''scrollamount'':''10'',''scrolldelay'':''10'',''scrollspeed'':''900'',''timeout'':''1000'',''navigator'':true,''pauseonover'':true}'



		End

	-- To get the Report Task enabled columns for Mobility --TECH-27286 Starts


	SET		@ReportName	= ''
	SET		@ReportContext = ''
	SET		@SPReportName	= ''
	SET		@SPReportContext = ''

	IF ISNULL(@DeviceType,'') IN ('P', 'T', 'B')
	BEGIN		

		SELECT	@ReportName			= rep.report_name, 
				@ReportContext		= rep.report_context
		FROM	es_comp_ctrl_type_mst mst (nolock),
				De_report_attributes rep (nolock),
				de_action act (nolock)
		WHERE	rep.customer_name  	= @engg_customer_name
		AND		rep.project_name  	= @engg_project_name
		AND		rep.ecrno    		= @engg_req_no
		AND		rep.process_name  	= @process_name
		AND		rep.component_name  = @engg_component
		AND		rep.activity_name  	= @activity_name
		AND		rep.ui_name    		= @ui_name_tmp
		AND		ISNULL(mst.report_req,'')= 'y'

		AND		rep.customer_name	= mst.customer_name
		AND		rep.project_name  	= mst.project_name
		AND		rep.process_name  	= mst.process_name
		AND		rep.component_name	= mst.component_name		

		AND		rep.customer_name	= act.customer_name
		AND		rep.project_name  	= act.project_name
		AND		rep.process_name  	= act.process_name
		AND		rep.component_name	= act.component_name
		AND		rep.Activity_name	= act.activity_name
		AND		rep.ui_name			= act.ui_name
		AND		rep.page_name		= act.page_bt_synonym
		AND		rep.task_name		= act.task_name
		AND		act.primary_control_bts	= @controlcolumnbt

		
		SELECT	@SPReportName		= rep.report_name, 
				@SPReportContext	= rep.report_context
		FROM	es_comp_ctrl_type_mst mst (nolock),
				de_sp_report_action_segment rep (nolock),
				de_action act (nolock)
		WHERE	rep.customer_name  	= @engg_customer_name
		AND		rep.project_name  	= @engg_project_name
		AND		rep.ecrno    		= @engg_req_no
		AND		rep.process_name  	= @process_name
		AND		rep.component_name  = @engg_component
		AND		rep.activity_name  	= @activity_name
		AND		rep.ui_name    		= @ui_name_tmp
		AND		ISNULL(mst.report_req,'')= 'y'

		AND		rep.customer_name	= mst.customer_name
		AND		rep.project_name  	= mst.project_name
		AND		rep.process_name  	= mst.process_name
		AND		rep.component_name	= mst.component_name

		AND		rep.customer_name	= act.customer_name
		AND		rep.project_name  	= act.project_name
		AND		rep.process_name  	= act.process_name
		AND		rep.component_name	= act.component_name
		AND		rep.Activity_name	= act.activity_name
		AND		rep.ui_name			= act.ui_name
		AND		rep.page_bt_synonym	= act.page_bt_synonym
		AND		rep.task_name		= act.task_name
		AND		act.primary_control_bts	= @controlcolumnbt
	END
	   --code fixed against systemgeneratedfielid TECH-52636    
 select @attachdocument = '',@save_doc_content_to_db='',@save_image_content_to_db='',@attachimage='',@autofilename=''      
      
 select @attachdocument= isnull(attach_document,'N') from es_comp_ctrl_type_mst(nolock)   
 where customer_name = @engg_customer_name       
 and  project_name   = @engg_project_name         
 and  process_name   = @process_name       
 and  component_name  = @engg_component       
 and  ctrl_type_name = @control_type        
     
 select @save_doc_content_to_db= isnull(save_doc_content_to_db,'N') from es_comp_ctrl_type_mst(nolock)   
 where customer_name = @engg_customer_name   
 and  project_name   = @engg_project_name    
 and  process_name   = @process_name      
 and  component_name= @engg_component       
 and  ctrl_type_name = @control_type      
       
 select @save_image_content_to_db = isnull(save_image_content_to_db,'N') from es_comp_ctrl_type_mst(nolock)  
  where customer_name = @engg_customer_name      
  and  project_name   = @engg_project_name       
  and  process_name   = @process_name      
  and  component_name  = @engg_component       
  and  ctrl_type_name = @control_type   
       
 select @attachimage =isnull(image_upload,'N') from es_comp_ctrl_type_mst(nolock) where   
 customer_name = @engg_customer_name       
 and  project_name   = @engg_project_name        
 and  process_name   = @process_name       
 and  component_name  = @engg_component    
 and  ctrl_type_name = @control_type       
        
      
 if ((@attachdocument='y'or @attachimage='y' or  @save_doc_content_to_db='Y' or @save_image_content_to_db='Y') and (isnull(@SystemGeneratedFileId,'N') = 'N'  and isnull(@AttachmentWithDesc,'N')='N' and isnull(@Dynamicstorepath,'N')='N' ))      
 begin       
 select @autofilename ='n'      
 end      
     -- for systemgeneratedfielid TECH-52636 ends 
	-- To get the Report Task enabled columns for Mobility --TECH-27286 Ends

		----For stacked links configuration	PLF2.0_18487	Ends

		if isnull(@PreventDownload,'')		= 'y' 	or isnull(@norowstodisplay_notreq,'')	= 'y'	or isnull(@placeholder,'')				<> ''	or isnull(@hidecopy,'')				= 'y'
		or isnull(@enabledefault,'')		= 'y' 	or isnull(@hideSelect,'')				= 'Y'	or isnull(@hideinsert,'')				= 'y'	or isnull(@hidedelete,'')			= 'Y'	 
		or isnull(@hidefilterdata,'')		= 'y' 	or isnull(@hidepdf,'')					= 'y'	or isnull(@hidereport,'')				= 'y'	or isnull(@hidehtml,'')				= 'y'
		or isnull(@hideexportexcel,'')		= 'y' 	or isnull(@hideexportcsv,'')			= 'y'	or isnull(@hideexporttext,'')			= 'y'	or isnull(@hideimportdata,'')		= 'y'	
		or isnull(@hidechart,'')			= 'y' 	or isnull(@hideexportopenoffice,'')		= 'y'	or isnull(@hidepersonalize,'')			= 'y'	or isnull(@searchhide,'')			= 'y'
		or isnull(@hidecut,'')				= 'y' 	or isnull(@autoheight,'')				= 'y'	or isnull(@Preserve_visible_length,'')	= 'y'	or isnull(@Auto_width_column,'')	<> ''
		or isnull(@QlikLink,'N')			= 'y'	or isnull(@SystemGeneratedFileId,'')	=  'y'	or isnull(@Ishijri,'')					= 'y'	or ISNULL(@IsMarquee,'N')			= 'Y'
		or ISNULL(@configuration,'')		<>''	or ISNULL(@IsAssorted,'N')				= 'y'--PLF2.0_18487	
		or isnull(@RatingType,'')			 <>''	or ISNULL(@CaptchaData,'')				<> ''	
		or isnull(@gridtoform,'N')			= 'y'	or isnull(@rowexpander,'N')				= 'y'	--or isnull(@multiselector,'N')			= 'y'
		or isnull(@AttachmentWithDesc,'N')	= 'y'	or isnull(@Multifileselect,'N')			= 'y'	or	isnull(@MetaDataBasedLink,'N')		= 'y'	or	isnull(@EditMask,'N')			= 'y'
		or isnull(@Scan,'N')				= 'y'	or isnull(@NFC,'N')						= 'y'	or isnull(@IsDocked,'N')				= 'y'   or isnull(@mlsearchonly,'')			= 'y' or @autofilename ='n'  -- TECH-45171
		OR isnull(@ColAssociateColumn,'')	<> ''	OR isnull(@ColButtonStyle,'')			= 'y'	OR isnull(@ColSelectOnlyLE,'')			= 'y' --TECH-71262

		begin
		
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Column Name="' 		+ ltrim(rtrim(isnull(upper(@controlcolumnbt),'')))			+ '" ' + 
			'ControlName="' 		+ ltrim(rtrim(isnull(upper(@control_id),'')))			+ '" ' +	
			'ViewName="'		+ ltrim(rtrim(isnull(upper(@view_name),''))) 			+ '" ' 
	
		if (@PreventDownload = 'y')
			select @sql    = @sql+'PreventDownload="'			+ ltrim(rtrim(isnull(upper(@PreventDownload),'')))		+ '" '
	
		if (isnull(@SystemGeneratedFileId,'') =  'y')
			select @sql    = @sql+'SystemGeneratedFileId="'			+ ltrim(rtrim(isnull(upper(@SystemGeneratedFileId),'')))	+ '" ' 
			
			--start TECH-52636
			       
         if (isnull(@autofilename,'') =  'n')        
           select @sql    = @sql+'SystemGeneratedFileId="'   + ltrim(rtrim(isnull(upper('n'),''))) + '" ' 
		   --ends TECH-52636
	
		if (isnull(@gridtoform,'N') = 'y')
		Begin
			select @sql    = @sql+'GridToForm="'			+ ltrim(rtrim(isnull(@gridtoform,'')))	+ '" '  
			select @sql    = @sql+'ColumnTransformAs="'			+ ltrim(rtrim(isnull(upper(@TransformAs),'')))	+ '" '  
		End
 		if (isnull(@rowexpander,'N') = 'y')
			select @sql    = @sql+'ColumnAsRow="'			+ ltrim(rtrim(isnull(@rowexpander,'')))	+ '" '  
		if (isnull(@AttachmentWithDesc,'N') = 'y')
		Begin
			select @sql    = @sql+'AttachmentWithDesc="'			+ ltrim(rtrim(isnull(@AttachmentWithDesc,'')))	+ '" '  
			select @sql    = @sql+'DynamicFileID="'			+ ltrim(rtrim(isnull(@AssociatedHiddenView,'')))	+ '" '  
			SELECT @sql    = @sql+'PreTask="'			+ ltrim(rtrim(isnull(@PreTask,'')))	+ '" '				---TECH-68066
			SELECT @sql    = @sql+'PostTask="'			+ ltrim(rtrim(isnull(@PostTask,'')))	+ '" '			---TECH-68066
		
			SELECT @sql    = @sql+'BrowsePreTask="'			+ ltrim(rtrim(isnull(@BrowsePreTask,'')))	+ '" '				-- --Tech-71262
			SELECT @sql    = @sql+'BrowsePostTask="'		+ ltrim(rtrim(isnull(@BrowsePostTask,'')))	+ '" '		
			SELECT @sql    = @sql+'DeletePreTask="'		+ ltrim(rtrim(isnull(@DeletePreTask,'')))	+ '" '
			SELECT @sql    = @sql+'DeletePostTask="'		+ ltrim(rtrim(isnull(@DeletePostTask,'')))	+ '" '

		End	
		if (isnull(@Dynamicstorepath,'N') = 'y')
			select @sql    = @sql+'DynamicStorePath="'			+ ltrim(rtrim(isnull(@DynamicHdnView,'')))	+ '" '  

		--TECH-71262
		SELECT  @AssociateControl = '',
				@AssociateViewname = ''

		IF (ISNULL(@ColAssociateColumn,'') <> '') 
		BEGIN
			SELECT	@AssociateControl	= UPPER(Control_id),
					@AssociateViewname	= View_name
			FROM	de_published_ui_grid (NOLOCK)
			WHERE	customer_name  	= @engg_customer_name
			AND  	project_name  	= @engg_project_name
			AND		ecrno			= @engg_req_no
			AND  	process_name  	= @process_name
			AND  	component_name  = @engg_component
			AND  	activity_name  	= @activity_name
			AND  	ui_name    		= @ui_name_tmp
			AND		Column_bt_synonym = @ColAssociateColumn
	 
			SELECT @sql    = @sql+'AssociateControl="'			+ ltrim(rtrim(isnull(@AssociateControl,'')))	+ '" '
			SELECT @sql    = @sql+'AssociateViewName="'			+ ltrim(rtrim(isnull(@AssociateViewname,'')))	+ '" '
		END

		IF (isnull(@ColButtonStyle,'') = 'y')  
			SELECT @sql    = @sql+'ButtonStyle="'			+ ltrim(rtrim(isnull(@ColButtonStyle,'')))	+ '" ' 
			
		IF (isnull(@ColSelectOnlyLE,'') = 'y')  
			SELECT @sql    = @sql+'SelectOnlyListValues="'			+ ltrim(rtrim(isnull(@ColSelectOnlyLE,'')))	+ '" ' 
		--TECH-71262

		if (isnull(@Multifileselect,'N') = 'y')
			select @sql    = @sql+'MultiFileSelect="'			+ ltrim(rtrim(isnull(@Multifileselect,'')))	+ '" ' 		

		if (isnull(@Scan,'N') = 'y')
			select @sql    = @sql+'Scan="'				+ ltrim(rtrim(isnull(@Scan,'')))	+ '" '   

		if (isnull(@AutoScan,'N') = 'y')
			select @sql    = @sql+'AutoScan="'				+ ltrim(rtrim(isnull(@AutoScan,'')))	+ '" '   

		if (isnull(@NFC,'N') = 'y')
			select @sql    = @sql+'NFC="'				+ ltrim(rtrim(isnull(@NFC,'')))	+ '" ' 

		if (isnull(@IsDocked,'N') = 'y')
			select @sql    = @sql+'IsDocked="'				+ ltrim(rtrim(isnull(@IsDocked,'')))	+ '" ' 

			--TECH-69629
		if (isnull(@Ishijri,'') =  'y')
			select @sql    = @sql+'Ishijiri="'			+ ltrim(rtrim(isnull(Lower(@Ishijri),'')))	+ '" '  
			--TECH-69629

		if isnull(@EditMask,'N') = 'y'
		Begin				
			select	@rawdata		= view_name 
			from	de_published_ui_grid  (nolock)
			where	customer_name	= @engg_customer_name
			and		project_name  	= @engg_project_name
			and		ecrno    		= @engg_req_no
			and		process_name  	= @process_name
			and		component_name	= @engg_component
			and		activity_name	= @activity_name
			and		ui_name    		= @ui_name_tmp
			and		control_id		= @control_id
			and		column_bt_synonym= 'm'+@controlcolumnbt+'_rd'

			select	@regularexp		= view_name 
			from	de_published_ui_grid  (nolock)
			where	customer_name  	= @engg_customer_name
			and		project_name  	= @engg_project_name
			and		ecrno    		= @engg_req_no
			and		process_name  	= @process_name
			and		component_name  = @engg_component
			and		activity_name  	= @activity_name
			and		ui_name    		= @ui_name_tmp
			and		control_id		= @control_id
			and		column_bt_synonym= 'm'+@controlcolumnbt+'_ex'

			select	@replacechar	= view_name 
			from	de_published_ui_grid  (nolock)
			where	customer_name  	= @engg_customer_name
			and		project_name  	= @engg_project_name
			and		ecrno    		= @engg_req_no
			and		process_name  	= @process_name
			and		component_name  = @engg_component
			and		activity_name  	= @activity_name
			and		ui_name    		= @ui_name_tmp
			and		control_id		= @control_id
			and		column_bt_synonym= 'm'+@controlcolumnbt+'_rc'

			select @sql  = @sql+'RawValue="'		+  ltrim(rtrim(isnull(upper(@rawdata),''))) + '" ' 
			select @sql  = @sql+'RegularExpr="'		+  ltrim(rtrim(isnull(upper(@regularexp),''))) 	+ '" ' 
			select @sql  = @sql+'ReplaceChar="'		+  ltrim(rtrim(isnull(upper(@replacechar),''))) + '" ' 

			--select @sql    = @sql+'RawValue="'			+ ltrim(rtrim(isnull('m'+@controlcolumnbt+'_rd','')))	+ '" ' 
			--select @sql    = @sql+'RegularExpr="'		+ ltrim(rtrim(isnull('m'+@controlcolumnbt+'_ex','')))	+ '" ' 
			--select @sql    = @sql+'ReplaceChar="'			+ ltrim(rtrim(isnull('m'+@controlcolumnbt+'_rc','')))	+ '" ' 
		End
	
		-- To get the Report Task enabled columns for Mobility --TECH-27286 Starts
		IF LEN(@ReportName)	>= 1
		BEGIN
			select @sql    = @sql+'ReportName="'		+ ltrim(rtrim(isnull(@ReportName,'')))	+ '" '   		
			select @sql    = @sql+'ReportContext="'		+ ltrim(rtrim(isnull(@ReportContext,'')))	+ '" '   
		END

		IF LEN(@SPReportName)	>= 1
		BEGIN
			select @sql    = @sql+'ReportName="'		+ ltrim(rtrim(isnull(@SPReportName,'')))	+ '" '   		
			select @sql    = @sql+'ReportContext="'				+ ltrim(rtrim(isnull(@SPReportContext,'')))	+ '" '   
		END
		-- To get the Report Task enabled columns for Mobility --TECH-27286 Ends

		if (isnull(@MetaDataBasedLink,'N') = 'y')
			select @sql    = @sql+'MetaDataBasedLink="'			+ ltrim(rtrim(isnull(@MDLinkHdnview,'')))	+ '" ' 
		 
	
		select @sql = @sql +'/>'

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)
		end

	fetch next from colcur into 
	@control_id			,@view_name,			@PreventDownload	,@norowstodisplay_notreq,	@enabledefault		,	@hideinsert,		@hidedelete			,@hideselect
	,@hidecopy			,@hidecut,				@hidefilterdata		,@hidepdf,					@hidereport		,		@hidehtml,			@hideexportexcel	,@hideexportcsv			
	,@hideexporttext	,@hideimportdata,		@hidechart			,@hideexportopenoffice	 ,	@hidepersonalize	,	@searchhide			, @autoheight,
	@Preserve_visible_length, @Auto_width_column,@Ishijri,			@QlikLink  ,				@SystemGeneratedFileId,	@IsMarquee,			@control_type,		@IsAssorted--PLF2.0_18487		
	,@RatingType,		@CaptchaData,			@gridtoform,		@rowexpander,				@AttachmentWithDesc,	@controlcolumnbt,
	@TransformAs,		@columnclass,			@Dynamicstorepath,	@Multifileselect,			@MetaDataBasedLink,		@EditMask,			@mlsearchonly,	--TECH-45171
	@ColAssociatecolumn,						@ColButtonStyle,	@ColSelectOnlyLE --TECH-71262
	end
	--End
	close colcur
	deallocate colcur
	--*****************************
	Declare	colcur  cursor FAST_FORWARD for
	select	Distinct upper(column_bt_synonym), upper(control_id), view_name
	from	de_published_ui_grid grd (nolock)
	where	customer_name	= @engg_customer_name
	and		project_name	= @engg_project_name
	and		ecrno			= @engg_req_no
	and		process_name	= @process_name
	and		component_name	= @engg_component
	and		activity_name	= @activity_name
	and		ui_name			= @ui_name_tmp
	and		grd.column_bt_synonym in (select distinct primary_control_bts  
		from	de_published_action a (nolock)
		where	a.customer_name		= grd.customer_name
		and		a.project_name		= grd.project_name
		and		ecrno				= @engg_req_no
		and		a.process_name		= grd.process_name
		and		a.component_name	= grd.component_name
		and		a.activity_name		= grd.activity_name
		and		a.ui_name			= grd.ui_name
		and		isnull(a.sectionlaunchtype,'') = 'Callout') 

	open colcur 
	fetch next from colcur into @columnname, @control_bt_synonym, @view_name
	WHILE @@FETCH_STATUS = 0   
	BEGIN 
	
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql =	'<Column Name="'		+ ltrim(rtrim(isnull(@columnname,'')))			+ '" ' +	
						'ControlName="'		+ ltrim(rtrim(isnull(@control_bt_synonym,''))) 			+ '" ' +
						'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' +
						'IsCallOut="Y"' 
		select @sql = @sql +'/>'
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)	

	fetch next from colcur into @columnname, @control_bt_synonym, @view_name
	End
	Close colcur
	deallocate colcur
	-------Callout in Grid for mobility Starts
	--------------List Swipe Action Starts
	Declare	colcur  cursor FAST_FORWARD for
	select	Distinct upper(column_bt_synonym), upper(control_id), view_name, columnclass
	from	de_published_ui_grid grd (nolock)
	where	customer_name	= @engg_customer_name
	and		project_name	= @engg_project_name
	and		ecrno			= @engg_req_no
	and		process_name	= @process_name
	and		component_name	= @engg_component
	and		activity_name	= @activity_name
	and		ui_name			= @ui_name_tmp
	and		charindex('~', columnclass) > 0 

	open colcur 
	fetch next from colcur into @columnname, @control_bt_synonym, @view_name, @columnclass
	WHILE @@FETCH_STATUS = 0   
	BEGIN 
		select @swipeicon = substring(@columnclass, 1, charindex('~', @columnclass)-1)
		select @swipecolor = substring(@columnclass, charindex('~', @columnclass)+1, len(@columnclass)-charindex('~', @columnclass) )
		
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql =	'<Column Name="'	+ ltrim(rtrim(isnull(@columnname,'')))			+ '" ' +	
						'ControlName="'		+ ltrim(rtrim(isnull(@control_bt_synonym,''))) 			+ '" ' +
						'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' +
						'IsSwipe="Y" '		+ 
						'Icon="'			+ ltrim(rtrim(isnull(@swipeicon,''))) 			+ '" ' +
						'Color="'			+ ltrim(rtrim(isnull(@swipecolor,''))) 			+ '"' 
		select @sql = @sql +'/>'
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)	

	fetch next from colcur into @columnname, @control_bt_synonym, @view_name, @columnclass
	End
	Close colcur
	deallocate colcur
	-------List Swipe Action Ends

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '</Columns>',@xml_seq_tmp_out)

	-------Pivot Grid Starts  PLF2.0_16291		
	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<Pivot>',@xml_seq_tmp_out)

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<PControls>',@xml_seq_tmp_out)

	declare pivctrl_curs cursor FAST_FORWARD for
	select  section_bt_synonym,		upper(ctrl.control_id), upper(ctrl.view_name),upper(ctrl.control_bt_synonym)
	from	es_comp_ctrl_type_mst_vw ctype (nolock),
			de_published_ui_control ctrl (nolock)
	where	ctrl.customer_name  		= ctype.customer_name
	and  	ctrl.project_name  			= ctype.project_name
	and  	ctrl.process_name  			= ctype.process_name
	and  	ctrl.component_name  		= ctype.component_name
	and  	ctrl.control_type  			= ctype.ctrl_type_name
	and  	ctrl.customer_name  		= @engg_customer_name
	and  	ctrl.project_name  			= @engg_project_name
	and  	ctrl.ecrno    				= @engg_req_no
	and  	ctrl.process_name  			= @process_name
	and  	ctrl.component_name  		= @engg_component
	and  	ctrl.activity_name  		= @activity_name
	and  	ctrl.ui_name    			= @ui_name_tmp
	and		ctype.base_ctrl_type		= 'Pivot'
	--and	 	isnull(ctype.IsPivot,'')	= 'Y'


	open pivctrl_curs

	fetch next from pivctrl_curs into 
			@PivotSection,		@control_id			,@view_name,			@control_bt_synonym

	WHILE @@FETCH_STATUS = 0   
	BEGIN 

	--create table #tmp_table_piv (row_tot varchar(255), row_sub varchar(255),col_tot varchar(255), col_sub varchar(255))

		--insert into #tmp_table_piv (col_sub )
		--select  DisplayText
		select	@colsubtot_text		= DisplayText
		from	de_published_pivot_lang_extn (nolock)
		where	DisplayField		= 'Column Sub Total Text' 
		and		customer_name  		= @engg_customer_name
		and  	project_name  		= @engg_project_name
		and  	ecrno    			= @engg_req_no
		and  	process_name  		= @process_name
		and  	component_name		= @engg_component
		and  	activity_name  		= @activity_name
		and  	ui_name    			= @ui_name_tmp
		and		Control_bt_synonym	= @control_bt_synonym
		and		languageid			= @language_code

		--update a
		--set row_tot = DisplayText
		--from #tmp_table_piv  a,
		select	@rowgrandtot_text	= DisplayText
		from	de_published_pivot_lang_extn (nolock)
		where	DisplayField		= 'Row Grand Total Text' 
		and		customer_name  		= @engg_customer_name
		and  	project_name  		= @engg_project_name
		and  	ecrno    			= @engg_req_no
		and  	process_name  		= @process_name
		and  	component_name		= @engg_component
		and  	activity_name  		= @activity_name
		and  	ui_name    			= @ui_name_tmp
		and		Control_bt_synonym	= @control_bt_synonym
		and		languageid			= @language_code


		--update a
		--set row_sub = DisplayText
		--from #tmp_table_piv  a,
		select	@rowsubtot_text		= DisplayText
		from	de_published_pivot_lang_extn (nolock)
		where	DisplayField		= 'Row Sub Total Text' 
		and		customer_name  		= @engg_customer_name
		and  	project_name  		= @engg_project_name
		and  	ecrno    			= @engg_req_no
		and  	process_name  		= @process_name
		and  	component_name		= @engg_component
		and  	activity_name  		= @activity_name
		and  	ui_name    			= @ui_name_tmp
		and		Control_bt_synonym	= @control_bt_synonym
		and		languageid			= @language_code


		--update a
		--set col_tot = DisplayText
		--from #tmp_table_piv  a,
		select	@colgrandtot_text	= DisplayText
		from	de_published_pivot_lang_extn (nolock)
		where	DisplayField		= 'Column Grand Total Text' 
		and		customer_name  		= @engg_customer_name
		and  	project_name  		= @engg_project_name
		and  	ecrno    			= @engg_req_no
		and  	process_name  		= @process_name
		and  	component_name		= @engg_component
		and  	activity_name  		= @activity_name
		and  	ui_name    			= @ui_name_tmp
		and		Control_bt_synonym	= @control_bt_synonym
		and		languageid			= @language_code

		Select  distinct 
				@config_pos			= isnull(configpan_pos,''),
				@rowgrandtot_pos	= isnull(rowgrandtot_pos,''),	
				@rowsubtot_pos		= isnull(rowsubtot_pos,''),
				@colgrandtot_pos	= isnull(colgrandtot_pos,''),
				@colsubtot_pos		= isnull(colsubtot_pos,'')--,
				--@rowgrandtot_text	= isnull(row_tot,''),	
				--@colgrandtot_text	= isnull(col_tot,''),
				--@rowsubtot_text		= isnull(row_sub,''),	
				--@colsubtot_text		= isnull(col_sub,'')
		from	de_published_pivot_configure con (nolock)--,
				--#tmp_table_piv	tab (nolock)
		where	customer_name  		= @engg_customer_name
		and  	project_name  		= @engg_project_name
		and  	ecrno    			= @engg_req_no
		and  	process_name  		= @process_name
		and  	component_name		= @engg_component
		and  	activity_name  		= @activity_name
		and  	ui_name    			= @ui_name_tmp
		and		Control_bt_synonym	= @control_bt_synonym

		-- Code added for Pivot Control TECH-28436 
		SELECT	@AssGridName				=  upper(control_id)
		FROM	es_comp_ctrl_type_mst_vw ctype (nolock),
				de_published_ui_control ctrl (nolock)
		where	ctrl.customer_name  		= ctype.customer_name
		and  	ctrl.project_name  			= ctype.project_name
		and  	ctrl.process_name  			= ctype.process_name
		and  	ctrl.component_name  		= ctype.component_name
		and  	ctrl.control_type  			= ctype.ctrl_type_name
		and  	ctrl.customer_name  		= @engg_customer_name
		and  	ctrl.project_name  			= @engg_project_name
		and  	ctrl.ecrno    				= @engg_req_no
		and  	ctrl.process_name  			= @process_name
		and  	ctrl.component_name  		= @engg_component
		and  	ctrl.activity_name  		= @activity_name
		and  	ctrl.ui_name    			= @ui_name_tmp
		and		ctrl.section_bt_synonym		= @PivotSection
		and		ctype.base_ctrl_type		= 'Grid'

		
		SELECT	@AssGridTask				= upper(act.task_name),
				@AssGridTaskType			= act.task_type
		FROM	es_comp_ctrl_type_mst_vw ctype (nolock),
				de_published_ui_control ctrl (nolock),
				de_published_Action act (nolock)
		where	ctrl.customer_name  		= ctype.customer_name
		and  	ctrl.project_name  			= ctype.project_name
		and  	ctrl.process_name  			= ctype.process_name
		and  	ctrl.component_name  		= ctype.component_name
		and  	ctrl.control_type  			= ctype.ctrl_type_name

		and		ctrl.customer_name			= act.customer_name
		and		ctrl.project_name			= act.project_name
		and		ctrl.process_name			= act.process_name
		and		ctrl.component_name			= act.component_name
		and		ctrl.activity_name			= act.activity_name	
		and		ctrl.ui_name				= act.ui_name
		and		ctrl.page_bt_synonym		= act.page_bt_synonym
		and		ctrl.control_bt_synonym		= act.primary_control_bts

		and  	ctrl.customer_name  		= @engg_customer_name
		and  	ctrl.project_name  			= @engg_project_name
		and  	ctrl.ecrno    				= @engg_req_no
		and  	ctrl.process_name  			= @process_name
		and  	ctrl.component_name  		= @engg_component
		and  	ctrl.activity_name  		= @activity_name
		and  	ctrl.ui_name    			= @ui_name_tmp
		and		ctrl.section_bt_synonym		= @PivotSection
		and		ctype.base_ctrl_type		in ('Button','Link')

		-- Code added for Pivot Control TECH-28436 Ends


	--drop table #tmp_table_piv

	--if isnull(@config_pos,'')			<> ''	or ISNULL(@rowgrandtot_pos,'None')		<>'None'or isnull(@rowsubtot_pos,'None')	<> 'None'
	--or ISNULL(@colgrandtot_pos,'None')	<>'None'or isnull(@colsubtot_pos,'None')		<>'None'or ISNULL(@rowgrandtot_text,'')			<> ''	or ISNULL(@colgrandtot_text,'')		<>''		
	--or isnull(@rowsubtot_text,'')		<>''	or ISNULL(@colsubtot_text,'')			<>''	

	--begin
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull(@control_id,'')))			+ '" ' +					
		'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' 

		--if (isnull(@config_pos,'') <>  '' )
			select @sql    = @sql+'ConfigurationPanePosition="'			+ ltrim(rtrim(isnull(@config_pos,'')))	+ '" '  	

		--if (isnull(@rowgrandtot_pos,'None') <>  'None'	)
			select @sql    = @sql+'RowGrandTotalPosition="'			+ ltrim(rtrim(isnull(@rowgrandtot_pos,'None')))	+ '" '  
	
		--if (isnull(@rowgrandtot_text,'') <>  ''	)
			select @sql    = @sql+'RowGrandTotalLabel="'			+ ltrim(rtrim(isnull(@rowgrandtot_text,'')))	+ '" '  	
	
		--if (isnull(@rowsubtot_pos,'None') <>  'None'	)
			select @sql    = @sql+'RowSubTotalPosition="'			+ ltrim(rtrim(isnull(@rowsubtot_pos,'None')))	+ '" '  
	
		--if (isnull(@rowsubtot_text,'') <>  ''	)
			select @sql    = @sql+'RowSubTotalLabel="'			+ ltrim(rtrim(isnull(@rowsubtot_text,'')))	+ '" '  
		
		--if (isnull(@colgrandtot_pos,'None') <>  'None'	)
			select @sql    = @sql+'ColumnGrandTotalPosition="'			+ ltrim(rtrim(isnull(@colgrandtot_pos,'None')))	+ '" '  	
	
		--if (isnull(@colgrandtot_text,'') <>	'' )
			select @sql    = @sql+'ColumnGrandTotalLabel="'			+ ltrim(rtrim(isnull(@colgrandtot_text,'')))	+ '" '  
			
		--if (isnull(@colsubtot_pos,'None') <>	'None' )
			select @sql    = @sql+'ColumnSubTotalPosition="'			+ ltrim(rtrim(isnull(@colsubtot_pos,'None')))	+ '" '  
	
		--if (isnull(@colsubtot_text,'')	<> '')
			select @sql    = @sql+'ColumnSubTotalLabel="'			+ ltrim(rtrim(isnull(@colsubtot_text,'')))	+ '" '  
	
	-- Code added for Pivot Control TECH-28436 Starts
		if (isnull(@AssGridName,'')	<> '')
			select @sql    = @sql+'AssGridName="'			+ ltrim(rtrim(isnull(@AssGridName,'')))	+ '" '  
		
		if (isnull(@AssGridTask,'')	<> '')
		Begin
			select @sql    = @sql+'AssGridTask="'			+ ltrim(rtrim(isnull(@AssGridTask,'')))	+ '" ' 
			select @sql    = @sql+'AssGridTaskType="'		+ ltrim(rtrim(isnull(@AssGridTaskType,'')))	+ '"' 
		End
		-- Code added for Pivot Control TECH-28436  Ends

		select @sql = @sql +'/>'

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)
	--end

		fetch next from pivctrl_curs into 
				@PivotSection,			@control_id			,@view_name,			@control_bt_synonym

		end
		close pivctrl_curs
		deallocate pivctrl_curs

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no, @process_name, @engg_component,
	@activity_name,  @guid,    '</PControls>',@xml_seq_tmp_out)

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<PColumns>',@xml_seq_tmp_out)
	----Columns
	declare piv_curs cursor FAST_FORWARD for
	select  upper(grd.control_id), upper(grd.view_name),upper(grd.control_bt_synonym),Upper(column_bt_synonym),
			upper(ctype.caption_alignment)
	from	de_published_ui_grid   grd (nolock),
			es_comp_ctrl_type_mst_vw ctype (nolock),
			de_published_ui_control ctrl (nolock)
	where	ctrl.customer_name  		= grd.customer_name
	and  	ctrl.project_name  			= grd.project_name
	and  	ctrl.process_name  			= grd.process_name
	and  	ctrl.component_name  		= grd.component_name
	and		ctrl.activity_name			= grd.activity_name
	and		ctrl.ui_name				= grd.ui_name
	and		ctrl.page_bt_synonym		= grd.page_bt_synonym		
	and		ctrl.section_bt_synonym		= grd.section_bt_synonym
	and		ctrl.control_bt_synonym		= grd.control_bt_synonym
	and		ctrl.ecrno					= grd.ecrno
	and		ctrl.customer_name  		= ctype.customer_name
	and  	ctrl.project_name  			= ctype.project_name
	and  	ctrl.process_name  			= ctype.process_name
	and  	ctrl.component_name  		= ctype.component_name
	and  	ctrl.control_type  			= ctype.ctrl_type_name
	and  	ctrl.customer_name  		= @engg_customer_name
	and  	ctrl.project_name  			= @engg_project_name
	and  	ctrl.ecrno    				= @engg_req_no
	and  	ctrl.process_name  			= @process_name
	and  	ctrl.component_name  		= @engg_component
	and  	ctrl.activity_name  		= @activity_name
	and  	ctrl.ui_name    			= @ui_name_tmp
	and		ctype.base_ctrl_type		= 'Pivot'
	--and	 	isnull(ctype.IsPivot,'')	= 'Y'
	and		exists ( select 'x' from ep_pivot_fields (nolock)
			where	customer_name		= grd.customer_name
			and		project_name		= grd.project_name			
			and		process_name		= grd.process_name
			and		component_name		= grd.component_name
			and		activity_name		= grd.activity_name
			and		ui_name				= grd.ui_name
			and		page_name			= grd.page_bt_synonym
			and		Control_bt_synonym	= grd.control_bt_synonym
			and		column_bt_synonym	= grd.column_bt_synonym)


	open piv_curs

	fetch next from piv_curs into 
	@control_id			,@view_name,			@control_bt_synonym,	@column_name,@columnAlignment

	WHILE @@FETCH_STATUS = 0   
	BEGIN 
		Declare @FieldType engg_flag
		Declare @FieldSeq  engg_seqno

		select  @FieldType	= '',
				@FieldSeq	= 0

		Select	Distinct @ColumnCaption = ISNULL(bt_synonym_caption,'Left')
		from	de_published_glossary(nolock)
		where	customer_name  		= @engg_customer_name
		and  	project_name  		= @engg_project_name
		and  	ecrno    			= @engg_req_no
		and  	process_name  		= @process_name
		and  	component_name		= @engg_component
		and  	bt_synonym_name		= @column_name

		Select  distinct 
				@rowlabel				= isnull(rowlabel,''),
				@columnlabel			= isnull(columnlabel,''),	
				@fieldValue				= isnull(fieldValue,''),
				@rowlabelseq			= isnull(rowlabelseq,0),
				@columnlabelseq			= isnull(columnlabelseq,0),
				@valueseq				= isnull(valueseq,0),	
				@ValueFunction			= isnull(ValueFunction,''),
				@rowlabelsorting		= isnull(rowlabelsorting,''),	
				@columnlabelsorting		= isnull(columnlabelsorting,'')
		from	de_published_pivot_fields con (nolock)
		where	con.customer_name  		= @engg_customer_name
		and  	con.project_name  		= @engg_project_name
		and  	con.ecrno    			= @engg_req_no
		and  	con.process_name  		= @process_name
		and  	con.component_name		= @engg_component
		and  	con.activity_name  		= @activity_name
		and  	con.ui_name    			= @ui_name_tmp
		and		con.Control_bt_synonym	= @control_bt_synonym
		and		con.column_bt_synonym	= @column_name
		
		if @rowlabel = 'Y'
		Begin
			select	@FieldType	 = 'R',
					@FieldSeq    = ISNULL(@rowlabelseq,0)
		End
		else if  @columnlabel = 'Y'
		Begin
			select	@FieldType	 = 'C', 
					@FieldSeq    = ISNULL(@columnlabelseq,0)
		End
		else if @fieldValue = 'Y'
		Begin
			select	@FieldType	 = 'V', 
					@FieldSeq    = ISNULL(@valueseq,0)
		End
		Else
		Begin
			select	@FieldType	 = 'N', 
					@FieldSeq    = 0
		End

		if ISNULL(@rowlabel,'N')			= 'Y'	or ISNULL(@columnlabel,'N')				= 'N'	or ISNULL(@valueseq,0)					<>0
		or ISNULL(@fieldValue,'N')				= 'Y'	or ISNULL(@rowlabelseq,0)				<>0		or isnull(@columnlabelseq,0)				<>0		
		or ISNULL(@ValueFunction,'None')	<>'None'or ISNULL(@rowlabelsorting,'')			<>''	or ISNULL(@columnlabelsorting,'')			<>''	

		begin
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Column Name="' 		+ ltrim(rtrim(isnull(@column_name,'')))			+ '" ' +	
		'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' +	
		'ColumnCaption="'		+ ltrim(rtrim(isnull(@ColumnCaption,''))) 			+ '" ' +
		'ColumnAlignment="'		+ ltrim(rtrim(isnull(@columnAlignment,'Left'))) 			+ '" ' +		
		'ControlName="'		+ ltrim(rtrim(isnull(@control_id,''))) 			+ '" ' +
		'FieldType="'		+ ltrim(rtrim(isnull(@FieldType,''))) 			+ '" ' +
		'FieldSequence="'		+ ltrim(rtrim(isnull(@FieldSeq,0))) 			+ '" ' 

		--if (isnull(@columnlabel,'N') =  'y' )
		--	select @sql    = @sql+'ColumnLabel="'			+ ltrim(rtrim(isnull(@columnlabel,'N')))	+ '" '  
	
		--if (isnull(@columnlabelseq,0) <>  0)
		--	select @sql    = @sql+'ColumnSequence="'			+ ltrim(rtrim(isnull(@columnlabelseq,0)))	+ '" '  
	
		if (isnull(@columnlabelsorting,'') <> '')
			select @sql    = @sql+'ColumnSorting="'			+ ltrim(rtrim(isnull(@columnlabelsorting,'')))	+ '" '  
		
		--if (isnull(@rowlabel,'N') =  'y'	)
		--	select @sql    = @sql+'RowLabel="'			+ ltrim(rtrim(isnull(@rowlabel,'N')))	+ '" '  

		--if (isnull(@rowlabelseq,0) <> 0	)
		--	select @sql    = @sql+'RowSequence="'			+ ltrim(rtrim(isnull(@rowlabelseq,0)))	+ '" '  
				
		if (isnull(@rowlabelsorting,'') <> '' )
			select @sql    = @sql+'RowSorting="'			+ ltrim(rtrim(isnull(@rowlabelsorting,'')))	+ '" '  		
	
		--if (isnull(@fieldValue,'N') =  'y'	)
		--	select @sql    = @sql+'Value="'			+ ltrim(rtrim(isnull(@fieldValue,'N')))	+ '" '  
		
		--if (isnull(@valueseq,0) <> 0	)
		--	select @sql    = @sql+'ValueSequence="'			+ ltrim(rtrim(isnull(@valueseq,0)))	+ '" '  
	
		if (isnull(@ValueFunction,'None') <>  'None'	)
			select @sql    = @sql+'ValueFunction="'			+ ltrim(rtrim(isnull(@ValueFunction,'None')))	+ '" '  
	

		select @sql = @sql +'/>'

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)
		end

		fetch next from piv_curs into 
		@control_id			,@view_name,			@control_bt_synonym,	@column_name,@columnAlignment

		end
		--End
		close piv_curs
		deallocate piv_curs
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</PColumns>',@xml_seq_tmp_out)

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</Pivot>',@xml_seq_tmp_out)
	--Pivot Grid Ends

	----------------------------Column Group Starts
	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<ColumnGroup>',@xml_seq_tmp_out)

	declare @grplevel engg_code,@grpseqno engg_seqno,@ingrpname engg_name,@ingrpcaption	engg_name,@incolseq engg_seqno,
			@incolname engg_name,@inmappedentity engg_name,@chkcontrlid engg_name ,@maxgrplevel engg_seqno , @controlbtsynonym engg_name ,
			@groupname_temp engg_name ,@parentgroupseq engg_seqno,  @ColCaption engg_name, @viewname engg_name , @tempcontrol engg_seqno,
			@tempcontrol1 engg_seqno,@parentgroup engg_name , @maxgroupseq engg_seqno , @tempcol engg_seqno, @column_bt_syn engg_name,
			@groupseq engg_seqno
	select @chkcontrlid = '' , @tempcontrol = 0 , @tempcontrol1 = 0 , @tempcol = 0

	If exists (select	'K'
				from	de_published_ui_columngroup grp( nolock)
				where	    grp.customer_name  		= @engg_customer_name
				and		grp.project_name  		= @engg_project_name
				and		grp.ecrno    				= @engg_req_no
				and		grp.process_name  		= @process_name
				and		grp.component_name  	= @engg_component
				and		grp.activity_name  		= @activity_name
				and		grp.ui_name    				= @ui_name_tmp )
	begin
				
				declare colgrp_curs Cursor Fast_forward for 
				
				select	distinct 
				grd.control_id,-- grp.group_name, grp.group_caption, grp.grouplevel, grp.groupseqno	,
				grp.grid_control_bt_synonym--,grp.parentgroupseq,parentgroup
				from	de_published_ui_grid grd  (nolock),
						de_published_ui_columngroup grp( nolock)
				where	grd.customer_name  			= grp.customer_name  	
				and		grd.project_name  		= grp.project_name  	
				and		grd.ecrno    				= grp.ecrno    		
				and		grd.process_name  		= grp.process_name  	
				and		grd.component_name  	= grp.component_name  
				and		grd.activity_name  		= grp.activity_name  	
				and		grd.ui_name    				= grp.ui_name    		
				and		grd.page_bt_synonym 	= grp.page_bt_synonym
				and		grd.section_bt_synonym 	= grp.section_bt_synonym
				and		grd.control_bt_synonym 	= grp.grid_control_bt_synonym
				and		grd.customer_name  		= @engg_customer_name
				and		grd.project_name  		= @engg_project_name
				and		grd.ecrno    				= @engg_req_no
				and		grd.process_name  		= @process_name
				and		grd.component_name  	= @engg_component
				and		grd.activity_name  		= @activity_name
				and		grd.ui_name    				= @ui_name_tmp
				order by 1

				open colgrp_curs

				fetch next from colgrp_curs into 
				@controlid,--@groupname,@groupcaption,@grplevel,@grpseqno,
				@controlbtsynonym--,@parentgroupseq,@parentgroup
	
				WHILE @@FETCH_STATUS = 0   
				BEGIN 
					
					If @tempcontrol = 0
						begin 
										select @xml_seq_tmp_out=@xml_seq_tmp_out+1
										select @sql = '<Control Name="'+ ltrim(rtrim(isnull(@controlid,'')))			+ '"> ' 
		  		
										insert into ep_genxml_tmp
										(customer_name,   project_name,   req_no,   process_name,  component_name,
										activity_name,    guid,    gen_xml,seq_no)
										values
										(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
										@activity_name,  @guid,    
										@sql ,@xml_seq_tmp_out)
										Set @tempcontrol = 1
						end	
						
						Declare colgrpcontrol_cursor  Cursor Fast_forward for 
						select grd.column_bt_synonym, grd.SequenceNo, grd.mapped_entity
										from de_published_ui_column_group_mapping grd (nolock)
										where	   grd.customer_name  		= @engg_customer_name
										and		grd.project_name  		= @engg_project_name
										and		grd.ecrno    				= @engg_req_no
										and		grd.process_name  		= @process_name
										and		grd.component_name  	= @engg_component
										and		grd.activity_name  		= @activity_name
										and		grd.ui_name    				= @ui_name_tmp
										and		grd.grid_control_bt_synonym = @controlbtsynonym
										and		grd.Group_name			=	'GridControl'   
										order by 2
										
				open colgrpcontrol_cursor
				
				fetch next from colgrpcontrol_cursor into @column_bt_syn, @groupseq, @inmappedentity

				WHILE @@FETCH_STATUS = 0   
				BEGIN 
									
					If @inmappedentity = 'Column'
					Begin
													--begin
	--												Set @tempcol = 1
													--declare colgrp_viewcurs cursor FAST_FORWARD for
													--select distinct grp.group_name, grp.SequenceNo, grp.column_bt_synonym, grp.mapped_entity
													--from de_published_ui_column_group_mapping grp (nolock)
													--where 	grp.customer_name  		= @engg_customer_name
													--and		grp.project_name  		= @engg_project_name
													--and		grp.ecrno    			= @engg_req_no
													--and		grp.process_name  		= @process_name
													--and		grp.component_name  	= @engg_component
													--and		grp.activity_name  		= @activity_name
													--and		grp.ui_name    			= @ui_name_tmp
													--and		grp.grid_control_bt_synonym = @controlbtsynonym
													--and		grp.group_name			= 'Ungroup'
													--and		grp.ecrno				= @engg_req_no

													--open colgrp_viewcurs

													--fetch next from colgrp_viewcurs into 
													--@ingrpname, @incolseq, @incolname,	@inmappedentity 

													--WHILE @@FETCH_STATUS = 0   
													--BEGIN 
															Select @ColCaption = ''
															Select @view_name = ''
															
															Select @view_name = view_name
															from	de_published_ui_grid (nolock)
															where	customer_name  		= @engg_customer_name
															and		project_name  		= @engg_project_name
															and		ecrno    			= @engg_req_no
															and		process_name  		= @process_name
															and		component_name  	= @engg_component
															and		activity_name  		= @activity_name
															and		ui_name    			= @ui_name_tmp
															and		control_bt_synonym	= @controlbtsynonym															
															and		column_bt_synonym	= @column_bt_syn

															
															Select	Distinct @ColCaption = ISNULL(bt_synonym_caption,@incolname)
															from	de_published_glossary(nolock)
															where	customer_name  		= @engg_customer_name
															and  	project_name  		= @engg_project_name
															and  	ecrno    			= @engg_req_no
															and  	process_name  		= @process_name
															and  	component_name		= @engg_component
															and  	bt_synonym_name		= @column_bt_syn
															
															--added by Srikanth S for TECH-59159
															
															select @ColCaption = replace(@ColCaption,'<','&lt;')  
															select @ColCaption = replace(@ColCaption,'>','&gt;')  
															select @ColCaption = replace(@ColCaption,'&','&amp;')  
															select @ColCaption = replace(@ColCaption,'"','&quot;')  

															select @xml_seq_tmp_out=@xml_seq_tmp_out+1
															select @sql = '<Column Name="'		+ ltrim(rtrim(isnull(@column_bt_syn,''))) 			+ '" ' +
															'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' +
															'ColumnCaption="'		+ ltrim(rtrim(isnull(@ColCaption,''))) 			+ '" ' +
															'SequenceNo="'		+ ltrim(rtrim(isnull(@groupseq,0))) 			+ '" ' + 
															'IsGroup="n"'

															select @sql = @sql +'/>'

															insert into ep_genxml_tmp
															(customer_name,   project_name,   req_no,   process_name,  component_name,
															activity_name,    guid,    gen_xml,seq_no)
															values
															(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
															@activity_name,  @guid,    
															@sql ,@xml_seq_tmp_out)
				
													--fetch next from colgrp_viewcurs into 
													--@ingrpname, @incolseq, @incolname,	@inmappedentity 

													--END
													--close colgrp_viewcurs
													--deallocate colgrp_viewcurs
													--end							
					End
					Else If @inmappedentity = 'Group'
					Begin

						select @groupcaption = grd.Group_caption
						from	de_published_ui_columngroup grd (nolock)
						where 	grd.customer_name  		= @engg_customer_name
						and		grd.project_name  		= @engg_project_name
						and		grd.ecrno    			= @engg_req_no
						and		grd.process_name  		= @process_name
						and		grd.component_name  	= @engg_component
						and		grd.activity_name  		= @activity_name
						and		grd.ui_name    				= @ui_name_tmp
						and		grd.grid_control_bt_synonym=@controlbtsynonym
						and		grd.Group_name			= @column_bt_syn

						--Added for TECH-65298 starts
						select @groupcaption = replace(@groupcaption,'<','&lt;')
						select @groupcaption = replace(@groupcaption,'>','&gt;')
						select @groupcaption = replace(@groupcaption,'&','&amp;')
						select @groupcaption = replace(@groupcaption,'"','&quot;')
						--Added for TECH-65298 ends

						select @xml_seq_tmp_out=@xml_seq_tmp_out+1
						select @sql = '<Column Name="' 		+ ltrim(rtrim(isnull(@column_bt_syn,'')))			+ '" ' +					
											'ColumnCaption="'		+ ltrim(rtrim(isnull(@groupcaption,''))) 			+ '" ' +	
											'SequenceNo="'		+ ltrim(rtrim(isnull(@groupseq,0))) 			+ '" ' + 
											'IsGroup="y">'
	
						insert into ep_genxml_tmp
						(customer_name,   project_name,   req_no,   process_name,  component_name,
						activity_name,    guid,    gen_xml,seq_no)
						values
						(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
						@activity_name,  @guid,    
						@sql ,@xml_seq_tmp_out)

						
											If Exists (	select	'K'
											from de_published_ui_columngroup grd (nolock)
											where 	grd.customer_name  		= @engg_customer_name
											and		grd.project_name  		= @engg_project_name
											and		grd.ecrno    			= @engg_req_no
											and		grd.process_name  		= @process_name
											and		grd.component_name  	= @engg_component
											and		grd.activity_name  		= @activity_name
											and		grd.ui_name    				= @ui_name_tmp
											and		grd.grid_control_bt_synonym=@controlbtsynonym
											and		grd.parentgroup			= @groupname )
																			begin 
																					Set @tempcontrol1 = 1
																					GOTO Label1;
																			end

					--If not exists (		select	'K'
					--					from de_published_ui_column_group_mapping grd (nolock)
					--					where	   grd.customer_name  		= @engg_customer_name
					--					and		grd.project_name  		= @engg_project_name
					--					and		grd.ecrno    			= @engg_req_no
					--					and		grd.process_name  		= @process_name
					--					and		grd.component_name  	= @engg_component
					--					and		grd.activity_name  		= @activity_name
					--					and		grd.ui_name    			= @ui_name_tmp
					--					and		grd.grid_control_bt_synonym = @controlbtsynonym
					--					and		grd.Group_name			=	@groupname 
					--					and		grd.mapped_entity		=	'Group')

					--								begin

													declare colgrp_viewcurs cursor FAST_FORWARD for
													select distinct --grp.group_name, colgrp.group_caption, 
													grp.SequenceNo, grp.column_bt_synonym, grp.mapped_entity
													from de_published_ui_column_group_mapping grp (nolock)--,
													--de_published_ui_columngroup colgrp( nolock)
													--where 	grp.customer_name  		= colgrp.customer_name  	
													--and		grp.project_name  		= colgrp.project_name  	
													--and		grp.ecrno    			= colgrp.ecrno    		
													--and		grp.process_name  		= colgrp.process_name  	
													--and		grp.component_name  	= colgrp.component_name  
													--and		grp.activity_name  		= colgrp.activity_name  	
													--and		grp.ui_name    			= colgrp.ui_name    		
													--and		grp.page_bt_synonym 	= colgrp.page_bt_synonym
													--and		grp.section_bt_synonym 	= colgrp.section_bt_synonym
													--and		grp.grid_control_bt_synonym	= colgrp.grid_control_bt_synonym
													--and		grp.group_name			= colgrp.group_name
													where		grp.customer_name  		= @engg_customer_name
													and		grp.project_name  		= @engg_project_name
													and		grp.ecrno    			= @engg_req_no
													and		grp.process_name  		= @process_name
													and		grp.component_name  	= @engg_component
													and		grp.activity_name  		= @activity_name
													and		grp.ui_name    			= @ui_name_tmp
													and		grp.grid_control_bt_synonym = @controlbtsynonym
													and		grp.group_name			= @column_bt_syn
													--and		grp.ecrno				= @engg_req_no
													order by 1
													open colgrp_viewcurs

													fetch next from colgrp_viewcurs into @incolseq, @incolname,	@inmappedentity 
													--@ingrpname, @ingrpcaption, 

													WHILE @@FETCH_STATUS = 0   
													BEGIN 
															Select @ColCaption = ''
															Select @view_name = ''
															
															Select @view_name = view_name
															from	de_published_ui_grid (nolock)
															where	customer_name  		= @engg_customer_name
															and		project_name  		= @engg_project_name
															and		ecrno    			= @engg_req_no
															and		process_name  		= @process_name
															and		component_name  	= @engg_component
															and		activity_name  		= @activity_name
															and		ui_name    			= @ui_name_tmp
															and		control_bt_synonym	= @controlbtsynonym															
															and		column_bt_synonym	= @incolname
															
															Select	Distinct @ColCaption = ISNULL(bt_synonym_caption,@incolname)
															from	de_published_glossary(nolock)
															where	customer_name  		= @engg_customer_name
															and  	project_name  		= @engg_project_name
															and  	ecrno    			= @engg_req_no
															and  	process_name  		= @process_name
															and  	component_name		= @engg_component
															and  	bt_synonym_name		= @incolname
															
															select @ColCaption = replace(@ColCaption,'<','&lt;')  
															select @ColCaption = replace(@ColCaption,'>','&gt;')  
															select @ColCaption = replace(@ColCaption,'&','&amp;')  
                                                            select @ColCaption = replace(@ColCaption,'"','&quot;')  
															
															
															select @xml_seq_tmp_out=@xml_seq_tmp_out+1
															select @sql = '<Column Name="'		+ ltrim(rtrim(isnull(@incolname,''))) 			+ '" ' +
															'ViewName="'		+ ltrim(rtrim(isnull(@view_name,''))) 			+ '" ' +
															'ColumnCaption="'		+ ltrim(rtrim(isnull(@ColCaption,''))) 			+ '" ' +
															'SequenceNo="'		+ ltrim(rtrim(isnull(@incolseq,0))) 			+ '" ' + 
															'IsGroup="n"'

															select @sql = @sql +'/>'

															insert into ep_genxml_tmp
															(customer_name,   project_name,   req_no,   process_name,  component_name,
															activity_name,    guid,    gen_xml,seq_no)
															values
															(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
															@activity_name,  @guid,    
															@sql ,@xml_seq_tmp_out)
				
													fetch next from colgrp_viewcurs into @incolseq, @incolname,	@inmappedentity 
													--@ingrpname, @ingrpcaption, @incolseq, @incolname,	@inmappedentity 

													END
													close colgrp_viewcurs
													deallocate colgrp_viewcurs

														select @xml_seq_tmp_out=@xml_seq_tmp_out+1
														insert into ep_genxml_tmp
														(customer_name,   project_name,   req_no,   process_name,  component_name,
														activity_name,    guid,    gen_xml,seq_no)
														values
														(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
														@activity_name,  @guid,    '</Column>',@xml_seq_tmp_out)

								
											--		end
								End
													
													fetch next from colgrpcontrol_cursor into @column_bt_syn, @groupseq, @inmappedentity
													END
													close colgrpcontrol_cursor
													deallocate colgrpcontrol_cursor
								--End
					Select  @chkcontrlid = @controlid

--To get maximum of group to close column tag
					Select @maxgroupseq = isnull(max(groupseqno),0)
					from de_published_ui_columngroup grd (nolock)
					where 	customer_name  		= @engg_customer_name
					and		project_name  			= @engg_project_name
					and		ecrno    					= @engg_req_no
					and		process_name  		= @process_name
					and		component_name  	= @engg_component
					and		activity_name  			= @activity_name
					and		ui_name    				= @ui_name_tmp
					and		grid_control_bt_synonym	=@controlbtsynonym
					and		parentgroup			= @parentgroup
					group by customer_name,project_name,ecrno,process_name,
								 component_name,activity_name,ui_name,Page_bt_synonym,section_bt_synonym,grid_control_bt_synonym,parentgroup

					--If @parentgroup is not null 
					--and exists (	select 'K' 
					--				from de_published_ui_columngroup grd (nolock)
					--				where 	customer_name  		= @engg_customer_name
					--				and		project_name  			= @engg_project_name
					--				and		ecrno    					= @engg_req_no
					--				and		process_name  		= @process_name
					--				and		component_name  	= @engg_component
					--				and		activity_name  			= @activity_name
					--				and		ui_name    				= @ui_name_tmp
					--				and		grid_control_bt_synonym	=@controlbtsynonym
					--				and		group_name 			= @groupname
					--				and		groupseqno				=	@maxgroupseq
					--				and		parentgroup			= @parentgroup			) 
					--				begin 
					--					select @xml_seq_tmp_out=@xml_seq_tmp_out+1
					--					insert into ep_genxml_tmp
					--					(customer_name,   project_name,   req_no,   process_name,  component_name,
					--					activity_name,    guid,    gen_xml,seq_no)
					--					values
					--					(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
					--					@activity_name,  @guid,    '</Column>',@xml_seq_tmp_out)
					--				end 

					fetch next from colgrp_curs into 
					@controlid,--@groupname,@groupcaption,@grplevel,@grpseqno,
					@controlbtsynonym --,@parentgroupseq,@parentgroup

							Label1:
								If @tempcontrol1 = 1
									begin	
											fetch next from colgrp_curs into 
											@controlid,--@groupname,@groupcaption,@grplevel,@grpseqno,
											@controlbtsynonym --,@parentgroupseq,@parentgroup
											Select  @chkcontrlid = @controlid
											Select	  @tempcontrol1 = 0
									End 


					If @controlid <> @chkcontrlid
						begin
						
							select @xml_seq_tmp_out=@xml_seq_tmp_out+1
							insert into ep_genxml_tmp
							(customer_name,   project_name,   req_no,   process_name,  component_name,
							activity_name,    guid,    gen_xml,seq_no)
							values
							(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
							@activity_name,  @guid,    '</Control>',@xml_seq_tmp_out)
							
							--select @chkcontrlid = ''
							Set @tempcontrol = 0
							
						end

				if @@FETCH_STATUS = -1
						begin
						
							select @xml_seq_tmp_out=@xml_seq_tmp_out+1
							insert into ep_genxml_tmp
							(customer_name,   project_name,   req_no,   process_name,  component_name,
							activity_name,    guid,    gen_xml,seq_no)
							values
							(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
							@activity_name,  @guid,    '</Control>',@xml_seq_tmp_out)	
						end

					END -- while begin
					close colgrp_curs
					deallocate colgrp_curs
	end  

 	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '</ColumnGroup>',@xml_seq_tmp_out)
	----------------------------Column Group Ends
	----------------------------Sync View Starts
	
	Declare @syncolumn engg_name

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid, gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<Syncview>',@xml_seq_tmp_out)

	declare sync_curs cursor FAST_FORWARD for
	select	upper(legrid_control_id), legrid_view_name, legrid_column_bt_synonym
	from de_published_sync_view a (nolock)
	where a.customer_name		=	@engg_customer_name
	and a.project_name			=	@engg_project_name
	and	a.ecrno					=	@engg_req_no
	and	a.process_name  		=   @process_name
	and	a.component_name		=   @engg_component
	and	a.Activity_name			=	@activity_name
	and	a.ui_name				=	@ui_name_tmp

	open sync_curs

	fetch next from sync_curs into 	@controlid,@viewname,@syncolumn

	WHILE @@FETCH_STATUS = 0   
	BEGIN 

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull(@controlid,'')))			+ '" ' +					
		'ColumnName="'		+ ltrim(rtrim(isnull(@syncolumn,''))) 			+ '" ' +	
		'ViewName="'		+ ltrim(rtrim(isnull(@viewname,''))) 			+ '"' 		
		select @sql = @sql +'/>'		

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,  
		@sql ,@xml_seq_tmp_out)
	

	fetch next from sync_curs into 	@controlid,@viewname,@syncolumn
	END
	close sync_curs
	deallocate sync_curs

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '</Syncview>',@xml_seq_tmp_out)
----------------------------Sync View Ends
 	----------------------------Slider Starts
	declare @SliderType		engg_name,
			@SliderBehav	engg_name,
			@RenderType		engg_name,
			@Orientation	engg_name,
			@Startvalue		engg_seqno,
			@Endvalue		engg_seqno,
			@Stepvalue		engg_seqno,
			@SliderValue	engg_seqno,
			@Showvalue		engg_flag,
			@ShowTooltip	engg_flag,
			@ctrltype		engg_name,
			@event_req		engg_flag,
			@steplabel		engg_name,
			@steptt			engg_name,
			@stepmlvalue	engg_seqno,
			@valueshown		engg_name,
			@minvalue		engg_seqno,
			@maxvalue		engg_seqno

	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '<Sliders>',@xml_seq_tmp_out)

	declare slider_curs cursor FAST_FORWARD for
	select upper(b.control_id), lower(b.view_name), SliderType,  SliderBehaviour, RenderType, Orientation, Startvalue, Endvalue, Stepvalue,
			SliderValue, Showvalue, ShowTooltip,  ctrl_type_name, ValueShown, minvalue, maxvalue
	from es_comp_ctrl_type_mst_extn a (nolock) , de_published_ui_control b (nolock)--, de_published_ui_grid c (nolock)
	where a.customer_name		=	@engg_customer_name
	and a.project_name			=	@engg_project_name
	and	b.ecrno					=	@engg_req_no
	and	a.process_name  		=   @process_name
	and	a.component_name		=   @engg_component
	and	b.Activity_name			=	@activity_name
	and	b.ui_name				=	@ui_name_tmp
	and a.customer_name			=	b.customer_name
	and a.project_name			=	b.project_name
	and a.process_name			=	b.process_name
	and a.component_name		=	b.component_name
	and a.ctrl_type_name		=	b.control_type
	and    a.base_ctrl_type        in     ('Slider','RSSlider') --Added against TECH-60668
	--and	a.SliderType			=	'Static'
	open slider_curs

	fetch next from slider_curs into 
	@controlid,@viewname,@SliderType, @SliderBehav, @RenderType, @Orientation, @Startvalue, @Endvalue, @Stepvalue, @SliderValue, @Showvalue, @ShowTooltip,@ctrltype, @valueshown, @minvalue, @maxvalue

	WHILE @@FETCH_STATUS = 0   
	BEGIN 
	
		select	@event_req	= isnull(event_handling_req,'N')
		from	es_comp_ctrl_type_mst (nolock)
		where	customer_name	= @engg_customer_name
		and		project_name  	= @engg_project_name		
		and		process_name  	= @process_name
		and		component_name  = @engg_component
		and		ctrl_type_name	= @ctrltype



		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		select @sql = '<Slider Name="' 		+ ltrim(rtrim(isnull(@controlid,'')))			+ '" ' +					
		'ViewName="'		+ ltrim(rtrim(isnull(@viewname,''))) 			+ '" ' +	
		'SliderType="'		+ ltrim(rtrim(isnull(@SliderType,''))) 			+ '" ' +	
		'SliderBehaviour="'		+ ltrim(rtrim(isnull(@SliderBehav,''))) 			+ '" ' +
		'RenderType="'		+ ltrim(rtrim(isnull(@RenderType,''))) 			+ '" ' +
		'Orientation="'		+ ltrim(rtrim(isnull(@Orientation,''))) 			+ '" ' +
		'StartValue="'		+ ltrim(rtrim(isnull(@StartValue,''))) 			+ '" ' +
		'EndValue="'		+ ltrim(rtrim(isnull(@EndValue,0))) 			+ '" ' +
		'MinValue="'		+ ltrim(rtrim(isnull(@minValue,''))) 			+ '" ' +
		'MaxValue="'		+ ltrim(rtrim(isnull(@maxValue,0))) 			+ '" ' +
		'StepValue="'		+ ltrim(rtrim(isnull(@Stepvalue,0))) 			+ '" ' +
		--'SliderValue="'		+ ltrim(rtrim(isnull(@SliderValue,0))) 			+ '" ' +
		'ShowValue="'		+ ltrim(rtrim(isnull(@ShowValue,''))) 			+ '" ' +
		'ShowTooltip="'		+ ltrim(rtrim(isnull(@ShowTooltip,''))) 		+ '" ' +
		'EventRequired="'	+ ltrim(rtrim(isnull(@event_req,''))) 			+ '" ' + 	
		'ValueShown="'		+ ltrim(rtrim(isnull(@valueshown,''))) 			+ '"' 		
		select @sql = @sql +'/>'
		

		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    
		@sql ,@xml_seq_tmp_out)
	

			--select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			--insert into ep_genxml_tmp
			--(customer_name,   project_name,   req_no,   process_name,  component_name,
			--activity_name,    guid,    gen_xml,seq_no)
			--values
			--(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			--@activity_name,  @guid,    '<Slider>',@xml_seq_tmp_out)

		fetch next from slider_curs into 
		@controlid,@viewname, @SliderType, @SliderBehav, @RenderType, @Orientation, @Startvalue, @Endvalue, @Stepvalue, @SliderValue, @Showvalue, @ShowTooltip, @ctrltype, @valueshown, @minvalue, @maxvalue

		END
		close slider_curs
		deallocate slider_curs

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</Sliders>',@xml_seq_tmp_out)

		
		-- Tag Starts
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Tag>',@xml_seq_tmp_out)

		select @controlid = ''
		
		declare tag_curs cursor FAST_FORWARD for
		select upper(a.control_id),  a.section_bt_synonym, c.insert_req
		from de_published_ui_control a (nolock) ,   es_comp_ctrl_type_mst c (nolock) --,de_published_ui_grid b (nolock)
		where a.customer_name		=	@engg_customer_name
		and a.project_name			=	@engg_project_name
		and	a.ecrno					=	@engg_req_no
		and a.process_name			=	@process_name
		and a.component_name		=	@engg_component
		and  a.activity_name   		= @activity_name
		and  a.ui_name      			= @ui_name_tmp	

		and a.customer_name			=	c.customer_name
		and a.project_name			=	c.project_name
		and a.process_name			=	c.process_name
		and a.component_name		=	c.component_name
		and a.control_type			=	c.ctrl_type_name
		and	c.RenderAs				in	('Tag','Chips')	--TECH-65000
		order by 1 

		open tag_curs
		
		fetch next from tag_curs into @controlid, @section_bt_synonym, @InsertFlag
	-- Width="600px" 

		WHILE @@FETCH_STATUS = 0   
		BEGIN 
			select	@tagsectionwidth= cast(width as varchar) + Setion_width_Scalemode
			From	de_published_ui_section (nolock)
			where	customer_name	= @engg_customer_name
			and		project_name	= @engg_project_name
			and		ecrno			= @engg_req_no
			and		process_name	= @process_name
			and		component_name	= @engg_component
			and		activity_name   = @activity_name
			and		ui_name      	= @ui_name_tmp	
			and		section_bt_synonym= @section_bt_synonym


			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql = '<Control Name="' 		+ ltrim(rtrim(isnull(@controlid,'')))
			select @sql = @sql + '" Width="' 		+ ltrim(rtrim(isnull(@tagsectionwidth,'')))
			select @sql = @sql + '" InsertFlag="' 		+ ltrim(rtrim(isnull(@InsertFlag,'')))	+ '">'		
		
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    
			@sql ,@xml_seq_tmp_out)
	

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql = '<Column ViewName="tagkeyfield" Type="Key"' 
			select @sql = @sql +'/>'

			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    
			@sql ,@xml_seq_tmp_out)

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql = '<Column ViewName="tagvalue" Type="Value"' 
			select @sql = @sql +'/>'

			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    
			@sql ,@xml_seq_tmp_out)

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql = '<Column ViewName="tagseqno" Type="SeqNo"' 
			select @sql = @sql +'/>'

			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    
			@sql ,@xml_seq_tmp_out)
			
			fetch next from tag_curs into @controlid, @section_bt_synonym, @InsertFlag

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Control>',@xml_seq_tmp_out)

		

		END
		close tag_curs
		deallocate tag_curs

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</Tag>',@xml_seq_tmp_out)
		
		-- Tag Ends

		-- ListItem Mobility Starts
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<ListItems>',@xml_seq_tmp_out)

		select @controlid = ''
		
		declare Listitem_curs cursor FAST_FORWARD for
		select	DISTINCT upper(GridControlID), GridViewName,  UPPER(MappedGridColumnSynonym), UPPER(control_id),
				UPPER(view_name)
		from de_published_nativeapp_mapping  (nolock) 
		where	customer_name		= @engg_customer_name
		and		project_name		= @engg_project_name
		and		ecrno				= @engg_req_no
		and		process_name		= @process_name
		and		component_name		= @engg_component
		and		activity_name   	= @activity_name
		and		ui_name      		= @ui_name_tmp	
		order by 1 

		open Listitem_curs
		
		fetch next from Listitem_curs into @GridcontrolID, @GridViewName, @column_name, @control_id, @View_name
	
		WHILE @@FETCH_STATUS = 0   
		BEGIN 		

			--SET @OldGridControlID	= @GridcontrolID
		
			If isnull(@OldGridControlID,'') <> isnull(@GridcontrolID,'')
			Begin

				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				select @sql = '<ListItem ControlName="' 		+ ltrim(rtrim(isnull(@GridcontrolID,''))) 	+ '">'	
			
		
				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    
				@sql ,@xml_seq_tmp_out)
			END

			SET @OldGridControlID	= @GridcontrolID

			select @sql = '<Column Name="' + ltrim(rtrim(isnull(@column_name,''))) 
			select @sql = @sql + '" ViewName="' 		+ ltrim(rtrim(isnull(@GridViewName,'')))
			select @sql = @sql + '" MappedControlId="' 		+ ltrim(rtrim(isnull(@control_id,'')))
			select @sql = @sql + '" MappedViewName="' 		+ ltrim(rtrim(isnull(@View_name,'')))	+ '"/>'		


			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    
			@sql ,@xml_seq_tmp_out)
		
			
			fetch next from Listitem_curs into @GridcontrolID, @GridViewName, @column_name, @control_id, @View_name

			If isnull(@OldGridControlID,'') <> isnull(@GridcontrolID,'')
			Begin
				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</ListItem>',@xml_seq_tmp_out)
			END
		

		END
		close Listitem_curs
		deallocate Listitem_curs

		IF isnull(@GridcontrolID,'') <> ''
		Begin
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</ListItem>',@xml_seq_tmp_out)
		End

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</ListItems>',@xml_seq_tmp_out)
		
		-- ListItem Mobility Ends


		-- Added for Message Based Actions TECH-12776 Starts
		Declare @chktask engg_name
		
		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<MessageActions>',@xml_seq_tmp_out)

		select @chktask = ''
		
		If exists( 	select	'X'
		from	de_fw_des_publish_message_task_map a (nolock) 
		where	a.customer_name	=	@engg_customer_name
		and		a.project_name	=	@engg_project_name
		and		a.ecrno			=	@engg_req_no
		and		a.process_name	=	@process_name
		and		a.component_name=	@engg_component
		and		a.activity_name = @activity_name
		and		a.ui_name      	= @ui_name_tmp	
		)
		Begin
		declare msgaction_curs cursor FAST_FORWARD for
		select	distinct upper(taskname), MessageID
		from	de_fw_des_publish_message_task_map a (nolock) -- Changed for TECH-21011
		where	a.customer_name	=	@engg_customer_name
		and		a.project_name	=	@engg_project_name
		and		a.ecrno			=	@engg_req_no
		and		a.process_name	=	@process_name
		and		a.component_name=	@engg_component
		and		a.activity_name = @activity_name
		and		a.ui_name      	= @ui_name_tmp	
		order by 1,2		

		open msgaction_curs

		fetch next from msgaction_curs into @task_name,  @MessageID
	
		WHILE @@FETCH_STATUS = 0   
		BEGIN 


			if (@chktask <> @task_name) or isnull(@chktask,'') = ''
			Begin
				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				select @sql = '<Task Name="' 		+ ltrim(rtrim(isnull(@task_name,''))) + '">'		
		
				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    
				@sql ,@xml_seq_tmp_out)
			End
			
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			select @sql = '<Error ID="' + ltrim(rtrim(isnull(@MessageID,'')))		+ '">'		
		
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    
			@sql ,@xml_seq_tmp_out)
	
			declare mapaction_curs cursor FAST_FORWARD for
			select distinct isnull(upper(maptask_name),''), isnull(maptask_Descr,''), isnull(maptask_type,''), 
					isnull(upper(HlpAssociatedcontrol),'') -- Changed for TECH-21011
			from de_fw_des_publish_message_task_map a (nolock) 
			where a.customer_name		=	@engg_customer_name
			and a.project_name			=	@engg_project_name
			and	a.ecrno					=	@engg_req_no
			and a.process_name			=	@process_name
			and a.component_name		=	@engg_component
			and  a.activity_name   			= @activity_name
			and  a.ui_name      			= @ui_name_tmp	
			and	a.taskname				= @task_name
			and	a.MessageID				= @MessageID
			order by 1		

			open mapaction_curs

			fetch next from mapaction_curs into @maptask_name, @maptask_Descr, @maptask_type, @HlpAssociatedcontrol
	

			WHILE @@FETCH_STATUS = 0   
			BEGIN 

				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				select @sql = '<MappedTask Name="' + @maptask_name + '" Description="' + @maptask_Descr + '" Type="' + @maptask_type + '" HelpAssociatedControl="' + @HlpAssociatedcontrol  + '"' 
				select @sql = @sql +'/>'

				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    
				@sql ,@xml_seq_tmp_out)
			
				fetch next from mapaction_curs into @maptask_name, @maptask_Descr, @maptask_type, @HlpAssociatedcontrol	
			END
			close mapaction_curs
			deallocate mapaction_curs

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Error>',@xml_seq_tmp_out)
			select @chktask = @task_name
			
			fetch next from msgaction_curs into @task_name,  @MessageID
			
			if @chktask <> @task_name
			Begin
				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    '</Task>',@xml_seq_tmp_out)
			End		

		END
		close msgaction_curs
		deallocate msgaction_curs

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</Task>',@xml_seq_tmp_out)
		End

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</MessageActions>',@xml_seq_tmp_out)
		
		-- Added for Message Based Actions TECH-12776 Ends

		-- Added for TECH-43307 Responsive Layout of Mobility Starts

		Declare	@tmp_formfactor		engg_name,
				@tmp_devicetype		engg_documentation,
				@tmp_orientation	engg_name,
				@tmp_pagename		engg_name,
				@tmp_sectionname	engg_name,
				@tmp_parentsec		engg_name,
				@tmp_visible		engg_flag,
				@tmp_weightage		engg_seqno,
				@tmp_secwidth		engg_seqno


		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '<Responsive>',@xml_seq_tmp_out)

		Declare ressec_cur cursor Fast_forward for
		SELECT	DISTINCT Formfactor
		FROM	de_published_ui_section_refinement  (nolock)
		WHERE	customer_name	=	@engg_customer_name
		and		project_name	=	@engg_project_name
		and		ecrno			=	@engg_req_no
		and		process_name	=	@process_name
		and		component_name	=	@engg_component
		and		activity_name	=	@activity_name
		and		ui_name      	=	@ui_name_tmp	
		ORDER BY Formfactor

		open ressec_cur
		Fetch Next from ressec_cur into @tmp_formfactor

		While (1=1)
		begin		
		If @@fetch_status <> 0 
		 break
			IF CHARINDEX('Desktop', @tmp_formfactor) > 0 
				SELECT	@tmp_devicetype		= '<Device Type="Desktop" Orientation="Landscape">'
			ELSE IF CHARINDEX('TabletP', @tmp_formfactor) > 0 
				SELECT	@tmp_devicetype		= '<Device Type="Tablet" Orientation="Portrait">'
			ELSE IF CHARINDEX('TabletL', @tmp_formfactor) > 0 
				SELECT	@tmp_devicetype		= '<Device Type="Tablet" Orientation="Landscape">'
			ELSE IF CHARINDEX('PhoneL', @tmp_formfactor) > 0 
				SELECT	@tmp_devicetype		= '<Device Type="Phone" Orientation="Landscape">'

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    @tmp_devicetype, @xml_seq_tmp_out)

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '<Sections>',@xml_seq_tmp_out)

			Declare sec_cur cursor Fast_forward for
			SELECT	DISTINCT section_bt_synonym,	page_bt_synonym,	parent_section					
			FROM	de_published_ui_section  (nolock)
			WHERE	customer_name		=	@engg_customer_name
			AND		project_name		=	@engg_project_name
			AND		ecrno				=	@engg_req_no
			AND		process_name		=	@process_name
			AND		component_name		=	@engg_component
			AND		activity_name		=	@activity_name
			AND		ui_name      		=	@ui_name_tmp	
			AND		section_bt_synonym	NOT IN ('PrjHdnSection','[tabcontrol]','hdnrt_stsection')  
			AND		section_type	NOT	IN	('Tree','chart')		
			ORDER BY 1

			open sec_cur
			Fetch Next from sec_cur into @tmp_sectionname,	@tmp_pagename, @tmp_parentsec
			
			While (1=1)
			begin		
			If @@fetch_status <> 0 
				break

				SELECT	@tmp_visible		=	'N'
				SELECT	@tmp_weightage		=	0
				SELECT	@tmp_secwidth		=	0

				SELECT	@tmp_visible		=	ISNULL(visible_flag, 'N')
				FROM	de_published_ui_section_refinement (nolock)
				WHERE	customer_name		=	@engg_customer_name
				AND		project_name		=	@engg_project_name
				AND		ecrno				=	@engg_req_no
				AND		process_name		=	@process_name
				AND		component_name		=	@engg_component
				AND		activity_name		=	@activity_name
				AND		ui_name      		=	@ui_name_tmp
				AND		page_bt_synonym		=	@tmp_pagename
				AND		section_bt_synonym	=	@tmp_sectionname
				AND		Formfactor			=	@tmp_formfactor

				SELECT	@tmp_weightage		=	ISNULL(Weightage,0),
						@tmp_secwidth		=	ISNULL(SectionWidth,0)
				FROM	de_published_responsive_sec_weightage (nolock)
				WHERE	customer_name		=	@engg_customer_name
				AND		project_name		=	@engg_project_name
				AND		ecrno				=	@engg_req_no
				AND		process_name		=	@process_name
				AND		component_name		=	@engg_component
				AND		activity_name		=	@activity_name
				AND		ui_name      		=	@ui_name_tmp
				AND		page_bt_synonym		=	@tmp_pagename
				AND		section_bt_synonym	=	@tmp_sectionname
				AND		parent_section		=	@tmp_parentsec				
				AND		Formfactor			=	@tmp_formfactor

				select @xml_seq_tmp_out=@xml_seq_tmp_out+1
				select @sql = '<Section Name="' 		+ ltrim(rtrim(isnull(@tmp_sectionname,''))) 
				select @sql = @sql + '" PageName="'		+ ltrim(rtrim(isnull(@tmp_pagename,'')))  
				--select @sql = @sql + '" ParentSection="'+ ltrim(rtrim(isnull(@tmp_parentsec,'')))
				select @sql = @sql + '" VisibleFlag="' 	+ ltrim(rtrim(isnull(@tmp_visible,'')))
				select @sql = @sql + '" Weightage="' 	+ ltrim(rtrim(isnull(@tmp_weightage,'')))
				select @sql = @sql + '" Width="' 		+ ltrim(rtrim(isnull(@tmp_secwidth,'')))	+ '"/>'	

				insert into ep_genxml_tmp
				(customer_name,   project_name,   req_no,   process_name,  component_name,
				activity_name,    guid,    gen_xml,seq_no)
				values
				(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
				@activity_name,  @guid,    
				@sql ,@xml_seq_tmp_out)
			

			Fetch Next from sec_cur into @tmp_sectionname,	@tmp_pagename, @tmp_parentsec
		
			end
			close sec_cur
			deallocate sec_cur
				
			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Sections>',@xml_seq_tmp_out)

			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
			insert into ep_genxml_tmp
			(customer_name,   project_name,   req_no,   process_name,  component_name,
			activity_name,    guid,    gen_xml,seq_no)
			values
			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
			@activity_name,  @guid,    '</Device>',@xml_seq_tmp_out)

		Fetch Next from ressec_cur into @tmp_formfactor
		
		end
		close ressec_cur
		deallocate ressec_cur

		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
		insert into ep_genxml_tmp
		(customer_name,   project_name,   req_no,   process_name,  component_name,
		activity_name,    guid,    gen_xml,seq_no)
		values
		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
		@activity_name,  @guid,    '</Responsive>',@xml_seq_tmp_out)

		-- Added for TECH-43307 Responsive Layout of Mobility Ends

	--declare slider_curs1 cursor FAST_FORWARD for
	--select	distinct upper(slid.control_id), SliderType,  SliderBehaviour, RenderType, slid.Orientation, Startvalue, Endvalue, Stepvalue,
	--		SliderValue, Showvalue, ShowTooltip, control_type
	----from	de_published_ui_slider slid  (nolock),
	--from	de_ui_slider slid  (nolock),
	--		es_comp_ctrl_type_mst ctrl (nolock)
	--where	slid.customer_name  	= ctrl.customer_name  	
	--and		slid.project_name  		= ctrl.project_name  	
	--and		slid.process_name  		= ctrl.process_name  	
	--and		slid.component_name  	= ctrl.component_name  
	----and		ctrl.control_type		= ctrl.ctrl_type_name
	--and		ctrl.base_ctrl_type		= 'Slider'
	--and		slid.customer_name  	= @engg_customer_name
	--and		slid.project_name  		= @engg_project_name
	--and		slid.ecrno    			= @engg_req_no
	--and		slid.process_name  		= @process_name
	--and		slid.component_name  	= @engg_component
	--and		slid.activity_name  	= @activity_name
	--and		slid.ui_name    		= @ui_name_tmp
	--and		slid.control_id			= 'TimeLine'
	--order by 1

	--open slider_curs1

	--fetch next from slider_curs1 into 
	--@controlid,@SliderType, @SliderBehav, @RenderType, @Orientation, @Startvalue, @Endvalue, @Stepvalue, @SliderValue, @Showvalue, @ShowTooltip,@ctrltype

	--WHILE @@FETCH_STATUS = 0   
	--BEGIN 
	
	--	select	@event_req	= isnull(event_handling_req,'N')
	--	from	es_comp_ctrl_type_mst (nolock)
	--	where	customer_name	= @engg_customer_name
	--	and		project_name  	= @engg_project_name		
	--	and		process_name  	= @process_name
	--	and		component_name  = @engg_component
	--	and		ctrl_type_name	= @ctrltype

	--select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	--select @sql = '<Slider Name="' 		+ ltrim(rtrim(isnull(@controlid,'')))			+ '" ' +					
	--'SliderType="'		+ ltrim(rtrim(isnull(@SliderType,''))) 			+ '" ' +	
	--'SliderBehaviour="'		+ ltrim(rtrim(isnull(@SliderBehav,''))) 			+ '" ' +
	--'RenderType="'		+ ltrim(rtrim(isnull(@RenderType,''))) 			+ '" ' +
	--'Orientation="'		+ ltrim(rtrim(isnull(@Orientation,''))) 			+ '" ' +
	--'StartValue="'		+ ltrim(rtrim(isnull(@StartValue,''))) 			+ '" ' +
	--'EndValue="'		+ ltrim(rtrim(isnull(@EndValue,0))) 			+ '" ' +
	--'Stepvalue="'		+ ltrim(rtrim(isnull(@Stepvalue,0))) 			+ '" ' +
	--'SliderValue="'		+ ltrim(rtrim(isnull(@SliderValue,0))) 			+ '" ' +
	--'ShowValue="'		+ ltrim(rtrim(isnull(@ShowValue,''))) 			+ '" ' +
	--'ShowTooltip="'		+ ltrim(rtrim(isnull(@ShowTooltip,''))) 			+ '" ' +
	--'EventRequired="'		+ ltrim(rtrim(isnull(@event_req,''))) 			+ '" ' 	
	--select @sql = @sql +'/>'
		

	--insert into ep_genxml_tmp
	--(customer_name,   project_name,   req_no,   process_name,  component_name,
	--activity_name,    guid,    gen_xml,seq_no)
	--values
	--(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	--@activity_name,  @guid,    
	--@sql ,@xml_seq_tmp_out)
	
	--		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	--		insert into ep_genxml_tmp
	--		(customer_name,   project_name,   req_no,   process_name,  component_name,
	--		activity_name,    guid,    gen_xml,seq_no)
	--		values
	--		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	--		@activity_name,  @guid,    '<Steps>',@xml_seq_tmp_out)

	--		Declare Cusslider_curs cursor FAST_FORWARD for
	--		select	StepLabel, StepValue, StepTooltip
	--		--from	de_published_ui_slider slid  (nolock),
	--		from	de_ui_custom_slider slid  (nolock)
	--		where	slid.customer_name  	= @engg_customer_name
	--		and		slid.project_name  		= @engg_project_name
	--		and		slid.ecrno    			= @engg_req_no
	--		and		slid.process_name  		= @process_name
	--		and		slid.component_name  	= @engg_component
	--		and		slid.activity_name  	= @activity_name
	--		and		slid.ui_name    		= @ui_name_tmp
	--		and		slid.control_bt_synonym = @controlid
	--		order by StepValue
	
	--		open Cusslider_curs

	--		fetch next from Cusslider_curs into @steplabel, @stepmlvalue , @steptt

	--		WHILE @@FETCH_STATUS = 0   
	--		BEGIN 

			
	--			select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	--			select @sql = '<Step Label="' 		+ ltrim(rtrim(isnull(@steplabel,'')))			+ '" ' +					
	--			'Value="'		+ ltrim(rtrim(isnull(@stepmlvalue,''))) 			+ '" ' +	
	--			'Tooltip="'		+ ltrim(rtrim(isnull(@steptt,''))) 			+ '" ' 	
	--			select @sql = @sql +'/>'
	
	--			insert into ep_genxml_tmp
	--			(customer_name,   project_name,   req_no,   process_name,  component_name,
	--			activity_name,    guid,    gen_xml,seq_no)
	--			values
	--			(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	--			@activity_name,  @guid,    
	--			@sql ,@xml_seq_tmp_out)

	--		fetch next from Cusslider_curs into @steplabel, @stepmlvalue , @steptt

	--		END
	--		close Cusslider_curs
	--		deallocate Cusslider_curs

	--		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	--		insert into ep_genxml_tmp
	--		(customer_name,  project_name,   req_no,   process_name,  component_name,
	--		activity_name,    guid,    gen_xml,seq_no)
	--		values
	--		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	--		@activity_name,  @guid,    '</Steps>',@xml_seq_tmp_out)

	--		fetch next from slider_curs1 into 
	--		@controlid,@SliderType, @SliderBehav, @RenderType, @Orientation, @Startvalue, @Endvalue, @Stepvalue, @SliderValue, @Showvalue, @ShowTooltip, @ctrltype


	--		END
	--		close slider_curs1
	--		deallocate slider_curs1

	--		select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	--		insert into ep_genxml_tmp
	--		(customer_name,   project_name,   req_no,   process_name,  component_name,
	--		activity_name,    guid,    gen_xml,seq_no)
	--		values
	--		(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	--		@activity_name,  @guid,    '</Slider>',@xml_seq_tmp_out)
	------------------------------Slider Ends


	select @xml_seq_tmp_out=@xml_seq_tmp_out+1
	insert into ep_genxml_tmp
	(customer_name,   project_name,   req_no,   process_name,  component_name,
	activity_name,    guid,    gen_xml,seq_no)
	values
	(@engg_customer_name, @engg_project_name, @engg_req_no,   @process_name, @engg_component,
	@activity_name,  @guid,    '</Properties>',@xml_seq_tmp_out)


set nocount off 
end




