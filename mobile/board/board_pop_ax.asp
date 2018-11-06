<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

%>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
<%
	Dim service_flg : service_flg = True 
'------------------------------------------------------------------
'	Request
	idx		= fncRequest("idx")
	val		= fncRequest("val")
	brd_id	= fncRequest("brd_id")
'------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 생성여부 확인
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			service_flg = False 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

	If service_flg = False Then 
		intMsg = 1
	ElseIf idx = "" Or val = "" Then 
		intMsg = 2
	Else 
	'--------------------------------------------------------------------------
	'	비밀번호 확인
		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_SEC_NUM "
		strSql = strSql & "		FROM "& brd_tbl &" WITH(NOLOCK) "
		strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_IDX='"& idx &"' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			sec_num		= Rs("BA_SEC_NUM")
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------

		If val = sec_num Then 
			intMsg = 3
		Else 
			intMsg = 4
		End If 
	End If 

	response.Write intMsg
%>