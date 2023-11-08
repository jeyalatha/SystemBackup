/************************************************************************************
procedure name and id    de_fw_req_activity_transpose_sp
description
name of the author       Karthikeyan V. S
date created             19 Jan 2006
modifications history
modified by
modified date
modified purpose
************************************************************************************
procedure name and id    de_fw_req_activity_transpose_sp
description
modifications history
modified by              : Kiruthika R
modified date            : 7 Feb 2011
modified purpose         : PNR2.0_29888
************************************************************************************
procedure name and id    de_fw_req_activity_transpose_sp
description
modifications history
modified by              : Kiruthika R
modified date            : 28 Feb 2011
modified purpose         : PNR2.0_30361
************************************************************************************/

alter PROCEDURE de_fw_req_activity_transpose_sp(
@ActivityID engg_seqno,
@ActivityName engg_name,
@ILBOCode engg_name  = '',
@ecrno engg_name ,
/* Code Modified for the Case ID:PNR2.0_30361 By Kiruthika */
@Status  INT OUTPUT)--,@Platform engg_name = 'Dotnet')--Modification made by Kiruthika for bug id:PNR2.0_29888
/* Code Modified for the Case ID:PNR2.0_30361 By Kiruthika */
AS
BEGIN
SET NOCOUNT ON
DECLARE @ControlID engg_control_id
DECLARE @NewILBOCode  engg_name
DECLARE @ReturnStatus INT
DECLARE @Seq  INT
DECLARE @Exists  varchar(5)

-- This cursor contains all the ilbos mapped to an activity
DECLARE
ilbo_cursor
CURSOR FOR
SELECT
ILBOCode
FROM
#fw_req_activity_ilbo (nolock)
WHERE
ActivityID = @ActivityID
ORDER BY
ILBOCode
FOR READ ONLY
-- This cursor contains all the grid controlids of an ILBO
DECLARE
ctrl_cursor
CURSOR FOR
/* Modified by Madusudanan R, Defect ID RVW_1.3_59 , 28 Dec 2001
SELECT
ControlID
FROM
fw_req_ilbo_control
WHERE
ILBOCode = @ILBOCode
AND Type = 'RSGrid'
ORDER BY
ControlID
*/
SELECT
c.ControlID
FROM
#fw_req_ilbo_control c (nolock) ,
#fw_req_ilbo_control_property cp (nolock)
WHERE
c.ILBOCode = @ILBOCode
and c.Type = 'RSGrid'
and cp.ILBOCode = c.ILBoCode
and cp.ControlID = c.ControlID
and cp.ViewName = c.ControlID
and cp.PropertyName = 'zoom'
and cp.value = 'true'
ORDER BY
c.ControlID
--  Modification ENDS
FOR READ ONLY

-- check if the ilbo code is specified...
-- if specified then generate transpose for that ilbo alone
-- else generate transpose for all ilbos mapped to the given activity
IF (@ILBOCode <> '')

BEGIN

OPEN ctrl_cursor
FETCH NEXT FROM
ctrl_cursor
INTO
@ControlID

WHILE @@FETCH_STATUS = 0
BEGIN
--Defect Id: RVW_1.3_77.Modified by chaina on 23 Jan 2002
EXEC de_Chk_if_Trans_exists_tmp @ActivityID, @ILBOCode, @ControlID, @Exists OUTPUT
--Modification end
IF (@Exists = 'TRUE')
BEGIN
SELECT @Status = 4
CLOSE ctrl_cursor
DEALLOCATE ctrl_cursor
DEALLOCATE ilbo_cursor
RETURN
END
-- frame the newilbocode
/*Defect Id: RVW_1.3_77. Commented by chaina. fw_req_ilbo_create_transpose sp will return the newilbocode
SELECT
@Seq = convert(integer, ParamValue)
FROM
fw_req_system_parameters
WHERE
ParamName = 'ZoomILBOSeqNo'

SELECT @NewILBOCode = 'ZoomILBO' + convert(varchar, @Seq + 1)
*/
-- call fw_req_ilbo_create_transpose to create the model
-- info for the transpose ilbo
select 'tt'
EXEC @ReturnStatus = de_fw_req_ilbo_create_transpose_sp @ActivityID, @ActivityName, 
/* Code Modified for the Case ID:PNR2.0_30361 By Kiruthika */
@ILBOCode, @ControlID, @ecrno, @NewILBOCode OUTPUT--,@Platform
--Modification made by Kiruthika for bug id:PNR2.0_29888
/* Code Modified for the Case ID:PNR2.0_30361 By Kiruthika */
IF (@ReturnStatus <> 3)
BEGIN
SELECT @Status = 2
CLOSE ctrl_cursor
DEALLOCATE ctrl_cursor
DEALLOCATE ilbo_cursor
RETURN
END

