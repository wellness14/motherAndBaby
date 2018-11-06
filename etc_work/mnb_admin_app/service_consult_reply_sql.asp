<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 

	as_reply_content		=	fncRequest("as_reply_content")
	idx						=	fncRequest("idx")
	reply_flg				=	fncRequest("reply_flg")
 
	intMsg = 1
 
	
		If as_reply_content <> "" and idx <> ""	Then 
  
			If reply_flg = "Y" then
		
				strSql = ""	 
				strSql = strSql & " UPDATE  MO_APP_SERVICE_CONSULT   SET "  
				strSql = strSql & "			AS_REPLY_CONTENT 	='"& as_reply_content &"'	"  
				strSql = strSql & "	WHERE	AS_SEQ				='"& idx &"'				"

				intMsg = 2 '수정
			
			Else

				strSql = ""	 
				strSql = strSql & " UPDATE  MO_APP_SERVICE_CONSULT   SET "  
				strSql = strSql & "			AS_REPLY_CONTENT 	='"& as_reply_content &"'	"  
				strSql = strSql & ",		AS_REPLY 			='Y'						"  
				strSql = strSql & "	WHERE	AS_SEQ				='"& idx &"'				" 

				intMsg = 3 '등록
				 
			End If 

				Call DBExec(strSql, "main") : Call DBClose(DBCon)

		End If 
 
		Response.write intMsg
 
%>
 