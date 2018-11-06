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

  
	If page_flg = "address" Then 

	
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='address' "
			 
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
					strSql = strSql & ", 		'address'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon) 

				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='address' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 

	If page_flg = "service" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"' and  MS_CHECK_NAME='service'" 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'service'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "   
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"' and  MS_CHECK_NAME='service' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 


	If page_flg = "gift" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"' and MS_CHECK_NAME='gift' " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'gift'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='gift' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 

 
	If page_flg = "helper" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='helper'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'helper'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='helper' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 

	If page_flg = "helper_visit" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'   and  MS_CHECK_NAME='helper_visit' " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'helper_visit'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='helper_visit' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 
  
	If page_flg = "bodycare" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'   and  MS_CHECK_NAME='bodycare'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'bodycare'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='bodycare' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If  
	
	If page_flg = "nurse_visit" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"' and  MS_CHECK_NAME='nurse_visit'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'nurse_visit'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='nurse_visit' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 

	If page_flg = "mom_milk_analysis" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='mom_milk_analysis' " 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			 	mode = "upd" 
			Else
			 
			End If 
			CALL RSCLOSE(RS)
		End if
 
		Select Case mode 
				Case "ins" :  
					strSql = strSql & " INSERT INTO MO_APP_MY_DATA_CHECK ( "
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'mom_milk_analysis'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='mom_milk_analysis' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 
 
 	If page_flg = "sodok" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"' and  MS_CHECK_NAME='sodok' " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'sodok'							"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='sodok' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 
  
	If page_flg = "mom_milk_msg" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='mom_milk_msg' " 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			 	mode = "upd" 
			Else
			 
			End If 
			CALL RSCLOSE(RS)
		End if
 
		Select Case mode 
				Case "ins" :  
					strSql = strSql & " INSERT INTO MO_APP_MY_DATA_CHECK ( "
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'mom_milk_msg'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='mom_milk_msg' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 

	If page_flg = "pay" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'   and  MS_CHECK_NAME='pay'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'pay'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); "  
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='pay' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 
 
	If page_flg = "add_service1" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'   and  MS_CHECK_NAME='add_service1' " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'add_service1'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='add_service1' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 


	If page_flg = "add_service2" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"' and  MS_CHECK_NAME='add_service2' " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'add_service2'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='add_service2' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 
 
	If page_flg = "add_service3" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='add_service3' " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'add_service3'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='add_service3' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 
	
	If page_flg = "add_pay1" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'  and  MS_CHECK_NAME='add_pay1'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'add_pay1'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='add_pay1' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If  

	If page_flg = "add_pay2" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'   and  MS_CHECK_NAME='add_pay2'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'add_pay2'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='add_pay2' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If 

	If page_flg = "add_pay3" Then   
		If check_flg <> "" and now_date <> "" and mr_idx <> "" and mem_id <> "" Then 
			strSql = " select * from MO_APP_MY_DATA_CHECK  where  MR_IDX =   '"& mr_idx &"'   and  MS_CHECK_NAME='add_pay3'  " 
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
					strSql = strSql & "       MR_IDX		"
					strSql = strSql & ",      MR_MEM_ID		"
					strSql = strSql & ",      MS_CHECK_NAME		" 
					strSql = strSql & ",      MS_CHECK_FLG			"     
					strSql = strSql & ",      MS_CHECK_DATE			"     
					strSql = strSql & " )  "
					strSql = strSql & " values ( "
					strSql = strSql & "	 		'"& mr_idx					&"' "
					strSql = strSql & ", 		'"& mem_id					&"' "
					strSql = strSql & ", 		'add_pay3'					"
					strSql = strSql & ", 		'"& check_flg				&"' " 
					strSql = strSql & ",	 	'"& now_date				&"'); " 
		'			response.Write strSql
		'			response.End 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 2
 
				Case "upd" :   
					strSql = ""	 
					strSql = strSql & " UPDATE MO_APP_MY_DATA_CHECK SET "  
					strSql = strSql & "       MS_CHECK_FLG		='"& check_flg &"' "  
					strSql = strSql & ",      MS_CHECK_DATE		='"& now_date &"' "  
					strSql = strSql & "	WHERE MR_IDX='"& mr_idx &"'  and  MS_CHECK_NAME='add_pay3' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3 
		End Select  
		Response.write intMsg
	End If  
%>
 