-- should also call the sp which creates links for all
-- the helps used by the parent ilbo in which the
-- parent ilbo's multiline participates.
EXEC @ReturnStatus = de_fw_req_transpose_help_sp @ActivityID, @ILBOCode, @NewILBOCode, @ControlID, @ecrno
IF (@ReturnStatus <> 3)
BEGIN
SELECT @Status = 2
CLOSE ctrl_cursor
DEALLOCATE ctrl_cursor
DEALLOCATE ilbo_cursor
RETURN
END

FETCH NEXT FROM
ctrl_cursor
INTO
@ControlID
END
CLOSE ctrl_cursor
--DEALLOCATE ctrl_cursor

END

ELSE

BEGIN
--  the ilbo code is not specified...
-- generate for all ilbos mapped to the activity.
OPEN ilbo_cursor
FETCH NEXT FROM
ilbo_cursor
INTO
@ILBOCode

WHILE @@FETCH_STATUS = 0
BEGIN
-- frame the newilbocode
/*Defect Id: RVW_1.3_77. Commented by chaina. fw_req_ilbo_create_transpose sp will return the newilbocode
SELECT
@Seq = convert(integer, ParamValue)
FROM
fw_req_system_parameters
WHERE
ParamName = 'ZoomILBOSeqNo'

SELECT @NewILBOCode = 'ZoomILBO' + convert(varchar, @Seq + 1)
*/

OPEN ctrl_cursor
FETCH NEXT FROM
ctrl_cursor
INTO
@ControlID

WHILE @@FETCH_STATUS = 0
BEGIN
--Defect Id: RVW_1.3_77. Modified by chaina on 23 Jan 2002
EXEC de_Chk_if_Trans_exists_tmp @ActivityID, @ILBOCode, @ControlID, @ecrno, @Exists OUTPUT
--Modification end
IF (@Exists = 'TRUE')
BEGIN
SELECT @Status = 4
CLOSE ctrl_cursor
DEALLOCATE ctrl_cursor
CLOSE ilbo_cursor
DEALLOCATE ilbo_cursor
RETURN
END

-- call fw_req_ilbo_create_transpose to create the model
-- info for the transpose ilbo
EXEC @ReturnStatus = de_fw_req_ilbo_create_transpose_sp @ActivityID, @ActivityName,
/* Code Modified for the Case ID:PNR2.0_30361 By Kiruthika */
@ILBOCode, @ControlID, @ecrno, @NewILBOCode OUTPUT--,@Platform
--Modification made by Kiruthika for bugid:PNR2.0_29888
/* Code Modified for the Case ID:PNR2.0_30361 By Kiruthika */
IF (@ReturnStatus <> 3)
BEGIN
SELECT @Status = 2
CLOSE ctrl_cursor
DEALLOCATE ctrl_cursor
CLOSE ilbo_cursor
DEALLOCATE ilbo_cursor
RETURN
END

-- should also call the sp which creates links for all
-- the helps used by the parent ilbo in which the
-- parent ilbo's multiline participates.
EXEC @ReturnStatus = de_fw_req_transpose_help_sp @ActivityID, @ILBOCode, @NewILBOCode, @ControlID, @ecrno
IF (@ReturnStatus <> 3)
BEGIN
SELECT @Status = 2
CLOSE ctrl_cursor
DEALLOCATE ctrl_cursor
CLOSE ilbo_cursor
DEALLOCATE ilbo_cursor
RETURN
END


FETCH NEXT FROM
ctrl_cursor
INTO
@ControlID
END
CLOSE ctrl_cursor
--DEALLOCATE ctrl_cursor

FETCH NEXT FROM
ilbo_cursor
INTO
@ILBOCode
END
CLOSE ilbo_cursor
--DEALLOCATE ilbo_cursor
END

SET NOCOUNT OFF
DEALLOCATE ctrl_cursor
DEALLOCATE ilbo_cursor

SELECT @Status = 1

END







