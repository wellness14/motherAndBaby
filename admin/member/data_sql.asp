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
	P_name		= Trim(fncRequest("ser_program"))   ' 서비스 프로그럄
	cate		= Trim(fncRequest("cate"))  '서비스 타입
	term	= Trim(fncRequest("term"))   ' 서비스 기간 
	price	= Trim(fncRequest("price"))   ' 서비스 price 
	code	= Trim(fncRequest("code"))   ' 서비스 price 

	local		= Trim(fncRequest("local"))   ' 산모도우미 시퀀스
	part	= Trim(fncRequest("part"))  '산모도우미 이름
	filePath	= Trim(fncRequest("filePath")) '사진 파일

 End if
 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	데이터 확인
	Select Case mode 
			Case "ins" :


	strTable = " from	MO_DATA   "
	 
	strWhere = " WHERE MO_DATA_SEQ = '"& idx &"' "

 
	 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_DATA ( "
				strSql = strSql & "       MO_DATA_SEQ "
				strSql = strSql & ",      MO_DATA_NAME "
			    strSql = strSql & ",      MO_DATA_CATEGORY "
		        strSql = strSql & ",      MO_DATA_TERM "
				strSql = strSql & ",      MO_DATA_PRICE "
				strSql = strSql & ",      MO_DATA_CODE "
			 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MO_DATA_SEQ), 0) + 1 FROM MO_DATA) "
				strSql = strSql & "	,		'"& P_name &"' "
				strSql = strSql & "	,		'"& cate &"'   "
				strSql = strSql & "	,		'"& term &"' "
				strSql = strSql & "	,		'"& price &"' "
				strSql = strSql & "	,		'"& code &"') ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 


%>

<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_DATA SET "
				strSql = strSql & "		MO_DATA_NAME ='"& P_name &"' "
				strSql = strSql & "		,MO_DATA_CATEGORY ='"& cate &"' "
				strSql = strSql & "		,MO_DATA_TERM ='"& term &"' "
				strSql = strSql & "		,MO_DATA_PRICE ='"& price &"' "
				strSql = strSql & "		,MO_DATA_CODE ='"& code &"' "
 
				strSql = strSql & "	WHERE MO_DATA_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_DATA  "
					strSql = strSql & "	WHERE MO_DATA_SEQ='"& idx &"' "
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
				parent.location.href = "./data_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./data_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./data_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
