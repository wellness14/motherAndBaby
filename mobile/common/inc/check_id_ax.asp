<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

%>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
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
			intMsg = 2
		Else 
			intMsg = 3
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------
	End If 

	response.Write intMsg
%>