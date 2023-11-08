/*$File_version=ms4.3.0.06$*/    
/********************************************************************************/    
/* Procedure     : FSE_PmtH_Sp_GetParam_Spo      */    
/* Description     :             */    
/********************************************************************************/    
/* Project      :              */    
/* EcrNo      : FSE_ECR_00034          */    
/* Version      :              */    
/********************************************************************************/    
/* Referenced     :              */    
/* Tables      :              */    
/********************************************************************************/    
/* Development history   : 14H109_FSET_00019        */    
/********************************************************************************/    
/* Author      : Nithya S          */    
/* Date       : Mar 22 2017 03:51PM       */    
/********************************************************************************/    
/* Modification History   :  epe-6617   kavitha r  16 may 2018   */    
/* Modification History   :  epe-6617   sasirekha  18 may 2018   */    
/********************************************************************************/    
/* Sejal N Khimani     27 Nov 2019      EPE-17371   */    
/* Priyadarshini R     27 Dec 2019      EPE-17313   */  
/* Abinaya V     20-01-2022 ` EPE-41583 */    
    
CREATE Procedure FSE_PmtH_Sp_GetParam_Spo    
 @ctxt_ouinstance       fin_ctxt_ouinstance,      
 @ctxt_user             fin_ctxt_user,      
 @ctxt_language         fin_ctxt_language,      
 @ctxt_service          fin_ctxt_service,      
 @ctxt_role             fin_ctxt_role,      
 @business_process12    fin_text255,      
 @business_unit1        fin_text255,      
 @company_12121         fin_companycode,      
 @component_12          fin_text255,      
 @guid                  fin_guid,      
 @levelofparameters     fin_text255,      
 @organization_unit121  fin_ouinstname,      
 @text_search           fin_text255,      
 @tvwtreesecnodeid      udd_nvarcharmax,      
 @m_errorid             fin_int output --To Return Execution Status    
as    
    
Begin    
 -- nocount should be switched on to prevent phantom rows    
 Set nocount on    
 -- @m_errorid should be 0 to Indicate Success    
 Select @m_errorid = 0    
    
 --declaration of temporary variables    
    
    
 --temporary and formal parameters mapping    
    
 Select @ctxt_user             = ltrim(rtrim(@ctxt_user))    
 Select @ctxt_service          = ltrim(rtrim(@ctxt_service))    
 Select @ctxt_role             = ltrim(rtrim(@ctxt_role))    
 Select @business_process12    = ltrim(rtrim(@business_process12))    
 Select @business_unit1        = ltrim(rtrim(@business_unit1))    
 Select @company_12121         = ltrim(rtrim(@company_12121))    
 Select @component_12          = ltrim(rtrim(@component_12))    
 Select @guid                  = ltrim(rtrim(@guid))    
 Select @levelofparameters     = ltrim(rtrim(@levelofparameters))    
 Select @organization_unit121  = ltrim(rtrim(@organization_unit121))    
 Select @text_search           = ltrim(rtrim(@text_search))    
 Select @tvwtreesecnodeid      = ltrim(rtrim(@tvwtreesecnodeid))    
    
 --null checking    
    
 IF @ctxt_ouinstance = -915    
  Select @ctxt_ouinstance = null      
    
 IF @ctxt_user = '~#~'     
  Select @ctxt_user = null      
    
 IF @ctxt_language = -915    
  Select @ctxt_language = null      
    
 IF @ctxt_service = '~#~'     
  Select @ctxt_service = null      
    
 IF @ctxt_role = '~#~'     
  Select @ctxt_role = null      
    
 IF @business_process12 = '~#~'     
  Select @business_process12 = null      
    
 IF @business_unit1 = '~#~'     
  Select @business_unit1 = null      
    
 IF @company_12121 = '~#~'     
  Select @company_12121 = null      
    
 IF @component_12 = '~#~'     
  Select @component_12 = null      
    
 IF @guid = '~#~'     
  Select @guid = null      
    
 IF @levelofparameters = '~#~'     
  Select @levelofparameters = null      
    
 IF @organization_unit121 = '~#~'     
  Select @organization_unit121 = null      
    
 IF @text_search = '~#~'     
  Select @text_search = null      
    
 IF @tvwtreesecnodeid = '~#~'     
  Select @tvwtreesecnodeid = null      
    
 declare @date_tmp    fin_date,    
   @all_tmp    fin_desc40,    
   @hdn_bu_combo   fin_int,    
   @hdn_co     fin_int,    
   @hdn_bu     fin_int,    
   @hdn_inst_combo   fin_int,    
   @tax_type    udd_type,    
   @tax_community   udd_type    
     
 select @date_tmp   = dbo.RES_Getdate(@ctxt_ouinstance)    
    
 select @all_tmp   = parameter_text    
 from fin_quick_code_met with (nolock)    
 where component_id  = 'FSET'    
 and  parameter_type  = 'COMBO'     
 and  parameter_category = 'ALL'    
 and  language_id   = @ctxt_language    
    
 if isnull(@levelofparameters,'') in (@all_tmp,'')    
  select @levelofparameters = null    
     
 if isnull(@company_12121,'')  in (@all_tmp,'')    
  select @company_12121  = null    
    
 if isnull(@business_unit1,'') in (@all_tmp,'')    
  select @business_unit1 = null    
    
 if isnull(@business_process12,'') in (@all_tmp,'')    
  select @business_process12 = null    
    
 if isnull(@component_12,'') in (@all_tmp,'')    
  select @component_12 = null    
        
 if isnull(@organization_unit121,'') in (@all_tmp,'')    
  select @organization_unit121 = null    
 else    
  Select @organization_unit121= ou_id    
  from emod_ou_vw  with (nolock)    
  where ouinstname  = @organization_unit121    
  and  @date_tmp between isnull(effective_from, @date_tmp) and isnull(effective_to, @date_tmp)     
     
 select @text_search  = '%'+isnull(@text_search,'')+'%'    
        
 select @levelofparameters = parameter_code    
 from fin_quick_code_met with (nolock)    
 where component_id  = 'FSET'    
 and  parameter_type  = 'COMBO'     
 and  parameter_category = 'PARAMETER'    
 and  parameter_text  = @levelofparameters    
 and  language_id   = @ctxt_language    
     
 select @tax_type  = min(rtrim(tax_type))    
 from cps_taxcommunity_vw  with (nolock)    
 where /*ou    = @ctxt_ouinstance--EPE-17313    
 and */ company_code = @company_12121     
 order by 1    
     
 select @tax_community = (rtrim(tax_community))    
 from cps_taxcommunity_vw  with (nolock)    
 where /*ou    = @ctxt_ouinstance--EPE-17313     
 and  */company_code = @company_12121    
 and  tax_type  = @tax_type    
 order by 1     


      
 if @levelofparameters  = 'FN'    
 begin     
  select @business_process12 = bpc_code    
  from fset_treeparam_met with (nolock)    
  where bpc_desc   = @business_process12    
  and  type_code   = @levelofparameters    
  and  language_id   = @ctxt_language    
     
  select @component_12  = component_code    
  from fset_treeparam_met with (nolock)    
  where component_desc  = @component_12    
  and  type_code   = @levelofparameters    
  and  language_id   = @ctxt_language    
    
  declare @table table    
  (    
  parameter_category fin_desc255    
  )    
    
  insert into @table     
  (    
   parameter_category    
  )    
  select parameter_category     
  from fset_parameters_met met(nolock)    
  where bpc_code   = 'GTS'    
    
    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  AdjInptaxwithOuttax  = 'N'  and parameter_category = 'AUTO_ADJ')    
    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
  where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  AvailKKC     = 'N'  and parameter_category = 'AVAIL_KKC')    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  CentAvailInpCrRecon  = 'N'  and parameter_category = 'CENTAVAILINPCRRECON')    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  DefSTNinSTR    = 'N'  and parameter_category = 'DEFSTNINSTR')    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  ItemUsageMappingToTaxGroup= 'N'  and parameter_category = 'ITEM_USG_TAXGRP_MAP')    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and Retention     = 'N'  and parameter_category = 'TAX_RET_CAL')    
    
     
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and SerPaybySerRecvr   = 'N'  and parameter_category = 'SERPAYBYSERRECVR')    
     
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and TaxInvAmtDifTaxAmtPur  = 'N'  and parameter_category = 'TAX_AMT_DIFF_PUR')    
    
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and TaxInvAmtDifTaxAmtSal  = 'N'  and parameter_category = 'TAX_AMT_DIFF_SAL')    
     
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  UtiofSerInpCrd   = 'N'  and parameter_category = 'DLF_SER_INPCREPER')    
                   
  delete     
  from @table    
  where parameter_category in  (select parameter_category from @table,    
         tcal_setfunct_state_metadata(nolock)    
        where tax_type     =   @tax_type    
        and  tax_community    =   @tax_community    
        and  eratetype_post   = 'N'  and parameter_category = 'ERATE_TYPE')    
    
 end    
 else    
 begin    
  select @business_process12 = activity_code    
  from fset_treeparam_met with (nolock)    
  where activity_desc  = @business_process12    
  and  type_code   = @levelofparameters    
  and  language_id   = @ctxt_language    
 end    
     
 if @levelofparameters   = 'BU'    
 begin    
  select @company_12121  = company_code,    
    @organization_unit121= ou_id     
  from emod_ou_vw with (nolock)    
  where bu_id    = @business_unit1    
  and  @date_tmp between isnull(effective_from, @date_tmp) and isnull(effective_to, @date_tmp)    
 end    
    
 if @ctxt_user = 'debuguser$'    
 begin    
  select  'select @levelofparameters,@business_process12,@component_12,@company_12121,@business_unit1,@organization_unit121,@text_search'    
  select  @levelofparameters,@business_process12,@component_12,@company_12121,@business_unit1,@organization_unit121,@text_search    
 end    
    
    
 if @ctxt_Service <> 'fse_pmth_sr_get'    
 begin    
  declare @node_id  fin_desc40    
  declare @node_type  fin_desc40    
  declare @node_desc  fin_desc40    
  declare @parent_id  fin_desc40    
      
  select  @parent_id  = parent_id,    
    @node_type  = node_type,    
    @node_desc  = node_desc,    
    @node_id  = node_id    
  from fset_parameters_tmp with (nolock)    
  where guid   = @guid   
    
  
      
  delete from fset_parameters_tmp     
  where   guid   = @guid    
     
  if @parent_id in ('root','child')    
  begin    
   select @parent_id = @node_id    
   select @node_id  = NULL    
  end    
     
 if @ctxt_user = 'debuguser$$'    
 begin    
  select  'select @parent_id,@node_type,@node_desc,@node_id'    
  select  @parent_id,@node_type,@node_desc,@node_id    
 end    
    
 /* Code added for EPE-17371 Begins */    
     
 exec fse_pmth_sp_getparam_scm_spo     
   @ctxt_ouinstance,    
   @ctxt_user,    
   @ctxt_language,    
   @ctxt_service,    
   @ctxt_role,    
   @business_process12,    
   @business_unit1,    
   @company_12121,    
   @component_12,    
   @guid,    
   @levelofparameters,    
   @organization_unit121,    
   @text_search,    
   @tvwtreesecnodeid,    
   @parent_id,    
   @node_type,    
   @node_desc,    
   @node_id,    
   @m_errorid output    
     
 /* Code added for EPE-17371 Ends */    
        
  if @parent_id = 'IN'    
  begin    
   Select distinct    
     activity_desc 'businessprocess_',     
     null   'business_unit',     
     case when isnull(company_code,'0') = '0' then '' else company_code end    
         'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     null   'organization_unit',     
     parametername 'parameter',      
     f.parameter_text'value',    
     @ctxt_ouinstance'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     0    'hdn_global',    
     case when @node_id='glsys' then 0 else 1 end    
          'hdn_co',     
     0     'hdn_bu',    
     --EPE-17313    
     parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'    
      --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ips_processparam_sys i with (nolock),    
     fin_quick_code_met f with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = i.parameter_category    
   and  i.parameter_type   = m.activity_code    
   and  ((m.activity_code   =   'GLSYS' and i.company_code in ('0',''))    
      or     
      (m.activity_code  =   'CPSYS' and isnull(@company_12121,i.company_code) = i.company_code and i.company_code not in ('0','')))    
   and  i.language_id    = @ctxt_language    
   and  f.component_id    = 'IPS'    
   and  f.parameter_type   = 'COMBO'    
   and  i.parameter_category  = f.parameter_category    
   and  i.parameter_code   = f.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  m.direct_match    = 'N'    
   union    
   Select distinct    
     activity_desc 'businessprocess_',     
     null   'business_unit',     
     case when isnull(company_code,'0') = '0' then '' else company_code end    
         'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     null   'organization_unit',     
     parametername 'parameter',      
     i.parameter_code'value',    
     @ctxt_ouinstance'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     0    'hdn_global',    
     case when @node_id='glsys' then 0 else 1 end    
          'hdn_co',     
     0     'hdn_bu'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'     
     --EPE-17313    
   from fset_parameters_met m with (nolock),    
     ips_processparam_sys i with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = i.parameter_category    
   and  i.parameter_type = m.activity_code    
   and  ((m.activity_code  =   'GLSYS' and i.company_code in ('0',''))    
      or     
      (m.activity_code  =   'CPSYS' and isnull(@company_12121,i.company_code) = i.company_code and i.company_code not in ('0','')))    
   and  i.language_id    = @ctxt_language    
   and  m.direct_match    = 'Y'    
       
  end    
      
  if @parent_id = 'CO'    
  begin    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
         'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',     
     f.parameter_text'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     0    'hdn_global',    
     1    'hdn_co',     
     0     'hdn_bu'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  f.component_id    = 'CPS'    
   and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  = c.parameter_category    
   and  f.parameter_code   = c.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
         'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',     
     c.parameter_code'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     0    'hdn_global',    
     1    'hdn_co',     
     0     'hdn_bu'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  m.direct_match    = 'Y'    
   union    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
         'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     vw.description  'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  vw.ou_id     = c.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = c.parameter_code    
   and  m.direct_match    = 'E'    
  union    
  --EPE-17313 starts     
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
         'company_1212',     
     component_code 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     isnull(dbo.fin_quickcode_desc('CPS','COMBO','YESNO',m.direct_match,@ctxt_language),'')       'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global',    
     parametername 'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                            usage_id,type_code/*,component_code*/,activity_code,ou.ou_id) 'hdimdlparam_text_new'     
   from   fset_parameters_met m with (nolock),    
                           fw_admin_view_component ad with(nolock),    
                           fin_quick_code_met qk with(nolock)left outer join    
                           cps_workflowparam_sys c(nolock)    
              on            (   c.company_code  =     @company_12121    
                           and  c.language_id    =     @ctxt_language    
                           and  c.component_id   =     qk.parameter_category    
                           and  c.workflow_tran  =     qk.parameter_code)    
                           right outer join emod_ou_vw ou with (nolock)    
              on            ou.ou_id                          = c.ou_id           
              where   type_code                         = @parent_id    
              and           activity_code                     = isnull(@node_id,activity_code)    
              and           c.company_code                    = isnull(@company_12121,c.company_code)    
         and           c.language_id                     = @ctxt_language    
              and           ad.componentname                  = qk.parameter_category                 
              and           qk.component_id                   = 'CPS'             
              and           qk.parameter_type                 = 'WFTRAN'    
              and           qk.language_id                    = @ctxt_language    
              and           qk.parameter_text                 = m.parametername    
       
  ----EPE-17313 ends    
  end    
      
  if @parent_id = 'BU'    
  begin    
   Select distinct    
     activity_desc 'businessprocess_',     
     b.bu_id   'business_unit',     
     company_code 'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',     
     f.parameter_text'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1     'hdn_co',     
     1    'hdn_bu',     
     0    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                  usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     bps_processparam_sys b with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = b.parameter_category    
   and  b.parameter_type   = m.activity_code    
   and  b.bu_id      = isnull(@business_unit1,b.bu_id)    
   and  ou.company_code    = isnull(@company_12121,ou.company_code)    
   and  b.language_id    = @ctxt_language    
   and  f.component_id    = 'BPS'    
   --and  f.parameter_type   = 'COMBO'    
   and  f.parameter_type   = b.parameter_type    
   and  f.parameter_category  = b.parameter_category    
   and  f.parameter_code   = b.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = b.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc 'businessprocess_',     
     b.bu_id   'business_unit',     
     company_code 'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',     
     b.parameter_code'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1     'hdn_co',     
     1    'hdn_bu',     
     0    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     bps_processparam_sys b with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = b.parameter_category    
   and  b.parameter_type   = m.activity_code    
   and  b.bu_id      = isnull(@business_unit1,b.bu_id)    
   and  ou.company_code    = isnull(@company_12121,ou.company_code)    
   and  b.language_id    = @ctxt_language    
   and  ou.ou_id     = b.ou_id    
   and  m.direct_match    = 'Y'    
  end    
      
  if @parent_id = 'OU'    
  begin    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     company_code 'company_1212',     
     component_desc 'component_11',     
   type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     f.parameter_text'value',    
     o.ou_id   'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  f.component_id    = 'OPS'    
   and  f.parameter_category  = o.parameter_category    
   and  f.parameter_code   = o.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     company_code 'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     o.parameter_code'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'Y'    
   union    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     company_code 'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     vw.description  'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  vw.ou_id     = o.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = o.parameter_code    
   and  m.direct_match    = 'E'    
      
  union    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     ou.company_code 'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     case o.parameter_category     
      when  'DEF_CAP_DATE' then dbo.fin_quickcode_desc('OPS','FASYS','DEFCAPDAT',parameter_code,@ctxt_language)    
      when  'DEF_INSER_DATE' then dbo.fin_quickcode_desc('OPS','FASYS','DEFINSERDAT',parameter_code,@ctxt_language)    
      when  'AUTO_DEF_ITEMDESC' then dbo.fin_quickcode_desc('OPS','FASYS','AUTOITEMDESC',parameter_code,@ctxt_language)      
      when  'ALW_AUTO_CAP_INV' then dbo.fin_quickcode_desc('OPS','FASYS','ALLOWAUTOCAP',parameter_code,@ctxt_language)    
      else parameter_code    
     end 'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
    1    'hdn_bu',     
     1    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys_fa o with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = @parent_id    
   and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121    
              and ou_id = isnull(@organization_unit121,o.ou_id))      
   and  param_level     = 'OU'    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'N'    
  end    
    
  if @levelofparameters = 'FN' and @node_id is null    
  begin    
    
   --Direct matching with fin_processparam_sys    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = m.component_code    
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       --and  m.component_code   = f.component_id    
       and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,           
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)  --EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = m.component_code    
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    --and  m.component_code   = f.component_id    
    and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'Y'    
   end    
       
   --No Direct matching with fin_processparam_sys    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = m.component_code    
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'N'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,   type_desc,    
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
       1,       1,           
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id    
    --and  e.component_id    = m.component_code     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'N'    
   end    
   if exists ( Select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
       and  m.parametername    like @text_search    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'N'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'N'    
   end    
       
   --exchange rate description    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock),    
         erate_etype_vw vw with (nolock)    
       where type_code      = @parent_id    
       and  ((m.bpc_code     = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code    = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id     = f.component_id     
       --and  e.bfg_code      = bfg.bfg_code    
       --and  bfg.bpc_code     = m.bpc_code    
       and  f.parameter_type    = m.activity_code    
       and  m.parameter_category   = f.parameter_category    
       and  m.component_code    = f.component_id    
       and  f.company_code     = isnull(@company_12121,f.company_code)    
       and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id     = @ctxt_language    
       and  ou.ou_id      = f.ou_id     
       and  ou.company_code     = f.company_code    
       and  vw.ou_id      = f.ou_id    
       and  vw.language_id     = @ctxt_language    
       and  vw.exchrate_type    = f.parameter_code     
       and  m.direct_match     = 'E'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
     -- emod_bfg_component_met e with (nolock),    
     -- emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock),    
      erate_etype_vw vw with (nolock)    
    where type_code      = @parent_id    
    and  ((m.bpc_code     = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code    = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
   ---- and  e.component_id     = f.component_id     
    --and  e.bfg_code      = bfg.bfg_code    
    --and  bfg.bpc_code     = m.bpc_code    
    and  f.parameter_type    = m.activity_code    
    and  m.parameter_category   = f.parameter_category    
    and  m.component_code    = f.component_id    
    and  f.company_code     = isnull(@company_12121,f.company_code)    
    and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id     = @ctxt_language    
    and  ou.ou_id      = f.ou_id     
    and  ou.company_code     = f.company_code    
    and  vw.ou_id      = f.ou_id    
    and  vw.language_id     = @ctxt_language    
    and  vw.exchrate_type    = f.parameter_code     
    and  m.direct_match     = 'E'    
   end     
   --Metadata matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_category    
       and  met.parameter_code   = f.parameter_code    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'M'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_category    
    and  met.parameter_code   = f.parameter_code    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'M'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_category    
       and  met.parameter_code   = f.parameter_text    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'MC'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_category    
    and  met.parameter_code   = f.parameter_text    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'MC'    
end           
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_code    
       and  met.parameter_code   = f.parameter_text    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'M'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_code    
    and  met.parameter_code   = f.parameter_text    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'M'    
   end     
        
    --MAC Parameters drect matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         mac_parameters mac with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.parameter_category  = mac.ma_param_group    
       and  m.component_code   = mac.component_id    
       and  ma_company_no    = isnull(@company_12121,ma_company_no)    
       and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
       and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_status     = 'A'    
       and  mac.ou_id     = ou.ou_id    
       and  ma_company_no    = ou.company_code    
       and  mac.bu_id     = ou.bu_id   
and m.direct_match    = 'Y'    
)   
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      mac.bu_id,     
      ma_company_no,    component_desc,    type_desc,     
      ouinstname,     parametername,     ma_param_value,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      mac_parameters mac with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.parameter_category  = mac.ma_param_group    
    and  m.component_code   = mac.component_id    
    and  ma_company_no    = isnull(@company_12121,ma_company_no)    
    and mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
    and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_status     = 'A'    
    and  mac.ou_id     = ou.ou_id    
    and  ma_company_no    = ou.company_code    
    and  mac.bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end    
        
    --CBUD Parameters drect matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         cbud_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_company_code    = isnull(@company_12121,ma_company_code)    
       and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_code    = ou.company_code    
       and  ma_bu_id     = ou.bu_id    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     ma_bu_id,     
      ma_company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ma_param_value,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      cbud_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_code    = isnull(@company_12121,ma_company_code)    
 and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_code    = ou.company_code    
    and  ma_bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
    
    update fset_parameters_tmp    
    set  value      = parameter_text    
    from fin_quick_code_met  with (nolock)    
    where component_id    = 'CBUD'    
    and  parameter_type    = 'FNBG'    
    and  parameter_category   = 'VARINFB'    
    and  language_id     = @ctxt_language    
    and  guid      = @guid    
    and  usage_id     = 'FUN_MAC_COSTBUD'    
    and  value      in ('P','R')    
    and  parameter_code    = value    
   end    
        
    --DPRUP Parameters drect matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         mac_dprup_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
       and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_code    = ou.bu_id    
       and  ma_bu_id     = ou.company_code    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      ma_company_code,     
      ma_bu_id,      component_desc,    type_desc,     
      ouinstname,     parametername,    ma_param_value,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      mac_dprup_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
    and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_code    = ou.bu_id    
    and  ma_bu_id     = ou.company_code    
    and  m.direct_match    = 'Y'    
   end    
        
    --PPRUP Parameters drect matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         mac_pprup_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
 and  ma_company_code   = isnull(@company_12121,ma_company_code)    
       and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_code    = ou.company_code    
       and  ma_bu_id     = ou.bu_id    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     ma_bu_id,     
      ma_company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,     ma_param_value,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      mac_pprup_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_code    = isnull(@company_12121,ma_company_code)    
    and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_code    = ou.company_code    
    and  ma_bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end    
        
    --ODSS Parameters drect matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         odss_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_company_no    = isnull(@company_12121,ma_company_no)    
       and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_no    = ou.company_code    
       and  ma_bu_id     = ou.bu_id    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      ma_bu_id,     
      ma_company_no,    component_desc,    type_desc,     
      ouinstname,     parametername,     ma_param_value,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      odss_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_no    = isnull(@company_12121,ma_company_no)    
    and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_no    = ou.company_code    
    and  ma_bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end    
        
    --AMIG Parameters drect matching case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         amig_process_parameter_sys a with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.parameter_category   = a.parameter_category    
       and  m.activity_code     = a.parameter_code    
       --and  ma_company_no    = isnull(@company_12121,ma_company_no)    
       --and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
       and  a.ou_id      = isnull(@organization_unit121,a.ou_id)    
       and  language_id     = @ctxt_language    
       and  a.ou_id      = ou.ou_id    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      amig_process_parameter_sys a with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.parameter_category   = a.parameter_category    
    and  m.activity_code     = a.parameter_code    
    --and  ma_company_no    = isnull(@company_12121,ma_company_no)    
    --and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  a.ou_id      = isnull(@organization_unit121,a.ou_id)    
    and  ou.company_code    = isnull(@company_12121,company_code)    
    and  bu_id      =   isnull(@business_unit1,bu_id)    
    and  language_id     = @ctxt_language    
    and  a.ou_id      = ou.ou_id    
    and  m.direct_match    = 'Y'    
   end    
        
    --CALL parameters direct matching    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock),    
         call_parameters f with (nolock) left outer join          
         fin_quick_code_met met with (nolock)    
       on  (   met.component_id   = f.ma_component_id    
          and  met.parameter_category  = f.ma_param_group    
          and  met.parameter_code   = ma_param_value    
          and  met.language_id    = @ctxt_language    
          and  met.parameter_type   = 'COMBO'    
         )    
       where type_code     = @parent_id    
      and  ((m.bpc_code   = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  m.component_code   = ma_component_id    
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  ou.ou_id     = ma_ou_id     
       and  ou.company_code    = ma_company_code    
       and  ma_company_code    = isnull(@company_12121,ma_company_code)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  m.parameter_category  = f.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_lang_id     = @ctxt_language    
       and  m.direct_match    = 'C'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,     met.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      --emod_bfg_component_met e with (nolock),    
     -- emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock),    
      call_parameters f with (nolock) left outer join          
      fin_quick_code_met met with (nolock)    
    on  (   met.component_id   = f.ma_component_id    
       and  met.parameter_category  = f.ma_param_group    
       and  met.parameter_code   = ma_param_value    
       and  met.language_id    = @ctxt_language    
       and  met.parameter_type   = 'COMBO'    
      )    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.component_code   = ma_component_id    
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  ou.ou_id     = ma_ou_id     
    and  ou.company_code    = ma_company_code    
    and  ma_company_code    = isnull(@company_12121,ma_company_code)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  m.parameter_category  = f.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_lang_id     = @ctxt_language    
    and  m.direct_match    = 'C'    
   end    
        
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PT'    
  )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,    parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PT'    
     )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id ,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
   where type_code   = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PTC'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PTC'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
        or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PTT'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PTT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PC'    
      )    
   begin    
    insert into fset_parameters_tmp    
