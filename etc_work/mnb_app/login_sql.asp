<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	DIM USERID, USER_PWD, LOGIN_TYPE, RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	USERID		= fncRequest("user_id")
	USER_PWD	= fncRequest("user_pw")
	login_auto		= fncRequest("login_auto")

	USERID		= REPLACE(USERID, "'", "")
	USERID		= REPLACE(USERID, "-", "")
	USER_PWD	= REPLACE(REPLACE(USER_PWD, "'", ""), "-", "")

'	reUrl = fncRequest("reUrl")
 
  
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

		If login_auto <> "" Then 
			Response.Cookies ("uid").expires = Date +365 
			Response.Cookies ("uname").expires = Date +365 
			Response.Cookies ("auto_login_ck").expires = Date +365 
			Response.Cookies ("auto_login_ck")("Flag") = "on"
		End if

		'	If reUrl <> "" Then
		'		RE_PATH = reUrl
		'	Else
		'		RE_PATH = "http://www.mothernbaby.co.kr/mnb_notebook/login.asp"
		'	End If
			
			response.Write "<script type='text/javascript'>parent.location.href='/etc_work/mnb_app/plan_list.asp'</script>"
			response.End 




		End If


		CALL RSCLOSE(RS)

		


	End If 
%>
<script type="text/javascript"  charset="utf-8">
<!--
   alert("정보가 올바르지 않습니다. 다시 확인하세요");
   parent.location.href="/etc_work/mnb_app/login.asp";
//-->
</SCRIPT>