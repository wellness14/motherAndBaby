<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 팀 메뉴 정보 변경
'파 일 명 : menu_team_action.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
%>
<!-- 공통 인클루드 페이지 시작 -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- 공통 인클루드 페이지 마침 -->
<%

	indexText	= fncRequest("indexText")
	menuId		= fncRequest("menuId")
	selected	= fncRequest("select")
	teamId		= fncRequest("teamId")
   
	' 팀별 메뉴 저장하는 곳
	If selected = "true" Then
        strSql = ""
	    strSql = strSql & "INSERT INTO MO_MENU_TEAM (MT_TEAM_CD,MT_MENU_CD) VALUES ( '"&teamId&"',"&menuId&" ) "
	Else
	    '상위 메뉴 삭제.
	    strSql = ""
        strSql = strSql & " SELECT MT_MENU_CD FROM MO_MENU_TEAM WITH (NOLOCK) "
        strSql = strSql & " WHERE MT_MENU_CD IN "
        strSql = strSql & " ( "
        strSql = strSql & " 	SELECT MI_MENU_CODE FROM MO_MENU_INFO WITH (NOLOCK)  "
        strSql = strSql & " 	WHERE MI_ROOT_MENU = (SELECT MI_ROOT_MENU FROM MO_MENU_INFO WHERE MI_MENU_CODE="& menuId &" AND MT_TEAM_CD='"& teamId &"') "
        strSql = strSql & " )  AND MT_TEAM_CD = '"& teamId &"' AND  mt_menu_cd <> "& menuId &" "
		Set Rs = DBExec(strSql,"main")
        If RS.EOF then '하위 메뉴가 없을 경우 삭제
            strSql = "DELETE MO_MENU_TEAM where MT_TEAM_CD = '"&teamId&"' and MT_MENU_CD = (select mi_root_menu from MO_menu_info where mi_menu_code = "&menuId&"  ) ;"
		End If 
         
	    strSql = strSql & "DELETE MO_MENU_TEAM where MT_TEAM_CD = '"&teamId&"' and MT_MENU_CD = "&menuId
	End If
    
	CALL DBExec(strSql, "main") : CALL DBClose(DBCon)
%>