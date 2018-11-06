<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 메뉴별 사용자 관리
'파 일 명 : json_menu_user_list.asp
'작성일자 : 2013/07/31
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
{"teams":[
<%
	uId		= fncRequestCookie("userid")
	menuId	= trim(Request.Item("node"))

    '관리자 권한 부여
    adminUser = getAdminAuth()

    If groupCode = "" Then
        groupCode = getTeamId(uId)
    End If 

    strSql = ""
    strSql = strSql & " SELECT "
    strSql = strSql & " 	UL_MEM_ID "
    strSql = strSql & " 	,UL_MEM_NM "
    strSql = strSql & " 	,UL_GRP_CD "
    strSql = strSql & " 	,(CASE  WHEN ISNULL(MU_USER_CD,'') = '' OR MU_MENU_USER=0 THEN 'false' ELSE 'true' END ) USER_AUTH "
    strSql = strSql & " FROM  "
    strSql = strSql & " 	MO_USER_LIST WITH(NOLOCK) "
    strSql = strSql & " 	LEFT JOIN MO_MENU_USER WITH(NOLOCK) ON UL_MEM_ID = MU_USER_CD AND MU_MENU_CD = '"& menuId &"' "
    strSql = strSql & " WHERE  "
    strSql = strSql & " 	UL_USE_YN = 'Y' "
	strSql = strSql & " ORDER BY UL_MEM_ID "
'	response.Write strSql
	call RSExec(RS,0,1,strSQL,"main")	

	i = 0
	if NOT RS.EOF then
	    DO UNTIL RS.EOF
			mem_id = Rs("UL_MEM_ID")
			mem_nm = Rs("UL_MEM_NM")
			grp_cd = Rs("UL_GRP_CD")
			USER_AUTH = Rs("USER_AUTH")

			part_name	= ""
			team_name	= ""

			if i > 0 then response.Write ","
    %>

        {"id":"<%=mem_id%>","part_name":"<%=part_name%>","team_name":"<%=team_name%>","user_name":"<%=mem_nm%>","user_auth":"<%=USER_AUTH%>"}

    <%
			RS.MoveNext
			i= i+1
	    LOOP
	End If
	Call RSClose(RS)
%>]}

