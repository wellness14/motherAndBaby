<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
'--------------------------------------------------------------
'	��Ű�� �ʱ�ȭ

	'��Ű�� �ʱ�ȭ : ���̵�	
	Call SetCookie ("uid", "")
	'��Ű�� �ʱ�ȭ : ȸ����
	Call SetCookie ("uname", "")
	'��Ű�� �ʱ�ȭ : ȸ������
	Call SetCookie ("mem_type", "")

	Response.Redirect "/index.asp"
'--------------------------------------------------------------
%>
