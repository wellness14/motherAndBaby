<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
'--------------------------------------------------------------
'	쿠키값 초기화

	'쿠키값 초기화 : 아이디	
	Call SetCookie ("uid", "")
	Call SetCookie ("uname", "")
	Call SetCookie ("auto_login_ck", "")
 

	Response.Redirect "/etc_work/mnb_admin_app/login.asp"
'--------------------------------------------------------------
%>
