<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	DIM USERID, USER_PWD, LOGIN_TYPE, RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	helper_point	= fncRequest("helper_point")
	nurse_point	= fncRequest("nurse_point")
	bodycare_point	= fncRequest("bodycare_point")
	mom_milk_msg_point	= fncRequest("mom_milk_msg_point")
	mmilk_analysis_point	= fncRequest("mmilk_analysis_point")
	sodok	= fncRequest("sodok")
	mr_idx	= fncRequest("mr_idx")
 
	intMsg = 2
 
 
  
	If mr_idx <> "" Then 
 

				strSql = ""	 
				strSql = strSql & " UPDATE  MO_RESERVATION  SET " 
If helper_point <> "" Then 
				strSql = strSql & "       MR_HELPER_POINT				='"& helper_point &"' "
ElseIf 	nurse_point <> "" Then 		
				strSql = strSql & "       MR_NURSE_POINT				='"& nurse_point &"' "
ElseIf 	bodycare_point <> "" Then 				
				strSql = strSql & "       MR_BODYCARE_POINT				='"& bodycare_point &"' "
ElseIf 	mom_milk_msg_point <> "" Then 				
				strSql = strSql & "       MR_MOM_MILK_MSG_POINT			='"& mom_milk_msg_point &"' "
ElseIf 	mmilk_analysis_point <> "" Then 				
				strSql = strSql & "       MR_MOM_MILK_ANALYSIS_POINT	='"& mmilk_analysis_point &"' "
ElseIf 	sodok <> "" Then 				
				strSql = strSql & "       MR_SODOK_POINT				='"& sodok &"' "
End If 
				strSql = strSql & "	WHERE MR_IDX			='"& mr_idx &"'; "

				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				Response.write  1
			


	End If 
%>
 