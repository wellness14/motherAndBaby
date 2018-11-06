<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 지역 관리
'파 일 명 : local_sql.asp
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
<!-- #include file = "./local_inc.asp"-->
<%
'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
		local		= fncRequest("local")
		part		= fncRequest("part")
		use_flg		= fncRequest("use_flg")
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = " MO_COMM_CD "
'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
			strSql = strSql & "         CC_COMM_KIND,CC_COMM_CD,CC_KOR_NM,CC_USE_YN,CC_REG_DT,CC_KOR_NM2 "
			strSql = strSql & " )  "
			strSql = strSql & " SELECT  "
			strSql = strSql & "			88 "
			strSql = strSql & "			,ISNULL((SELECT TOP 1 CC_COMM_CD FROM "& brd_tbl &" WHERE CC_COMM_KIND = 88 ORDER BY CC_COMM_CD DESC ),0) + 1 "
			strSql = strSql & "			,'"& local &"-"& part &"', '"& use_flg &"',getdate(),'"& part &"'; "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
			
		Case "upd" : 
			strSql = ""
			strSql = strSql & " UPDATE  "& brd_tbl &" SET "
			strSql = strSql & "      CC_KOR_NM = '"& local &"-"& part &"' "
			strSql = strSql & "      ,CC_USE_YN = '"& use_flg &"' "
			strSql = strSql & "      ,CC_KOR_NM2 = '"& part &"' "
			strSql = strSql & "      ,CC_UPD_DT = GETDATE() "
			strSql = strSql & " WHERE   CC_COMM_CD = " & intIDX
		'	response.Write strSql
		'	response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)

			intMsg = 3
		Case "del" : 
			If intIDX > 0 Then 
			End If 
			intMsg = 4

	End Select 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('로그인 후 이용 가능합니다.');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
			case(3) :
				alert('수정 되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
			case(4) :
				alert('삭제되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
			case(7) :
				alert('변경 되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
