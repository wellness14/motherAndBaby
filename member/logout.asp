<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
'--------------------------------------------------------------
'	쿠키값 초기화

	'쿠키값 초기화 : 아이디	
	Call SetCookie ("uid", "")
	'쿠키값 초기화 : 회원명
	Call SetCookie ("uname", "")
	'쿠키값 초기화 : 회원구분
	Call SetCookie ("mem_type", "")

	Response.Redirect "/index.asp"
'--------------------------------------------------------------
%>
