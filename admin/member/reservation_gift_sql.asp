<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 예약확인
'파 일 명 : member_reser_sql.asp
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
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
idx = fncRequest("idx")  

mode			= fncRequest("mode")	
If mode = "ins" Or mode = "upd" Then 

	   mode			= fncRequest("mode")	
	P_name		= Trim(fncRequest("P_name"))   ' 산모도우미 시퀀스
	cate		= Trim(fncRequest("cate"))  '산모도우미 이름
	use_yn	= Trim(fncRequest("use_yn"))   '산모도우미 서비스 비고

	local		= Trim(fncRequest("local"))   ' 산모도우미 시퀀스
	part	= Trim(fncRequest("part"))  '산모도우미 이름
	filePath	= Trim(fncRequest("filePath")) '사진 파일

 End if
 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	데이터 확인
	Select Case mode 
			Case "ins" :
	 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_RESERVATION_GIFT ( "
				strSql = strSql & "       MD_GIFT_SEQ "
				strSql = strSql & ",      MD_GIFT_NAME "
			    strSql = strSql & ",      MD_GIFT_CATEGORY "
		        strSql = strSql & ",      MD_GIFT_USE_YN "
				strSql = strSql & ",      MD_GIFT_LOCAL "
				strSql = strSql & ",      MD_GIFT_LOCAL_DETAIL "
				strSql = strSql & ",      MD_GIFT_PICTURE "
			 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MD_GIFT_SEQ), 0) + 1 FROM MO_RESERVATION_GIFT) "
				strSql = strSql & "	,		'"& P_name &"' "
				strSql = strSql & "	,		'"& cate &"'   "
				strSql = strSql & "	,		'"& use_yn &"' "
				strSql = strSql & "	,		'"& local &"'  "
				strSql = strSql & "	,		'"& part &"'   "
				strSql = strSql & "	,		'"& filePath &"') ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_RESERVATION_GIFT SET "
				strSql = strSql & "		MD_GIFT_NAME ='"& P_name &"' "
				strSql = strSql & "		,MD_GIFT_CATEGORY ='"& cate &"' "
				strSql = strSql & "		,MD_GIFT_USE_YN ='"& use_yn &"' "
				strSql = strSql & "		,MD_GIFT_LOCAL ='"& local &"' "
				strSql = strSql & "		,MD_GIFT_LOCAL_DETAIL ='"& part &"' "
				strSql = strSql & "		,MD_GIFT_PICTURE ='"& filePath &"' "
 
				strSql = strSql & "	WHERE MD_GIFT_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_RESERVATION_GIFT  "
					strSql = strSql & "	WHERE MD_GIFT_SEQ='"& idx &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		
	End Select 
 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('회원정보를 확인해 주세요');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "./reservation_gift_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./reservation_gift_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./reservation_gift_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
