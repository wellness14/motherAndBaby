<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 

	check_y			=	fncRequest("check") 
	mh_seq			=	fncRequest("SEQ") 
	check_flg		=	fncRequest("check_flg") 

	Response.write check_y		& "<br>"
	Response.write mh_seq		& "<br>" 
	Response.write check_flg	& "<br>" 


	Dim mode : mode = "ins"
 
 
 
		If check_flg <> "" And mh_seq <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_HISTORY  where  MH_SEQ =   '"& mh_seq &"'  and  MH_NAME='"& check_flg &"' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			 	mode = "upd" 
			Else 

			End If 
			CALL RSCLOSE(RS)
		End If 
 
		Select Case mode 
				Case "ins" : 
	  
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_HISTORY SET "  
					strSql = strSql & "       MH_CHECK		= '"& check_y &"' "   
					strSql = strSql & "	WHERE MH_SEQ = '"& mh_seq &"'	and  MH_NAME= '"& check_flg &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
 
		End Select  
		Response.write intMsg
 
 



%>
 