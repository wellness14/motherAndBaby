<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
response.charset = "utf-8"
%>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
<%
	DIM USERID, USER_PWD, LOGIN_TYPE, RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	USERID		= fncRequest("loginid")
	USER_PWD	= fncRequest("loginpw")

	USERID		= REPLACE(USERID, "'", "")
	USERID		= REPLACE(USERID, "-", "")
	USER_PWD	= REPLACE(REPLACE(USER_PWD, "'", ""), "-", "")

	If USERID <> "" And USER_PWD <> "" Then 
		strSql = "SELECT MM_MEM_NM, MM_MEM_TYPE FROM MO_MEM_MAS with(nolock) WHERE MM_MEM_ID='"& USERID &"' AND MM_MEM_PW = dbo.UF_MD5('"& USER_PWD &"') AND MM_DEL_DT IS NULL "
		Set RS = DBExec(strSql, "main")
		If Not Rs.EOF Then 
			Response.Cookies("uid") = USERID
			Response.Cookies("uid").Path = "/"
			Response.Cookies("uid").Domain = strDomain

			Response.Cookies("uname") = TRIM(RS(0))
			Response.Cookies("uname").Path = "/"
			Response.Cookies("uname").Domain = strDomain

			Response.Cookies("mem_type") = TRIM(RS(1))
			Response.Cookies("mem_type").Path = "/"
			Response.Cookies("mem_type").Domain = strDomain

			RE_PATH = "/mobile/main/"
			
			response.Write "<script type='text/javascript'>parent.location.href='"& RE_PATH &"'</script>"
			response.End 
		End If 
		CALL RSCLOSE(RS)
	End If 
%>
<script type="text/javascript">
<!--
   alert("아이디 / 패스워드를 확인해 주세요.");
   parent.location.href="/mobile/member/login.asp"
//-->
</SCRIPT>