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

	page = fncRequest("page")
	ba_idx = fncRequest("ba_idx")

	strSql = ""
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_MEM_NM "
	strSql = strSql & "			,BA_TITLE "
	strSql = strSql & "			,BA_CONTENT "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT "
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL) BA_LOCAL_NM "
	strSql = strSql & "			,ISNULL((SELECT TOP 1 BA_IDX FROM MO_BRD_PRAISE WHERE BA_DPH = 1 AND BA_CNLKBN='N' AND BA_IDX < '"& ba_idx &"' ORDER BY BA_SEQ DESC, BA_IDX DESC), 0) PREV_IDX "
	strSql = strSql & "			,ISNULL((SELECT TOP 1 BA_IDX FROM MO_BRD_PRAISE WHERE BA_DPH = 1 AND BA_CNLKBN='N' AND BA_IDX > '"& ba_idx &"'ORDER BY BA_SEQ, BA_IDX), 0) NEXT_IDX "
	strSql = strSql & "			,ROW_NUMBER() OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_PRAISE WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_IDX='"& ba_idx &"' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		mem_nm = Rs("BA_MEM_NM")
		title = Rs("BA_TITLE")
		content = Re_sqlFilter(Rs("BA_CONTENT"))
		content = Replace(content, Chr(10), "<br>")
		content = Replace(content, Chr(13), "<br>")
		content = Replace(content, "'", """")
		sec_flg = Rs("BA_SEC_FLG")
		reg_dt = Replace(Left(Rs("BA_REG_DT"), 10), "-", ".")
		ba_local_nm = Rs("BA_LOCAL_NM")

		prev_idx = Rs("PREV_IDX")
		next_idx = Rs("NEXT_IDX")
	Else
		prev_idx = 0
		next_idx = 0
	End If 
	Call RSClose(Rs)

	Response.write callback & "({ba_idx: " & ba_idx & ", prev_idx: " & prev_idx & ", next_idx: " & next_idx & ", ba_local_nm: '" & ba_local_nm & "', mem_nm: '" & mem_nm & "', title: '" & title & "', content: '" & content & "', sec_flg: '" & sec_flg & "', reg_dt: '" & reg_dt & "'})"
%>