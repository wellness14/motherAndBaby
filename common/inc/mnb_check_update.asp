<%
Response.AddHeader "Cache-Control", "no-cache"
Response.AddHeader "Expires", "0"
Response.AddHeader "Pragma", "no-cache"
Response.ContentType = "text/html; charset=euc-kr"
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	mem_id = fncRequest("user_id")
	pw = fncRequest("mnb_pwd2")


	'--------------------------------------------------------------------------
	'	회원정보 조회
	If mem_id = "" Then 
		intMsg = 1
	else
		strSql  = ""
		strSql = strSql & "	update MO_MEM_DTL set MD_EVENT = 'Y' WHERE MD_MEM_ID='"& mem_id &"' "
			intMsg = 2
		Call DBExec(strSql, "main") : Call DBClose(DBCon)
	'--------------------------------------------------------------------------
	End If 



'	If intMsg = 33 Then
'		strSql  = ""
'		strSql = strSql & "	update MO_MEM_DTL set MD_EVENT = 'Y' WHERE MD_MEM_ID='"& mem_id &"' "
'			intMsg = 2
'		Call DBExec(strSql, "main") : Call DBClose(DBCon)
'	End if



	response.Write intMsg
%>