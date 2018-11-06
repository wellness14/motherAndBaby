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
    mode			= fncRequest("mode")				'처리구분(등록/수정)
	baby_name			= Trim(fncRequest("baby_name"))		' 신생아이름
	baby_name2			= Trim(fncRequest("baby_name2"))		' 신생아이름
	baby_name3			= Trim(fncRequest("baby_name3"))		' 신생아이름
	idx			= Trim(fncRequest("idx"))		' 신생아이름
  
'-----------------------------------------------------------------------------
 
%>
 
<%
				strSql = ""

				strSql = strSql & " UPDATE MO_RESERVATION SET "
			If baby_name <> "" then
				strSql = strSql & "		MR_BABY1 = '"& baby_name &"' "
			ElseIf baby_name2 <> "" Then
				strSql = strSql & "		MR_BABY2 = '"& baby_name2 &"' "
			ElseIf baby_name3 <> "" Then
				strSql = strSql & "		MR_BABY3 = '"& baby_name3 &"' "
			End If 
				strSql = strSql & "	WHERE MR_IDX='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('이용약관에 동의해 주세요');
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "./baby_view_twin.asp?idx=<%=idx%>"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./baby_view_twin.asp?idx=<%=idx%>"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./baby_view_twin.asp?idx=<%=idx%>"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
