<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 팀 메뉴 리스트
'파 일 명 : json_team_list.asp
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

<!-- #include virtual = "/common/asp/vardef.asp" -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->

{"teams":[
<%
    '<!-- 공통 인클루드 페이지 마침 -->
    partName = unescape(trim(Request.Item("part_name")))
    menuId = trim(Request.Item("node"))

    strSql = ""
	If partName = "" Then
	    strSql = strSql & " select distinct part_name ,'' team_name,'' mt_menu_cd from "
	    strSql = strSql & " ( "
	    strSql = strSql & " 	SELECT   "
	    strSql = strSql & " 		UL_GRP_CD "
	    strSql = strSql & "  			,( CASE WHEN CHARINDEX('-',CC_KOR_NM) > 0 THEN LEFT(CC_KOR_NM,CHARINDEX('-',CC_KOR_NM)-1) ELSE CC_KOR_NM END) PART_NAME"
        strSql = strSql & " 	FROM	MO_USER_LIST with(nolock) "
	    strSql = strSql & " 	LEFT JOIN MO_COMM_CD with(nolock) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND = '88' AND CC_USE_YN = 'Y'  "
	    strSql = strSql & " 	group by ul_grp_cd,CC_KOR_NM "
	    strSql = strSql & " ) t1 "
    ElseIf partName = "all" Then
        strSql = strSql & " select "
        If menuId = "0" Then strSql = strSql & "    top 0  "
        strSql = strSql & " 	UL_GRP_CD "
        strSql = strSql & " 	,max(part_name) part_name "
        strSql = strSql & " 	,max(team_name) team_name "
        strSql = strSql & " 	,max(mt_menu_cd) mt_menu_cd "
        strSql = strSql & " from "
        strSql = strSql & " (  "
        strSql = strSql & " 	select UL_GRP_CD,part_name,team_name,'' mt_menu_cd from   "
        strSql = strSql & " 	 (     "
        strSql = strSql & " 	  SELECT    "
        strSql = strSql & "  			UL_GRP_CD   "
        strSql = strSql & "  			,( CASE WHEN CHARINDEX('-',CC_KOR_NM) > 0 THEN LEFT(CC_KOR_NM,CHARINDEX('-',CC_KOR_NM)-1) ELSE CC_KOR_NM END) PART_NAME"
        strSql = strSql & "  			,(CASE WHEN CHARINDEX('-',REVERSE(CC_KOR_NM)) >0 THEN RIGHT(CC_KOR_NM,CHARINDEX('-',REVERSE(CC_KOR_NM))-1) ELSE CC_KOR_NM END )TEAM_NAME"
        strSql = strSql & " 		 FROM	MO_USER_LIST with(nolock)   "
        strSql = strSql & " 		 LEFT JOIN MO_COMM_CD with(nolock) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND = '88' AND CC_USE_YN = 'Y'  "
        strSql = strSql & " 		 group by ul_grp_cd,CC_KOR_NM   "
        strSql = strSql & " 	  ) t1   "
        strSql = strSql & " 	union all "
        strSql = strSql & " 	select MT_TEAM_CD,'','',MT_MENU_CD from MO_menu_team with(nolock) where mt_menu_cd ='"&menuId&"' "
        strSql = strSql & " ) t2 group by UL_GRP_CD order by part_name "
   Else
	    strSql = strSql & " select "
	    strSql = strSql & " UL_GRP_CD,part_name,team_name,'' mt_menu_cd from "
	    strSql = strSql & " (   "
	    strSql = strSql & "    SELECT  "
	    strSql = strSql & " 	    UL_GRP_CD "
	    strSql = strSql & "  			,( CASE WHEN CHARINDEX('-',CC_KOR_NM) > 0 THEN LEFT(CC_KOR_NM,CHARINDEX('-',CC_KOR_NM)-1) ELSE CC_KOR_NM END) PART_NAME"
        strSql = strSql & "  			,(CASE WHEN CHARINDEX('-',REVERSE(CC_KOR_NM)) >0 THEN RIGHT(CC_KOR_NM,CHARINDEX('-',REVERSE(CC_KOR_NM))-1) ELSE CC_KOR_NM END )TEAM_NAME"
	    strSql = strSql & "    FROM	MO_USER_LIST with(nolock) "
	    strSql = strSql & "    LEFT JOIN MO_COMM_CD with(nolock) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND = '88' AND CC_USE_YN = 'Y'  "
	    strSql = strSql & "    group by ul_grp_cd,CC_KOR_NM "
	    strSql = strSql & " ) t1 where part_name = '"&partName&"' "
    End If 

	'Response.write strSql
	Set Rs = DBExec(strSql,"main")
	
	i = 0
	If NOT RS.EOF then
	    DO UNTIL RS.EOF

	    if partName = "" then
	        id = i
	    else
	        id = RS("UL_GRP_CD")
	    end if

        part_name = trim(RS("part_name"))
        team_name = trim(RS("team_name"))
        mt_menu_cd = trim(RS("mt_menu_cd"))

        if mt_menu_cd = "0" then team_auth = "false"  else team_auth = "true" end if

        if i > 0 then response.Write ","
    %>

        {"id":"<%=id%>","part_name":"<%=part_name%>","team_name":"<%=team_name%>","team_auth":"<%=team_auth %>"}

    <%
	    RS.MoveNext
	    i= i+1
	    LOOP
	End If
	call RSClose(RS)
%>]}

 