(    
      guid,      bpc_desc,  bu_id,    
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_code,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PC'    
   end    
       
   --To show Ou Description    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'OUPC'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ouinstname,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code   = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'OUPC'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'OUPT'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ouinstname,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'OUPT'    
   end    
   ---EPE-17313    
   --TCAL Parameters    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         emod_ou_vw ou with (nolock),    
         @table  der    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and     m.parameter_category  = der.parameter_category    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and  m.direct_match    = 'Y'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
)    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    case     
                     when m.parameter_category = 'DFLT_PUR_TAX_CATEGORY' then  dflt_pur_tax_category    
                     when m.parameter_category = 'DFLT_SAL_TAX_CATEGORY' then  dflt_sal_tax_category    
                     when m.parameter_category = 'DFLT_PUR_TAX_CLASS'  then  dflt_pur_tax_class    
                     when m.parameter_category = 'DFLT_SAL_TAX_CLASS'  then  dflt_sal_tax_class    
                     when m.parameter_category = 'TAX_ROUND_OFF'   then  convert(nvarchar,tax_round_off)    
                     when m.parameter_category = 'DLF_SER_INPCREPER'  then dlf_ser_inpcreper    
                      when m.parameter_category = 'DFLT_DEDUCTIBLE_PER'  then convert(nvarchar,dflt_deductible_per)    
                     else null     
                     end,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      emod_ou_vw ou with (nolock),    
      @table der    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  m.component_code   = 'TCAL'    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and     m.parameter_category  = der.parameter_category    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and  m.direct_match    = 'Y'    
   end    
    
    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         tcal_comp_metadata_vw vw,    
         emod_ou_vw ou with (nolock),    
         @table der    
       where type_code     = @parent_id    
       and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
         or    
         (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and     m.parameter_category  = der.parameter_category    
       and  t.tax_type     = vw.tax_type    
       and  t.tax_community    = vw.tax_community    
       and  vw.paramcode    = case     
                   when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
                   when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
                   when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
                   when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
                   when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
                   when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
                   when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
                   when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
                   when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
                   when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
                   when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
                   when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
                   when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
                   when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
                   when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
                   when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
                   when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
       when m.parameter_category = 'REVDOC_IRN_CANC'    then isnull(revdoc_IRN,'') --EPE-41583   
                   else ''    
                   end    
       and  vw.langid     = @ctxt_language    
       and  vw.paramcategory   = 'COMBO'    
       and  m.direct_match    = 'N'    
       and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
     )    
   begin     
    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    paramdesc_shd,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      tcal_comp_metadata_vw vw,    
      emod_ou_vw ou with (nolock)    
      ,    
      @table der    
    where type_code     = @parent_id    
    and  ((m.bpc_code    = isnull(@node_id,m.bpc_code) and @parent_id = 'FN')    
      or    
      (m.component_code   = isnull(@node_id,m.component_code) and  @parent_id = 'FN'))    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and     m.parameter_category  = der.parameter_category    
    and  t.tax_type     = vw.tax_type    
    and  t.tax_community    = vw.tax_community    
    and  vw.paramcode    = case     
               when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
               when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
               when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
               when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
               when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
               when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
               when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
               when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
               when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
               when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
               when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
              when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
      when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
               when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
               when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
               when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
               when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
      when m.parameter_category = 'REVDOC_IRN_CANC'    then isnull(revdoc_IRN,'') --EPE-41583  
                else ''    
                end    
    and  vw.langid     = @ctxt_language    
    and  vw.paramcategory   = 'COMBO'    
    and  m.direct_match    = 'N'    
    and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
    
   end    
  end    
  else if @levelofparameters = 'FN' and @node_id is not null    
  begin    
   
   --bpc level    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock)    
       where type_code    = @parent_id    
       and  m.bpc_code    = isnull(@node_id,m.bpc_code)    
       and  language_id    = 1    
      )    
   begin     
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          --emod_bfg_component_met e with (nolock),    
         -- emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        --and  e.component_id    = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end     
        --and  e.bfg_code     = bfg.bfg_code    
       -- and  bfg.bpc_code    = m.bpc_code    
        --and  bfg.language_id    = @ctxt_language    
        and  f.parameter_type    = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        --and  m.component_code   = f.component_id    
        and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'Y' )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       ou.company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     f.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       --emod_bfg_component_met e with (nolock),    
       --emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     --and  e.component_id    = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end     
     --and  e.bfg_code     = bfg.bfg_code    
     --and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     --and  m.component_code   = f.component_id   
     and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id  = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'Y'    
    end    
         
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          --emod_bfg_component_met e with (nolock),    
          --emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        --and  e.component_id    = f.component_id     
        --and  e.bfg_code     = bfg.bfg_code    
        --and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'N'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,     f.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       --emod_bfg_component_met e with (nolock),    
      -- emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
    -- and  e.component_id    = f.component_id     
     --and  e.bfg_code     = bfg.bfg_code    
    -- and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
 and  m.direct_match    = 'N'    
    end    
        
    if exists ( Select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parametername    like @text_search    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_code    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'N'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
  company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    f.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_code    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'N'    
    end    
         
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          --emod_bfg_component_met e with (nolock),    
          --emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock),    
          erate_etype_vw vw with (nolock)    
        where type_code      = @parent_id    
        and  m.bpc_code      = isnull(@node_id,m.bpc_code)    
       -- and  e.component_id     = f.component_id     
       -- and  e.bfg_code      = bfg.bfg_code    
       -- and  bfg.bpc_code     = m.bpc_code    
        and  f.parameter_type    = m.activity_code    
        and  m.parameter_category   = f.parameter_category    
        and  m.component_code    = f.component_id    
        and  f.company_code     = isnull(@company_12121,f.company_code)    
        and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id     = @ctxt_language    
        and  ou.ou_id      = f.ou_id     
        and  ou.company_code     = f.company_code    
        and  vw.ou_id      = f.ou_id    
        and  vw.language_id     = @ctxt_language    
        and  vw.exchrate_type    = f.parameter_code     
        and  m.direct_match     = 'E'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,    bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    f.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
      -- emod_bfg_component_met e with (nolock),    
      -- emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock),    
       erate_etype_vw vw with (nolock)    
     where type_code      = @parent_id    
     and  m.bpc_code      = isnull(@node_id,m.bpc_code)    
     --and  e.component_id     = f.component_id     
    -- and  e.bfg_code      = bfg.bfg_code    
    -- and  bfg.bpc_code = m.bpc_code    
     and f.parameter_type    = m.activity_code    
     and  m.parameter_category   = f.parameter_category    
     and  m.component_code    = f.component_id    
     and  f.company_code     = isnull(@company_12121,f.company_code)    
     and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id     = @ctxt_language    
     and  ou.ou_id      = f.ou_id     
     and  ou.company_code     = f.company_code    
     and  vw.ou_id      = f.ou_id    
     and  vw.language_id     = @ctxt_language    
     and  vw.exchrate_type    = f.parameter_code     
     and  m.direct_match     = 'E'    
    end    
         
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          --emod_bfg_component_met e with (nolock),    
         -- emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock),    
          fin_quick_code_met met with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        --and  e.component_id    = f.component_id     
       -- and  e.bfg_code     = bfg.bfg_code    
       -- and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  met.component_id   = m.component_code    
        and  met.parameter_category  = f.parameter_category    
        and  met.parameter_code   = f.parameter_code    
        and  met.language_id    = @ctxt_language    
        and  m.direct_match    = 'M'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    met.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       --emod_bfg_component_met e with (nolock),    
       --emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock),    
       fin_quick_code_met met with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
    -- and  e.component_id    = f.component_id     
    -- and  e.bfg_code     = bfg.bfg_code    
    -- and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  met.component_id   = m.component_code    
     and  met.parameter_category  = f.parameter_category    
  and  met.parameter_code   = f.parameter_code    
     and  met.language_id    = @ctxt_language    
     and  m.direct_match    = 'M'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          emod_ou_vw ou with (nolock),    
          fin_quick_code_met met with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  met.component_id   = m.component_code    
        and  met.parameter_category  = f.parameter_category    
        and  met.parameter_code   = f.parameter_text    
        and  met.language_id    = @ctxt_language    
        and  m.direct_match    = 'MC'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    met.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       emod_ou_vw ou with (nolock),    
       fin_quick_code_met met with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  met.component_id   = m.component_code    
     and  met.parameter_category  = f.parameter_category    
     and  met.parameter_code   = f.parameter_text    
     and  met.language_id    = @ctxt_language    
     and  m.direct_match    = 'MC'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          emod_ou_vw ou with (nolock),    
          fin_quick_code_met met with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_code    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  met.component_id   = m.component_code    
        and  met.parameter_category  = f.parameter_code    
        and  met.parameter_code   = f.parameter_text    
        and  met.language_id    = @ctxt_language    
        and  m.direct_match    = 'M'    
       )    
 begin   
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
  ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    met.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       emod_ou_vw ou with (nolock),    
       fin_quick_code_met met with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_code    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  met.component_id   = m.component_code    
     and  met.parameter_category  = f.parameter_code    
     and  met.parameter_code   = f.parameter_text    
     and  met.language_id    = @ctxt_language    
     and  m.direct_match    = 'M'    
    end    
           
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          mac_parameters mac with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parameter_category  = mac.ma_param_group    
        and  m.component_code   = mac.component_id    
        and  ma_company_no    = isnull(@company_12121,ma_company_no)    
        and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
        and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
        and  ma_lang_id     = @ctxt_language    
        and  ma_status     = 'A'    
        and  mac.ou_id     = ou.ou_id    
        and  ma_company_no    = ou.company_code    
        and  mac.bu_id     = ou.bu_id    
        and  m.direct_match    = 'Y'     
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     mac.bu_id,     
       ma_company_no,     component_desc,    type_desc,     
       ouinstname,     parametername,     ma_param_value,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       mac_parameters mac with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.parameter_category  = mac.ma_param_group    
     and  m.component_code   = mac.component_id    
     and  ma_company_no    = isnull(@company_12121,ma_company_no)    
     and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
     and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
     and  ma_lang_id     = @ctxt_language    
     and  ma_status     = 'A'    
     and  mac.ou_id     = ou.ou_id    
     and  ma_company_no    = ou.company_code    
     and  mac.bu_id     = ou.bu_id    
  and  m.direct_match    = 'Y'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          cbud_parameters c with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parameter_category  = c.ma_param_group    
        and  m.component_code   = ma_component_id    
        and  ma_company_code    = isnull(@company_12121,ma_company_code)    
        and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
        and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
        and  ma_lang_id     = @ctxt_language    
        and  ma_ou_id     = ou.ou_id    
        and  ma_company_code    = ou.company_code    
        and  ma_bu_id     = ou.bu_id    
        and  m.direct_match    = 'Y'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      ma_bu_id,     
       ma_company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,     ma_param_value,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       cbud_parameters c with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.parameter_category  = c.ma_param_group    
     and  m.component_code   = ma_component_id    
     and  ma_company_code    = isnull(@company_12121,ma_company_code)    
     and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
     and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
     and  ma_lang_id     = @ctxt_language    
     and  ma_ou_id     = ou.ou_id    
     and  ma_company_code    = ou.company_code    
     and  ma_bu_id     = ou.bu_id    
     and  m.direct_match    = 'Y'    
    end     
         
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          mac_dprup_parameters c with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parameter_category  = c.ma_param_group    
        and  m.component_code   = ma_component_id    
        and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
        and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
        and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
        and  ma_lang_id     = @ctxt_language    
        and  ma_ou_id     = ou.ou_id    
        and  ma_company_code    = ou.bu_id    
        and  ma_bu_id     = ou.company_code    
        and  m.direct_match    = 'Y'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     ma_company_code,     
       ma_bu_id,     component_desc,    type_desc,     
       ouinstname,     parametername,    ma_param_value,    
       ou.ou_id,  usage_id,     1,   
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       mac_dprup_parameters c with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.parameter_category  = c.ma_param_group    
     and  m.component_code   = ma_component_id    
     and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
     and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
     and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
     and  ma_lang_id     = @ctxt_language    
     and  ma_ou_id     = ou.ou_id    
     and  ma_company_code    = ou.bu_id    
     and  ma_bu_id     = ou.company_code    
     and  m.direct_match    = 'Y'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          mac_pprup_parameters c with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parameter_category  = c.ma_param_group    
        and  m.component_code   = ma_component_id    
        and  ma_company_code    = isnull(@company_12121,ma_company_code)    
        and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
        and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
        and  ma_lang_id     = @ctxt_language    
        and  ma_ou_id     = ou.ou_id    
        and  ma_company_code    = ou.company_code    
        and  ma_bu_id     = ou.bu_id    
        and  m.direct_match    = 'Y'     
       )    
    begin     
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      ma_bu_id,     
       ma_company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,    ma_param_value,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       mac_pprup_parameters c with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.parameter_category  = c.ma_param_group    
     and  m.component_code   = ma_component_id    
     and  ma_company_code    = isnull(@company_12121,ma_company_code)    
     and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
     and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
     and  ma_lang_id     = @ctxt_language    
     and  ma_ou_id     = ou.ou_id    
     and  ma_company_code    = ou.company_code    
     and  ma_bu_id     = ou.bu_id    
     and  m.direct_match    = 'Y'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          odss_parameters c with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parameter_category  = c.ma_param_group    
        and  m.component_code   = ma_component_id    
        and  ma_company_no    = isnull(@company_12121,ma_company_no)    
        and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
        and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
        and ma_lang_id     = @ctxt_language    
        and ma_ou_id     = ou.ou_id    
        and  ma_company_no    = ou.company_code    
        and  ma_bu_id     = ou.bu_id    
        and  m.direct_match    = 'Y'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     ma_bu_id,     
       ma_company_no,    component_desc,    type_desc,     
       ouinstname,     parametername,     ma_param_value,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       odss_parameters c with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.parameter_category  = c.ma_param_group    
     and  m.component_code   = ma_component_id    
     and  ma_company_no    = isnull(@company_12121,ma_company_no)    
     and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
     and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
     and  ma_lang_id     = @ctxt_language    
     and  ma_ou_id     = ou.ou_id    
     and  ma_company_no    = ou.company_code    
     and  ma_bu_id     = ou.bu_id    
     and  m.direct_match    = 'Y'    
    end    
        
    --AMIG Parameters drect matching case    
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          amig_process_parameter_sys a with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.parameter_category  = a.parameter_category    
        and  m.activity_code    = a.parameter_code    
        --and  ma_company_no   = isnull(@company_12121,ma_company_no)    
        --and  ma_bu_id    = isnull(@business_unit1,ma_bu_id)    
        and  a.ou_id      = isnull(@organization_unit121,a.ou_id)    
        and  language_id     = @ctxt_language    
        and  a.ou_id      = ou.ou_id    
        and  m.direct_match    = 'Y'    
       )    
    begin     
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       amig_process_parameter_sys a with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.parameter_category  = a.parameter_category    
     and  m.activity_code    = a.parameter_code    
     --and  ma_company_no   = isnull(@company_12121,ma_company_no)    
     --and  ma_bu_id    = isnull(@business_unit1,ma_bu_id)    
     and  a.ou_id      = isnull(@organization_unit121,a.ou_id)    
     and  ou.company_code    = isnull(@company_12121,company_code)    
     and  bu_id      =   isnull(@business_unit1,bu_id)    
     and  language_id     = @ctxt_language    
     and  a.ou_id      = ou.ou_id    
     and  m.direct_match    = 'Y'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          emod_bfg_component_met e with (nolock),    
          emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock),    
          call_parameters f with (nolock) left outer join          
          fin_quick_code_met met with (nolock)    
        on  (   met.component_id   = f.ma_component_id    
           and  met.parameter_category  = f.ma_param_group    
           and  met.parameter_code   = ma_param_value    
           and  met.language_id    = @ctxt_language    
           and  met.parameter_type   = 'COMBO'    
          )    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  m.component_code   = ma_component_id    
        --and  e.component_id    = ma_component_id     
        and  e.bfg_code     = bfg.bfg_code    
        and  bfg.bpc_code    = m.bpc_code    
        and  ou.ou_id     = ma_ou_id     
        and  ou.company_code    = ma_company_code    
        and  ma_company_code    = isnull(@company_12121,ma_company_code)    
        and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
        and  m.parameter_category  = f.ma_param_group    
        and  ma_lang_id     = @ctxt_language    
        and  m.direct_match    = 'C'    
       )    
    begin     
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,   bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,     met.parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       --emod_bfg_component_met e with (nolock),    
       --emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock),    
       call_parameters f with (nolock) left outer join          
       fin_quick_code_met met with (nolock)    
     on  (   met.component_id   = f.ma_component_id    
        and  met.parameter_category  = f.ma_param_group    
        and  met.parameter_code   = ma_param_value    
        and  met.language_id    = @ctxt_language    
        and  met.parameter_type   = 'COMBO'    
       )    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  m.component_code   = ma_component_id    
     --and  e.component_id    = ma_component_id     
     --and  e.bfg_code     = bfg.bfg_code    
     --and  bfg.bpc_code    = m.bpc_code    
     and  ou.ou_id     = ma_ou_id     
     and  ou.company_code    = ma_company_code    
     and  ma_company_code    = isnull(@company_12121,ma_company_code)    
     and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
     and  m.parameter_category  = f.ma_param_group    
     and  ma_lang_id     = @ctxt_language    
     and  m.direct_match    = 'C'    
    end    
        
    --INTCOTRAN Parameters drect matching case    
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
         -- emod_bfg_component_met e with (nolock),    
         -- emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
       -- and  e.component_id    = f.component_id     
       -- and e.bfg_code     = bfg.bfg_code    
       -- and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_code    
