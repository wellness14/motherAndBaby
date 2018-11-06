<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	callback = fncRequest("callback")

	If callback = "" Then
		Response.End
	End If

	brd_tbl = "MO_BRD_PRAISE"

	result = fncRequest("ba_content")

	mem_nm = fncRequest("ba_mem_nm")
	email = fncRequest("ba_email")
	ba_local_detail = Trim(fncRequest("ba_local_detail"))
	title = Trim(fncRequest("ba_title"))
	'content = Replace(Trim(fncRequest("ba_content")), "<br/>", Chr(10))
	content = Trim(fncRequest("ba_content"))

	If ba_local_detail <> "" then
		class_value = ba_local_detail
		dim myarray
		myarray=split(class_value,":")
		class_value_1=myarray(0)
		title_value_1=myarray(1)
	End If

	sec_flg = "N"
	intPw = ""
	user_ip = ""
	fileNm = ""
	filePath = ""

	strSql = ""
	strSql = strSql & " DECLARE  @IDX INT; "
	strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
	strSql = strSql & "         BA_SEQ, BA_DPH, BA_PIDX, BA_LOCAL, BA_LOCAL_DETAIL, BA_MEM_ID, BA_MEM_NM, BA_TITLE, "
	strSql = strSql & "         BA_CONTENT, BA_SEC_FLG, BA_SEC_NUM, BA_IP, BA_EMAIL, BA_FILE_NM, BA_FILE_PATH "
	strSql = strSql & " )  "
	strSql = strSql & " SELECT  ISNULL((SELECT TOP 1 BA_SEQ FROM "& brd_tbl &" WITH(NOLOCK) ORDER BY BA_SEQ DESC),0)+1, "
	strSql = strSql & "			'1',ISNULL((SELECT TOP 1 BA_SEQ FROM " & brd_tbl & " WITH(NOLOCK) ORDER BY BA_SEQ DESC),0)+1, "
	strSql = strSql & "			'"& class_value_1 &"','"& title_value_1 &"','MOMCHO','"& mem_nm &"','"& title &"','"& content &"','"& sec_flg &"','"& intPw &"','"& user_ip &"', "
	strSql = strSql & "			'"& email &"','"& fileNm &"','"& filePath &"'; "
	strSql = strSql & "SELECT   @IDX = @@IDENTITY;  "
	strSql = strSql & "UPDATE   " & brd_tbl & " SET BA_PIDX = @IDX WHERE BA_IDX = @IDX; "

	Call DBExec(strSql, "main") : Call DBClose(DBCon)

	Response.write callback & "({result: 'success'})"
%>