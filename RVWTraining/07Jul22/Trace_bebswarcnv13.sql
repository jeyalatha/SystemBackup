begin tran
declare @p15 int
set @p15=0
exec fse_pmth_sp_getparam_spo @ctxt_ouinstance=N'2',@ctxt_user=N'RAMCOUSER',@ctxt_language=1,@ctxt_service=N'fse_pmth_sr_get',@ctxt_role=N'testrole',@business_process12=N'~#~',@business_unit1=N'RSBU',@company_12121=N'RSCO',@component_12=N'~#~',@guid=N'2f24f6ed-7df2-426b-bcb2-2d504b586023',@levelofparameters=N'Function',@organization_unit121=N'RSOU1',@text_search=N'~#~',@tvwtreesecnodeid=N'~#~',@M_ErrorID=@p15 output
select @p15
rollback

