<%@ Language=VBScript %>
<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : �� �޴� ���� ����
'�� �� �� : menu_team_action.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
%>
<!-- ���� ��Ŭ��� ������ ���� -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- ���� ��Ŭ��� ������ ��ħ -->
<%

	indexText	= fncRequest("indexText")
	menuId		= fncRequest("menuId")
	selected	= fncRequest("select")
	teamId		= fncRequest("teamId")
   
	' ���� �޴� �����ϴ� ��
	If selected = "true" Then
        strSql = ""
	    strSql = strSql & "INSERT INTO MO_MENU_TEAM (MT_TEAM_CD,MT_MENU_CD) VALUES ( '"&teamId&"',"&menuId&" ) "
	Else
	    '���� �޴� ����.
	    strSql = ""
        strSql = strSql & " SELECT MT_MENU_CD FROM MO_MENU_TEAM WITH (NOLOCK) "
        strSql = strSql & " WHERE MT_MENU_CD IN "
        strSql = strSql & " ( "
        strSql = strSql & " 	SELECT MI_MENU_CODE FROM MO_MENU_INFO WITH (NOLOCK)  "
        strSql = strSql & " 	WHERE MI_ROOT_MENU = (SELECT MI_ROOT_MENU FROM MO_MENU_INFO WHERE MI_MENU_CODE="& menuId &" AND MT_TEAM_CD='"& teamId &"') "
        strSql = strSql & " )  AND MT_TEAM_CD = '"& teamId &"' AND  mt_menu_cd <> "& menuId &" "
		Set Rs = DBExec(strSql,"main")
        If RS.EOF then '���� �޴��� ���� ��� ����
            strSql = "DELETE MO_MENU_TEAM where MT_TEAM_CD = '"&teamId&"' and MT_MENU_CD = (select mi_root_menu from MO_menu_info where mi_menu_code = "&menuId&"  ) ;"
		End If 
         
	    strSql = strSql & "DELETE MO_MENU_TEAM where MT_TEAM_CD = '"&teamId&"' and MT_MENU_CD = "&menuId
	End If
    
	CALL DBExec(strSql, "main") : CALL DBClose(DBCon)
%>