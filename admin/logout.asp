<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	'�ƢƢƢƢƢƢƢƢƢƢƢ� ��Ű�� �ʱ�ȭ �ƢƢƢƢƢƢƢƢƢƢƢƢƢƢƢƢƢ�

	'��Ű�� �ʱ�ȭ : ���̵�	
	Call SetCookie ("userid", "")
	'��Ű�� �ʱ�ȭ : ȸ����
	Call SetCookie ("username", "")
	'��Ű�� �ʱ�ȭ : ȸ������
	Call SetCookie ("mem_type", "")
	'��Ű�� �ʱ�ȭ : ����
	Call SetCookie ("encval", "")
	'��Ű�� �ʱ�ȭ : �����ּ�
	Call SetCookie ("useremail", "")
	'��Ű�� �ʱ�ȭ : �г�
	Call SetCookie ("usergrade", "")
	'��Ű�� �ʱ�ȭ : �ڳ���̵�
	Call SetCookie ("childid", "")
	'��Ű�� �ʱ�ȭ : ������
	Call SetCookie ("com_info", "")

	Call SetCookie ("usergrpcd", "")

	Call SetCookie ("userlevel", "")

	Call SetCookie ("usergrpcd2", "")

	Response.Redirect "/admin/index.asp"
%>
