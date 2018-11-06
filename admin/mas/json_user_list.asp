<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 사용자 관리
'파 일 명 : user_list_json.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
Response.ChaRset = "euc-kr"
%>
<!-- #include virtual = "/common/asp/vardef.asp" -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
{"users":[
<%
    '<!-- 공통 인클루드 페이지 마침 -->
    groupCode	= unescape(Trim(Request.Item("groupCode")))
    limit		= unescape(Trim(Request.Item("limit")))
    start		= unescape(Trim(Request.Item("start")))
    userName	= unescape(Trim(Request.Item("userName")))
    useYN		= unescape(Trim(Request.Item("useYN")))
    
    If limit = "" Then limit = 30
    If start = "" Then start = 0

	strWhere = ""
    If groupCode <> "" Then strWhere = strWhere & " AND UL_GRP_CD = '"&groupCode&"' "
    if userName <> "" Then strWhere = strWhere & " AND UL_MEM_NM = '"&userName&"' "
    if useYN <> "" Then strWhere = strWhere & " AND UL_USE_YN ='"&useYN&"' "
    
    strSql = " SELECT COUNT(*) FROM MO_USER_LIST with(NOLOCK)  INNER JOIN MO_COMM_CD with(nolock) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND = '88'  where 1=1 "&strWhere
	Set Rs = DBExec(strSql,"main")
    totalRacordCount = 0
    If Not Rs.Eof Then
        totalRacordCount = RS(0)
    End If
    Call RSClose(RS)
    
    strSql = ""
    strSql = strSql & " SELECT TOP "& limit &" " 
    strSql = strSql & " 	UL_GRP_CD   "
    strSql = strSql & " 	,CC_KOR_NM   "
    strSql = strSql & " 	,UL_MEM_ID   "
    strSql = strSql & " 	,UL_MEM_NM   "
    strSql = strSql & " 	,UL_LEVEL  "
    strSql = strSql & " 	,UL_USE_YN  " 
    strSql = strSql & " 	,REPLACE(LEFT(CC_KOR_NM,CHARINDEX('-',CC_KOR_NM) ),'-','') PART_NAME "
    strSql = strSql & " 	,UL_PWD " 
    strSql = strSql & " FROM	MO_USER_LIST  a with(nolock)  "
    strSql = strSql & " INNER JOIN MO_COMM_CD b with(nolock) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND = '88' "
	strSql = strSql & " where 1=1 "&strWhere
    strSql = strSql & "    AND UL_MEM_ID NOT IN ( "
	strSql = strSql & "			SELECT TOP "&cInt(start)&" UL_MEM_ID FROM  MO_USER_LIST WITH (NOLOCK) LEFT JOIN MO_COMM_CD WITH (NOLOCK) ON CC_COMM_CD = UL_GRP_CD AND CC_COMM_KIND = '88'  "
	strSql = strSql & "			where 1=1" &strWhere
    strSql = strSql & "			ORDER BY UL_GRP_CD ) "
    strSql = strSql & " ORDER BY UL_GRP_CD  "
	Set Rs = DBExec(strSql,"main")
	num = 0
	If NOT RS.EOF Then
	    DO UNTIL RS.EOF
			ul_grp_cd	= Trim(RS("UL_GRP_CD"))
			cc_kor_nm	= Trim(RS("CC_KOR_NM"))
			ul_mem_id	= Trim(RS("UL_MEM_ID"))
			ul_mem_nm	= Trim(RS("UL_MEM_NM"))
			ul_level	= Trim(RS("UL_LEVEL"))
			ul_use_yn	= RS("UL_USE_YN")
			part_name	= RS("part_name")
			pwd			= RS("UL_PWD")
                     
			if num > 0 Then response.Write "," 
    %>
        
        {"id":<%=num%>,"ul_grp_cd":"<%=ul_grp_cd%>","cc_kor_nm":"<%=cc_kor_nm%>","part_name":"<%=part_name%>","ul_mem_id":"<%=ul_mem_id%>","ul_mem_nm":"<%=ul_mem_nm%>","ul_level":"<%=ul_level %>","ul_use_yn":"<%=ul_use_yn%>","limit":"<%=limit%>","start":"<%=start%>","pwd":"<%=pwd%>"}
    		
    <%
		    RS.MoveNext
			num = num + 1
	    LOOP
	End If
	Call RSClose(RS)
%>],"recordCount":<%=totalRacordCount%>}