and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'PT'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       f.company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
      -- emod_bfg_component_met e with (nolock),    
      -- emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
    -- and  e.component_id    = f.component_id     
    -- and  e.bfg_code     = bfg.bfg_code    
    -- and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_code    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'PT'    
    end      
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
         -- emod_bfg_component_met e with (nolock),    
         -- emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        --and  e.component_id    = f.component_id     
       -- and  e.bfg_code     = bfg.bfg_code    
       -- and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'PT'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       f.company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
      -- emod_bfg_component_met e with (nolock),    
      -- emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     --and  e.component_id    = f.component_id     
     --and  e.bfg_code     = bfg.bfg_code    
     --and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'PT'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
         -- emod_bfg_component_met e with (nolock),    
         -- emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
       -- and  e.component_id    = f.component_id     
       -- and  e.bfg_code     = bfg.bfg_code    
       -- and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'PTC'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       f.company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       --emod_bfg_component_met e with (nolock),    
       --emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     --and  e.component_id    = f.component_id     
     --and  e.bfg_code     = bfg.bfg_code    
     --and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'PTC'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
     -- emod_bfg_component_met e with (nolock),    
         -- emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
 and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
       -- and  e.component_id    = f.component_id     
       -- and  e.bfg_code     = bfg.bfg_code    
       -- and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'PTT'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,      bu_id,     
       f.company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     parameter_text,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
      -- emod_bfg_component_met e with (nolock),    
      -- emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     --and  e.component_id    = f.component_id     
     --and  e.bfg_code     = bfg.bfg_code    
     --and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'PTT'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          --emod_bfg_component_met e with (nolock),    
          --emod_bfg_met bfg with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        --and  e.component_id    = f.component_id     
        --and  e.bfg_code     = bfg.bfg_code    
        --and  bfg.bpc_code    = m.bpc_code    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'PC'    
       )    
    begin    
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
)    
     Select distinct    
     @guid,      bpc_desc,      bu_id,     
       f.company_code,    component_desc,    type_desc,     
       ouinstname,     parametername,     parameter_code,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       --emod_bfg_component_met e with (nolock),    
       -- emod_bfg_met bfg with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     --and  e.component_id    = f.component_id     
     --and  e.bfg_code     = bfg.bfg_code    
     --and  bfg.bpc_code    = m.bpc_code    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'PC'    
    end    
        
    --To show Ou Description    
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_code    
        and  m.component_code   = f.component_id    
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'OUPT'    
      )    
    begin     
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    ouinstname,    
       ou.ou_id,     usage_id,     1,     
       1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_code    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'OUPT'    
    end    
        
    if exists ( select 'X'    
        from fset_parameters_met m with (nolock),    
          fin_processparam_sys f with (nolock),    
          emod_ou_vw ou with (nolock)    
        where type_code     = @parent_id    
        and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  f.parameter_type   = m.activity_code    
        and  m.parameter_category  = f.parameter_category    
        and  m.component_code   = f.component_id   
        and  f.company_code    = isnull(@company_12121,f.company_code)    
        and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
        and  f.language_id    = @ctxt_language    
        and  ou.ou_id     = f.ou_id     
        and  ou.company_code    = f.company_code    
        and  m.direct_match    = 'OUPC'    
      )    
    begin     
     insert into fset_parameters_tmp    
     (    
       guid,      bpc_desc,     bu_id,       
       company_code,    component_desc,    type_desc,    
       ouinstname,     parametername,    value,    
       hdn_ou_param,    usage_id,     hdn_co,    
       hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
     )    
     Select distinct    
       @guid,      bpc_desc,     bu_id,     
       ou.company_code,   component_desc,    type_desc,     
       ouinstname,     parametername,    ouinstname,    
       ou.ou_id,   usage_id,     1,     
       1,       1,    
       dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
     from fset_parameters_met m with (nolock),    
       fin_processparam_sys f with (nolock),    
       emod_ou_vw ou with (nolock)    
     where type_code     = @parent_id    
     and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
     and  f.parameter_type   = m.activity_code    
     and  m.parameter_category  = f.parameter_category    
     and  m.component_code   = f.component_id    
     and  f.company_code    = isnull(@company_12121,f.company_code)    
     and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
     and  f.language_id    = @ctxt_language    
     and  ou.ou_id     = f.ou_id     
     and  ou.company_code    = f.company_code    
     and  m.direct_match    = 'OUPC'    
    end    
        
   --TCAL Parameters    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         emod_ou_vw ou with (nolock),    
         @table der    
       where type_code     = @parent_id    
       and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and     m.parameter_category  = der.parameter_category    
       and  m.direct_match    = 'Y'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    case     
                     when m.parameter_category = 'DFLT_PUR_TAX_CATEGORY' then  dflt_pur_tax_category    
                     when m.parameter_category = 'DFLT_SAL_TAX_CATEGORY' then  dflt_sal_tax_category    
                     when m.parameter_category = 'DFLT_PUR_TAX_CLASS'  then  dflt_pur_tax_class    
                     when m.parameter_category = 'DFLT_SAL_TAX_CLASS'  then  dflt_sal_tax_class    
                     when m.parameter_category = 'TAX_ROUND_OFF'   then  convert(nvarchar,tax_round_off)    
                     when m.parameter_category = 'DLF_SER_INPCREPER'  then dlf_ser_inpcreper    
                      when m.parameter_category = 'DFLT_DEDUCTIBLE_PER'  then convert(nvarchar,dflt_deductible_per)    
  else null     
      end,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      emod_ou_vw ou with (nolock),    
      @table der    
    where type_code     = @parent_id    
    and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
    and  m.component_code   = 'TCAL'    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and     m.parameter_category  = der.parameter_category    
    and  m.language_id    = @ctxt_language   
    and  ou.company_code    = t.company_code    
    and  m.direct_match    = 'Y'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         tcal_comp_metadata_vw vw,    
         emod_ou_vw ou with (nolock)    
         ,    
         @table der    
       where type_code     = @parent_id    
       and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and     m.parameter_category  = der.parameter_category    
       and  t.tax_type     = vw.tax_type    
       and  t.tax_community    = vw.tax_community    
       and  vw.paramcode    = case     
                   when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
                   when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
                   when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
                   when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
                   when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
                   when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
                   when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
                   when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
                   when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
                   when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
                   when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
                   when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
                   when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
                   when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
                   when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
                   when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
                   when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
    
                   else ''    
                   end    
       and  vw.langid     = @ctxt_language    
       and  vw.paramcategory   = 'COMBO'    
       and  m.direct_match    = 'N'    
       and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
   guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
   hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    paramdesc_shd,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      tcal_comp_metadata_vw vw,    
      emod_ou_vw ou with (nolock)    
      ,    
      @table der    
    where type_code     = @parent_id    
    and  m.bpc_code     = isnull(@node_id,m.bpc_code)    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and     m.parameter_category  = der.parameter_category    
    and  t.tax_type     = vw.tax_type    
    and  t.tax_community    = vw.tax_community    
    and  vw.paramcode    = case     
               when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
               when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
               when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
               when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
               when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
               when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
               when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
               when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
               when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
               when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
               when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
               when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
               when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
               when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
               when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
               when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
               when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
                else ''    
                end    
    and  vw.langid     = @ctxt_language    
    and  vw.paramcategory   = 'COMBO'    
    and  m.direct_match    = 'N'    
    and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
   end    
  end    
  else    
  begin     
   --component level parameters    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       --and  e.component_id    = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       --and  m.component_code   = f.component_id    
       and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    --and  e.component_id    = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end     
    -- and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    --and  m.component_code   = f.component_id    
    and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'Y'    
   end    
        
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
        -- emod_bfg_component_met e with (nolock),    
        -- emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock),    
         erate_etype_vw vw with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       --and  e.component_id     = f.component_id     
       --and  e.bfg_code      = bfg.bfg_code    
       --and  bfg.bpc_code     = m.bpc_code    
       and  f.parameter_type    = m.activity_code    
       and  m.parameter_category   = f.parameter_category    
       and  m.component_code    = f.component_id    
       and  f.company_code     = isnull(@company_12121,f.company_code)    
       and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id     = @ctxt_language    
       and  ou.ou_id      = f.ou_id     
       and  ou.company_code     = f.company_code    
       and  vw.ou_id      = f.ou_id    
       and  vw.language_id     = @ctxt_language    
