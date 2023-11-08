Attach_document   -- will do only download
Browse Button enable -- will do upload
sp_who2
Attachment without Description   : 
es_comp_ctrl_type_mst_extn
kill 57
Test cases:
1. Header control download - Relative Document Path - Attachment without Description  attach_document = 'y' and attachmentwithdesc = 'n' and relative document path = 'dfdsf'
control name: Document4
2. Grid Column download - Relative Document Path - Attachment without Description
Comp:not	ui: M3AttachNotes control: Document5, Document6
3. Header control upload - Relative Document Path - Attachment without Description  attach_document = 'y' and Browse_Button_Enable = 'y' and attachmentwithdesc = 'n' and relative document path = 'dfdsf'
Comp : Srpps_pco_billing ui : Srpps_ptnr_tmsht control : Attachdocument
4. Grid Column  upload - Relative Document Path - Attachment without Description 
Comp : Srpps_pco_billing ui : Srpps_CustomerProf column : Atta_Atta


Header control upload - Relative Image Path Attachment without Description attach_document = 'y' and Browse_Button_Enable = 'y' and attachmentwithdesc = 'n' and relative image path = 'dfdsf'

Header control download - Relative Image Path Attachment without Description   attach_document = 'y' and attachmentwithdesc = 'n' and relative image path = 'dfdsf'
Grid Column  download - Relative Image Path Attachment without Description 

Grid Column  upload - Relative Image Path Attachment without Description 

Header control download - Relative Document Path - Attachment with Description 
Header control download - Relative Image Path Attachment with Description 
Header control upload - Relative Document Path - Attachment with Description 
Header control upload - Relative Image Path Attachment with Description 

Grid Column download - Relative Document Path - Attachment with Description 
Grid Column  download - Relative Image Path Attachment with Description 
Grid Column  upload - Relative Document Path - Attachment with Description 
Grid Column  upload - Relative Image Path Attachment with Description 
