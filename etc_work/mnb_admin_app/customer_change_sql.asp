<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 
 
	idx				=	fncRequest("idx")
	flg				=	fncRequest("flg")
 
	intMsg = 1
 
	
		If flg <> "" and idx <> ""	Then 
  
			If flg = "Y" then
		
				strSql = ""	 
				strSql = strSql & " UPDATE  MO_APP_MY_DATA_HISTORY   SET "  
				strSql = strSql & "			MH_CHECK 	='"& flg &"'	"  
				strSql = strSql & "	WHERE	MH_SEQ			='"& idx &"'				"

				intMsg = 2 '수정
			 
			End If 

				Call DBExec(strSql, "main") : Call DBClose(DBCon)

		End If 
 
		Response.write intMsg
 
%>
 