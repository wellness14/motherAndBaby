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
	mem_id = fncRequest("cert_mnb_id")
	pw = fncRequest("mnb_pwd2")


	'--------------------------------------------------------------------------
	'	ȸ������ ��ȸ
	If mem_id = "" Then 
		intMsg = 1
	else
		strSql  = ""
		strSql = strSql & "	SELECT MM_MEM_ID FROM MO_MEM_MAS WITH(NOLOCK) "
		strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"' and  MM_MEM_PW = dbo.UF_MD5('"& pw &"')  "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			intMsg = 2
		Else 
			intMsg = 3
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------
	End If 



	If intMsg = 2 Then 
	'--------------------------------------------------------------------------
	'	ȸ������ ��ȸ

		strSql  = ""
		strSql = strSql & "	SELECT MD_MEM_ID, MD_EVENT FROM MO_MEM_DTL WITH(NOLOCK) "
		strSql = strSql & "	WHERE MD_MEM_ID='"& mem_id &"' and  MD_EVENT = 'Y'  "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			intMsg = 22		'���̵� �����޾������
		Else 
			intMsg = 33		'���̵� �������� �ʾ��� ���
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------
	Else 
			intMsg = 3		'���̵� Ʋ�Ȱų� ��ϵ��� ������� �ʾ��� ���
	End if

		



'	If intMsg = 33 Then
'		strSql  = ""
'		strSql = strSql & "	update MO_MEM_DTL set MD_EVENT = 'Y' WHERE MD_MEM_ID='"& mem_id &"' "
'			intMsg = 2
'		Call DBExec(strSql, "main") : Call DBClose(DBCon)
'	End if



	response.Write intMsg
%>