and  vw.exchrate_type    = f.parameter_code     
       and  m.direct_match     = 'E'    
      )    
   begin     
    insert into fset_parameters_tmp    
    (    
 guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock),    
      erate_etype_vw vw with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    --and  e.component_id     = f.component_id     
    -- and  e.bfg_code      = bfg.bfg_code    
    --and  bfg.bpc_code     = m.bpc_code    
    and  f.parameter_type    = m.activity_code    
    and  m.parameter_category   = f.parameter_category    
    and  m.component_code    = f.component_id    
    and  f.company_code     = isnull(@company_12121,f.company_code)    
    and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id     = @ctxt_language    
    and  ou.ou_id      = f.ou_id     
    and  ou.company_code     = f.company_code    
    and  vw.ou_id      = f.ou_id    
    and  vw.language_id     = @ctxt_language    
    and  vw.exchrate_type    = f.parameter_code     
    and  m.direct_match     = 'E'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
        -- emod_bfg_component_met e with (nolock),    
        -- emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_category    
       and  met.parameter_code   = f.parameter_code    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'M'     
      )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      ou.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     met.parameter_text,    
      ou.ou_id,     usage_id, 1,     
  1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
  usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
     -- emod_bfg_component_met e with (nolock),    
  -- emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_category    
    and  met.parameter_code   = f.parameter_code    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'M'    
   end    
    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_code    
       and  met.parameter_code   = f.parameter_text    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'M'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)   
    and  f.ou_id     = isnull(@organization_unit121,f.ou_id)    
