<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	consultName = fncRequest("consultName")
	consultBirth = Replace(fncRequest("consultBirth"), "-", "")
	consultTel1 = fncRequest("consultTel1")
	consultTel2 = fncRequest("consultTel2")
	consultTel3 = fncRequest("consultTel3")
	consultMobile1 = fncRequest("consultMobile1")
	consultMobile2 = fncRequest("consultMobile2")
	consultMobile3 = fncRequest("consultMobile3")
	consultPost = fncRequest("consultPost")
	consultAddr1 = fncRequest("consultAddr1")
	consultAddr2 = fncRequest("consultAddr2")
	consultContent = fncRequest("consultContent")

	If consultTel1 = "-" Then
		consultTel = ""
	Else
		consultTel = consultTel1 & "-" & consultTel2 & "-" & consultTel3
	End If

	consultMobile = consultMobile1 & "-" & consultMobile2 & "-" & consultMobile3

	strSql = ""
	strSql = strSql & " INSERT INTO MO_BRD_SERVICE ( "
	strSql = strSql & " MS_MEM_ID, MS_MEM_NM, MS_CHILDBIRTH, MS_PHONE,  MS_HP, MS_POST, MS_ADDR1, MS_ADDR2, "
	strSql = strSql & " MS_CONTENT, MD_LOCAL, MD_LOCAL_DETAIL, MS_ROUTE, MS_CONTRACT) "
	strSql = strSql & " VALUES ( "
	strSql = strSql & "	'', '"& consultName &"', '"& consultBirth &"', '"& consultTel &"', '"& consultMobile &"', '"& consultPost &"', '"& consultAddr1 &"', '"& consultAddr2 &"', "
	strSql = strSql & "	'"& consultContent &"' ,'1' ,'1', 'flowerbirth', '') "

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
%>
<script type="text/javascript">
	parent.result();
</script>