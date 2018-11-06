<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<!-- #include virtual = "/common/asp/DbGodo.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	DIM USERID, USER_PWD, LOGIN_TYPE, RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	USERID		= fncRequest("user_id")
	USER_PWD	= fncRequest("user_pw")

	USERID		= REPLACE(USERID, "'", "")
	USERID		= REPLACE(USERID, "-", "")
	USER_PWD	= REPLACE(REPLACE(USER_PWD, "'", ""), "-", "")

 
 
  
	If USERID <> "" Then 
		strSql = "SELECT MM_MEM_ID, MM_MEM_NM, MM_MEM_TYPE FROM MO_MEM_MAS with(nolock) WHERE MM_MEM_ID='"& USERID &"' "
		 
		Set RS = DBExec(strSql, "main")
		If Not Rs.EOF Then 
			mem_id = Rs(0)
			intMsg1 = 1
		'	response.Write  1  '아이디 있음

		'	If reUrl <> "" Then
		'		RE_PATH = reUrl
		'	Else
		'		RE_PATH = "http://www.mothernbaby.co.kr/mnb_notebook/login.asp"
		'	End If
			
		'	response.Write "<script type='text/javascript'>parent.location.href='/etc_work/mnb_app/plan_list.asp'</script>"
		'	response.End 
		Else
		
			intMsg1 = 0
		'	response.Write  0  '아이디 없음


		End If


		CALL RSCLOSE(RS)


		'	고도몰 회원정보 조회
		strSql  = ""
		strSql = strSql & "	select m_id from gd_member where m_id = '" & USERID & "'"
		Set Rs = dbConGodo.Execute(strSql)

		If Not Rs.EOF Then 
			intMsg2 = 1
		Else 
			intMsg2 = 0
		End If

		Rs.Close
		Set Rs = Nothing

		dbConGodo.Close
		Set dbConGodo = Nothing

		If intMsg1 = 0 And intMsg2 = 0 Then
			intMsg = 0
		Else
			intMsg = 1
		End If

		response.Write intMsg
	End If 
%>
 