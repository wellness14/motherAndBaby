<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.Charset = "UTF-8"
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<%
	ME_TEL = Request("phone01") & "-" & Request("phone02") & "-" & Request("phone03")
	ME_NAME = Request("name")
	ME_DUE_DATE = Request("year") & "-" & Request("month") & "-" & Request("day")
	ME_POST = Request("address01") & "-" & Request("address02")
	ME_ADDR1 = Request("address03")
	ME_ADDR2 = Request("address04")
	ME_GUIDE_WANT = Request("want")
	ME_IP = Request.ServerVariables("REMOTE_ADDR")

	strSql = "INSERT INTO MOMTALK_EVENT (ME_TEL, ME_NAME, ME_DUE_DATE, ME_POST, ME_ADDR1, ME_ADDR2, ME_GUIDE_WANT, ME_IP)"
	strSql = strSql & "VALUES ('" & ME_TEL & "', '" & ME_NAME & "', '" & ME_DUE_DATE & "', '" & ME_POST & "', '" & ME_ADDR1 & "', '" & ME_ADDR2 & "', '" & ME_GUIDE_WANT & "', '" & ME_IP & "')"
	
	'response.Write strSql
	'response.End

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
%>
<script type="text/javascript">
	parent.saveOk();
</script>