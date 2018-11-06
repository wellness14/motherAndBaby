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
    mode						= fncRequest("mode")						' 처리구분(등록/수정)
	hp_seq						= Trim(fncRequest("hp_seq"))				' hp_seq
	idx							= Trim(fncRequest("idx"))					' idx 
	baby_seq					= Trim(fncRequest("baby_seq"))				' hp_seq
	mo_note_seq					= Trim(fncRequest("mo_note_seq"))			' hp_seq 
	MO_NOTE_DAY					= Trim(fncRequest("MO_NOTE_DAY"))			' 일자   
	event_contents				= Trim(fncRequest("event_contents"))			' event_contents   
 
'-----------------------------------------------------------------------------
 

 				Select Case mode 
				Case "ins" :

				strSql = strSql & " INSERT INTO MO_SERVICE_LIST ( "
				strSql = strSql & "    MO_NOTE_SEQ	"
				strSql = strSql & " ,  MR_IDX	"
				strSql = strSql & " ,  HELPER_SEQ	"
				strSql = strSql & " ,  MO_BABY_SEQ	"
				strSql = strSql & " ,  MO_NOTE_DAY	"
			    strSql = strSql & " ,  MO_SERVICE_CONTENT	" 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES (    (SELECT ISNULL(MAX(MO_NOTE_SEQ), 0) + 1 FROM MO_SERVICE_LIST) " 
				strSql = strSql & ", '"& idx &"' , '"& hp_seq &"' , '"& baby_seq &"' , (SELECT ISNULL(MAX(MO_NOTE_DAY), 0) + 1 FROM MO_SERVICE_LIST where MO_BABY_SEQ = '"& baby_seq &"' ) , '"
 			
				strSql = strSql & event_contents &"');"
 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2

 
			Case "upd" : 
			'저장하고
				strSql = ""
				strSql = strSql & " UPDATE MO_SERVICE_LIST SET "
				strSql = strSql & "		MO_SERVICE_CONTENT = '"& event_contents &"' "
				strSql = strSql & "	WHERE MO_NOTE_SEQ ='"& mo_note_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3

		'+이미지 클릭시 일자 추가 
				strSql = strSql & " INSERT INTO MO_SERVICE_LIST ( "
				strSql = strSql & "    MO_NOTE_SEQ	"
				strSql = strSql & " ,  MR_IDX	"
				strSql = strSql & " ,  HELPER_SEQ	"
				strSql = strSql & " ,  MO_BABY_SEQ	"
				strSql = strSql & " ,  MO_NOTE_DAY	"
				strSql = strSql & " )  "
				strSql = strSql & " VALUES (    (SELECT ISNULL(MAX(MO_NOTE_SEQ), 0) + 1 FROM MO_SERVICE_LIST) " 
				strSql = strSql & ", '"& idx &"' , '"& hp_seq &"' , '"& baby_seq &"' , (SELECT ISNULL(MAX(MO_NOTE_DAY), 0) + 1 FROM MO_SERVICE_LIST where MO_BABY_SEQ = '"& baby_seq &"')  );"
 			
			'	strSql = strSql & event_contents &"');"
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 5
			End Select 
  
%>
  <script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('이용약관에 동의해 주세요');
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "./service_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./service_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./service_list.asp"
			break;
			case(5) :
				alert('관리대장일자가 추가되었습니다.');
				parent.location.href = "./service_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