and  f.language_id    = @ctxt_language    
    and  ou.ou_id  = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id  = m.component_code    
    and  met.parameter_category  = f.parameter_code    
    and  met.parameter_code   = f.parameter_text    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'M'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_category    
       and  met.parameter_code   = f.parameter_text    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'MC'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_category    
    and  met.parameter_code   = f.parameter_text    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'MC'    
   end    
         
   if exists ( select 'X'     
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
       --  emod_bfg_component_met e with (nolock),    
       --  emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
      -- and  e.component_id     = f.component_id     
      -- and  e.bfg_code      = bfg.bfg_code    
     -- and  bfg.bpc_code     = m.bpc_code    
       and  f.parameter_type    = m.activity_code    
       and  m.parameter_category   = f.parameter_category    
      and  m.component_code    = f.component_id    
       and  f.company_code     = isnull(@company_12121,f.company_code)    
       and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id     = @ctxt_language    
       and  ou.ou_id      = f.ou_id     
       and  ou.company_code     = f.company_code    
       and  m.direct_match     = 'N'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      ou.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
     -- emod_bfg_component_met e with (nolock),    
     -- emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    --and  e.component_id     = f.component_id     
    --and  e.bfg_code      = bfg.bfg_code    
    --and  bfg.bpc_code     = m.bpc_code    
    and  f.parameter_type    = m.activity_code    
    and  m.parameter_category   = f.parameter_category    
    and  m.component_code    = f.component_id    
    and  f.company_code     = isnull(@company_12121,f.company_code)    
    and  f.ou_id       = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id     = @ctxt_language    
    and  ou.ou_id      = f.ou_id     
    and  ou.company_code     = f.company_code    
    and  m.direct_match     = 'N'    
   end    
       
   if exists ( Select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       and  m.parametername    like @text_search    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'N'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    f.parameter_text,    
      ou.ou_id,     usage_id,     1,     
   1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                 usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
  fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'N'    
   end    
        
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         mac_parameters mac with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  m.parameter_category  = mac.ma_param_group    
       and  m.component_code   = mac.component_id    
       and  ma_company_no    = isnull(@company_12121,ma_company_no)    
       and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
       and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_status     = 'A'    
       and  mac.ou_id     = ou.ou_id    
       and  ma_company_no    = ou.company_code    
       and  mac.bu_id     = ou.bu_id    
       and  m.direct_match    = 'Y'    
      )     
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      mac.bu_id,     
      ma_company_no,    component_desc,    type_desc,     
      ouinstname,     parametername,     ma_param_value,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      mac_parameters mac with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  m.parameter_category  = mac.ma_param_group    
    and  m.component_code   = mac.component_id    
    and  ma_company_no    = isnull(@company_12121,ma_company_no)    
    and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
    and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_status     = 'A'    
    and  mac.ou_id     = ou.ou_id    
    and  ma_company_no    = ou.company_code    
    and  mac.bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         cbud_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
     and  ma_company_code    = isnull(@company_12121,ma_company_code)    
   and  ma_bu_id   = isnull(@business_unit1,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_code    = ou.company_code    
       and  ma_bu_id     = ou.bu_id    
       and  m.direct_match    = 'Y'    
      )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     ma_bu_id,     
      ma_company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,     ma_param_value,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      cbud_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_code    = isnull(@company_12121,ma_company_code)    
    and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_code    = ou.company_code    
    and  ma_bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end     
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         mac_dprup_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
       and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_code    = ou.bu_id    
       and  ma_bu_id     = ou.company_code    
       and  m.direct_match    = 'Y'    
      )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      ma_company_code,     
      ma_bu_id,      component_desc,    type_desc,     
      ouinstname,     parametername,    ma_param_value,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      mac_dprup_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
 and  m.component_code   = isnull(@node_id,m.component_code)    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
    and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_code    = ou.bu_id    
    and  ma_bu_id     = ou.company_code    
    and  m.direct_match    = 'Y'    
   end    
       
   if exists ( select 'X'     
       from fset_parameters_met m with (nolock),    
         mac_pprup_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_company_code    = isnull(@company_12121,ma_company_code)    
       and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_code    = ou.company_code    
       and  ma_bu_id     = ou.bu_id    
       and  m.direct_match    = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     ma_bu_id,     
      ma_company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,     ma_param_value,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      mac_pprup_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_code    = isnull(@company_12121,ma_company_code)    
    and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_code    = ou.company_code    
    and  ma_bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end    
       
   if exists ( select 'X'     
       from fset_parameters_met m with (nolock),    
         odss_parameters c with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  m.parameter_category  = c.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_company_no    = isnull(@company_12121,ma_company_no)    
       and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ma_lang_id     = @ctxt_language    
       and  ma_ou_id     = ou.ou_id    
       and  ma_company_no    = ou.company_code    
       and  ma_bu_id     = ou.bu_id    
       and m.direct_match   = 'Y'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
   guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      ma_bu_id,     
      ma_company_no,     component_desc,    type_desc,     
      ouinstname,     parametername,    ma_param_value,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      odss_parameters c with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    and  m.parameter_category  = c.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_company_no    = isnull(@company_12121,ma_company_no)    
    and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  ma_lang_id     = @ctxt_language    
    and  ma_ou_id     = ou.ou_id    
    and  ma_company_no    = ou.company_code    
    and  ma_bu_id     = ou.bu_id    
    and  m.direct_match    = 'Y'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         amig_process_parameter_sys a with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code      = isnull(@levelofparameters,type_code)    
       and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
       and  m.component_code    = isnull(@node_id,m.component_code)    
       and  m.parameter_category   = a.parameter_category    
       and  m.activity_code     = a.parameter_code    
       and  ou.company_code     = isnull(@company_12121,ou.company_code)    
       and  ou.bu_id      = isnull(@business_unit1,bu_id)    
       and  ou.ou_id      = isnull(@organization_unit121,ou.ou_id)    
       and  a.ou_id       = isnull(@organization_unit121,a.ou_id)    
       and  language_id      = @ctxt_language    
       and  a.ou_id       = ou.ou_id    
       and  m.direct_match     = 'Y'    
      )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      company_code,     component_desc,    type_desc,     
      ouinstname,     parametername,    parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      amig_process_parameter_sys a with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code      = isnull(@levelofparameters,type_code)    
    and  m.bpc_code      = isnull(@parent_id,m.bpc_code)    
    and  m.component_code    = isnull(@node_id,m.component_code)    
    and  m.parameter_category   = a.parameter_category    
    and  m.activity_code     = a.parameter_code    
    and  ou.company_code     = isnull(@company_12121,ou.company_code)    
    and  ou.bu_id      = isnull(@business_unit1,bu_id)    
    and  ou.ou_id      = isnull(@organization_unit121,ou.ou_id)    
    and  language_id      = @ctxt_language    
    and  a.ou_id       = ou.ou_id    
    and  m.direct_match     = 'Y'    
  end    
       
if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
        -- emod_bfg_component_met e with (nolock),    
        -- emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock),    
         call_parameters f with (nolock) left outer join          
         fin_quick_code_met met with (nolock)    
       on  (   met.component_id   = f.ma_component_id    
          and  met.parameter_category  = f.ma_param_group    
          and  met.parameter_code   = ma_param_value    
          and  met.language_id    = @ctxt_language    
          and  met.parameter_type   = 'COMBO'    
         )    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       and  m.component_code   = ma_component_id    
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  ou.ou_id     = ma_ou_id     
       and  ou.company_code    = ma_company_code    
       and  ma_company_code    = isnull(@company_12121,ma_company_code)    
       and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  m.parameter_category  = f.ma_param_group    
       and  m.component_code   = ma_component_id    
       and  ma_lang_id     = @ctxt_language    
       and  m.direct_match    = 'C'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,     met.parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock),    
      call_parameters f with (nolock) left outer join          
      fin_quick_code_met met with (nolock)    
    on  (   met.component_id   = f.ma_component_id    
       and  met.parameter_category  = f.ma_param_group    
       and  met.parameter_code   = ma_param_value    
       and  met.language_id    = @ctxt_language    
       and  met.parameter_type   = 'COMBO'    
      )    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  m.component_code   = ma_component_id    
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  ou.ou_id     = ma_ou_id     
    and  ou.company_code    = ma_company_code    
    and  ma_company_code    = isnull(@company_12121,ma_company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
    and  m.parameter_category  = f.ma_param_group    
    and  m.component_code   = ma_component_id    
    and  ma_lang_id     = @ctxt_language    
    and  m.direct_match    = 'C'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PT'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PT'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname, parametername,   value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PTC'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PTC'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PTT'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PTT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         --emod_bfg_component_met e with (nolock),    
         --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock)    
 where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       --and  e.component_id    = f.component_id     
       --and  e.bfg_code     = bfg.bfg_code    
       --and  bfg.bpc_code    = m.bpc_code    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'PC'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,      bu_id,     
      f.company_code,    component_desc,    type_desc,     
      ouinstname,     parametername,     parameter_code,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      --emod_bfg_component_met e with (nolock),    
      --emod_bfg_met bfg with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    --and  e.component_id    = f.component_id     
    --and  e.bfg_code     = bfg.bfg_code    
    --and  bfg.bpc_code    = m.bpc_code    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'PC'    
   end    
       
   --To show Ou Description    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'OUPT'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param, usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid, bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ouinstname,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'OUPT'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'OUPC'    
     )    
  begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ouinstname,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'OUPC'    
   end    
       
   --TCAL Parameters    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),   
         emod_ou_vw ou with (nolock),    
         @table der    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.bu_id     = isnull(@business_unit1,bu_id)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and     m.parameter_category  = der.parameter_category    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and  m.direct_match    = 'Y'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    case     
                     when m.parameter_category = 'DFLT_PUR_TAX_CATEGORY' then  dflt_pur_tax_category    
                     when m.parameter_category = 'DFLT_SAL_TAX_CATEGORY' then  dflt_sal_tax_category    
                     when m.parameter_category = 'DFLT_PUR_TAX_CLASS'  then  dflt_pur_tax_class    
                     when m.parameter_category = 'DFLT_SAL_TAX_CLASS'  then  dflt_sal_tax_class    
                     when m.parameter_category = 'TAX_ROUND_OFF'   then  convert(nvarchar,tax_round_off)    
                     when m.parameter_category = 'DLF_SER_INPCREPER'  then dlf_ser_inpcreper    
                      when m.parameter_category = 'DFLT_DEDUCTIBLE_PER'  then convert(nvarchar,dflt_deductible_per)    
                     else null     
                     end,    
ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      emod_ou_vw ou with (nolock),    
      @table der    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  m.component_code   = 'TCAL'    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and  ou.bu_id     = isnull(@business_unit1,bu_id)    
    and     m.parameter_category  = der.parameter_category    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and  m.direct_match    = 'Y'    
   end    
       
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         tcal_comp_metadata_vw vw,    
         emod_ou_vw ou with (nolock)    
         ,    
         @table der    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
       and  m.component_code   = isnull(@node_id,m.component_code)    
       and  m.parametername    like @text_search    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and     m.parameter_category  = der.parameter_category    
       and  t.tax_type     = vw.tax_type    
       and  t.tax_community    = vw.tax_community    
       and  vw.paramcode    = case     
               when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
               when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
               when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
               when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
               when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
               when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
               when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
               when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
               when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
               when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
               when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
               when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
               when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
               when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
               when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
               when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
               when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
                   else ''    
     end    
       and  vw.langid     = @ctxt_language    
       and  vw.paramcategory   = 'COMBO'    
       and  m.direct_match    = 'N'    
       and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    paramdesc_shd,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      tcal_comp_metadata_vw vw,    
      emod_ou_vw ou with (nolock)    
      ,    
      @table der    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@parent_id,m.bpc_code)    
    and  m.component_code   = isnull(@node_id,m.component_code)    
    and  m.parametername    like @text_search    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and     m.parameter_category  = der.parameter_category    
    and  t.tax_type     = vw.tax_type    
    and  t.tax_community    = vw.tax_community    
    and  vw.paramcode    = case     
               when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
  when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
               when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
               when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
               when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
               when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
               when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
               when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
               when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
               when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
               when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
               when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
               when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
               when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
               when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
               when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
               when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
                else ''    
                end    
    and  vw.langid     = @ctxt_language    
    and  vw.paramcategory   = 'COMBO'    
    and  m.direct_match    = 'N'    
    and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
   end    
   end    
   end    
  
    --Code added for EPE-41583 starts  
   update tmp  
   set   tmp.value     = f.parameter_code  
   from   fin_processparam_sys f(nolock),  
    fset_parameters_tmp tmp(nolock)  
   where  guid   = @guid    
   and    f.component_id            = 'APLAN'      
   and    f.parameter_type          = 'COMBO'      
   and    f.parameter_category   in( 'COSTVAR','EXRVAR')  
   and    tmp.parametername   = f.parameter_text    
   and    f.company_code    = @company_12121  
   --Code added for EPE-41583 ends  
    
    select  bpc_desc    'businessprocess_',     
    bu_id     'business_unit',     
    company_code   'company_1212',     
    component_desc   'component_11',     
    type_desc    'context_1',     
    ouinstname    'organization_unit',     
    parametername   'parameter',     
    value     'value',    
    hdn_ou_param   'Hdn_OU_Param',    
    usage_id    'hdn_param',    
    hdn_co     'hdn_co',     
    hdn_bu     'hdn_bu',     
    hdn_global    'hdn_global'    
    /* Code added for EPE-17371 Begins */    
    ,parametername   'param_text_new',    
    --'{"tc": "bh","ta": "bhsysadd","ti": "bhsysaddmain","tci": [{"cid": "ctxtswouinstance","vwn": "ctxtswouinstance","v": "2"} ]}' 'hdimdlparam_text_new'    
    --hdn_link_dtl   'hdimdlparam_text_new'    
--    case when usage_id = 'POSETFN' then '{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'     
    --case when usage_id = 'POSETFN' then replace(hdn_link_dtl,'{mlparameters_grid.11}',hdn_ou_param)--'{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'     
    --  when usage_id = 'bhsetfn' then '{"tc": "bh","ta": "bhsysadd","ti": "bhsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"} ]}'--hdn_link_dtl    
    --  when usage_id = 'SARETSETFN' then replace(hdn_link_dtl,'{mlparameters_grid.11}',hdn_ou_param)--'{"tc": "saret","ta": "saretsysadd","ti": "saretsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "4"}]}'    
    --hdn_link_dtl--'{"tc":"saret","ta": "saretsysadd","ti": "saretsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"} ]}'--hdn_link_dtl    
    --  else  '{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'         
    --end 'hdimdlparam_text_new'    
    hdn_link_dtl   'hdimdlparam_text_new'    
    /* Code added for EPE-17371 Ends */    
  from fset_parameters_tmp  with (nolock)    
  where   guid   = @guid    
 end--end(tree node click)    
 else if @ctxt_service = 'fse_pmth_sr_get'    
 begin    
  -- select '@levelofparameters',@levelofparameters  
  /* Code added for EPE-17371 Begins */    
      
  exec fse_pmth_sp_getparam_scm_spo     
    @ctxt_ouinstance,    
    @ctxt_user,    
    @ctxt_language,    
    @ctxt_service,    
    @ctxt_role,    
    @business_process12,    
    @business_unit1,    
    @company_12121,    
    @component_12,    
    @guid,    
    @levelofparameters,    
    @organization_unit121,    
    @text_search,    
    @tvwtreesecnodeid,    
    @parent_id,    
    @node_type,    
    @node_desc,    
    @node_id,    
    @m_errorid output    
      
    /* Code added for EPE-17371 Ends */   
   
 --select '@levelofparameters',@levelofparameters  
        
  if @levelofparameters = 'IN'    
  begin    
