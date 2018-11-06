<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 메뉴별 사용자 정보 변경
'파 일 명 : menu_user_action.asp
'작성일자 : 2013/07/31
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
'Response.Expires = -1 
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	indexText	= fncRequest("indexText")
	menuId		= fncRequest("menuId")
	selected	= fncRequest("select")
	userId		= fncRequest("userId")

	admin_auth	= "0"
	user_auth	= "0"

	response.Write indexText & "<BR>"
	response.Write menuId & "<BR>"
	response.Write selected & "<BR>"
	response.Write userId & "<BR>"
	

	' 팀별 메뉴 저장하는 곳
	If selected = "true" Then
		If indexText = "user_auth" then user_auth = "1" 
		If indexText = "admin_auth" then admin_auth = "1"

		'해당 메뉴 확인
		strSql = " select MU_USER_CD from MO_MENU_USER  with (nolock) "
		strSql = strSql & " where MU_MENU_CD = "&menuId&" and MU_USER_CD = '"&userId&"'  "
		Set Rs = DBExec(strSql,"main")
		If RS.EOF Then		'메뉴가 없을 경우 추가
			strSql = "insert into MO_MENU_USER (MU_USER_CD,MU_MENU_CD,MU_MENU_USER,MU_MENU_ADMIN ) values ( '"& userId &"',"& menuId &" ,"& user_auth &","& admin_auth &" ) ;"
		End If 
	End If 

	' 메뉴 업데이트 
	strSql = strSql & "UPDATE MO_MENU_USER SET MU_MENU_USER = "& user_auth &" ,MU_MENU_ADMIN="& admin_auth &" where MU_USER_CD = '"& userId &"' and MU_MENU_CD = "& menuId
	CALL DBExec(strSql, "main") : CALL DBClose(DBCon)
%>