<%@ Language=VBScript %>
<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ������ �޴� ����
'�� �� �� : menu_save.asp
'�ۼ����� : 2013/07/31
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
Response.Expires = -1
Response.ChaRset = "euc-kr"
'<!-- ���� ��Ŭ��� ������ ���� -->    
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


    '���� �޴� update
    strSql = " UPDATE MO_MENU_INFO SET mi_menu_nm = '"&name&"', mi_menu_path='"&url&"', mi_upd_dt = getdate() where mi_menu_code = "&id&";"
    if subName <> "" then 
        '�޴��ڵ� ����
        strSql = " select isnull(max(mi_menu_code)+1,1) cnt from MO_MENU_INFO with(nolock) "
        call RSExec(Rs,0,3,strSql,"main")

        If Not (Rs.eof or Rs.bof) Then
            mi_menu_code=Rs(0)
        End If
        RSClose(Rs)

        '���� �޴��� ���� ��� ���� �޴� insert
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
