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

	   
	P_name		= Trim(fncRequest("P_name"))   ' 소모품명
	cate		= Trim(fncRequest("cate"))  '품목
	price		= Trim(fncRequest("price"))   '사용구분
	somo_gubun	= Trim(fncRequest("somo_gubun"))   '사용구분
	use_yn		= Trim(fncRequest("use_yn"))   '사용구분
 
 

 End if
 
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	데이터 확인
	Select Case mode 
			Case "ins" :
	 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_CONSUMABLES ( "
				strSql = strSql & "       MO_CONSUMABLES_SEQ "
				strSql = strSql & ",      MO_CONSUMABLES_NAME "
			    strSql = strSql & ",      MO_CONSUMABLES_CATEGORY "
		        strSql = strSql & ",      MO_CONSUMABLES_PRICE "
				strSql = strSql & ",      MO_CONSUMABLES_USE_YN "
				strSql = strSql & ",      MO_CONSUMABLES_GUBUN "
			 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MO_CONSUMABLES_SEQ), 0) + 1 FROM MO_CONSUMABLES) "
				strSql = strSql & "	,		'"& P_name &"' "
				strSql = strSql & "	,		'"& cate &"'   "
				strSql = strSql & "	,		'"& price &"' "
				strSql = strSql & "	,		'"& use_yn &"'  "
				strSql = strSql & "	,		'"& somo_gubun &"') ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
%>
 
<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_CONSUMABLES SET "
				strSql = strSql & "		 MO_CONSUMABLES_NAME ='"& P_name &"' "
				strSql = strSql & "		,MO_CONSUMABLES_CATEGORY ='"& cate &"' "
				strSql = strSql & "		,MO_CONSUMABLES_PRICE ='"& price &"' "
				strSql = strSql & "		,MO_CONSUMABLES_USE_YN ='"& use_yn &"' "
				strSql = strSql & "		,MO_CONSUMABLES_GUBUN ='"& somo_gubun &"' "
 
				strSql = strSql & "	WHERE MO_CONSUMABLES_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_CONSUMABLES  "
					strSql = strSql & "	WHERE MO_CONSUMABLES_SEQ='"& idx &"' "
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
				parent.location.href = "./consumables_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./consumables_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./consumables_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
