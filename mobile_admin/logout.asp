<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	'�ƢƢƢƢƢƢƢƢƢƢƢ� ��Ű�� �ʱ�ȭ �ƢƢƢƢƢƢƢƢƢƢƢƢƢƢƢƢƢ�

	'��Ű�� �ʱ�ȭ : ���̵�	
	'Call SetCookie ("userid", "")
	'��Ű�� �ʱ�ȭ : ȸ����
	'Call SetCookie ("username", "")
	'��Ű�� �ʱ�ȭ : ȸ������
	'Call SetCookie ("mem_type", "")
	'��Ű�� �ʱ�ȭ : ����
	'Call SetCookie ("encval", "")
	'��Ű�� �ʱ�ȭ : �����ּ�
	'Call SetCookie ("useremail", "")
	'��Ű�� �ʱ�ȭ : �г�
	'Call SetCookie ("usergrade", "")
	'��Ű�� �ʱ�ȭ : �ڳ���̵�
	'Call SetCookie ("childid", "")
	'��Ű�� �ʱ�ȭ : ������
	'Call SetCookie ("com_info", "")

	Response.Cookies("USERID") = ""
	Response.Cookies("USERID").Path = "/"
'	Response.Cookies("USERID").Domain = strDomain

	Response.Cookies("userid") = ""
	Response.Cookies("userid").Path = "/"
'	Response.Cookies("userid").Domain = strDomain

	Response.Cookies("username") = ""
	Response.Cookies("username").Path = "/"
	Response.Cookies("username").Domain = strDomain

	Response.Cookies("usergrpcd") = ""
	Response.Cookies("usergrpcd").Path = "/"
	Response.Cookies("usergrpcd").Domain = strDomain

	Response.Redirect "/mobile_admin/mobile_index.asp"
%>
