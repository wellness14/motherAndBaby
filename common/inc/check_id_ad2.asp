<%
Response.AddHeader "Cache-Control", "no-cache"
Response.AddHeader "Expires", "0"
Response.AddHeader "Pragma", "no-cache"
Response.ContentType = "text/html; charset=euc-kr"
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<!-- #include virtual = "/common/asp/DbGodo.asp"-->
<%
	mem_id = fncRequest("mem_id")

	If mem_id = "" Then 
		intMsg = 1
	Else 
	'--------------------------------------------------------------------------
	'	회원정보 조회
		strSql  = ""
		strSql = strSql & "	SELECT MM_MEM_ID FROM MO_MEM_MAS WITH(NOLOCK) "
		strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			intMsg1 = 2
		Else 
			intMsg1 = 3
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------

	'--------------------------------------------------------------------------
	'	고도몰 회원정보 조회
		strSql  = ""
		strSql = strSql & "	select m_id from gd_member where m_id = '" & mem_id & "'"
		Set Rs = dbConGodo.Execute(strSql)

		If Not Rs.EOF Then 
			intMsg2 = 2
		Else 
			intMsg2 = 3
		End If

		Rs.Close
		Set Rs = Nothing

		dbConGodo.Close
		Set dbConGodo = Nothing
	'--------------------------------------------------------------------------

		If intMsg1 = 3 And intMsg2 = 3 Then
			intMsg = 3
		Else
			intMsg = 2
		End If
	End If

	response.Write intMsg
%>