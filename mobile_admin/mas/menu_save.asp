<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 관리자 메뉴 관리
'파 일 명 : menu_save.asp
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
    id		= unescape(request("id"))
    leaf	= unescape(request("leaf") )
    name	= unescape(request("name"))
    url		= unescape(request("url") )
    subName = unescape(request("subname"))
    subUrl  = unescape(request("subUrl"))


    '상위 메뉴 update
    strSql = " UPDATE MO_MENU_INFO SET mi_menu_nm = '"&name&"', mi_menu_path='"&url&"', mi_upd_dt = getdate() where mi_menu_code = "&id&";"
    if subName <> "" then 
        '메뉴코드 생성
        strSql = " select isnull(max(mi_menu_code)+1,1) cnt from MO_MENU_INFO with(nolock) "
        call RSExec(Rs,0,3,strSql,"main")

        If Not (Rs.eof or Rs.bof) Then
            mi_menu_code=Rs(0)
        End If
        RSClose(Rs)

        '하위 메뉴가 있을 경우 하위 메뉴 insert
        strSql = ""
        strSql = strSql & " INSERT INTO MO_MENU_INFO (mi_menu_code,mi_root_menu,mi_menu_nm,mi_menu_rank,mi_menu_path,mi_dspl_type,mi_reg_dt) "
        strSql = strSql & " SELECT  "
        strSql = strSql & "     "&mi_menu_code&", "
        strSql = strSql & "     "&id&", "
        strSql = strSql & "     '"&subName&"', "
        strSql = strSql & "     (select isnull(max(mi_menu_rank)+1,1) from MO_MENU_INFO with(nolock)where mi_root_menu = "&id&"), "
        strSql = strSql & "     '"&subUrl&"', 'Y' ,"
        strSql = strSql & "     getdate() "
    End If
    Call DBExec(strSql, "main") : DBClose(DBCon)
    If leaf = "1" Then
        menuClass = "folder"
        menuLeaf = "false"
    Else
        menuClass = "file"
        menuLeaf = "true"
    End If 
%>
{"success":"true","text":"<%=subName%>","id":"<%=mi_menu_code%>","cls":"<%=menuClass%>","url":"<%=subUrl%>","leaf":<%=menuLeaf%>,"singleClickExpand":true}
