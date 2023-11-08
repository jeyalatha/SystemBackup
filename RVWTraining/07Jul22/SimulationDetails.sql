[09:50] Manoj S
Please find the simulation steps and the screen details for the  metalink,
server name:  http:// bebswarcnv13.ramco/rvw/hub.aspx
Username: ramcouser
Password: ramco3*
Screen details: Parameters Hub

Simulation details:
1.After launching the screen,click on the get button
2.In the grid, Parameter text column is modelled as Metalink.
Query:
select * from de_ui_grid(nolock)
where ui_name = 'parametershub'
and control_id ='mlparameters_grid'
and view_name = '13'
select * from de_hidden_view(nolock)
where ui_name = 'ParametersHub'
and control_bt_synonym = 'param_text_new'


Application BE details:
bebswarcnv13.ramco
syssa
S@sys$a13*

Trace:
begin tran
declare @p15 int
set @p15=0
exec fse_pmth_sp_getparam_spo @ctxt_ouinstance=N'2',@ctxt_user=N'RAMCOUSER',@ctxt_language=1,@ctxt_service=N'fse_pmth_sr_get',@ctxt_role=N'testrole',@business_process12=N'~#~',@business_unit1=N'RSBU',@company_12121=N'RSCO',@component_12=N'~#~',@guid=N'2f24f6ed-7df2-426b-bcb2-2d504b586023',@levelofparameters=N'Function',@organization_unit121=N'RSOU1',@text_search=N'~#~',@tvwtreesecnodeid=N'~#~',@M_ErrorID=@p15 output
select @p15
rollback

{              "tc": "suprat",              "ta": "srfunset",              "ti": "srfunsetmain",              "tci":  [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "2"}]}
{              "tc": "packslip",              "ta": "packslipsysadd",              "ti": "packslipsysaddmain",              "tci":  [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "2"}]}
{              "tc": "cps",              "ta": "setwrkflw",              "ti": "setwrkflw",              "tci":  [{"cid": "rvwrt_lctxt_ou","vwn": "rvwrt_lctxt_ou","v": "2"}]}

