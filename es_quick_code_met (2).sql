
		INSERT INTO es_quick_code_met 
									(CustomerName,		ProjectName,	ParameterCode,			ParameterText,
									 ParameterSequence,	ParameterValue,	CreatedBy,				CreatedDate,	
									 ModifiedBy,		ModifiedDate
									 )

		SELECT DISTINCT				
									 customer_name,		project_name,	'AutoDefaultRequired',	'AUTO_DEFAULT_ML_COMBO',
									 1,					'N',			'Admin',				getdate(),	
									 'Admin',			getdate()
		FROM ep_ui_req_dtl dtl (NOLOCK)
		WHERE req_no = 'BASE'
              AND NOT EXISTS (SELECT  'X'
                    FROM es_quick_code_met  met (NOLOCK)
                    WHERE met.CustomerName           =  dtl.customer_name
                    AND   met.ProjectName			 =  dtl.project_name
					AND   met.ParameterCode			 =  'AutoDefaultRequired'
					AND   met.ParameterText			 =  'AUTO_DEFAULT_ML_COMBO'
                    )

		INSERT INTO es_quick_code_met 
									(CustomerName,		ProjectName,	ParameterCode,			ParameterText,
									 ParameterSequence,	ParameterValue,	CreatedBy,				CreatedDate,	
									 ModifiedBy,		ModifiedDate
									 )

		SELECT DISTINCT				
									 customer_name,		project_name,	'AutoDefaultRequired',	'AUTO_DEFAULT_ML_EDIT',
									 2,					'N',			'Admin',				getdate(),	
									 'Admin',			getdate()
		FROM ep_ui_req_dtl dtl (NOLOCK)
		WHERE req_no = 'BASE'
              AND NOT EXISTS (SELECT  'X'
                    FROM es_quick_code_met  met (NOLOCK)
                    WHERE met.CustomerName           =  dtl.customer_name
                    AND   met.ProjectName			 =  dtl.project_name
					AND   met.ParameterCode			 =  'AutoDefaultRequired'
					AND   met.ParameterText			 =  'AUTO_DEFAULT_ML_EDIT'
                    )