--  select 'test_ar',@levelofparameters,@business_process12,@component_12,@text_search,@company_12121  
  
  
   Select distinct     
     activity_desc   'businessprocess_',     
     null     'business_unit',     
     case when isnull(company_code,'0') = '0' then '' else company_code end    
           'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     null     'organization_unit',     
   parametername   'parameter',      
     f.parameter_text  'value',    
     @ctxt_ouinstance  'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     case when @business_process12='GLSYS' then 0     
     else 1 end    'hdn_co',     
     0      'hdn_bu',     
     0      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ips_processparam_sys i with (nolock),    
     fin_quick_code_met f with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  m.parameter_category  = i.parameter_category    
   and  i.parameter_type   = m.activity_code    
   and  ((m.activity_code   =   'GLSYS' and i.company_code in ('0',''))    
      or     
      (m.activity_code  =   'CPSYS' and isnull(@company_12121,i.company_code) = i.company_code and i.company_code not in ('0','')))    
   and  i.language_id    = @ctxt_language    
   and  f.component_id    = 'IPS'    
   and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  = i.parameter_category    
   and  f.parameter_code   = i.parameter_code    
   --and  i.parameter_code   = case when f.parameter_category IN ('FAINSTALLDATE','PBCDATE','PAYMODAPPLI') then i.parameter_code else f.parameter_code end    
   and  f.language_id    = @ctxt_language    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc   'businessprocess_',     
     null     'business_unit',     
     case when isnull(company_code,'0') = '0' then '' else company_code end    
           'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     null     'organization_unit',     
     parametername   'parameter',      
     i.parameter_code  'value',    
     @ctxt_ouinstance  'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     case when @business_process12='GLSYS' then 0     
     else 1 end    'hdn_co',     
     0      'hdn_bu',     
     0      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'     
     --EPE-17313     
    
   from fset_parameters_met m with (nolock),    
     ips_processparam_sys i with (nolock),    
     fin_quick_code_met f with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  m.parameter_category  = i.parameter_category    
   and  i.parameter_type   = m.activity_code    
   and  ((m.activity_code   =   'GLSYS' and i.company_code in ('0',''))    
      or     
      (m.activity_code  =   'CPSYS' and isnull(@company_12121,i.company_code) = i.company_code and i.company_code not in ('0','')))    
   and  i.language_id    = @ctxt_language    
   and  m.direct_match    = 'Y'    
  end    
      
  if @levelofparameters = 'CO'    
  begin    
   Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     c.company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     f.parameter_text  'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     0       'hdn_bu',     
     0      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
    
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   --and  f.parameter_type   = c.parameter_type    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  f.component_id    = 'CPS'    
   and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  in  (c.parameter_category,'YESNO')    
   and  f.parameter_code   = c.parameter_code    
   --and  c.parameter_code   = case when c.parameter_category IN ('TAXTOLPCNT','TAXTOLTFLAT','MAXBANKCHARGES','SNPCSHLIMIT','SUPCUSCSHLIMIT','RETPROPVALUE') then c.parameter_code else f.parameter_code end    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc 'businessprocess_',     
     bu_id     'business_unit',     
     c.company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     c.parameter_code  'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     0       'hdn_bu',     
   0      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
    
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   --and  f.parameter_type   = c.parameter_type    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  m.direct_match    = 'Y'    
   union    
   Select distinct    
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
           'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     vw.description    'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1      'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  vw.ou_id     = c.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = c.parameter_code    
   and  m.direct_match    = 'E'    
  union    
  --EPE-17313 starts     
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id   'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
         'company_1212',     
     component_code 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
     isnull(dbo.fin_quickcode_desc('CPS','COMBO','YESNO',m.direct_match,@ctxt_language),'')'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global',    
     parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                usage_id,type_code/*,component_code*/,activity_code,ou.ou_id) 'hdimdlparam_text_new'     
   from   fset_parameters_met m with (nolock),    
                   fw_admin_view_component ad with(nolock),    
               fin_quick_code_met qk with(nolock)left outer join    
                   cps_workflowparam_sys c(nolock)    
              on   (      c.company_code    =   @company_12121    
                   and    c.language_id  =   @ctxt_language    
                   and    c.component_id    =  qk.parameter_category    
                   and    c.workflow_tran   =  qk.parameter_code)    
                   right outer join emod_ou_vw ou with (nolock)    
              on            ou.ou_id           =      c.ou_id           
              where type_code     = isnull(@levelofparameters,type_code)    
     and  ((bpc_code    = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
     and  ((component_code  = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
     and  m.parametername    like @text_search    
              and  activity_code   = isnull(@node_id,activity_code)    
              and       c.company_code          =   isnull(@company_12121,c.company_code)    
              and       c.language_id           =   @ctxt_language    
              and       ad.componentname        =   qk.parameter_category                 
              and       qk.component_id         =   'CPS'             
              and       qk.parameter_type       =   'WFTRAN'    
              and       qk.language_id          =   @ctxt_language    
              and       qk.parameter_text       =   m.parametername    
       
  --EPE-17313 ends    
  end    
      
  if @levelofparameters = 'BU'    
  begin    
   Select distinct    
     activity_desc   'businessprocess_',     
     b.bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',     
     f.parameter_text  'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1       'hdn_bu',     
     0      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     bps_processparam_sys b with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  m.parameter_category  = b.parameter_category    
   and  b.parameter_type   = m.activity_code    
   and  b.bu_id      = isnull(@business_unit1,b.bu_id)    
   and  b.bu_id      = ou.bu_id    
   and  ou.company_code    = isnull(@company_12121,ou.company_code)    
   and  b.language_id    = @ctxt_language    
   and  f.component_id    = 'BPS'    
   and  f.parameter_type   = b.parameter_type    
   and  f.parameter_category  = b.parameter_category    
   and  f.parameter_code   = b.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = b.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct    
     activity_desc   'businessprocess_',     
     b.bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
    type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',     
     b.parameter_code  'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1       'hdn_bu',     
     0      'hdn_global'    
     --EPE-17313  
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     bps_processparam_sys b with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  m.parameter_category  = b.parameter_category    
   and  b.parameter_type   = m.activity_code    
   and  b.bu_id      = isnull(@business_unit1,b.bu_id)    
   and  b.bu_id      = ou.bu_id    
   and  ou.company_code    = isnull(@company_12121,ou.company_code)    
   and  b.language_id    = @ctxt_language    
   and  ou.ou_id     = b.ou_id    
   and  m.direct_match    = 'Y'    
  end    
      
  if @levelofparameters = 'OU'    
  begin    
   Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ou.ouinstname   'organization_unit',     
     parametername   'parameter',      
     f.parameter_text  'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  o.parameter_type   = m.activity_code    
   and  m.parameter_category  = o.parameter_category    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
            where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  f.component_id    = 'OPS'    
   --and  f.parameter_type   = o.parameter_type    
   --and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  = o.parameter_category    
   and  f.parameter_code   = o.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ou.ouinstname   'organization_unit',     
     parametername   'parameter',      
     o.parameter_code  'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  o.parameter_type   = m.activity_code    
   and  m.parameter_category  = o.parameter_category    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'Y'    
   union    
   Select distinct    
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     vw.description    'value',    
     ou.ou_id    'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1      'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   and  m.parametername    like @text_search    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
 where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  vw.ou_id     = o.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = o.parameter_code    
   and  m.direct_match    = 'E'    
   union    
   Select distinct    
     activity_desc 'businessprocess_',     
     bu_id 'business_unit',     
     ou.company_code 'company_1212',     
     component_desc 'component_11',     
     type_desc  'context_1',     
     ouinstname  'organization_unit',     
     parametername 'parameter',      
  case o.parameter_category     
      when  'DEF_CAP_DATE' then dbo.fin_quickcode_desc('OPS','FASYS','DEFCAPDAT',parameter_code,@ctxt_language)    
      when  'DEF_INSER_DATE' then dbo.fin_quickcode_desc('OPS','FASYS','DEFINSERDAT',parameter_code,@ctxt_language)    
      when  'AUTO_DEF_ITEMDESC' then dbo.fin_quickcode_desc('OPS','FASYS','AUTOITEMDESC',parameter_code,@ctxt_language)      
      when  'ALW_AUTO_CAP_INV' then dbo.fin_quickcode_desc('OPS','FASYS','ALLOWAUTOCAP',parameter_code,@ctxt_language)    
      else parameter_code    
     end 'value',    
     ou.ou_id  'Hdn_OU_Param',    
     usage_id  'hdn_param',    
     1    'hdn_co',     
     1    'hdn_bu',     
     1    'hdn_global'    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys_fa o with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  ((bpc_code     = isnull(@business_process12,bpc_code) and @levelofparameters = 'FN')    
     or    
     (activity_code    = isnull(@business_process12,activity_code) and @levelofparameters <> 'FN')    
     )     
   and  ((component_code   = isnull(@component_12,component_code) and  @levelofparameters = 'FN')    
     or    
     ( @levelofparameters <> 'FN')    
     )     
   --and  activity_code    = isnull(@node_id,activity_code)    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121    
              and ou_id = isnull(@organization_unit121,o.ou_id))      
   and  param_level     = 'OU'    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'N'    
     
        
  end    
    
  if isnull(@levelofparameters,'FN') = 'FN'    
  begin    
     
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,  value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,       
  hdn_link_dtl--EPE-17313    
   )    
   Select distinct   
     @guid,      bpc_desc,     bu_id,     
     ou.company_code,    component_desc,    type_desc,     
     ouinstname,     parametername,    f.parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     emod_bfg_component_met e with (nolock),    
     emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  e.component_id    = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end     
   and  e.bfg_code     = bfg.bfg_code    
   and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   --and  m.component_code   = f.component_id    
   and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
   and  f.ou_id    = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'Y'    
       
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     bu_id,     
     ou.company_code,   component_desc,    type_desc,     
     ouinstname,     parametername,     met.parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock),    
     fin_quick_code_met met with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  met.component_id   = m.component_code    
   and  met.parameter_category  = f.parameter_category    
   and  met.parameter_code   = f.parameter_code    
   and  met.language_id    = @ctxt_language    
   and  m.direct_match    = 'M'   
     
   
        
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
       and  component_code    = isnull(@component_12,component_code)    
       and  m.parametername    like @text_search    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_category    
       and  met.parameter_code = f.parameter_text    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'MC'    
      )    
   begin    
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
    hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global, hdn_link_dtl--EPE-17313    
  )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
 ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
    and  component_code    = isnull(@component_12,component_code)    
    and  m.parametername    like @text_search    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_category    
    and  met.parameter_code   = f.parameter_text    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'MC'    
   end    
  
   --Metadata matching Case    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock),    
         fin_quick_code_met met with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
       and  component_code    = isnull(@component_12,component_code)    
       and  m.parametername    like @text_search    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  met.component_id   = m.component_code    
       and  met.parameter_category  = f.parameter_code    
       and  met.parameter_code   = f.parameter_text    
       and  met.language_id    = @ctxt_language    
       and  m.direct_match    = 'M'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    met.parameter_text,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock),    
      fin_quick_code_met met with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
    and  component_code    = isnull(@component_12,component_code)    
    and  m.parametername    like @text_search    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  met.component_id   = m.component_code    
    and  met.parameter_category  = f.parameter_code    
    and  met.parameter_code   = f.parameter_text    
    and  met.language_id    = @ctxt_language    
    and  m.direct_match    = 'M'    
   end    
  
     
      
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     bu_id,     
     ou.company_code,   component_desc,    type_desc,     
     ouinstname,     parametername,    f.parameter_text,    
     ou.ou_id,     usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = m.component_code    
   and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'N'   
  
    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     bu_id,     
     ou.company_code,   component_desc,    type_desc,     
     ouinstname,     parametername,    f.parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_code    
   and  m.component_code   = case when f.component_id in ('DFT','DEFTRAN') then 'DEFTRAN' else f.component_id end    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'N'  
     
     
  --exchange rate description    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        fin_processparam_sys f with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock),    
        erate_etype_vw vw  with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      --and  e.component_id    = f.component_id     
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      and  f.parameter_type   = m.activity_code    
      and  m.parameter_category  = f.parameter_category    
      and  m.component_code   = f.component_id    
      and  f.company_code    = isnull(@company_12121,f.company_code)    
      and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
      and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
      and  f.language_id    = @ctxt_language    
      and  ou.ou_id     = f.ou_id     
      and  ou.company_code    = f.company_code    
      and  vw.ou_id     = f.ou_id    
      and  vw.language_id    = @ctxt_language    
      and  vw.exchrate_type   = f.parameter_code    
      and  m.direct_match    = 'E'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     bu_id,     
     ou.company_code,   component_desc,    type_desc,     
     ouinstname,     parametername,    f.parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw  with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  ou.bu_id     = isnull(@business_unit1,ou.bu_id)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  vw.ou_id     = f.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = f.parameter_code    
   and  m.direct_match    = 'E'    
  end     
      
  --MAC Parameters drect matching case    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        mac_parameters mac with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      and  m.parameter_category  = mac.ma_param_group    
      and  m.component_code   = mac.component_id    
      and  ma_company_no    = isnull(@company_12121,ma_company_no)    
      and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
      and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
      and  ma_lang_id     = @ctxt_language    
      and  ma_status     = 'A'    
      and  mac.ou_id     = ou.ou_id    
      and  ma_company_no    = ou.company_code    
      and  mac.bu_id     = ou.bu_id    
      and  m.direct_match    = 'Y'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      mac.bu_id,     
     ma_company_no,    component_desc,    type_desc,     
     ouinstname,     parametername,     ma_param_value,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     mac_parameters mac with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = mac.ma_param_group    
   and  m.component_code   = mac.component_id    
   and  ma_company_no    = isnull(@company_12121,ma_company_no)    
   and  mac.bu_id     = isnull(@business_unit1,mac.bu_id)    
   and  mac.ou_id     = isnull(@organization_unit121,mac.ou_id)    
   and  ma_lang_id     = @ctxt_language    
   and  ma_status     = 'A'    
   and  mac.ou_id     = ou.ou_id    
   and  ma_company_no    = ou.company_code    
   and  mac.bu_id     = ou.bu_id    
   and  m.direct_match    = 'Y'    
  end    
  
  --CBUD Parameters drect matching case    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        cbud_parameters c with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      and  m.parameter_category  = c.ma_param_group    
      and  m.component_code   = ma_component_id    
      and  ma_company_code    = isnull(@company_12121,ma_company_code)    
      and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
      and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
      and  ma_lang_id  = @ctxt_language    
      and  ma_ou_id     = ou.ou_id    
      and  ma_company_code    = ou.company_code    
      and  ma_bu_id     = ou.bu_id    
      and  m.direct_match    = 'Y'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      ma_bu_id,     
     ma_company_code,   component_desc,    type_desc,     
     ouinstname,     parametername,     ma_param_value,    
     ou.ou_id, usage_id,     1,     
     1,      1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     cbud_parameters c with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.ma_param_group    
   and  m.component_code   = ma_component_id    
   and  ma_company_code    = isnull(@company_12121,ma_company_code)    
   and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
   and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
   and  ma_lang_id     = @ctxt_language    
   and  ma_ou_id     = ou.ou_id    
   and  ma_company_code    = ou.company_code    
   and  ma_bu_id     = ou.bu_id    
   and  m.direct_match    = 'Y'    
       
   update fset_parameters_tmp    
   set  value      = parameter_text    
   from fin_quick_code_met  with (nolock)    
   where component_id    = 'CBUD'    
   and  parameter_type    = 'FNBG'    
   and  parameter_category   = 'VARINFB'    
   and  language_id     = @ctxt_language    
   and  guid      = @guid    
   and  usage_id     = 'FUN_MAC_COSTBUD'    
   and  value      in ('P','R')    
   and  parameter_code    = value    
  end    
      
  --DPRUP Parameters drect matching case    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        mac_dprup_parameters c with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      and  m.parameter_category  = c.ma_param_group    
      and  m.component_code   = ma_component_id    
      and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
      and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
      and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
      and  ma_lang_id     = @ctxt_language    
      and  ma_ou_id     = ou.ou_id    
      and  ma_company_code    = ou.bu_id    
      and  ma_bu_id     = ou.company_code    
      and  m.direct_match    = 'Y'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (   
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername, value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     ma_company_code,     
     ma_bu_id,      component_desc,    type_desc,     
     ouinstname,     parametername,     ma_param_value,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     mac_dprup_parameters c with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.ma_param_group    
   and  m.component_code   = ma_component_id    
   and  ma_company_code    = isnull(@business_unit1,ma_company_code)    
   and  ma_bu_id     = isnull(@company_12121,ma_bu_id)    
   and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
   and  ma_lang_id     = @ctxt_language    
   and  ma_ou_id     = ou.ou_id    
   and  ma_company_code    = ou.bu_id    
   and  ma_bu_id     = ou.company_code    
   and  m.direct_match    = 'Y'    
  end     
  
    
  --PPRUP Parameters drect matching case   
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        mac_pprup_parameters c with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      and  m.parameter_category  = c.ma_param_group    
      and  m.component_code   = ma_component_id    
      and  ma_company_code    = isnull(@company_12121,ma_company_code)    
      and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
      and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
      and  ma_lang_id     = @ctxt_language    
      and  ma_ou_id     = ou.ou_id    
      and  ma_company_code    = ou.company_code    
      and  ma_bu_id     = ou.bu_id    
      and  m.direct_match    = 'Y'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      ma_bu_id,     
     ma_company_code,    component_desc,    type_desc,     
     ouinstname,     parametername,    ma_param_value,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     mac_pprup_parameters c with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.ma_param_group    
   and  m.component_code   = ma_component_id    
   and  ma_company_code    = isnull(@company_12121,ma_company_code)    
   and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
   and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
   and  ma_lang_id     = @ctxt_language    
   and  ma_ou_id     = ou.ou_id    
   and  ma_company_code    = ou.company_code    
   and  ma_bu_id     = ou.bu_id    
   and  m.direct_match    = 'Y'    
  end    
      
  --ODSS Parameters drect matching case    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        odss_parameters c with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      and  m.parameter_category  = c.ma_param_group    
      and  m.component_code   = ma_component_id    
      and  ma_company_no    = isnull(@company_12121,ma_company_no)    
      and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
      and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
      and  ma_lang_id     = @ctxt_language    
      and  ma_ou_id     = ou.ou_id    
      and  ma_company_no    = ou.company_code    
      and  ma_bu_id     = ou.bu_id    
      and  m.direct_match    = 'Y'    
     )    
  begin     
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     ma_bu_id,     
     ma_company_no, component_desc,    type_desc,     
     ouinstname,     parametername,     ma_param_value,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     odss_parameters c with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.ma_param_group    
   and  m.component_code   = ma_component_id    
   and  ma_company_no    = isnull(@company_12121,ma_company_no)    
   and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
   and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
   and  ma_lang_id     = @ctxt_language    
   and  ma_ou_id     = ou.ou_id    
   and  ma_company_no    = ou.company_code    
   and  ma_bu_id     = ou.bu_id    
   and  m.direct_match    = 'Y'    
  end    
      
  --AMIG Parameters drect matching case    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        amig_process_parameter_sys a with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code      = isnull(@levelofparameters,type_code)    
      and  m.bpc_code      = isnull(@business_process12,m.bpc_code)    
      and  component_code     = isnull(@component_12,component_code)    
      and  m.parametername     like @text_search    
      and  m.parameter_category   = a.parameter_category    
      and  m.activity_code     = a.parameter_code    
      --and  ma_company_no    = isnull(@company_12121,ma_company_no)    
      --and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
      and  a.ou_id       = isnull(@organization_unit121,a.ou_id)    
      and  language_id      = @ctxt_language    
      and  a.ou_id       = ou.ou_id    
      and  m.direct_match     = 'Y'    
     )    
  begin     
  --select 'aplan_test'  
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      bu_id,  
     company_code,     component_desc,    type_desc,     
     ouinstname,     parametername,    parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     amig_process_parameter_sys a with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code      = isnull(@levelofparameters,type_code)    
   and  m.bpc_code      = isnull(@business_process12,m.bpc_code)    
   and  component_code     = isnull(@component_12,component_code)    
   and  m.parametername     like @text_search    
   and  m.parameter_category   = a.parameter_category       and  m.activity_code     = a.parameter_code    
   --and  ma_company_no    = isnull(@company_12121,ma_company_no)    
   --and  ma_bu_id     = isnull(@business_unit1,ma_bu_id)    
   and  a.ou_id      = isnull(@organization_unit121,a.ou_id)    
   and  ou.company_code    = isnull(@company_12121,company_code)    
   and  bu_id      =   isnull(@business_unit1,bu_id)    
   and  language_id      = @ctxt_language    
   and  a.ou_id       = ou.ou_id    
   and  m.direct_match     = 'Y'    
  end     
      
  --CALL parameters direct matching    
  if exists ( select 'X'     
      from fset_parameters_met m with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock),    
        call_parameters f with (nolock) left outer join          
        fin_quick_code_met met with (nolock)    
      on  (   met.component_id   = f.ma_component_id    
         and  met.parameter_category  = f.ma_param_group    
         and  met.parameter_code   = ma_param_value    
         and  met.language_id    = @ctxt_language    
         and  met.parameter_type   = 'COMBO'    
        )    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      and  m.component_code   = ma_component_id    
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      --and  ou.ou_id     = ma_ou_id     
      and  ou.company_code    = ma_company_code    
      and  ma_company_code    = isnull(@company_12121,ma_company_code)    
      and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
      and  m.parameter_category  = f.ma_param_group    
      and  m.component_code   = ma_component_id    
      and  ma_lang_id     = @ctxt_language    
      and  m.direct_match    = 'C'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,     bu_id,     
     ou.company_code,   component_desc,    type_desc,     
     ouinstname,     parametername,     met.parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock),    
     call_parameters f with (nolock) left outer join          
     fin_quick_code_met met with (nolock)    
 on  (   met.component_id   = f.ma_component_id    
      and  met.parameter_category  = f.ma_param_group    
      and  met.parameter_code   = ma_param_value    
      and  met.language_id    = @ctxt_language    
      and  met.parameter_type   = 'COMBO'    
     )    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   and  m.component_code   = ma_component_id    
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  ou.ou_id     = ma_ou_id     
   and  ou.company_code    = ma_company_code    
   and  ma_company_code    = isnull(@company_12121,ma_company_code)    
   and  ma_ou_id     = isnull(@organization_unit121,ma_ou_id)    
   and  m.parameter_category  = f.ma_param_group    
   and  m.component_code   = ma_component_id    
 and  ma_lang_id     = @ctxt_language    
   and  m.direct_match    = 'C'    
  end    
  
   
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        fin_processparam_sys f with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      --and  e.component_id    = f.component_id     
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      and  f.parameter_type   = m.activity_code    
      and  m.parameter_category  = f.parameter_code    
      and  m.component_code   = f.component_id    
      and  f.company_code    = isnull(@company_12121,f.company_code)    
      and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
      and  f.language_id    = @ctxt_language    
      and  ou.ou_id     = f.ou_id     
      and  ou.company_code    = f.company_code    
      and  m.direct_match    = 'PT'    
     )    
  begin     
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      bu_id,     
     f.company_code,    component_desc,    type_desc,     
     ouinstname,     parametername,     parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_code    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'PT'    
  end    
      
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        fin_processparam_sys f with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      --and  e.component_id    = f.component_id     
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      and  f.parameter_type   = m.activity_code    
      and  m.parameter_category  = f.parameter_category    
      and  m.component_code   = f.component_id    
      and  f.company_code    = isnull(@company_12121,f.company_code)    
      and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
      and  f.language_id    = @ctxt_language    
      and  ou.ou_id     = f.ou_id     
      and  ou.company_code    = f.company_code    
      and  m.direct_match    = 'PT'    
     )    
  begin     
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,   
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      bu_id,     
     f.company_code,    component_desc,    type_desc,     
 ouinstname,     parametername,     parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'PT'    
  end    
  
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        fin_processparam_sys f with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      --and  e.component_id    = f.component_id     
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      and  f.parameter_type   = m.activity_code    
      and  m.parameter_category  = f.parameter_category    
      and  m.component_code   = f.component_id    
      and  f.company_code    = isnull(@company_12121,f.company_code)    
      and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
      and  f.language_id    = @ctxt_language    
      and  ou.ou_id     = f.ou_id     
      and  ou.company_code    = f.company_code    
      and  m.direct_match    = 'PTC'    
 )    
  begin     
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      bu_id,     
     f.company_code,    component_desc,    type_desc,     
     ouinstname,     parametername,     parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
