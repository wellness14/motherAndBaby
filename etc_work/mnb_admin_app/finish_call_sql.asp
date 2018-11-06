<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 
 
	idx							=	fncRequest("idx")
	call_fisish_flg				=	fncRequest("call_fisish_flg")
 
	intMsg = 1
 
	
		If call_fisish_flg <> "" and idx <> ""	Then 
  
			If call_fisish_flg = "Y" then
		
				strSql = ""	 
				strSql = strSql & " UPDATE  MO_APP_CALL_SERVICE   SET "  
				strSql = strSql & "			CALL_FINISH_FLG 	='"& call_fisish_flg &"'	"  
				strSql = strSql & "	WHERE	CALL_SEQ			='"& idx &"'				"

				intMsg = 2 '수정
			 
			End If 

				Call DBExec(strSql, "main") : Call DBClose(DBCon)

		End If 
 
		Response.write intMsg
 
%>
 