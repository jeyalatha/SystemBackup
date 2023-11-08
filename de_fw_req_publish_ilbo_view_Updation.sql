-----Publish table Updation (de_fw_req_publish_ilbo_view)

Begin Tran

--Control
Update de_fw_req_publish_ilbo_view 
set ctrl_type_name	=	a.control_type,
	store_path		=	CASE WHEN (isnull(b.relative_document_path,'')) <> '' 
						THEN  LOWER(LTRIM(RTRIM(b.relative_document_path))) 
						ELSE LOWER(LTRIM(RTRIM(isnull(b.relative_image_path,'')))) 
						END,
	systemgeneratedfileid	=	ISNULL(b.systemgeneratedfileid,'n')
from de_ui_control     a (nolock),    
es_comp_ctrl_type_mst  b (nolock),    
de_fw_req_ilbo_control  c (nolock),
de_fw_req_publish_ilbo_view  d (nolock)    
where  a.customer_name  = b.customer_name    
and    a.project_name   = b.project_name    
and    a.process_name   = b.process_name    
and    a.component_name = b.component_name    
and    a.control_type   = b.ctrl_type_name    
and    a.customer_name  = c.customer_name    
and    a.project_name   = c.project_name    
and    a.component_name = c.component_name    
and    a.ui_name		= c.ilbocode    
and    a.page_bt_synonym= c.page_bt_synonym    
and    a.control_bt_synonym = c.control_bt_synonym    
and    a.control_id  = c.controlid   
and   a.customer_name   = d.customername    
and   a.project_name    = d.projectname    
and   a.process_name	= d.processname    
and   a.component_name	= d.componentname  
and   a.ui_name			= d.ilbocode
and   a.control_id		= d.controlid
and   a.view_name		= d.viewname
and    b.base_ctrl_type not in  ('Grid','StackedLinks','RSSlider','Assorted', 'Pivot', 'TreeGrid', 'ListView')   --kanagavel    
and    b.base_ctrl_type  not in ('link','button','line')    
and    a.control_type  not in ('filler' , 'filler2')    
and	  (isnull(b.relative_document_path,'')<>'' or isnull(b.relative_image_path,'')<>'')

and a.customer_name = 'BCDG'
and a.project_name = '7H118'
and a.process_name = 'SRPCRM'
and a.component_name = 'SRPCRMWKP'
and d.ecrno = 'WKP_ECR_00253'

--Grid
Update de_fw_req_publish_ilbo_view 
set ctrl_type_name	=	a.column_type,
	store_path		=	CASE WHEN (isnull(b.relative_document_path,'')) <> '' 
						THEN  LOWER(LTRIM(RTRIM(b.relative_document_path))) 
						ELSE LOWER(LTRIM(RTRIM(isnull(b.relative_image_path,'')))) 
						END,
	systemgeneratedfileid	=	ISNULL(b.systemgeneratedfileid,'n')
from  de_ui_grid a(nolock),    
es_comp_ctrl_type_mst b(nolock),    
de_fw_req_ilbo_control c(nolock) ,
de_fw_req_publish_ilbo_view  d (nolock)
where a.customer_name   = b.customer_name    
and   a.project_name    = b.project_name    
and   a.process_name	= b.process_name    
and   a.component_name	= b.component_name    
and   a.column_type		= b.ctrl_type_name    
and   a.customer_name   = c.customer_name    
and   a.project_name    = c.project_name    
and   a.component_name  = c.component_name    
and   a.ui_name			= c.ilbocode    
and   a.control_bt_synonym = c.control_bt_synonym  
and   a.customer_name   = d.customername    
and   a.project_name    = d.projectname    
and   a.process_name	= d.processname    
and   a.component_name	= d.componentname  
and   a.ui_name			= d.ilbocode
and   a.control_id		= d.controlid
and   a.view_name		= d.viewname
and   b.base_ctrl_type  not in ('button')    
and   B.ctrl_type_name  not in ('filler' , 'filler2')
and	  (isnull(b.relative_document_path,'')<>'' or isnull(b.relative_image_path,'')<>'')


and a.customer_name = 'BCDG'
and a.project_name = '7H118'
and a.process_name = 'SRPCRM'
and a.component_name = 'SRPCRMWKP'
and d.ecrno = 'WKP_ECR_00253'

-- For updating glance ui controls storepath for non-aviation for both header / grid columns 
update	de_fw_req_publish_ilbo_view
SET		store_path = b.StaticStorePath,
		systemgeneratedfileid	= CASE	WHEN b.systemgeneratedfileid= 'yes' THEN 'n' 
									WHEN b.systemgeneratedfileid = 'no' THEN 'y'
									ELSE b.systemgeneratedfileid END
FROM	de_fw_req_publish_ilbo_view a (nolock),
		NGPlatform.dbo.ngplf_published_common_properties b
WHERE	a.customername		= b.customerid
and		a.projectname		= b.projectid
and		a.processname		= b.processname
and		a.componentname		= b.componentname
and		a.ilbocode			= b.uiname
and		a.controlid			= b.ControlName
and		a.viewname			= b.viewname
and		isnull(b.StaticStorePath, '') <> ''
and		isnull(b.IsAviation, 'n') IN ('n','no')


and a.customername = 'BCDG'
and a.projectname = '7H118'
and a.processname = 'SRPCRM'
and a.componentname = 'SRPCRMWKP'
and a.ecrno = 'WKP_ECR_00253'
-- For resetting store path for aviation attachments

update	de_fw_req_publish_ilbo_view
set		store_path = ''
from	de_fw_req_publish_ilbo_view a (nolock),
		es_comp_ctrl_type_mst b (nolock)    
where	a.customername		= b.customer_name
and		a.projectname		= b.project_name
and     a.processname		= b.process_name
and     a.componentname	    = b.component_name
and		a.ctrl_type_name	= b.ctrl_type_name
and		(isnull(b.relative_document_path,'')	<> '' 
or		isnull(b.relative_image_path,'')		<> '')
and		isnull(b.avn_download, 'n')				= 'Y'


and a.customername = 'BCDG'
and a.projectname = '7H118'
and a.processname = 'SRPCRM'
and a.componentname = 'SRPCRMWKP'
and a.ecrno = 'WKP_ECR_00253'

commit

rollback