--and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'PTC'    
  end    
      
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        fin_processparam_sys f with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      --and  e.component_id    = f.component_id     
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      and  f.parameter_type   = m.activity_code    
      and  m.parameter_category  = f.parameter_category    
      and  m.component_code   = f.component_id    
      and  f.company_code    = isnull(@company_12121,f.company_code)    
      and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
      and  f.language_id    = @ctxt_language    
      and  ou.ou_id     = f.ou_id     
      and  ou.company_code    = f.company_code    
      and  m.direct_match    = 'PTT'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      bu_id,     
     f.company_code,    component_desc,    type_desc,     
     ouinstname,     parametername,     parameter_text,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'PTT'    
  end    
  
    
  if exists ( select 'X'    
      from fset_parameters_met m with (nolock),    
        fin_processparam_sys f with (nolock),    
        --emod_bfg_component_met e with (nolock),    
        --emod_bfg_met bfg with (nolock),    
        emod_ou_vw ou with (nolock)    
      where type_code     = isnull(@levelofparameters,type_code)    
      and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
      and  component_code    = isnull(@component_12,component_code)    
      and  m.parametername    like @text_search    
      --and  e.component_id    = f.component_id     
      --and  e.bfg_code     = bfg.bfg_code    
      --and  bfg.bpc_code    = m.bpc_code    
      and  f.parameter_type   = m.activity_code    
      and  m.parameter_category  = f.parameter_category    
      and  m.component_code   = f.component_id    
      and  f.company_code    = isnull(@company_12121,f.company_code)    
      and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
      and  f.language_id    = @ctxt_language    
      and  ou.ou_id     = f.ou_id     
      and  ou.company_code    = f.company_code    
      and  m.direct_match    = 'PC'    
     )    
  begin    
   insert into fset_parameters_tmp    
   (    
     guid,      bpc_desc,     bu_id,       
     company_code,    component_desc,    type_desc,    
     ouinstname,     parametername,    value,    
     hdn_ou_param,    usage_id,     hdn_co,    
     hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
   )    
   Select distinct    
     @guid,      bpc_desc,      bu_id,     
     f.company_code,    component_desc,    type_desc,     
     ouinstname,     parametername,     parameter_code,    
     ou.ou_id,   usage_id,     1,     
     1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
   from fset_parameters_met m with (nolock),    
     fin_processparam_sys f with (nolock),    
     --emod_bfg_component_met e with (nolock),    
     --emod_bfg_met bfg with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
   and  component_code    = isnull(@component_12,component_code)    
   and  m.parametername    like @text_search    
   --and  e.component_id    = f.component_id     
   --and  e.bfg_code     = bfg.bfg_code    
   --and  bfg.bpc_code    = m.bpc_code    
   and  f.parameter_type   = m.activity_code    
   and  m.parameter_category  = f.parameter_category    
   and  m.component_code   = f.component_id    
   and  f.company_code    = isnull(@company_12121,f.company_code)    
   and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = f.ou_id     
   and  ou.company_code    = f.company_code    
   and  m.direct_match    = 'PC'    
  end    
      
  --To show Ou Description    
  if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code    = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
       and  component_code    = isnull(@component_12,component_code)    
       and  m.parametername    like @text_search    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_category    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'OUPC'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ouinstname,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
    and  component_code    = isnull(@component_12,component_code)    
    and  m.parametername    like @text_search    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_category    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'OUPC'    
   end    
       
   
  
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         fin_processparam_sys f with (nolock),    
         emod_ou_vw ou with (nolock)    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
       and  component_code    = isnull(@component_12,component_code)    
       and  m.parametername    like @text_search    
       and  f.parameter_type   = m.activity_code    
       and  m.parameter_category  = f.parameter_code    
       and  m.component_code   = f.component_id    
       and  f.company_code    = isnull(@company_12121,f.company_code)    
       and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
       and  f.language_id    = @ctxt_language    
       and  ou.ou_id     = f.ou_id     
       and  ou.company_code    = f.company_code    
       and  m.direct_match    = 'OUPT'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    ouinstname,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      fin_processparam_sys f with (nolock),    
      emod_ou_vw ou with (nolock)    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
    and  component_code    = isnull(@component_12,component_code)    
    and  m.parametername    like @text_search    
    and  f.parameter_type   = m.activity_code    
    and  m.parameter_category  = f.parameter_code    
    and  m.component_code   = f.component_id    
    and  f.company_code    = isnull(@company_12121,f.company_code)    
    and  f.ou_id      = isnull(@organization_unit121,f.ou_id)    
    and  f.language_id    = @ctxt_language    
    and  ou.ou_id     = f.ou_id     
    and  ou.company_code    = f.company_code    
    and  m.direct_match    = 'OUPT'    
   end  
   
       
   --TCAL Parameters    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         emod_ou_vw ou with (nolock),    
         @table der    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
       and  component_code  = isnull(@component_12,component_code)    
       and  m.parametername    like @text_search    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and     m.parameter_category  = der.parameter_category    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and  m.direct_match    = 'Y'    
     )    
   begin     
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    case     
                     when m.parameter_category = 'DFLT_PUR_TAX_CATEGORY' then  dflt_pur_tax_category    
                     when m.parameter_category = 'DFLT_SAL_TAX_CATEGORY' then  dflt_sal_tax_category    
                     when m.parameter_category = 'DFLT_PUR_TAX_CLASS'  then  dflt_pur_tax_class    
                     when m.parameter_category = 'DFLT_SAL_TAX_CLASS'  then  dflt_sal_tax_class    
                     when m.parameter_category = 'TAX_ROUND_OFF'   then  convert(nvarchar,tax_round_off)    
                     when m.parameter_category = 'DLF_SER_INPCREPER'  then dlf_ser_inpcreper    
                      when m.parameter_category = 'DFLT_DEDUCTIBLE_PER'  then convert(nvarchar,dflt_deductible_per)    
                        
                     else null     
                     end,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      emod_ou_vw ou with (nolock),    
      @table der    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
    and  component_code    = isnull(@component_12,component_code)    
    and  m.parametername    like @text_search    
    and  m.component_code   = 'TCAL'    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
 and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and     m.parameter_category  = der.parameter_category    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and  m.direct_match    = 'Y'    
   end    
     
   -- select 'test_13_Y'  
   --select * from  fset_parameters_tmp  
   --where guid= @guid  
    
   if exists ( select 'X'    
       from fset_parameters_met m with (nolock),    
         tcal_function_dflt t with (nolock),    
         tcal_comp_metadata_vw vw,    
         emod_ou_vw ou with (nolock)    
         ,    
         @table der    
       where type_code     = isnull(@levelofparameters,type_code)    
       and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
       and  component_code    = isnull(@component_12,component_code)    
       and  m.parametername    like @text_search    
        and  t.tax_type     = @tax_type    
       and  t.tax_community    = @tax_community    
       and  t.company_code    = isnull(@company_12121,t.company_code)    
       and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
       and  m.language_id    = @ctxt_language    
       and  ou.company_code    = t.company_code    
       and     m.parameter_category  = der.parameter_category    
and  t.tax_type     = vw.tax_type    
       and  t.tax_community    = vw.tax_community    
       and  vw.paramcode    = case     
                   when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
                   when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
                   when m.parameter_category = 'TC_BASIS_SAL'   then  isnull(tc_basis_sal,'')    
                   when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
                   when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
                   when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
                   when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
                   when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
                   when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
                   when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
                   when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
                   when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
                   when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
             when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
                   when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
                   when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
                   when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')    
       when m.parameter_category = 'REVDOC_IRN_CANC'    then isnull(revdoc_IRN,'') --EPE-41583   
                   else ''    
                   end    
       and  vw.langid     = @ctxt_language    
       and  vw.paramcategory   = 'COMBO'    
       and  m.direct_match    = 'N'    
       and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
     )    
   begin     
    
 -- select 'here'   
    insert into fset_parameters_tmp    
    (    
      guid,      bpc_desc,     bu_id,       
      company_code,    component_desc,    type_desc,    
      ouinstname,     parametername,    value,    
      hdn_ou_param,    usage_id,     hdn_co,    
      hdn_bu,      hdn_global,     hdn_link_dtl--EPE-17313    
    )    
    Select distinct    
      @guid,      bpc_desc,     bu_id,     
      ou.company_code,   component_desc,    type_desc,     
      ouinstname,     parametername,    paramdesc_shd,    
      ou.ou_id,   usage_id,     1,     
      1,       1,    
      dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)--EPE-17313    
    from fset_parameters_met m with (nolock),    
      tcal_function_dflt t with (nolock),    
      tcal_comp_metadata_vw vw,    
      emod_ou_vw ou with (nolock)    
      ,    
      @table der    
    where type_code     = isnull(@levelofparameters,type_code)    
    and  m.bpc_code     = isnull(@business_process12,m.bpc_code)    
    and  component_code    = isnull(@component_12,component_code)    
    and  m.parametername    like @text_search    
    and  t.tax_type     = @tax_type    
    and  t.tax_community    = @tax_community    
    and  t.company_code    = isnull(@company_12121,t.company_code)    
    and  ou.ou_id     = isnull(@organization_unit121,ou.ou_id)    
    and  m.language_id    = @ctxt_language    
    and  ou.company_code    = t.company_code    
    and     m.parameter_category  = der.parameter_category    
    and  t.tax_type     = vw.tax_type    
    and  t.tax_community    = vw.tax_community    
    and  vw.paramcode    = case     
                   when m.parameter_category = 'DFLT_SAL_INCL_OPTION' then  isnull(dflt_sal_incl_option,'')    
                   when m.parameter_category = 'TAX_PUR_INCL_OPTION'  then isnull(TAX_PUR_INCL_OPTION,'')    
                   when m.parameter_category = 'TC_BASIS_SAL'  then  isnull(tc_basis_sal,'')    
                   when m.parameter_category = 'DLF_SAL_ACCBASIS'  then  isnull(dlf_sal_accbasis,'')    
                   when m.parameter_category = 'TAX_CORR_APPO_BASIS'  then  isnull(tax_corr_appo_basis,'')    
                   when m.parameter_category = 'TAX_ACCOUNT_TYPE'  then  isnull(tax_account_type,'')    
                   when m.parameter_category = 'TAX_ROUND_OFF_LEVEL'  then  isnull(tax_round_off_level,'')    
                   when m.parameter_category = 'AUTO_PAY_VOUCH_GEN'  then  isnull(auto_pay_vouch_gen,'')    
                   when m.parameter_category = 'ALLOWDRAFTCREATION'  then  isnull(allowdraftcreation,'')    
                   when m.parameter_category = 'ALL_VAR_INST'   then  isnull(all_var_inst,'')    
                   when m.parameter_category = 'ITEM_USG_TAXGRP_MAP'  then  isnull(item_usg_taxgrp_map,'')    
                   when m.parameter_category = 'CENTAVAILINPCRRECON'  then  isnull(centavailinpcrrecon,'')    
                   when m.parameter_category = 'AUTO_ADJ'    then  isnull(auto_adj,'')    
                   when m.parameter_category = 'ALLW_MOD_TXCD'   then isnull(ALLW_MOD_TXCD,'')    
                   when m.parameter_category = 'TAX_RET_CAL'    then isnull(TAX_RET_CAL,'')    
                   when m.parameter_category = 'AVAIL_KKC'    then isnull(avail_kkc,'')    
                   when m.parameter_category = 'DEFSTNINSTR'    then isnull(defstninstr,'')   
       when m.parameter_category = 'REVDOC_IRN_CANC'    then isnull(revdoc_IRN,'') --EPE-41583    
                else ''    
                end    
    and  vw.langid     = @ctxt_language    
    and  vw.paramcategory   = 'COMBO'    
    and  m.direct_match    = 'N'    
    and  paramdesc_shd    <> 'PPS_TCAL_00005' --EPE-17313    
   end    
   
   --Code added for EPE-41583 starts  
   --asset planning  
   update tmp  
   set   tmp.value     = f.parameter_code  
   from   fin_processparam_sys f(nolock),  
    fset_parameters_tmp tmp(nolock)  
   where  guid   = @guid    
   and    f.component_id            = 'APLAN'      
   and    f.parameter_type          = 'COMBO'      
   and    f.parameter_category   in( 'COSTVAR','EXRVAR')  
   and    tmp.parametername   = f.parameter_text    
   and    f.company_code   = @company_12121  
   --Code added for EPE-41583 ends  
  
   if isnull(@levelofparameters,'') = 'FN'    
   begin  
       
    select  bpc_desc    'businessprocess_',     
      bu_id     'business_unit',     
      company_code   'company_1212',     
      component_desc   'component_11',     
      type_desc    'context_1',     
      ouinstname    'organization_unit',     
      parametername   'parameter',     
      value     'value',    
      hdn_ou_param   'Hdn_OU_Param',    
      usage_id    'hdn_param',    
      hdn_co     'hdn_co',     
      hdn_bu     'hdn_bu',     
      hdn_global    'hdn_global'    
      /* Code added for EPE-17371 Begins */    
      ,parametername   'param_text_new',--EPE-17313    
      --'{"tc": "bh","ta": "bhsysadd","ti": "bhsysaddmain","tci": [{"cid": "ctxtswouinstance","vwn": "ctxtswouinstance","v": "2"} ]}' 'hdimdlparam_text_new'    
      --hdn_link_dtl   'hdimdlparam_text_new'    
      --case when usage_id = 'POSETFN' then '{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'     
      --  when usage_id = 'bhsetfn' then '{"tc": "bh","ta": "bhsysadd","ti": "bhsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"} ]}'--hdn_link_dtl    
      --  when usage_id = 'SARETSETFN' then replace(hdn_link_dtl,'{mlparameters_grid.11}',hdn_ou_param)--'{"tc": "saret","ta": "saretsysadd","ti": "saretsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "4"}]}'    
      --hdn_link_dtl--'{"tc": "saret","ta": "saretsysadd","ti": "saretsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"} ]}'--hdn_link_dtl    
      --  else  '{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'         
      --end     
      hdn_link_dtl   'hdimdlparam_text_new'--EPE-17313    
      /* Code added for EPE-17371 Ends */    
    from fset_parameters_tmp  with (nolock)    
    where   guid   = @guid    
   end     
  end    
  if isnull(@levelofparameters,'') = ''    
  begin    
   --ips PARAMETERS    
   Select distinct     
     activity_desc   'businessprocess_',     
     null     'business_unit',     
     case when isnull(company_code,'0') = '0' then '' else company_code end    
           'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     null     'organization_unit',     
     parametername   'parameter',      
     f.parameter_text  'value',    
     @ctxt_ouinstance  'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     case when @business_process12='GLSYS' then 0     
     else 1 end    'hdn_co',     
