<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이비 - 관리자
'모듈기능 : 메뉴
'파 일 명 : Menu.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
Response.Expires = -1
Response.ChaRset = "euc-kr"
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	mode = request.QueryString("mode")
    if mode="grid" then response.Write "{ 'roots':" end if
%>
[
<%
    uid			= LCASE(Trim(fncRequestCookie("userid")))
    menuRoot	= Trim(fncRequest("node"))
    menu		= Trim(fncRequest("menu"))
    teamId		= Trim(fncRequest("teamId"))
    userId		= Trim(fncRequest("userId"))

'---------------------------------------------------------------------------------------------------------------
'	관리자 사용자 체크
    strSql = " SELECT UL_MEM_ID FROM MO_USER_LIST WITH(NOLOCK) WHERE UL_USE_YN ='Y' AND UL_MEM_ID = '"&uid&"' "
    call RSExec(RS,0,1,strSql,"main")
    if NOT RS.EOF then
        ul_mem_id = RS(0)
    end if
    call RSClose(RS)
'---------------------------------------------------------------------------------------------------------------

    If ul_mem_id = "" Then
        response.Redirect "/admin/index.asp"
    End If

'----------------------------------------------------------------------------------------
'	관리자 권한 부여
	adminUser = "N"
	adminUser = getAdminAuth()
'----------------------------------------------------------------------------------------
	
'----------------------------------------------------------------------------------------
'	팀아이디가 없을 경우
	If teamId = "" Then
		strSql = ""
		strSql = strSql & " SELECT "
		strSql = strSql & "     UL_GRP_CD "
		strSql = strSql & " FROM MO_USER_LIST WITH(NOLOCK) INNER JOIN MO_COMM_CD WITH(NOLOCK) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND='88' "
		strSql = strSql & " WHERE UL_MEM_ID='"& uid &"' "
		Set Rs = DBExec(strSql,"main")
		If NOT RS.EOF Then
			teamId = RS(0)
		End If 
		Call RSClose(RS)
	End If

    if menu = "team" then
        '사용자 메뉴 테이블에서 메뉴 읽어와서 사용자별로 다른 메뉴를 표시
        strSql = ""
        strSql = strSql & " SELECT * FROM ("
        strSql = strSql & "    SELECT "
        strSql = strSql & "          MI_MENU_CODE "
        strSql = strSql & "        , MAX(MI_ROOT_MENU) MI_ROOT_MENU "
        strSql = strSql & "        , MAX(MI_MENU_LEVL) MI_MENU_LEVL "
        strSql = strSql & "        , MAX(MI_MENU_NM) MI_MENU_NM "
        strSql = strSql & "        , MAX(MI_MENU_PATH) MI_MENU_PATH "
        strSql = strSql & "        , MAX(MI_CLOS_YN) MI_CLOS_YN "
        strSql = strSql & "        , MAX(MI_MENU_RANK) MI_MENU_RANK "
        strSql = strSql & "        , MAX(MT_MENU_CD) MT_MENU_CD "
        strSql = strSql & "        , '0' MU_MENU_USER "
        strSql = strSql & "        , '0' MU_MENU_ADMIN "
        strSql = strSql & "    FROM "
        strSql = strSql & "    ( "
		If teamId = "1000" Then 
        strSql = strSql & "			SELECT MI_MENU_CODE, MI_ROOT_MENU, MI_MENU_LEVL, MI_MENU_NM, MI_MENU_PATH, MI_CLOS_YN, MI_MENU_RANK,'0' MT_MENU_CD"
        strSql = strSql & "			FROM MO_MENU_INFO WITH(NOLOCK) "
		strSql = strSql & "			WHERE MI_DSPL_TYPE ='Y' AND MI_ROOT_MENU = "&menuRoot
		Else
		strSql = strSql & "			SELECT MI_MENU_CODE, MI_ROOT_MENU, MI_MENU_LEVL, MI_MENU_NM, MI_MENU_PATH, MI_CLOS_YN, MI_MENU_RANK ,MT_MENU_CD "
        strSql = strSql & "			FROM MO_MENU_INFO WITH(NOLOCK) "
		strSql = strSql & "				INNER JOIN MO_MENU_TEAM WITH(NOLOCK) ON MT_MENU_CD = MI_MENU_CODE "
		strSql = strSql & "			WHERE MT_TEAM_CD = '"& teamId &"' AND MI_DSPL_TYPE ='Y' AND MI_ROOT_MENU = "&menuRoot
		End If 
        strSql = strSql & "    ) T1  "
        strSql = strSql & "    GROUP BY MI_MENU_CODE"
        strSql = strSql & ")T2 ORDER BY MI_MENU_RANK "
        singleClickExpand = "false"
    elseif menu ="team_auth" Then
        strSql = ""
        strSql = strSql & " SELECT * FROM ("
        strSql = strSql & "    SELECT "
        IF uid = "" THEN strSql = strSql & " TOP 0 "
        strSql = strSql & "        MI_MENU_CODE "
        strSql = strSql & "        , MAX(MI_ROOT_MENU) MI_ROOT_MENU "
        strSql = strSql & "        , MAX(MI_MENU_LEVL) MI_MENU_LEVL "
        strSql = strSql & "        , MAX(MI_MENU_NM) MI_MENU_NM "
        strSql = strSql & "        , MAX(MI_MENU_PATH) MI_MENU_PATH "
        strSql = strSql & "        , MAX(MI_CLOS_YN) MI_CLOS_YN "
        strSql = strSql & "        , MAX(MI_MENU_RANK) MI_MENU_RANK "
        strSql = strSql & "        , MAX(MT_MENU_CD) MT_MENU_CD "
        strSql = strSql & "        , MAX(MU_MENU_USER) MU_MENU_USER "
        strSql = strSql & "        , MAX(MU_MENU_ADMIN) MU_MENU_ADMIN "
        strSql = strSql & "    FROM "
        strSql = strSql & "    ( "
        strSql = strSql & "        SELECT  "
        strSql = strSql & "            MI_MENU_CODE "
        strSql = strSql & "            ,MI_ROOT_MENU "
        strSql = strSql & "            ,MI_MENU_LEVL "
        strSql = strSql & "            ,MI_MENU_NM  "
        strSql = strSql & "            ,MI_MENU_PATH  "
        strSql = strSql & "            ,MI_CLOS_YN  "
        strSql = strSql & "            ,MI_MENU_RANK  "
        strSql = strSql & "            ,'0' MT_MENU_CD  "
        strSql = strSql & "            ,MU_MENU_USER "
        strSql = strSql & "            ,MU_MENU_ADMIN "
        strSql = strSql & "        FROM  "
        strSql = strSql & "            MO_MENU_INFO WITH(NOLOCK) INNER JOIN MO_MENU_USER WITH(NOLOCK) ON MI_MENU_CODE = MU_MENU_CD INNER JOIN MO_MENU_TEAM WITH(NOLOCK) ON MI_MENU_CODE = MT_MENU_CD"
        strSql = strSql & "        WHERE MU_USER_CD = '"& uId &"'AND MI_DSPL_TYPE ='Y'  AND  MT_TEAM_CD = '"&teamId&"' AND MI_ROOT_MENU =  "&menuRoot
        strSql = strSql & "        UNION ALL "
        strSql = strSql & "        SELECT  "
        strSql = strSql & "            MI_MENU_CODE "
        strSql = strSql & "            ,MI_ROOT_MENU "
        strSql = strSql & "            ,MI_MENU_LEVL "
        strSql = strSql & "            ,MI_MENU_NM  "
        strSql = strSql & "            ,MI_MENU_PATH  "
        strSql = strSql & "            ,MI_CLOS_YN  "
        strSql = strSql & "            ,MI_MENU_RANK  "
        strSql = strSql & "            ,MT_MENU_CD  "
        strSql = strSql & "            ,'' MU_MENU_USER "
        strSql = strSql & "            ,'' MU_MENU_ADMIN "
        strSql = strSql & "        FROM  "
        strSql = strSql & "            MO_MENU_INFO WITH(NOLOCK) INNER JOIN MO_MENU_TEAM  WITH(NOLOCK) ON MI_MENU_CODE = MT_MENU_CD "
        strSql = strSql & "        WHERE MT_TEAM_CD = '"&teamId&"'AND MI_DSPL_TYPE ='Y' AND MI_ROOT_MENU =  "&menuRoot
        strSql = strSql & "    ) T1  "
        strSql = strSql & "    GROUP BY MI_MENU_CODE "
        strSql = strSql & ")T2 ORDER BY MI_MENU_RANK "

        singleClickExpand = "false"
    Else
      	'사용자 메뉴 테이블에서 메뉴 읽어와서 사용자별로 다른 메뉴를 표시
		strSql = ""
		strSql = strSql & " SELECT  MI_MENU_CODE, MI_ROOT_MENU, MI_MENU_LEVL, MI_MENU_NM, MI_MENU_PATH, MI_CLOS_YN, MI_MENU_RANK ,'0' MT_MENU_CD "
		strSql = strSql & "     , '0' MU_MENU_USER "
		strSql = strSql & "     , '0' MU_MENU_ADMIN "
		strSql = strSql & " FROM	MO_MENU_INFO A WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_MENU_USER B WITH(NOLOCK) ON A.MI_MENU_CODE = B.MU_MENU_CD "
		strSql = strSql & " WHERE MI_DSPL_TYPE ='Y' "
		strSql = strSql & "		AND MU_USER_CD='"& uid &"' AND (MU_MENU_USER = 1 OR MU_MENU_ADMIN = 1) "
		if menuRoot <> "source" then strSql = strSql & " AND MI_ROOT_MENU = " & menuRoot end if
		strSql = strSql & " ORDER BY MI_MENU_RANK  "

		IF adminUser = "Y" Then   ' Admin 권한일 경우
			strSql = ""
			strSql = strSql & " SELECT  MI_MENU_CODE, MI_ROOT_MENU, MI_MENU_LEVL, MI_MENU_NM, MI_MENU_PATH, MI_CLOS_YN, MI_MENU_RANK ,'0' MT_MENU_CD "
			strSql = strSql & "     , '0' MU_MENU_USER "
			strSql = strSql & "     , '0' MU_MENU_ADMIN "
			strSql = strSql & " FROM MO_MENU_INFO with(nolock) "
			strSql = strSql & " WHERE MI_DSPL_TYPE ='Y' "
			if menuRoot <> "source" then strSql = strSql & " and mi_root_menu = "& menuRoot end if
			strSql = strSql & " ORDER BY MI_MENU_RANK "
		End If

        singleClickExpand = "true"
	End If

'	response.Write strSql
   	Call RSExec(RS,0,1,strSQL,"main")

	i = 0
	If Not RS.EOF Then
		Do Until RS.EOF
			menuName		= Trim(RS("MI_MENU_NM"))
			menuId			= Trim(RS("MI_MENU_CODE"))
			menuPath		= Trim(RS("MI_MENU_PATH"))
			mi_menu_rank	= Trim(RS("MI_MENU_RANK"))
			mt_menu_cd		= Trim(RS("MT_MENU_CD"))
			mu_menu_user	= Trim(RS("MU_MENU_USER"))
			mu_menu_admin	= Trim(RS("MU_MENU_ADMIN"))

			If menuPath = "" Then
				menuClass = "folder"
				menuLeaf = "false"
			Else
				menuClass = "file"
				menuLeaf = "true"
			End If

			If mt_menu_cd = 0 then teamAuth = "false" else teamAuth = "true" end if
			If mu_menu_user = 0 then userAuth = "false" else userAuth = "true" end if
			If mu_menu_admin = 0 then adminAuth = "false" else adminAuth = "true" end if

			if i > 0 then response.Write ","
    %>

        {"text":"<%=menuName%>","id":"<%=menuId%>","cls":"<%=menuClass%>","url":"<%=menuPath%>","leaf":<%=menuLeaf%>,"singleClickExpand":<%=singleClickExpand%>,"menu_rank":"<%=mi_menu_rank%>","team_auth":<%=teamAuth%>,"user_auth":<%=userAuth%>,"admin_auth":<%=adminAuth%>,"sql":"<%=strSql%>"}

    <%
			RS.MoveNext
			i= i+1
	    LOOP
	End If
	call RSClose(RS)

%>]
<%if mode="grid" then response.Write ", 'recordCount': '"&i&"'} " end if %>
