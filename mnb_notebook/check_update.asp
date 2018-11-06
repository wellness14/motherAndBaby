<% 
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 

<%	
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
'-----------------------------------------------------------------------------
'	Request
    mode				= fncRequest("mode")				'처리구분(등록/수정)
	hp_seq				= Trim(fncRequest("hp_seq"))		' hp_seq
	idx					= Trim(fncRequest("idx"))			' idx 
 
 
	baby_seq				= Trim(fncRequest("baby_seq"))		' hp_seq
	mo_note_seq				= Trim(fncRequest("mo_note_seq"))		' hp_seq
	check1				= Trim(fncRequest("check1"))		' check1
	check2				= Trim(fncRequest("check2"))		' check1
	check3				= Trim(fncRequest("check3"))		' check1
	check4				= Trim(fncRequest("check4"))		' check1
	check5				= Trim(fncRequest("check5"))		' check1
	check6				= Trim(fncRequest("check6"))		' check1
	check7				= Trim(fncRequest("check7"))		' check1
	check8				= Trim(fncRequest("check8"))		' check1
	check9				= Trim(fncRequest("check9"))		' check1

	check10				= Trim(fncRequest("check10"))		' check1
	check11				= Trim(fncRequest("check11"))		' check1
	check12				= Trim(fncRequest("check12"))		' check1

	check13				= Trim(fncRequest("check13"))		' check1

	check14				= Trim(fncRequest("check14"))		' check1
	check15				= Trim(fncRequest("check15"))		' check1
	check16				= Trim(fncRequest("check16"))		' check1
	check17				= Trim(fncRequest("check17"))		' check1

	check18				= Trim(fncRequest("check18"))		' check1
	check19				= Trim(fncRequest("check19"))		' check1
	check20				= Trim(fncRequest("check20"))		' check1
	check21				= Trim(fncRequest("check21"))		' check1
	check22				= Trim(fncRequest("check22"))		' check1  

	event_contents				= Trim(fncRequest("event_contents"))		' event_contents  

'-----------------------------------------------------------------------------
     
%>
   
<%
 				Select Case mode 
				Case "ins" :

				strSql = strSql & " INSERT INTO MO_SERVICE_LIST ( "

				strSql = strSql & "    MO_NOTE_SEQ	"
				strSql = strSql & " ,  MR_IDX	"
				strSql = strSql & " ,  HELPER_SEQ	"
				strSql = strSql & " ,  MO_BABY_SEQ	"
				strSql = strSql & " ,  MO_NOTE_DAY	"
If check1 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_HELLO	"
ElseIf check2 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_UNIFORM	"
ElseIf check3 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_CLEAN	"
ElseIf check4 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_CHECK	"
ElseIf check5 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_SANMO1	"
ElseIf check6 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_SANMO2	"
ElseIf check7 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_SANMO3	"
ElseIf check8 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_SANMO4	"
ElseIf check9 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_SANMO5	"
ElseIf check10 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_SANMO6	"
ElseIf check11 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY1	"
ElseIf check12 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY2	"
ElseIf check13 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY3	"
ElseIf check14 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY4	"
ElseIf check15 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY5	"
ElseIf check16 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY6	"
ElseIf check17 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY7	"
ElseIf check18 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY8	"
ElseIf check19 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY9	"
ElseIf check20 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY10	"
ElseIf check21 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY11	"
ElseIf check22 <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_BABY12	"
ElseIf event_contents <> "" Then 
				strSql = strSql & " ,  MO_SERVICE_CONTENT	"
End if
				strSql = strSql & " )  "
				strSql = strSql & " VALUES (    (SELECT ISNULL(MAX(MO_NOTE_SEQ), 0) + 1 FROM MO_SERVICE_LIST) " 
				strSql = strSql & ", '"& idx &"' , '"& hp_seq &"' , '"& baby_seq &"'  , (SELECT ISNULL(MAX(MO_NOTE_DAY), 0) + 1 FROM MO_SERVICE_LIST) , '"
	
If check1 <> "" Then 				
				strSql = strSql & check1 &"');"
ElseIf check2 <> "" Then  	
				strSql = strSql & check2 &"');"