0      'hdn_bu',     
     0      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
         
   from fset_parameters_met m with (nolock),    
     ips_processparam_sys i with (nolock),    
     fin_quick_code_met f with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = i.parameter_category    
   and  i.parameter_type   = m.activity_code    
   and  ((m.activity_code   =   'GLSYS' and i.company_code in ('0',''))    
      or     
      (m.activity_code  =   'CPSYS' and isnull(@company_12121,i.company_code) = i.company_code and i.company_code not in ('0','')))    
   and  i.language_id    = @ctxt_language    
   and  f.component_id    = 'IPS'    
   and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  = i.parameter_category    
   and  f.parameter_code   = i.parameter_code    
   --and  i.parameter_code   = case when f.parameter_category IN ('FAINSTALLDATE','PBCDATE','PAYMODAPPLI') then i.parameter_code else f.parameter_code end    
   and  f.language_id    = @ctxt_language    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc   'businessprocess_',     
     null     'business_unit',     
     case when isnull(company_code,'0') = '0' then '' else company_code end    
           'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     null     'organization_unit',     
     parametername   'parameter',      
     i.parameter_code  'value',    
     @ctxt_ouinstance  'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     case when @business_process12='GLSYS' then 0     
     else 1 end    'hdn_co',     
     0      'hdn_bu',     
     0      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
 --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,@ctxt_ouinstance)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     ips_processparam_sys i with (nolock),    
     fin_quick_code_met f with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = i.parameter_category    
   and  i.parameter_type   = m.activity_code    
   and  ((m.activity_code   =   'GLSYS' and i.company_code in ('0',''))    
      or     
      (m.activity_code  =   'CPSYS' and isnull(@company_12121,i.company_code) = i.company_code and i.company_code not in ('0','')))    
   and  i.language_id    = @ctxt_language    
   and  m.direct_match    = 'Y'     
   UNION    
   --cps    
   Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     c.company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     f.parameter_text  'value',    
     ou.ou_id   'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     0       'hdn_bu',     
     0      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   --and  f.parameter_type   = c.parameter_type    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  f.component_id    = 'CPS'    
   and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  = c.parameter_category    
   and  f.parameter_code   = c.parameter_code    
   --and  c.parameter_code   = case when c.parameter_category IN ('TAXTOLPCNT','TAXTOLTFLAT','MAXBANKCHARGES','SNPCSHLIMIT','SUPCUSCSHLIMIT','RETPROPVALUE') then c.parameter_code else f.parameter_code end    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     c.company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     c.parameter_code  'value',    
     ou.ou_id     'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     0       'hdn_bu',     
     0      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     emod_ou_vw ou with (nolock)    
  where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   --and  f.parameter_type   = c.parameter_type    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  m.direct_match    = 'Y'    
   union    
   Select distinct    
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     case when isnull(c.company_code,'0') = '0' then '' else c.company_code end    
           'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',      
     vw.description    'value',    
     ou.ou_id   'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1      'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
      --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     cps_processparam_sys c with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = c.parameter_category    
   and  c.parameter_type   = m.activity_code    
   and  c.company_code    = isnull(@company_12121,c.company_code)    
   and  c.language_id    = @ctxt_language    
   and  ou.ou_id     = c.ou_id    
   and  vw.ou_id     = c.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = c.parameter_code    
   and  m.direct_match    = 'E'    
   UNION    
   --bps    
   Select distinct    
     activity_desc   'businessprocess_',     
     b.bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',     
     f.parameter_text  'value',    
     ou.ou_id     'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1       'hdn_bu',     
     0      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     bps_processparam_sys b with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = b.parameter_category    
   and  b.parameter_type   = m.activity_code    
   and  b.bu_id      = isnull(@business_unit1,b.bu_id)    
   and  b.bu_id      = ou.bu_id    
   and  ou.company_code    = isnull(@company_12121,ou.company_code)    
   and  b.language_id    = @ctxt_language    
   and  f.component_id    = 'BPS'    
   and  f.parameter_type   = b.parameter_type    
   and  f.parameter_category  = b.parameter_category    
   and  f.parameter_code   = b.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = b.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct    
     activity_desc   'businessprocess_',     
     b.bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',     
     b.parameter_code  'value',    
     ou.ou_id     'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1       'hdn_bu',     
     0      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
      --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
          usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     bps_processparam_sys b with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = b.parameter_category    
   and  b.parameter_type   = m.activity_code    
   and  b.bu_id      = isnull(@business_unit1,b.bu_id)    
   and  b.bu_id      = ou.bu_id    
   and  ou.company_code    = isnull(@company_12121,ou.company_code)    
   and  b.language_id    = @ctxt_language    
   and  ou.ou_id     = b.ou_id    
   and  m.direct_match    = 'Y'     
   union    
   --ops    
      Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ou.ouinstname   'organization_unit',     
     parametername   'parameter',      
     f.parameter_text  'value',    
     o.ou_id     'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
      --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     fin_quick_code_met f with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  o.parameter_type   = m.activity_code    
   and  m.parameter_category  = o.parameter_category    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  f.component_id    = 'OPS'    
   --and  f.parameter_type   = o.parameter_type    
   --and  f.parameter_type   = 'COMBO'    
   and  f.parameter_category  = o.parameter_category    
   and  f.parameter_code   = o.parameter_code    
   and  f.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'N'    
   union    
   Select distinct     
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ou.ouinstname   'organization_unit',     
     parametername   'parameter',      
     o.parameter_code  'value',    
     o.ou_id     'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1       'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
   usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
--EPE-17313     
     /* Code added for EPE-17371 Ends */          
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     emod_ou_vw ou with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  o.parameter_type   = m.activity_code    
   and  m.parameter_category  = o.parameter_category    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  m.direct_match    = 'Y'    
   union    
   Select distinct    
     activity_desc   'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname  'organization_unit',     
     parametername   'parameter',      
     vw.description    'value',    
     o.ou_id          'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     1      'hdn_co',     
     1      'hdn_bu',     
     1      'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     --EPE-17313         
     ,parametername   'param_text_new',    
     dbo.fse_pmth_sp_get_link_dtl_cmn_fn(@ctxt_ouinstance,@ctxt_user,@ctxt_language,@ctxt_service,@ctxt_role,    
                     usage_id,type_code,activity_code,ou.ou_id)   'hdimdlparam_text_new'     
     --EPE-17313     
     /* Code added for EPE-17371 Ends */         
   from fset_parameters_met m with (nolock),    
     ops_processparam_sys o with (nolock),    
     emod_ou_vw ou with (nolock),    
     erate_etype_vw vw with (nolock)    
   where type_code     = isnull(@levelofparameters,type_code)    
   and  m.parametername    like @text_search    
   and  m.parameter_category  = o.parameter_category    
   and  o.parameter_type   = m.activity_code    
   and  o.ou_id      in (select ou_id from emod_ou_vw with (nolock)     
              where company_code  =  @company_12121     
              and ou_id = isnull(@organization_unit121,o.ou_id))    
   and  o.language_id    = @ctxt_language    
   and  ou.ou_id     = o.ou_id    
   and  vw.ou_id     = o.ou_id    
   and  vw.language_id    = @ctxt_language    
   and  vw.exchrate_type   = o.parameter_code    
   and  m.direct_match    = 'E'     
   union    
   select  bpc_desc    'businessprocess_',     
     bu_id     'business_unit',     
     company_code   'company_1212',     
     component_desc   'component_11',     
     type_desc    'context_1',     
     ouinstname    'organization_unit',     
     parametername   'parameter',     
     value     'value',    
     hdn_ou_param   'Hdn_OU_Param',    
     usage_id    'hdn_param',    
     hdn_co     'hdn_co',     
     hdn_bu     'hdn_bu',     
     hdn_global    'hdn_global'    
     /* Code added for EPE-17371 Begins */    
     ,parametername   'param_text_new',--EPE-17313    
     --'{"tc": "bh","ta": "bhsysadd","ti": "bhsysaddmain","tci": [{"cid": "ctxtswouinstance","vwn": "ctxtswouinstance","v": "2"} ]}' 'hdimdlparam_text_new'    
     --hdn_link_dtl   'hdimdlparam_text_new'    
     --case when usage_id = 'POSETFN' then '{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'     
     --  when usage_id = 'bhsetfn' then '{"tc": "bh","ta": "bhsysadd","ti": "bhsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"} ]}'--hdn_link_dtl    
     --  when usage_id = 'SARETSETFN' then replace(hdn_link_dtl,'{mlparameters_grid.11}',hdn_ou_param)--'{"tc": "saret","ta": "saretsysadd","ti": "saretsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "4"}]}'    
     --hdn_link_dtl--'{"tc": "saret","ta": "saretsysadd","ti": "saretsysaddmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"} ]}'--hdn_link_dtl    
    --  else  '{"tc": "po","ta": "posetsyspar","ti": "posetsysparmain","tci": [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "3"}]}'         
     --end     
     hdn_link_dtl   'hdimdlparam_text_new'--EPE-17313    
     /* Code added for EPE-17371 Ends */         
   from fset_parameters_tmp  with (nolock)    
   where   guid   = @guid    
  end    
  end    
     
    
       
 if exists( select 'X'    
    from fset_parameters_tmp    
    where guid   = @guid    
   )    
 begin     
  delete from fset_parameters_tmp    where guid   = @guid    
 end        
 /*     
 --OutputList    
  Select    
  null 'businessprocess_',     
  null 'business_unit',     
  null 'company_1212',     
  null 'component_11',     
  null 'context_1',     
  null 'organization_unit',     
  null 'parameter',     
  null 'value',    
null 'Hdn_OU_Param',    
  null 'hdn_param',    
  null 'hdn_co',     
  null 'hdn_bu',     
  null 'hdn_inst_combo',     
  null 'hdn_bu_combo',    
  null 'hdn_global',    
 */    
     
Set nocount off    
    
End   
  
