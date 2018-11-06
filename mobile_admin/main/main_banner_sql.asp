<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 메인 배너 관리
'파 일 명 : main_banner_sql.asp
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
<!-- #include file = "./main_banner_inc.asp"-->
<%
'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intNum		= fncRequest("num")
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Or mode="recom" Then 
		strUrl		= fncRequest("strUrl")
		view_flg	= fncRequest("view_flg")
		filePath	= Trim(fncRequest("filePath"))
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = " MO_MAIN_MAS "
'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " UPDATE "& brd_tbl &" SET MM_ORD = MM_ORD + 1 WHERE MM_NUM = '"& intNum &"'; "
			strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
			strSql = strSql & "         MM_NUM, MM_ORD, MM_URL, MM_IMG, MM_VIEW_FLG "
			strSql = strSql & " )  "
			strSql = strSql & " SELECT  "
			strSql = strSql & "			'"& intNum &"', 1, '"& strUrl &"','"& filePath &"','"& view_flg &"'; "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
			
		Case "upd" : 
			strSql = ""
			strSql = strSql & " UPDATE  "& brd_tbl &" SET "
			strSql = strSql & "      MM_URL = '"& strUrl &"' "
			If filePath <> "" Then 
			strSql = strSql & "      ,MM_IMG = '"& filePath &"' "
			End If 
			strSql = strSql & "      , MM_VIEW_FLG = '"& view_flg &"' "
			strSql = strSql & "      ,MM_UPD_DT = GETDATE() "
			strSql = strSql & " WHERE   MM_IDX = " & intIDX
		'	response.Write strSql
		'	response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)

			intMsg = 3
		Case "del" : 
			If intIDX > 0 Then 
			End If 
			intMsg = 4

		Case "dpUp" :
			If intIDX > 0 Then
				strSql = ""
				strSql = strSql & "SET NOCOUNT ON;" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET	SL_ORD=SL_ORD+1,SL_UPD_DT=GETDATE() WHERE SL_IDX=" & intIDX & ";" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET" & vbcrlf
				strSql = strSql & "		SL_ORD=ORD.ORD_RN" & vbcrlf
				strSql = strSql & "FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "INNER JOIN (" & vbcrlf
				strSql = strSql & "		SELECT	SL_IDX	AS ORD_IDX" & vbcrlf
				strSql = strSql & "			,ROW_NUMBER() OVER( ORDER BY SL_ORD ASC, SL_UPD_DT ASC ) AS ORD_RN" & vbcrlf
				strSql = strSql & "		FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "		WHERE SL_NUM='"& intNum &"' "
				strSql = strSql & ") AS ORD" & vbcrlf
				strSql = strSql & "ON ORD.ORD_IDX=SL_IDX;" & vbcrlf
				strSql = strSql & "SET NOCOUNT OFF;" & vbcrlf
'				Response.Write strSql
'				Response.End
				Call DBExec(strSql,"main"): Call DBClose(DBCon)
			End If

			intMsg = 7

		Case "dpDn" :
			If intIDX > 0 Then
				strSql = ""
				strSql = strSql & "SET NOCOUNT ON;" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET	SL_ORD=SL_ORD-1, SL_UPD_DT=getdate() WHERE	SL_IDX=" & intIDX & ";" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET" & vbcrlf
				strSql = strSql & "		SL_ORD=ORD.ORD_RN" & vbcrlf
				strSql = strSql & "FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "INNER JOIN (" & vbcrlf
				strSql = strSql & "		SELECT	SL_IDX	AS ORD_IDX" & vbcrlf
				strSql = strSql & "			,ROW_NUMBER() OVER( ORDER BY SL_ORD ASC, SL_UPD_DT DESC ) AS ORD_RN" & vbcrlf
				strSql = strSql & "		FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "		WHERE SL_NUM='"& intNum &"' "
				strSql = strSql & ") AS ORD" & vbcrlf
				strSql = strSql & "ON ORD.ORD_IDX=SL_IDX;" & vbcrlf
				strSql = strSql & "SET NOCOUNT OFF;" & vbcrlf
'				Response.Write strSql
'				Response.End
				Call DBExec(strSql,"main"): Call DBClose(DBCon)
			End If

			intMsg = 7
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
