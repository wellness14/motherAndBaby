<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 관리자 메뉴 관리
'파 일 명 : menu_del.asp
'작성일자 : 2013/07/31
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
Response.Expires = -1
Response.ChaRset = "euc-kr"
'<!-- 공통 인클루드 페이지 시작 -->    
%>
<!-- #include virtual = "/common/asp/vardef.asp" -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<%
    sourceId = unescape(request("sourceId"))
    
	'메뉴삭제.
	strSql = " UPDATE MO_MENU_INFO SET MI_DSPL_TYPE = 'N', MI_UPD_DT=GETDATE() WHERE MI_MENU_CODE='"& sourceId &"' "
	call DBExec(strSql, "main")    
%>
{"success":"true"}