<%@ Language=VBScript %>
<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : �޴��� ����� ���� ����
'�� �� �� : menu_user_action.asp
'�ۼ����� : 2013/07/31
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
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
	

	' ���� �޴� �����ϴ� ��
	If selected = "true" Then
		If indexText = "user_auth" then user_auth = "1" 
		If indexText = "admin_auth" then admin_auth = "1"

		'�ش� �޴� Ȯ��
		strSql = " select MU_USER_CD from MO_MENU_USER  with (nolock) "
		strSql = strSql & " where MU_MENU_CD = "&menuId&" and MU_USER_CD = '"&userId&"'  "
		Set Rs = DBExec(strSql,"main")
		If RS.EOF Then		'�޴��� ���� ��� �߰�
			strSql = "insert into MO_MENU_USER (MU_USER_CD,MU_MENU_CD,MU_MENU_USER,MU_MENU_ADMIN ) values ( '"& userId &"',"& menuId &" ,"& user_auth &","& admin_auth &" ) ;"
		End If 
	End If 

	' �޴� ������Ʈ 
	strSql = strSql & "UPDATE MO_MENU_USER SET MU_MENU_USER = "& user_auth &" ,MU_MENU_ADMIN="& admin_auth &" where MU_USER_CD = '"& userId &"' and MU_MENU_CD = "& menuId
	CALL DBExec(strSql, "main") : CALL DBClose(DBCon)
%>