ElseIf check3 <> "" Then 
				strSql = strSql & check3 &"');"
ElseIf check4 <> "" Then 
				strSql = strSql & check4 &"');"
ElseIf check5 <> "" Then 
				strSql = strSql & check5 &"');"
ElseIf check6 <> "" Then 
				strSql = strSql & check6 &"');"
ElseIf check7 <> "" Then 
				strSql = strSql & check7 &"');"
ElseIf check8 <> "" Then 
				strSql = strSql & check8 &"');"
ElseIf check9 <> "" Then 
				strSql = strSql & check9 &"');"
ElseIf check10 <> "" Then 
				strSql = strSql & check10 &"');"
ElseIf check11 <> "" Then 
				strSql = strSql & check11 &"');"
ElseIf check12 <> "" Then 
				strSql = strSql & check12 &"');"
ElseIf check13 <> "" Then 
				strSql = strSql & check13 &"');"
ElseIf check14 <> "" Then 
				strSql = strSql & check14 &"');"
ElseIf check15 <> "" Then 
				strSql = strSql & check15 &"');"
ElseIf check16 <> "" Then 
				strSql = strSql & check16 &"');"
ElseIf check17 <> "" Then 
				strSql = strSql & check17 &"');"
ElseIf check18 <> "" Then 
				strSql = strSql & check18 &"');"
ElseIf check19 <> "" Then 
				strSql = strSql & check19 &"');"
ElseIf check20 <> "" Then 
				strSql = strSql & check20 &"');"
ElseIf check21 <> "" Then 
				strSql = strSql & check21 &"');"
ElseIf check22 <> "" Then 
				strSql = strSql & check22 &"');"
ElseIf event_contents <> "" Then 
				strSql = strSql & event_contents &"');"
End if


				
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2

 
			Case "upd" : 
				strSql = ""
				strSql = strSql & " UPDATE MO_SERVICE_LIST SET "
				strSql = strSql & "		MR_IDX = '"& idx &"' "
 
If check1 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_HELLO = '"& check1 &"' "
ElseIf check2 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_UNIFORM = '"& check2 &"' "
ElseIf check3 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_CLEAN = '"& check3 &"' "
ElseIf check4 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_CHECK = '"& check4 &"' "
ElseIf check5 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_SANMO1 = '"& check5 &"' "
ElseIf check6 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_SANMO2 = '"& check6 &"' "
ElseIf check7 <> "" Then
				strSql = strSql & ",	MO_SERVICE_SANMO3 = '"& check7 &"' "
ElseIf check8 <> "" Then
				strSql = strSql & ",	MO_SERVICE_SANMO4 = '"& check8 &"' "
ElseIf check9 <> "" Then
				strSql = strSql & ",	MO_SERVICE_SANMO5 = '"& check9 &"' "
ElseIf check10 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_SANMO6 = '"& check10 &"' "
ElseIf check11 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY1 = '"& check11 &"' "
ElseIf check12 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY2 = '"& check12 &"' "
ElseIf check13 <> "" Then
				strSql = strSql & ",	MO_SERVICE_BABY3 = '"& check13 &"' "
ElseIf check14 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY4 = '"& check14 &"' "
ElseIf check15 <> "" Then
				strSql = strSql & ",	MO_SERVICE_BABY5 = '"& check15 &"' "
ElseIf check16 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY6 = '"& check16 &"' "
ElseIf check17 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY7 = '"& check17 &"' "
ElseIf check18 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY8 = '"& check18 &"' "
ElseIf check19 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY9 = '"& check19 &"' "
ElseIf check20 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY10 = '"& check20 &"' "
ElseIf check21 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY11 = '"& check21 &"' "
ElseIf check22 <> "" Then 
				strSql = strSql & ",	MO_SERVICE_BABY12 = '"& check22 &"' "
ElseIf event_contents <> "" Then 
				strSql = strSql & ",	MO_SERVICE_CONTENT = '"& event_contents &"' "
End if
				strSql = strSql & "	WHERE MO_NOTE_SEQ ='"& mo_note_seq &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3

			End Select 
 


			Response.Write intMsg
%>
 
