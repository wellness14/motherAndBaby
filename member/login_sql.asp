<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	DIM USERID, USER_PWD, LOGIN_TYPE, RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	USERID		= fncRequest("loginid")
	USER_PWD	= fncRequest("loginpw")

	USERID		= REPLACE(USERID, "'", "")
	USERID		= REPLACE(USERID, "-", "")
	USER_PWD	= REPLACE(REPLACE(USER_PWD, "'", ""), "-", "")

	reUrl = fncRequest("reUrl")

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

			If reUrl <> "" Then
				RE_PATH = reUrl
			Else
				RE_PATH = "http://www.mothernbaby.co.kr/"
			End If
			
			response.Write "<script type='text/javascript'>parent.location.href='"& RE_PATH &"'</script>"
			response.End 




		End If


		CALL RSCLOSE(RS)

		


	End If 
%>
<script type="text/javascript">
<!--
   alert("���̵� / �н����带 Ȯ���� �ּ���.");
   parent.location.href="/member/login.asp?mOne=6&mTwo=1&reUrl=" + escape("<%=reUrl%>");
//-->
</SCRIPT>