<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	DIM USERID, USER_PWD, LOGIN_TYPE, RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	USERID		= fncRequest("user_id")
	USER_PWD	= fncRequest("user_pwd")

	USERID		= REPLACE(USERID, "'", "")
	USERID		= REPLACE(USERID, "-", "")
	USER_PWD	= REPLACE(REPLACE(USER_PWD, "'", ""), "-", "")

'	reUrl = fncRequest("reUrl")

  
	If USERID <> "" And USER_PWD <> "" Then 
		strSql = "SELECT MD_HELPER_NAME FROM MO_HELPER with(nolock) WHERE MD_HELPER_ID='"& USERID &"' AND MD_HELPER_PASS = '"& USER_PWD &"'  "
		Set RS = DBExec(strSql, "main")
		If Not Rs.EOF Then 
			Response.Cookies("uid") = USERID
			Response.Cookies("uid").Path = "/"
			Response.Cookies("uid").Domain = strDomain

			Response.Cookies("uname") = TRIM(RS(0))
			Response.Cookies("uname").Path = "/"
			Response.Cookies("uname").Domain = strDomain

 

		'	If reUrl <> "" Then
		'		RE_PATH = reUrl
		'	Else
		'		RE_PATH = "http://www.mothernbaby.co.kr/mnb_notebook/login.asp"
		'	End If
			
			response.Write "<script type='text/javascript'>parent.location.href='/mnb_notebook/customer_list.asp'</script>"
			response.End 




		End If


		CALL RSCLOSE(RS)

		


	End If 
%>
<script type="text/javascript"  charset="utf-8">
<!--
   alert("접속정보가 올바르지 않습니다. \t 계속 로그인이 안되시면 \t 마더앤베이비 본사 \t 02)557-3579로  연락하세요");
   parent.location.href="/mnb_notebook/login.asp";
//-->
</SCRIPT>