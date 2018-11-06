<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
<%
'-------------------------------------------------------------------------------------------
'	Request
	Dim cert_num	: cert_num	= Trim(fncRequest("cert_num"))
	Dim hp			: hp		= fncRequest("hp")
'-------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------
'	데이터 확인
	If cert_num = "" Then 
		intMsg = 1
	ElseIf hp = "" Then 
		intMsg = 2
	Else 
		strSql = " SELECT TOP 1 MC_CERT_NUM FROM MO_MEM_CERT WITH(NOLOCK) WHERE MC_HP_NO='"& hp &"' ORDER BY MC_REG_DT DESC "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			intNum = Rs(0)
		End If 
		Call RSClose(Rs)

		If Int(cert_num) = Int(intNum) Then 
			intMsg = 3
		Else 
			intMsg = 4
		End If 
	End If 
	
	response.Write intMsg
%>