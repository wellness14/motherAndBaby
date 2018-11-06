<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 

	check_flg		=	fncRequest("check")
	now_date		=	fncRequest("date")
	mr_idx			=	fncRequest("mr_idx")
	mem_id			=	fncRequest("mem_id") 
	page_flg		=	fncRequest("page_flg")
	


	Dim mode : mode = "ins"

	If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
		strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='" & page_flg & "' "
		 
		Set RS = DBExec(strSql, "main")
		If Not Rs.EOF Then
			mode = "upd"
		Else

		End If
		CALL RSCLOSE(RS)
	End If

	Select Case mode
		Case "ins" :
			strSql = strSql & " INSERT INTO MO_APP_MY_DATA_CHECK ( "
			strSql = strSql & "       MR_IDX				"
			strSql = strSql & ",      MR_MEM_ID				"
			strSql = strSql & ",      MS_CHECK_NAME			" 
			strSql = strSql & ",      MS_CHECK_FLG			"
			strSql = strSql & ",      MS_CHECK_DATE			"
			strSql = strSql & " )  "
			strSql = strSql & " values ( "
			strSql = strSql & "	 		'"& mr_idx					&"' "
			strSql = strSql & ", 		'"& mem_id					&"' "
			strSql = strSql & ", 		'" & page_flg & "'				"
			strSql = strSql & ", 		'"& check_flg				&"' "
			strSql = strSql & ",	 	'"& now_date				&"'); "
			Call DBExec(strSql, "main") : Call DBClose(DBCon)

		Case "upd" :
			strSql = ""
			strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "
			strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "
			strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "
			strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='" & page_flg & "' "
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 3
	End Select

	Response.write intMsg
%>