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
  
	mo_note_seq				= Trim(fncRequest("mo_note_seq"))		' hp_seq 
	writer_temp			= Trim(fncRequest("writer_temp"))		' hp_seq event_contents
	writer_mm			= Trim(fncRequest("writer_mm"))  '일자
	writer_mp        = Trim(fncRequest("writer_mp"))	   '시간
	writer_big				= Trim(fncRequest("writer_big"))	   '주야간
	writer_small			= Trim(fncRequest("writer_small"))	   '모유
	writer_etc				= Trim(fncRequest("writer_etc"))		   '분유
 
'----------------------------------------------------------------------------- 

 
 
'------------------------------------------------------------------------------- 

				strSql = strSql & " UPDATE MO_NOTE_DETAIL SET "
				strSql = strSql & "		MO_NOTE_WORK_TEMP = '"& writer_temp &"' "
				strSql = strSql & ",	MO_NOTE_MOM_MILK = '"& writer_mm &"' "
				strSql = strSql & ",	MO_NOTE_MILK_POWDER = '"& writer_mp &"' "
				strSql = strSql & ",	MO_NOTE_BIG = '"& writer_big &"' "
				strSql = strSql & ",	MO_NOTE_SMALL = '"& writer_small &"' " 
				strSql = strSql & ",	MO_NOTE_ETC = '"& writer_etc &"' "
 
				strSql = strSql & "	WHERE MO_NOTE_SEQ ='"& mo_note_seq &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
 
		  
	Response.Write intMsg

%>
  