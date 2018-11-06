<%
'======================================================================
'업 무 명 : 마더앤베이 - 서비스
'모듈기능 : 회원 가입
'파 일 명 : member_sql.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
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
	event_contents			= Trim(fncRequest("event_contents"))		' hp_seq event_contents

	MO_NOTE_DAY			= Trim(fncRequest("MO_NOTE_DAY"))  '일자
	MO_NOTE_WORK        = Trim(fncRequest("MO_NOTE_WORK"))	   '시간
	type_1				= Trim(fncRequest("type_1"))	   '주야간
	mom_milk			= Trim(fncRequest("mom_milk"))	   '모유
	milk				= Trim(fncRequest("milk"))		   '분유
	big_time			= Trim(fncRequest("big_time"))	   '대변
	small_time			= Trim(fncRequest("small_time"))   '소변
	emperature			= Trim(fncRequest("emperature"))   '소변
	etc			= Trim(fncRequest("etc"))   '소변

'-----------------------------------------------------------------------------
			 
 
  
				strSql = strSql & " INSERT INTO MO_NOTE_DETAIL ( "

				strSql = strSql & "    MO_NOTE_SEQ	"
				strSql = strSql & " ,  MR_IDX	"
				strSql = strSql & " ,  HELPER_SEQ	"
				strSql = strSql & " ,  MO_NOTE_DAY	"
				strSql = strSql & " ,  MO_NOTE_WORK	"
				strSql = strSql & " ,  MO_NOTE_WORK_TIME	"
				strSql = strSql & " ,  MO_NOTE_WORK_TEMP	"
				strSql = strSql & " ,  MO_NOTE_MOM_MILK	"
				strSql = strSql & " ,  MO_NOTE_MILK_POWDER	"
				strSql = strSql & " ,  MO_NOTE_BIG	"
				strSql = strSql & " ,  MO_NOTE_SMALL	"
				strSql = strSql & " ,  MO_NOTE_ETC	"
				strSql = strSql & " ,  MO_BABY_SEQ	"
 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES (    (SELECT ISNULL(MAX(MO_NOTE_SEQ), 0) + 1 FROM MO_NOTE_DETAIL) " 
				strSql = strSql & ", '"& idx &"' , '"& hp_seq &"' , '"& MO_NOTE_DAY &"' , '"& type_1 &"' , '"& MO_NOTE_WORK &"' , '"& emperature &"', '"& mom_milk &"' , '"& milk &"' , '"& big_time &"' , '"& small_time &"', '"& etc &"' , '"
				strSql = strSql & baby_seq &"');"
 	
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2

 
		 

 


	Response.Write intMsg

%>
  