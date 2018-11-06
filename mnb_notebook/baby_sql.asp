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
	helper_id			= Trim(fncRequest("helper_id"))		' helper_id  
	baby_name			= Trim(fncRequest("baby_name"))		'    baby_name
	baby_seq				= Trim(fncRequest("baby_seq"))		' hp_seq
'-----------------------------------------------------------------------------
 
%>
 
<%
			Select Case mode 
			Case "ins" :

				strSql = strSql & " INSERT INTO MO_BABY ( "

				strSql = strSql & "    MO_SEQ	"
				strSql = strSql & " ,  MR_IDX	"
				strSql = strSql & " ,  MR_HELPER_ID	"
				strSql = strSql & " ,  MO_BABY_NAME	"
				strSql = strSql & " )  "
				strSql = strSql & " VALUES (    (SELECT ISNULL(MAX(MO_SEQ), 0) + 1 FROM MO_BABY where MO_BABY_SEQ = '"& baby_seq &"') " 
				strSql = strSql & ", '"& idx &"' , '"& helper_id &"' , '"
				strSql = strSql & baby_name &"');"
 	
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2





			Case "upd" : 

				strSql = ""
				strSql = strSql & " UPDATE MO_BABY SET "
				strSql = strSql & "		MO_BABY_NAME = '"& baby_name &"' "
				strSql = strSql & "	WHERE MO_SEQ='"& baby_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3

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
				parent.location.href = "./baby_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./baby_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./baby_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
